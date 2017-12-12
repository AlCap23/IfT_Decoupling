package Rosenbrock
  model Decentralized
    Modelica.Blocks.Continuous.PI C_11(T = 0.607, k = 2.824) annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 0.607, k = 2.824) annotation(
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {1, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {1, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {1, 3}, b = {2}) annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {1, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation(
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {3}, b = {0}) annotation(
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {1}, b = {0}) annotation(
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_22 annotation(
      Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation(
      Placement(visible = true, transformation(origin = {42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation(
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation(
      Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation(
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation(
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs_e1 annotation(
      Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation(
      Placement(visible = true, transformation(origin = {-130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2 annotation(
      Placement(visible = true, transformation(origin = {-170, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_1 annotation(
      Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 200, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 200, startTime = 100, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(r_11.y, e_11.u1) annotation(
      Line(points = {{-138, 50}, {-130, 50}, {-130, 50}, {-128, 50}}, color = {0, 0, 127}));
    connect(r_22.y, e_22.u1) annotation(
      Line(points = {{-138, -110}, {-130, -110}, {-130, -110}, {-128, -110}}, color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation(
      Line(points = {{-138, -50}, {-100, -50}, {-100, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation(
      Line(points = {{-138, -10}, {-100, -10}, {-100, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation(
      Line(points = {{-158, -70}, {-140, -70}, {-140, -70}, {-142, -70}}, color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation(
      Line(points = {{-118, -70}, {-100, -70}, {-100, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation(
      Line(points = {{-111, -110}, {-83, -110}, {-83, -110}, {-83, -110}}, color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation(
      Line(points = {{141, -110}, {151, -110}, {151, -140}, {-121, -140}, {-121, -118}, {-121, -118}}, color = {0, 0, 127}));
    connect(G_22.y, y_22.u2) annotation(
      Line(points = {{101, -110}, {109, -110}, {109, -116}, {117, -116}, {117, -116}}, color = {0, 0, 127}));
    connect(G_21.y, y_22.u1) annotation(
      Line(points = {{102, 10}, {112, 10}, {112, -104}, {118, -104}}, color = {0, 0, 127}));
    connect(G_22.u, u_22.y) annotation(
      Line(points = {{78, -110}, {52, -110}, {52, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(G_12.u, u_22.y) annotation(
      Line(points = {{78, -70}, {60, -70}, {60, -110}, {50, -110}, {50, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(D_22.y, u_22.u2) annotation(
      Line(points = {{1, -110}, {9, -110}, {9, -116}, {27, -116}, {27, -116}}, color = {0, 0, 127}));
    connect(D_21.y, u_22.u1) annotation(
      Line(points = {{1, -70}, {19, -70}, {19, -104}, {27, -104}, {27, -104}}, color = {0, 0, 127}));
    connect(C_22.y, D_22.u) annotation(
      Line(points = {{-59, -110}, {-25, -110}, {-25, -110}, {-23, -110}}, color = {0, 0, 127}));
    connect(D_21.u, C_11.y) annotation(
      Line(points = {{-22, -70}, {-40, -70}, {-40, 50}, {-58, 50}}, color = {0, 0, 127}));
    connect(G_12.y, y_11.u2) annotation(
      Line(points = {{101, -70}, {108, -70}, {108, 44}, {118, 44}}, color = {0, 0, 127}));
    connect(D_12.u, C_22.y) annotation(
      Line(points = {{-22, 10}, {-36, 10}, {-36, -110}, {-59, -110}}, color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation(
      Line(points = {{-158, 10}, {-142, 10}, {-142, 10}, {-140, 10}, {-140, 10}}, color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation(
      Line(points = {{-120, 10}, {-100, 10}, {-100, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation(
      Line(points = {{142, 50}, {152, 50}, {152, 80}, {-120, 80}, {-120, 58}, {-120, 58}}, color = {0, 0, 127}));
    connect(G_21.u, u_11.y) annotation(
      Line(points = {{78, 10}, {60, 10}, {60, 50}, {54, 50}, {54, 50}, {54, 50}}, color = {0, 0, 127}));
    connect(D_12.y, u_11.u2) annotation(
      Line(points = {{2, 10}, {20, 10}, {20, 44}, {30, 44}, {30, 44}}, color = {0, 0, 127}));
    connect(G_11.y, y_11.u1) annotation(
      Line(points = {{102, 50}, {106, 50}, {106, 56}, {118, 56}, {118, 56}}, color = {0, 0, 127}));
    connect(u_11.y, G_11.u) annotation(
      Line(points = {{54, 50}, {76, 50}, {76, 50}, {78, 50}}, color = {0, 0, 127}));
    connect(D_11.y, u_11.u1) annotation(
      Line(points = {{2, 50}, {14, 50}, {14, 56}, {30, 56}, {30, 56}}, color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation(
      Line(points = {{-58, 50}, {-24, 50}, {-24, 50}, {-22, 50}}, color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation(
      Line(points = {{-110, 50}, {-84, 50}, {-84, 50}, {-82, 50}}, color = {0, 0, 127}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      Icon(coordinateSystem(extent = {{-300, -300}, {300, 300}})),
      Diagram(coordinateSystem(extent = {{-300, -300}, {300, 300}})),
      __OpenModelica_commandLineOptions = "",
  experiment(StartTime = 0, StopTime = 800, Tolerance = 1e-10, Interval = 1));
  end Decentralized;

  model Static_Decoupling
    Modelica.Blocks.Continuous.PI C_11(T = 1.16666666, k = 0.75) annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 0.607, k = 8.47) annotation(
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {1, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {1, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {1, 3}, b = {2}) annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {1, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation(
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {3}, b = {-2}) annotation(
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {1}, b = {-1}) annotation(
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_22 annotation(
      Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation(
      Placement(visible = true, transformation(origin = {42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation(
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation(
      Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation(
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation(
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IAE_1(y_start = 0)  annotation(
      Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2(y_start = 0)  annotation(
      Placement(visible = true, transformation(origin = {-150, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e1 annotation(
      Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation(
      Placement(visible = true, transformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-130, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator IE_2(y_start = 0)  annotation(
      Placement(visible = true, transformation(origin = {-130, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 200, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 200, startTime = 100, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(r_22.y, e_22.u1) annotation(
      Line(points = {{-138, -110}, {-130, -110}, {-130, -110}, {-128, -110}}, color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation(
      Line(points = {{-138, 50}, {-128, 50}, {-128, 50}, {-128, 50}}, color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation(
      Line(points = {{-118, -50}, {-90, -50}, {-90, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation(
      Line(points = {{-118, -10}, {-90, -10}, {-90, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation(
      Line(points = {{-138, -70}, {-129, -70}, {-129, -70}, {-122, -70}, {-122, -70}, {-122, -70}, {-122, -70}, {-122, -70}}, color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation(
      Line(points = {{-98, -70}, {-93, -70}, {-93, -70}, {-90, -70}, {-90, -110}, {-110, -110}, {-110, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation(
      Line(points = {{-111, -110}, {-97, -110}, {-97, -110}, {-81, -110}, {-81, -110}, {-83, -110}}, color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation(
      Line(points = {{141, -110}, {146, -110}, {146, -110}, {153, -110}, {153, -140}, {-119, -140}, {-119, -118}, {-121, -118}}, color = {0, 0, 127}));
    connect(G_22.y, y_22.u2) annotation(
      Line(points = {{101, -110}, {105, -110}, {105, -110}, {109, -110}, {109, -116}, {117, -116}, {117, -116}, {117, -116}, {117, -116}}, color = {0, 0, 127}));
    connect(G_21.y, y_22.u1) annotation(
      Line(points = {{102, 10}, {112, 10}, {112, -104}, {118, -104}}, color = {0, 0, 127}));
    connect(G_22.u, u_22.y) annotation(
      Line(points = {{78, -110}, {65, -110}, {65, -110}, {50, -110}, {50, -110}, {52, -110}, {52, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(G_12.u, u_22.y) annotation(
      Line(points = {{78, -70}, {60, -70}, {60, -110}, {50, -110}, {50, -110}, {51, -110}, {51, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(D_22.y, u_22.u2) annotation(
      Line(points = {{1, -110}, {5, -110}, {5, -110}, {11, -110}, {11, -116}, {29, -116}, {29, -116}, {27, -116}, {27, -116}}, color = {0, 0, 127}));
    connect(D_21.y, u_22.u1) annotation(
      Line(points = {{1, -70}, {10, -70}, {10, -70}, {19, -70}, {19, -104}, {27, -104}, {27, -105}, {27, -105}, {27, -104}}, color = {0, 0, 127}));
    connect(C_22.y, D_22.u) annotation(
      Line(points = {{-59, -110}, {-41, -110}, {-41, -110}, {-23, -110}, {-23, -110}, {-24, -110}, {-24, -110}, {-23, -110}}, color = {0, 0, 127}));
    connect(D_21.u, C_11.y) annotation(
      Line(points = {{-22, -70}, {-40, -70}, {-40, 50}, {-58, 50}}, color = {0, 0, 127}));
    connect(G_12.y, y_11.u2) annotation(
      Line(points = {{101, -70}, {108, -70}, {108, 44}, {118, 44}}, color = {0, 0, 127}));
    connect(D_12.u, C_22.y) annotation(
      Line(points = {{-22, 10}, {-36, 10}, {-36, -110}, {-59, -110}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation(
      Line(points = {{142, 50}, {152, 50}, {152, 80}, {-120, 80}, {-120, 58}, {-120, 58}}, color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation(
      Line(points = {{-98, 10}, {-90, 10}, {-90, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation(
      Line(points = {{-138, 10}, {-122, 10}, {-122, 10}, {-122, 10}}, color = {0, 0, 127}));
    connect(G_21.u, u_11.y) annotation(
      Line(points = {{78, 10}, {60, 10}, {60, 50}, {54, 50}, {54, 50}, {54, 50}}, color = {0, 0, 127}));
    connect(D_12.y, u_11.u2) annotation(
      Line(points = {{2, 10}, {20, 10}, {20, 44}, {30, 44}, {30, 44}}, color = {0, 0, 127}));
    connect(G_11.y, y_11.u1) annotation(
      Line(points = {{102, 50}, {106, 50}, {106, 56}, {118, 56}, {118, 56}}, color = {0, 0, 127}));
    connect(u_11.y, G_11.u) annotation(
      Line(points = {{54, 50}, {76, 50}, {76, 50}, {78, 50}}, color = {0, 0, 127}));
    connect(D_11.y, u_11.u1) annotation(
      Line(points = {{2, 50}, {14, 50}, {14, 56}, {30, 56}, {30, 56}}, color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation(
      Line(points = {{-58, 50}, {-24, 50}, {-24, 50}, {-22, 50}}, color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation(
      Line(points = {{-110, 50}, {-84, 50}, {-84, 50}, {-82, 50}}, color = {0, 0, 127}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 800, Tolerance = 1e-10, Interval = 0.01));
  end Static_Decoupling;

  model Dynamic_Decoupling
    Modelica.Blocks.Continuous.PI C_11(T = 1.16666, k = 0.75) annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 1.16666, k = 0.75) annotation(
      Placement(visible = true, transformation(origin = {-68, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {1, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {1, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {1, 3}, b = {2}) annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {1, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation(
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {1, 3}, b = {-2, -2}) annotation(
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {1}, b = {-1}) annotation(
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_22 annotation(
      Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation(
      Placement(visible = true, transformation(origin = {42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation(
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation(
      Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation(
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation(
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IAE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2 annotation(
      Placement(visible = true, transformation(origin = {-150, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e1 annotation(
      Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation(
      Placement(visible = true, transformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-130, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-130, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 200, startTime = 0, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 200, startTime = 100, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(r_22.y, e_22.u1) annotation(
      Line(points = {{-138, -110}, {-128, -110}, {-128, -110}, {-128, -110}}, color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation(
      Line(points = {{-138, 50}, {-128, 50}, {-128, 50}, {-128, 50}, {-128, 50}}, color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation(
      Line(points = {{-118, -10}, {-90, -10}, {-90, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation(
      Line(points = {{-118, -50}, {-90, -50}, {-90, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation(
      Line(points = {{-138, -70}, {-130, -70}, {-130, -70}, {-122, -70}, {-122, -70}, {-122, -70}, {-122, -70}, {-122, -70}}, color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation(
      Line(points = {{-98, -70}, {-94, -70}, {-94, -70}, {-90, -70}, {-90, -110}, {-112, -110}, {-112, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation(
      Line(points = {{141, -110}, {153, -110}, {153, -140}, {-119, -140}, {-119, -118}, {-121, -118}}, color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation(
      Line(points = {{-111, -110}, {-81, -110}}, color = {0, 0, 127}));
    connect(G_22.y, y_22.u2) annotation(
      Line(points = {{101, -110}, {105, -110}, {105, -110}, {109, -110}, {109, -116}, {119, -116}, {119, -117}, {117, -117}, {117, -116}}, color = {0, 0, 127}));
    connect(G_21.y, y_22.u1) annotation(
      Line(points = {{102, 10}, {112, 10}, {112, -104}, {118, -104}}, color = {0, 0, 127}));
    connect(G_22.u, u_22.y) annotation(
      Line(points = {{78, -110}, {65, -110}, {65, -110}, {50, -110}, {50, -110}, {52, -110}, {52, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(G_12.u, u_22.y) annotation(
      Line(points = {{78, -70}, {69, -70}, {69, -70}, {60, -70}, {60, -110}, {50, -110}, {50, -110}, {51, -110}, {51, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(D_22.y, u_22.u2) annotation(
      Line(points = {{1, -110}, {5, -110}, {5, -110}, {9, -110}, {9, -116}, {27, -116}, {27, -117}, {27, -117}, {27, -116}}, color = {0, 0, 127}));
    connect(D_21.y, u_22.u1) annotation(
      Line(points = {{1, -70}, {10, -70}, {10, -70}, {21, -70}, {21, -104}, {27, -104}, {27, -104}, {27, -104}, {27, -104}}, color = {0, 0, 127}));
    connect(C_22.y, D_22.u) annotation(
      Line(points = {{-57, -110}, {-22, -110}}, color = {0, 0, 127}));
    connect(D_21.u, C_11.y) annotation(
      Line(points = {{-22, -70}, {-40, -70}, {-40, 50}, {-58, 50}}, color = {0, 0, 127}));
    connect(G_12.y, y_11.u2) annotation(
      Line(points = {{101, -70}, {108, -70}, {108, 44}, {118, 44}}, color = {0, 0, 127}));
    connect(D_12.u, C_22.y) annotation(
      Line(points = {{-22, 10}, {-36, 10}, {-36, -110}, {-57, -110}}, color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation(
      Line(points = {{-98, 10}, {-90, 10}, {-90, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation(
      Line(points = {{-138, 10}, {-122, 10}, {-122, 10}, {-122, 10}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation(
      Line(points = {{142, 50}, {152, 50}, {152, 80}, {-120, 80}, {-120, 58}, {-120, 58}}, color = {0, 0, 127}));
    connect(G_21.u, u_11.y) annotation(
      Line(points = {{78, 10}, {60, 10}, {60, 50}, {54, 50}, {54, 50}, {54, 50}}, color = {0, 0, 127}));
    connect(D_12.y, u_11.u2) annotation(
      Line(points = {{2, 10}, {20, 10}, {20, 44}, {30, 44}, {30, 44}}, color = {0, 0, 127}));
    connect(G_11.y, y_11.u1) annotation(
      Line(points = {{102, 50}, {106, 50}, {106, 56}, {118, 56}, {118, 56}}, color = {0, 0, 127}));
    connect(u_11.y, G_11.u) annotation(
      Line(points = {{54, 50}, {76, 50}, {76, 50}, {78, 50}}, color = {0, 0, 127}));
    connect(D_11.y, u_11.u1) annotation(
      Line(points = {{2, 50}, {14, 50}, {14, 56}, {30, 56}, {30, 56}}, color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation(
      Line(points = {{-58, 50}, {-24, 50}, {-24, 50}, {-22, 50}}, color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation(
      Line(points = {{-110, 50}, {-84, 50}, {-84, 50}, {-82, 50}}, color = {0, 0, 127}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 800, Tolerance = 1e-10, Interval = 1));
  end Dynamic_Decoupling;

  model CentralizedPID
    Modelica.Blocks.Continuous.PI C_11(T = 0.3, k = 1) annotation(
      Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 0.3, k = 1) annotation(
      Placement(visible = true, transformation(origin = {-30, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {1, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {1, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {1, 3}, b = {2}) annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {1, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation(
      Placement(visible = true, transformation(origin = {42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation(
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation(
      Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation(
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation(
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs_e1 annotation(
      Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation(
      Placement(visible = true, transformation(origin = {-130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_1 annotation(
      Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2 annotation(
      Placement(visible = true, transformation(origin = {-170, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.PI C_12(T = 1, k = -2) annotation(
      Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_21(T = 0.3, k = -1) annotation(
      Placement(visible = true, transformation(origin = {-30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain ki_11(k = 0.17) annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain ki_22(k = 0.1) annotation(
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 200, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 200, startTime = 100, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(r_22.y, e_22.u1) annotation(
      Line(points = {{-138, -110}, {-128, -110}, {-128, -110}, {-128, -110}}, color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation(
      Line(points = {{-138, 50}, {-128, 50}, {-128, 50}, {-128, 50}}, color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation(
      Line(points = {{-138, -50}, {-100, -50}, {-100, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation(
      Line(points = {{-138, -10}, {-100, -10}, {-100, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(ki_22.u, e_22.y) annotation(
      Line(points = {{-82, -110}, {-97, -110}, {-97, -110}, {-112, -110}, {-112, -110}, {-111, -110}, {-111, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(ki_22.y, C_22.u) annotation(
      Line(points = {{-59, -110}, {-41, -110}, {-41, -110}, {-43, -110}}, color = {0, 0, 127}));
    connect(C_12.u, ki_22.y) annotation(
      Line(points = {{-42, 10}, {-56, 10}, {-56, -110}, {-59, -110}}, color = {0, 0, 127}));
    connect(C_21.y, u_22.u1) annotation(
      Line(points = {{-19, -70}, {1, -70}, {1, -104}, {29, -104}, {29, -104}, {27, -104}, {27, -104}}, color = {0, 0, 127}));
    connect(C_21.u, ki_11.y) annotation(
      Line(points = {{-42, -70}, {-52, -70}, {-52, 50}, {-58, 50}}, color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation(
      Line(points = {{-158, -70}, {-140, -70}, {-140, -70}, {-141, -70}, {-141, -70}, {-142, -70}}, color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation(
      Line(points = {{-118, -70}, {-109, -70}, {-109, -70}, {-100, -70}, {-100, -110}, {-110, -110}, {-110, -113}, {-110, -113}, {-110, -110}}, color = {0, 0, 127}));
    connect(e_22.u2, y_22.y) annotation(
      Line(points = {{-120, -118}, {-120, -118}, {-120, -118}, {-120, -118}, {-120, -140}, {150, -140}, {150, -110}, {142, -110}, {142, -113}, {142, -113}, {142, -110}}, color = {0, 0, 127}));
    connect(G_22.y, y_22.u2) annotation(
      Line(points = {{101, -110}, {105, -110}, {105, -110}, {111, -110}, {111, -116}, {119, -116}, {119, -117}, {117, -117}, {117, -116}}, color = {0, 0, 127}));
    connect(G_21.y, y_22.u1) annotation(
      Line(points = {{102, 10}, {112, 10}, {112, -104}, {118, -104}}, color = {0, 0, 127}));
    connect(G_22.u, u_22.y) annotation(
      Line(points = {{78, -110}, {65, -110}, {65, -110}, {52, -110}, {52, -110}, {52, -110}, {52, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(G_12.u, u_22.y) annotation(
      Line(points = {{78, -70}, {60, -70}, {60, -110}, {50, -110}, {50, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(C_22.y, u_22.u2) annotation(
      Line(points = {{-19, -110}, {-5, -110}, {-5, -110}, {9, -110}, {9, -116}, {29, -116}, {29, -116}, {27, -116}, {27, -116}}, color = {0, 0, 127}));
    connect(G_12.y, y_11.u2) annotation(
      Line(points = {{101, -70}, {108, -70}, {108, 44}, {118, 44}}, color = {0, 0, 127}));
    connect(ki_11.y, C_11.u) annotation(
      Line(points = {{-58, 50}, {-42, 50}, {-42, 50}, {-42, 50}}, color = {0, 0, 127}));
    connect(ki_11.u, e_11.y) annotation(
      Line(points = {{-82, 50}, {-110, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(C_11.y, u_11.u1) annotation(
      Line(points = {{-18, 50}, {8, 50}, {8, 56}, {30, 56}, {30, 56}}, color = {0, 0, 127}));
    connect(C_12.y, u_11.u2) annotation(
      Line(points = {{-18, 10}, {8, 10}, {8, 44}, {30, 44}, {30, 44}}, color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation(
      Line(points = {{-158, 10}, {-142, 10}, {-142, 10}, {-142, 10}}, color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation(
      Line(points = {{-120, 10}, {-100, 10}, {-100, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation(
      Line(points = {{142, 50}, {152, 50}, {152, 80}, {-120, 80}, {-120, 58}, {-120, 58}}, color = {0, 0, 127}));
    connect(G_21.u, u_11.y) annotation(
      Line(points = {{78, 10}, {60, 10}, {60, 50}, {54, 50}, {54, 50}, {54, 50}}, color = {0, 0, 127}));
    connect(G_11.y, y_11.u1) annotation(
      Line(points = {{102, 50}, {106, 50}, {106, 56}, {118, 56}, {118, 56}}, color = {0, 0, 127}));
    connect(u_11.y, G_11.u) annotation(
      Line(points = {{54, 50}, {76, 50}, {76, 50}, {78, 50}}, color = {0, 0, 127}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 800, Tolerance = 1e-10, Interval = 1));
  end CentralizedPID;

  model Ideal
    Modelica.Blocks.Continuous.PI C_11(T = 0.607, k = 2.824) annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 0.607, k = 2.824) annotation(
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {1, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {1, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation(
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation(
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs_e1 annotation(
      Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation(
      Placement(visible = true, transformation(origin = {-130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2 annotation(
      Placement(visible = true, transformation(origin = {-170, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_1 annotation(
      Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 200, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 200, startTime = 100, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(r_22.y, e_22.u1) annotation(
      Line(points = {{-138, -110}, {-128, -110}, {-128, -110}, {-128, -110}}, color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation(
      Line(points = {{-138, 50}, {-128, 50}, {-128, 50}, {-128, 50}}, color = {0, 0, 127}));
    connect(C_22.y, G_22.u) annotation(
      Line(points = {{-58, -110}, {76, -110}, {76, -110}, {78, -110}}, color = {0, 0, 127}));
    connect(C_11.y, G_11.u) annotation(
      Line(points = {{-58, 50}, {78, 50}, {78, 50}, {78, 50}}, color = {0, 0, 127}));
    connect(G_22.y, e_22.u2) annotation(
      Line(points = {{102, -110}, {120, -110}, {120, -140}, {-120, -140}, {-120, -118}, {-120, -118}}, color = {0, 0, 127}));
    connect(G_11.y, e_11.u2) annotation(
      Line(points = {{102, 50}, {120, 50}, {120, 80}, {-120, 80}, {-120, 58}, {-120, 58}}, color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation(
      Line(points = {{-138, -50}, {-100, -50}, {-100, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation(
      Line(points = {{-138, -10}, {-100, -10}, {-100, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation(
      Line(points = {{-158, -70}, {-140, -70}, {-140, -70}, {-142, -70}}, color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation(
      Line(points = {{-118, -70}, {-100, -70}, {-100, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation(
      Line(points = {{-111, -110}, {-83, -110}, {-83, -110}, {-83, -110}}, color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation(
      Line(points = {{-158, 10}, {-142, 10}, {-142, 10}, {-140, 10}, {-140, 10}}, color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation(
      Line(points = {{-120, 10}, {-100, 10}, {-100, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation(
      Line(points = {{-110, 50}, {-84, 50}, {-84, 50}, {-82, 50}}, color = {0, 0, 127}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      Icon(coordinateSystem(extent = {{-300, -300}, {300, 300}})),
      Diagram(coordinateSystem(extent = {{-300, -300}, {300, 300}})),
      __OpenModelica_commandLineOptions = "",
  experiment(StartTime = 0, StopTime = 800, Tolerance = 1e-10, Interval = 1));
  end Ideal;
  annotation(
    uses(Modelica(version = "3.2.2")));
end Rosenbrock;
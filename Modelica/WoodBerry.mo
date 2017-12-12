package WoodBerry
  model Decentralized
    Modelica.Blocks.Continuous.PI C_11(T = 10.14, k = 0.2205) annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 11.30, k = -0.059) annotation(
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {16.7, 1}, b = {12.8}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {10.9, 1}, b = {6.6}) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {21.0, 1}, b = {-18.9}) annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {14.4, 1}, b = {-19.4}) annotation(
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation(
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {12.2}, b = {0}) annotation(
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {19.4}, b = {0}) annotation(
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_22 annotation(
      Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation(
      Placement(visible = true, transformation(origin = {42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation(
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation(
      Placement(visible = true, transformation(origin = {170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation(
      Placement(visible = true, transformation(origin = {170, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Modelica.Blocks.Nonlinear.FixedDelay L_11(delayTime = 1) annotation(
      Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 7) annotation(
      Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(r_11.y, e_11.u1) annotation(
      Line(points = {{-138, 50}, {-130, 50}, {-130, 50}, {-128, 50}}, color = {0, 0, 127}));
    connect(r_22.y, e_22.u1) annotation(
      Line(points = {{-138, -110}, {-128, -110}, {-128, -110}, {-128, -110}}, color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation(
      Line(points = {{-138, -50}, {-100, -50}, {-100, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation(
      Line(points = {{-118, -70}, {-100, -70}, {-100, -110}, {-110, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation(
      Line(points = {{-138, -10}, {-100, -10}, {-100, 50}, {-110, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(G_22.y, L_22.u) annotation(
      Line(points = {{101, -110}, {119, -110}, {119, -110}, {117, -110}}, color = {0, 0, 127}));
    connect(L_22.y, y_22.u2) annotation(
      Line(points = {{141, -110}, {151, -110}, {151, -116}, {159, -116}, {159, -116}, {157, -116}, {157, -116}}, color = {0, 0, 127}));
    connect(G_12.y, L_12.u) annotation(
      Line(points = {{101, -70}, {119, -70}, {119, -70}, {117, -70}}, color = {0, 0, 127}));
    connect(L_12.y, y_11.u2) annotation(
      Line(points = {{141, -70}, {154, -70}, {154, 44}, {158, 44}}, color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation(
      Line(points = {{-158, -70}, {-140, -70}, {-140, -70}, {-142, -70}}, color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation(
      Line(points = {{-111, -110}, {-81, -110}, {-81, -110}, {-83, -110}}, color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation(
      Line(points = {{181, -110}, {186, -110}, {186, -108}, {193, -108}, {193, -138}, {-119, -138}, {-119, -116}, {-121, -116}, {-121, -118}, {-121, -118}}, color = {0, 0, 127}));
    connect(L_21.y, y_22.u1) annotation(
      Line(points = {{142, 10}, {152, 10}, {152, -104}, {158, -104}}, color = {0, 0, 127}));
    connect(G_22.u, u_22.y) annotation(
      Line(points = {{78, -110}, {65, -110}, {65, -108}, {52, -108}, {52, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(G_12.u, u_22.y) annotation(
      Line(points = {{78, -70}, {60, -70}, {60, -110}, {50, -110}, {50, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(D_22.y, u_22.u2) annotation(
      Line(points = {{1, -110}, {11, -110}, {11, -116}, {29, -116}, {29, -116}, {27, -116}, {27, -116}}, color = {0, 0, 127}));
    connect(D_21.y, u_22.u1) annotation(
      Line(points = {{1, -70}, {10, -70}, {10, -68}, {21, -68}, {21, -102}, {29, -102}, {29, -105}, {27, -105}, {27, -104}}, color = {0, 0, 127}));
    connect(C_22.y, D_22.u) annotation(
      Line(points = {{-59, -110}, {-23, -110}, {-23, -110}, {-23, -110}}, color = {0, 0, 127}));
    connect(D_21.u, C_11.y) annotation(
      Line(points = {{-22, -70}, {-40, -70}, {-40, 50}, {-58, 50}}, color = {0, 0, 127}));
    connect(D_12.u, C_22.y) annotation(
      Line(points = {{-22, 10}, {-36, 10}, {-36, -110}, {-59, -110}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation(
      Line(points = {{182, 50}, {190, 50}, {190, 80}, {-120, 80}, {-120, 58}, {-120, 58}}, color = {0, 0, 127}));
    connect(L_11.y, y_11.u1) annotation(
      Line(points = {{142, 50}, {148, 50}, {148, 56}, {158, 56}, {158, 56}}, color = {0, 0, 127}));
    connect(D_11.y, u_11.u1) annotation(
      Line(points = {{2, 50}, {14, 50}, {14, 56}, {30, 56}, {30, 56}}, color = {0, 0, 127}));
    connect(G_21.y, L_21.u) annotation(
      Line(points = {{102, 10}, {116, 10}, {116, 10}, {118, 10}}, color = {0, 0, 127}));
    connect(G_11.y, L_11.u) annotation(
      Line(points = {{102, 50}, {118, 50}, {118, 50}, {118, 50}}, color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation(
      Line(points = {{-158, 10}, {-142, 10}, {-142, 10}, {-142, 10}}, color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation(
      Line(points = {{-120, 10}, {-100, 10}, {-100, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(G_21.u, u_11.y) annotation(
      Line(points = {{78, 10}, {60, 10}, {60, 50}, {54, 50}, {54, 50}, {54, 50}}, color = {0, 0, 127}));
    connect(D_12.y, u_11.u2) annotation(
      Line(points = {{2, 10}, {20, 10}, {20, 44}, {30, 44}, {30, 44}}, color = {0, 0, 127}));
    connect(u_11.y, G_11.u) annotation(
      Line(points = {{54, 50}, {76, 50}, {76, 50}, {78, 50}}, color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation(
      Line(points = {{-58, 50}, {-24, 50}, {-24, 50}, {-22, 50}}, color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation(
      Line(points = {{-110, 50}, {-84, 50}, {-84, 50}, {-82, 50}}, color = {0, 0, 127}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 4800, Tolerance = 1e-10, Interval = 1));
  end Decentralized;

  model Static_Decoupling
    Modelica.Blocks.Continuous.PI C_11(T = 2.5868, k = 0.2072) annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 12.2790, k = -0.1018) annotation(
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {16.7, 1}, b = {12.8}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {10.9, 1}, b = {6.6}) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {21.0, 1}, b = {-18.9}) annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {14.4, 1}, b = {-19.4}) annotation(
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation(
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {12.2}, b = {18.9}) annotation(
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {19.9}, b = {6.6}) annotation(
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_22 annotation(
      Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation(
      Placement(visible = true, transformation(origin = {42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation(
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation(
      Placement(visible = true, transformation(origin = {170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation(
      Placement(visible = true, transformation(origin = {170, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Modelica.Blocks.Nonlinear.FixedDelay L_11(delayTime = 1) annotation(
      Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 7) annotation(
      Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(r_22.y, e_22.u1) annotation(
      Line(points = {{-138, -110}, {-130, -110}, {-130, -110}, {-128, -110}}, color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation(
      Line(points = {{-138, 50}, {-128, 50}, {-128, 50}, {-128, 50}}, color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation(
      Line(points = {{-158, -70}, {-140, -70}, {-140, -70}, {-140, -70}, {-140, -70}}, color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation(
      Line(points = {{-138, -50}, {-100, -50}, {-100, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation(
      Line(points = {{-118, -70}, {-100, -70}, {-100, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation(
      Line(points = {{-138, -10}, {-100, -10}, {-100, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(G_22.y, L_22.u) annotation(
      Line(points = {{101, -110}, {117, -110}, {117, -110}, {117, -110}}, color = {0, 0, 127}));
    connect(L_22.y, y_22.u2) annotation(
      Line(points = {{141, -110}, {145, -110}, {145, -108}, {149, -108}, {149, -114}, {157, -114}, {157, -116}, {157, -116}, {157, -116}}, color = {0, 0, 127}));
    connect(G_12.y, L_12.u) annotation(
      Line(points = {{101, -70}, {117, -70}, {117, -68}, {117, -68}, {117, -70}, {117, -70}}, color = {0, 0, 127}));
    connect(L_12.y, y_11.u2) annotation(
      Line(points = {{141, -70}, {154, -70}, {154, 44}, {158, 44}}, color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation(
      Line(points = {{-111, -110}, {-83, -110}, {-83, -108}, {-83, -108}, {-83, -110}, {-83, -110}}, color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation(
      Line(points = {{181, -110}, {187, -110}, {187, -108}, {191, -108}, {191, -140}, {-121, -140}, {-121, -118}, {-121, -118}}, color = {0, 0, 127}));
    connect(L_21.y, y_22.u1) annotation(
      Line(points = {{142, 10}, {152, 10}, {152, -104}, {158, -104}}, color = {0, 0, 127}));
    connect(G_22.u, u_22.y) annotation(
      Line(points = {{78, -110}, {52, -110}, {52, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(G_12.u, u_22.y) annotation(
      Line(points = {{78, -70}, {60, -70}, {60, -108}, {50, -108}, {50, -108}, {51, -108}, {51, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(D_22.y, u_22.u2) annotation(
      Line(points = {{1, -110}, {9, -110}, {9, -114}, {27, -114}, {27, -116}, {27, -116}, {27, -116}}, color = {0, 0, 127}));
    connect(D_21.y, u_22.u1) annotation(
      Line(points = {{1, -70}, {19, -70}, {19, -104}, {27, -104}, {27, -104}, {27, -104}, {27, -104}}, color = {0, 0, 127}));
    connect(C_22.y, D_22.u) annotation(
      Line(points = {{-59, -110}, {-25, -110}, {-25, -110}, {-23, -110}}, color = {0, 0, 127}));
    connect(D_21.u, C_11.y) annotation(
      Line(points = {{-22, -70}, {-40, -70}, {-40, 50}, {-58, 50}}, color = {0, 0, 127}));
    connect(D_12.u, C_22.y) annotation(
      Line(points = {{-22, 10}, {-36, 10}, {-36, -110}, {-59, -110}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation(
      Line(points = {{182, 50}, {190, 50}, {190, 80}, {-120, 80}, {-120, 58}, {-120, 58}}, color = {0, 0, 127}));
    connect(L_11.y, y_11.u1) annotation(
      Line(points = {{142, 50}, {148, 50}, {148, 56}, {158, 56}, {158, 56}}, color = {0, 0, 127}));
    connect(D_11.y, u_11.u1) annotation(
      Line(points = {{2, 50}, {14, 50}, {14, 56}, {30, 56}, {30, 56}}, color = {0, 0, 127}));
    connect(G_21.y, L_21.u) annotation(
      Line(points = {{102, 10}, {116, 10}, {116, 10}, {118, 10}}, color = {0, 0, 127}));
    connect(G_11.y, L_11.u) annotation(
      Line(points = {{102, 50}, {118, 50}, {118, 50}, {118, 50}}, color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation(
      Line(points = {{-158, 10}, {-142, 10}, {-142, 10}, {-142, 10}}, color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation(
      Line(points = {{-120, 10}, {-100, 10}, {-100, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(G_21.u, u_11.y) annotation(
      Line(points = {{78, 10}, {60, 10}, {60, 50}, {54, 50}, {54, 50}, {54, 50}}, color = {0, 0, 127}));
    connect(D_12.y, u_11.u2) annotation(
      Line(points = {{2, 10}, {20, 10}, {20, 44}, {30, 44}, {30, 44}}, color = {0, 0, 127}));
    connect(u_11.y, G_11.u) annotation(
      Line(points = {{54, 50}, {76, 50}, {76, 50}, {78, 50}}, color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation(
      Line(points = {{-58, 50}, {-24, 50}, {-24, 50}, {-22, 50}}, color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation(
      Line(points = {{-110, 50}, {-84, 50}, {-84, 50}, {-82, 50}}, color = {0, 0, 127}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 4800, Tolerance = 1e-10, Interval = 1));
  end Static_Decoupling;

  model Dynamic_Decoupling
    Modelica.Blocks.Continuous.PI C_11(T = 20.4723, k = 0.1548) annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 12.2790, k = -0.1018) annotation(
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {16.7, 1}, b = {12.8}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {10.9, 1}, b = {6.6}) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {21.0, 1}, b = {-18.9}) annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {14.4, 1}, b = {-19.4}) annotation(
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation(
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {12.8 * 21.0, 12.8}, b = {18.9 * 16.7, 18.9}) annotation(
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {19.4 * 10.9, 19.4}, b = {6.6 * 14.4, 6.6}) annotation(
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_22 annotation(
      Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation(
      Placement(visible = true, transformation(origin = {42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation(
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation(
      Placement(visible = true, transformation(origin = {170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation(
      Placement(visible = true, transformation(origin = {170, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Modelica.Blocks.Nonlinear.FixedDelay L_11(delayTime = 1) annotation(
      Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 7) annotation(
      Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay LD_21(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {22, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay LD_12(delayTime = 4) annotation(
      Placement(visible = true, transformation(origin = {22, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, startTime = 0, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(r_22.y, e_22.u1) annotation(
      Line(points = {{-138, -110}, {-128, -110}, {-128, -110}, {-128, -110}}, color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation(
      Line(points = {{-138, 50}, {-130, 50}, {-130, 50}, {-128, 50}}, color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation(
      Line(points = {{-138, -50}, {-100, -50}, {-100, -110}, {-112, -110}, {-112, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation(
      Line(points = {{-138, -10}, {-100, -10}, {-100, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(D_21.y, LD_12.u) annotation(
      Line(points = {{1, -70}, {11, -70}, {11, -70}, {9, -70}}, color = {0, 0, 127}));
    connect(LD_12.y, u_22.u1) annotation(
      Line(points = {{33, -70}, {41, -70}, {41, -88}, {21, -88}, {21, -104}, {29, -104}, {29, -104}, {27, -104}, {27, -104}}, color = {0, 0, 127}));
    connect(G_22.y, L_22.u) annotation(
      Line(points = {{101, -110}, {109, -110}, {109, -110}, {119, -110}, {119, -110}, {117, -110}, {117, -110}, {117, -110}}, color = {0, 0, 127}));
    connect(L_22.y, y_22.u2) annotation(
      Line(points = {{141, -110}, {145, -110}, {145, -110}, {151, -110}, {151, -116}, {159, -116}, {159, -117}, {157, -117}, {157, -116}}, color = {0, 0, 127}));
    connect(G_12.y, L_12.u) annotation(
      Line(points = {{101, -70}, {119, -70}, {119, -70}, {117, -70}}, color = {0, 0, 127}));
    connect(L_12.y, y_11.u2) annotation(
      Line(points = {{141, -70}, {154, -70}, {154, -11}, {158, -11}, {158, 44}}, color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation(
      Line(points = {{-158, -70}, {-149, -70}, {-149, -70}, {-140, -70}, {-140, -70}, {-142, -70}}, color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation(
      Line(points = {{-118, -70}, {-109, -70}, {-109, -70}, {-100, -70}, {-100, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation(
      Line(points = {{-111, -110}, {-96, -110}, {-96, -110}, {-81, -110}, {-81, -110}, {-83, -110}, {-83, -110}, {-83, -110}}, color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation(
      Line(points = {{181, -110}, {193, -110}, {193, -140}, {-119, -140}, {-119, -118}, {-121, -118}}, color = {0, 0, 127}));
    connect(L_21.y, y_22.u1) annotation(
      Line(points = {{142, 10}, {152, 10}, {152, -104}, {158, -104}}, color = {0, 0, 127}));
    connect(G_22.u, u_22.y) annotation(
      Line(points = {{78, -110}, {65, -110}, {65, -110}, {52, -110}, {52, -110}, {52, -110}, {52, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(G_12.u, u_22.y) annotation(
      Line(points = {{78, -70}, {60, -70}, {60, -110}, {50, -110}, {50, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(D_22.y, u_22.u2) annotation(
      Line(points = {{1, -110}, {11, -110}, {11, -116}, {29, -116}, {29, -117}, {27, -117}, {27, -116}}, color = {0, 0, 127}));
    connect(C_22.y, D_22.u) annotation(
      Line(points = {{-59, -110}, {-23, -110}, {-23, -110}, {-23, -110}}, color = {0, 0, 127}));
    connect(D_21.u, C_11.y) annotation(
      Line(points = {{-22, -70}, {-40, -70}, {-40, 50}, {-58, 50}}, color = {0, 0, 127}));
    connect(D_12.u, C_22.y) annotation(
      Line(points = {{-22, 10}, {-36, 10}, {-36, -110}, {-59, -110}}, color = {0, 0, 127}));
    connect(LD_21.y, u_11.u2) annotation(
      Line(points = {{34, 10}, {38, 10}, {38, 30}, {20, 30}, {20, 44}, {30, 44}, {30, 44}}, color = {0, 0, 127}));
    connect(LD_21.u, D_12.y) annotation(
      Line(points = {{10, 10}, {2, 10}, {2, 10}, {2, 10}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation(
      Line(points = {{182, 50}, {190, 50}, {190, 80}, {-120, 80}, {-120, 58}, {-120, 58}}, color = {0, 0, 127}));
    connect(L_11.y, y_11.u1) annotation(
      Line(points = {{142, 50}, {148, 50}, {148, 56}, {158, 56}, {158, 56}}, color = {0, 0, 127}));
    connect(D_11.y, u_11.u1) annotation(
      Line(points = {{2, 50}, {14, 50}, {14, 56}, {30, 56}, {30, 56}}, color = {0, 0, 127}));
    connect(G_21.y, L_21.u) annotation(
      Line(points = {{102, 10}, {116, 10}, {116, 10}, {118, 10}}, color = {0, 0, 127}));
    connect(G_11.y, L_11.u) annotation(
      Line(points = {{102, 50}, {118, 50}, {118, 50}, {118, 50}}, color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation(
      Line(points = {{-158, 10}, {-142, 10}, {-142, 10}, {-142, 10}}, color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation(
      Line(points = {{-120, 10}, {-100, 10}, {-100, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(G_21.u, u_11.y) annotation(
      Line(points = {{78, 10}, {60, 10}, {60, 50}, {54, 50}, {54, 50}, {54, 50}}, color = {0, 0, 127}));
    connect(u_11.y, G_11.u) annotation(
      Line(points = {{54, 50}, {76, 50}, {76, 50}, {78, 50}}, color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation(
      Line(points = {{-58, 50}, {-24, 50}, {-24, 50}, {-22, 50}}, color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation(
      Line(points = {{-110, 50}, {-84, 50}, {-84, 50}, {-82, 50}}, color = {0, 0, 127}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Dynamic_Decoupling;

  model Inverse_Decoupling
    Modelica.Blocks.Continuous.PI C_11(T = 16.7, k = 0.041) annotation(
      Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 14.4, initType = Modelica.Blocks.Types.Init.SteadyState, k = -0.009) annotation(
      Placement(visible = true, transformation(origin = {-50, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {16.7, 1}, b = {12.8}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {10.9, 1}, b = {6.6}) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {21.0, 1}, b = {-18.9}) annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {14.4, 1}, b = {-19.4}) annotation(
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation(
      Placement(visible = true, transformation(origin = {170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation(
      Placement(visible = true, transformation(origin = {170, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Modelica.Blocks.Nonlinear.FixedDelay L_11(delayTime = 1) annotation(
      Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 7) annotation(
      Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add ed_11 annotation(
      Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add ed_22 annotation(
      Placement(visible = true, transformation(origin = {-78, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Derivative d_12(T = 21.0, initType = Modelica.Blocks.Types.Init.SteadyState, k = 36.069) annotation(
      Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Derivative d_21(T = 10.9, k = -37.714) annotation(
      Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Nonlinear.FixedDelay tau_12(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Nonlinear.FixedDelay tau_21(delayTime = 4) annotation(
      Placement(visible = true, transformation(origin = {-30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-152, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(r_11.y, e_11.u1) annotation(
      Line(points = {{-138, 50}, {-128, 50}, {-128, 50}, {-128, 50}}, color = {0, 0, 127}));
    connect(r_22.y, e_22.u1) annotation(
      Line(points = {{-138, -110}, {-128, -110}, {-128, -110}, {-128, -110}}, color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation(
      Line(points = {{-140, -52}, {-100, -52}, {-100, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation(
      Line(points = {{-138, -10}, {-100, -10}, {-100, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(d_21.u, tau_21.y) annotation(
      Line(points = {{-58, -70}, {-49, -70}, {-49, -70}, {-40, -70}, {-40, -70}, {-41, -70}, {-41, -70}, {-42, -70}}, color = {0, 0, 127}));
    connect(tau_21.u, C_11.y) annotation(
      Line(points = {{-18, -70}, {0, -70}, {0, 50}, {-38, 50}}, color = {0, 0, 127}));
    connect(d_21.y, ed_22.u1) annotation(
      Line(points = {{-81, -70}, {-88, -70}, {-88, -70}, {-97, -70}, {-97, -104}, {-91, -104}, {-91, -104}, {-89, -104}, {-89, -104}}, color = {0, 0, 127}));
    connect(ed_22.u2, e_22.y) annotation(
      Line(points = {{-90, -116}, {-93, -116}, {-93, -116}, {-96, -116}, {-96, -110}, {-112, -110}, {-112, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(ed_22.y, C_22.u) annotation(
      Line(points = {{-67, -110}, {-63, -110}, {-63, -110}, {-63, -110}, {-63, -110}, {-63, -110}}, color = {0, 0, 127}));
    connect(G_22.y, L_22.u) annotation(
      Line(points = {{101, -110}, {109, -110}, {109, -110}, {117, -110}, {117, -110}, {117, -110}, {117, -110}, {117, -110}}, color = {0, 0, 127}));
    connect(L_22.y, y_22.u2) annotation(
      Line(points = {{141, -110}, {145, -110}, {145, -110}, {149, -110}, {149, -116}, {157, -116}, {157, -117}, {157, -117}, {157, -116}}, color = {0, 0, 127}));
    connect(G_12.y, L_12.u) annotation(
      Line(points = {{101, -70}, {117, -70}, {117, -70}, {117, -70}, {117, -70}, {117, -70}}, color = {0, 0, 127}));
    connect(L_12.y, y_11.u2) annotation(
      Line(points = {{141, -70}, {154, -70}, {154, 44}, {158, 44}}, color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation(
      Line(points = {{-158, -70}, {-149, -70}, {-149, -70}, {-140, -70}, {-140, -70}, {-141, -70}, {-141, -70}, {-142, -70}}, color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation(
      Line(points = {{-118, -70}, {-109, -70}, {-109, -70}, {-100, -70}, {-100, -110}, {-110, -110}, {-110, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation(
      Line(points = {{181, -110}, {191, -110}, {191, -140}, {-121, -140}, {-121, -118}, {-121, -118}}, color = {0, 0, 127}));
    connect(L_21.y, y_22.u1) annotation(
      Line(points = {{142, 10}, {152, 10}, {152, -104}, {158, -104}}, color = {0, 0, 127}));
    connect(C_22.y, G_22.u) annotation(
      Line(points = {{-39, -110}, {77, -110}, {77, -110}, {77, -110}, {77, -110}, {77, -110}}, color = {0, 0, 127}));
    connect(G_12.u, C_22.y) annotation(
      Line(points = {{78, -70}, {20, -70}, {20, -110}, {-38, -110}, {-38, -112}, {-38, -112}, {-38, -110}}, color = {0, 0, 127}));
    connect(tau_12.u, C_22.y) annotation(
      Line(points = {{-18, 10}, {4, 10}, {4, -110}, {-39, -110}}, color = {0, 0, 127}));
    connect(G_21.u, C_11.y) annotation(
      Line(points = {{78, 10}, {20, 10}, {20, 50}, {-38, 50}, {-38, 50}}, color = {0, 0, 127}));
    connect(C_11.y, G_11.u) annotation(
      Line(points = {{-38, 50}, {78, 50}, {78, 50}, {78, 50}}, color = {0, 0, 127}));
    connect(d_12.u, tau_12.y) annotation(
      Line(points = {{-56, 10}, {-41, 10}}, color = {0, 0, 127}));
    connect(d_12.y, ed_11.u2) annotation(
      Line(points = {{-79, 10}, {-96, 10}, {-96, 44}, {-92, 44}}, color = {0, 0, 127}));
    connect(ed_11.y, C_11.u) annotation(
      Line(points = {{-68, 50}, {-64, 50}, {-64, 50}, {-62, 50}}, color = {0, 0, 127}));
    connect(ed_11.u1, e_11.y) annotation(
      Line(points = {{-92, 56}, {-98, 56}, {-98, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation(
      Line(points = {{182, 50}, {190, 50}, {190, 80}, {-120, 80}, {-120, 58}, {-120, 58}}, color = {0, 0, 127}));
    connect(L_11.y, y_11.u1) annotation(
      Line(points = {{142, 50}, {148, 50}, {148, 56}, {158, 56}, {158, 56}}, color = {0, 0, 127}));
    connect(G_21.y, L_21.u) annotation(
      Line(points = {{102, 10}, {116, 10}, {116, 10}, {118, 10}}, color = {0, 0, 127}));
    connect(G_11.y, L_11.u) annotation(
      Line(points = {{102, 50}, {118, 50}, {118, 50}, {118, 50}}, color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation(
      Line(points = {{-158, 10}, {-142, 10}, {-142, 10}, {-142, 10}}, color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation(
      Line(points = {{-120, 10}, {-100, 10}, {-100, 50}, {-110, 50}}, color = {0, 0, 127}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 4800, Tolerance = 1e-10, Interval = 1));
  end Inverse_Decoupling;

  model Multivariable_PID
    Modelica.Blocks.Continuous.PI C_11(T = 7.692307692, k = 1. / 0.81) annotation(
      Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 1. / 0.165, k = 1. / 1.57) annotation(
      Placement(visible = true, transformation(origin = {-50, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {16.7, 1}, b = {12.8}, y_start = 0) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {10.9, 1}, b = {6.6}, y_start = 0) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {21.0, 1}, b = {-18.9}, y_start = 0) annotation(
      Placement(visible = true, transformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {14.4, 1}, b = {-19.4}, y_start = 0) annotation(
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation(
      Placement(visible = true, transformation(origin = {170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation(
      Placement(visible = true, transformation(origin = {170, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Modelica.Blocks.Nonlinear.FixedDelay L_11(delayTime = 1) annotation(
      Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 7) annotation(
      Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_12(T = 1. / 0.23, k = 1. / 1.50) annotation(
      Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_21(T = 1. / 0.085, k = 1. / 1.57) annotation(
      Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay LC_21(delayTime = 4) annotation(
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay LC_12(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22(k2 = -1) annotation(
      Placement(visible = true, transformation(origin = {30, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11(k2 = -1) annotation(
      Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain k1(k = 0.524) annotation(
      Placement(visible = true, transformation(origin = {-82, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain k2(k = 0.175) annotation(
      Placement(visible = true, transformation(origin = {-82, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_11(period = 2400, startTime = 0, width = 50) annotation(
      Placement(visible = true, transformation(origin = {-170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_22(offset = 0, period = 2400, startTime = 600, width = 50) annotation(
      Placement(visible = true, transformation(origin = {-170, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  equation
    connect(r_22.y, e_22.u1) annotation(
      Line(points = {{-159, -108}, {-127, -108}, {-127, -110}, {-129, -110}}, color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation(
      Line(points = {{-138, -50}, {-100, -50}, {-100, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation(
      Line(points = {{-138, -10}, {-100, -10}, {-100, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(k2.u, e_22.y) annotation(
      Line(points = {{-94, -110}, {-103, -110}, {-103, -110}, {-112, -110}, {-112, -110}, {-111, -110}, {-111, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(k2.y, C_22.u) annotation(
      Line(points = {{-71, -110}, {-67, -110}, {-67, -110}, {-61, -110}, {-61, -110}, {-62, -110}, {-62, -110}, {-63, -110}}, color = {0, 0, 127}));
    connect(C_12.u, k2.y) annotation(
      Line(points = {{-62, -70}, {-65, -70}, {-65, -70}, {-68, -70}, {-68, -110}, {-70, -110}, {-70, -111}, {-70, -111}, {-70, -110}}, color = {0, 0, 127}));
    connect(u_22.y, G_22.u) annotation(
      Line(points = {{41, -110}, {59, -110}, {59, -110}, {77, -110}, {77, -110}, {76, -110}, {76, -110}, {77, -110}}, color = {0, 0, 127}));
    connect(u_22.u2, C_22.y) annotation(
      Line(points = {{18, -116}, {9, -116}, {9, -116}, {0, -116}, {0, -110}, {-20.5, -110}, {-20.5, -110}, {-41, -110}}, color = {0, 0, 127}));
    connect(LC_21.y, u_22.u1) annotation(
      Line(points = {{2, 10}, {6, 10}, {6, -104}, {18, -104}}, color = {0, 0, 127}));
    connect(G_12.u, u_22.y) annotation(
      Line(points = {{76, -70}, {60, -70}, {60, -110}, {42, -110}}, color = {0, 0, 127}));
    connect(LC_12.u, C_12.y) annotation(
      Line(points = {{-22, -70}, {-38, -70}, {-38, -70}, {-38, -70}}, color = {0, 0, 127}));
    connect(LC_12.y, u_11.u2) annotation(
      Line(points = {{1, -70}, {12, -70}, {12, 44}, {18, 44}}, color = {0, 0, 127}));
    connect(G_22.y, L_22.u) annotation(
      Line(points = {{101, -110}, {119, -110}, {119, -110}, {117, -110}}, color = {0, 0, 127}));
    connect(L_22.y, y_22.u2) annotation(
      Line(points = {{141, -110}, {151, -110}, {151, -116}, {159, -116}, {159, -116}, {157, -116}, {157, -116}}, color = {0, 0, 127}));
    connect(L_12.y, y_11.u2) annotation(
      Line(points = {{141, -70}, {154, -70}, {154, 44}, {158, 44}}, color = {0, 0, 127}));
    connect(G_12.y, L_12.u) annotation(
      Line(points = {{99, -70}, {118, -70}}, color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation(
      Line(points = {{-158, -70}, {-140, -70}, {-140, -70}, {-142, -70}}, color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation(
      Line(points = {{-118, -70}, {-100, -70}, {-100, -110}, {-110, -110}, {-110, -112}, {-110, -112}, {-110, -110}}, color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation(
      Line(points = {{181, -110}, {193, -110}, {193, -140}, {-119, -140}, {-119, -118}, {-121, -118}}, color = {0, 0, 127}));
    connect(L_21.y, y_22.u1) annotation(
      Line(points = {{142, 10}, {152, 10}, {152, -104}, {158, -104}}, color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation(
      Line(points = {{-158, 50}, {-128, 50}, {-128, 50}, {-128, 50}}, color = {0, 0, 127}));
    connect(k1.y, C_21.u) annotation(
      Line(points = {{-70, 50}, {-68, 50}, {-68, 10}, {-62, 10}, {-62, 10}}, color = {0, 0, 127}));
    connect(k1.y, C_11.u) annotation(
      Line(points = {{-70, 50}, {-64, 50}, {-64, 50}, {-62, 50}}, color = {0, 0, 127}));
    connect(k1.u, e_11.y) annotation(
      Line(points = {{-94, 50}, {-110, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(LC_21.u, C_21.y) annotation(
      Line(points = {{-24, 10}, {-40, 10}, {-40, 10}, {-40, 10}}, color = {0, 0, 127}));
    connect(u_11.u1, C_11.y) annotation(
      Line(points = {{18, 56}, {0, 56}, {0, 50}, {-41, 50}}, color = {0, 0, 127}));
    connect(G_21.u, u_11.y) annotation(
      Line(points = {{80, 10}, {60, 10}, {60, 50}, {42, 50}}, color = {0, 0, 127}));
    connect(G_21.y, L_21.u) annotation(
      Line(points = {{103, 10}, {118, 10}}, color = {0, 0, 127}));
    connect(u_11.y, G_11.u) annotation(
      Line(points = {{42, 50}, {76, 50}, {76, 50}, {78, 50}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation(
      Line(points = {{182, 50}, {190, 50}, {190, 80}, {-120, 80}, {-120, 58}, {-120, 58}}, color = {0, 0, 127}));
    connect(L_11.y, y_11.u1) annotation(
      Line(points = {{142, 50}, {148, 50}, {148, 56}, {158, 56}, {158, 56}}, color = {0, 0, 127}));
    connect(G_11.y, L_11.u) annotation(
      Line(points = {{102, 50}, {118, 50}, {118, 50}, {118, 50}}, color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation(
      Line(points = {{-158, 10}, {-142, 10}, {-142, 10}, {-142, 10}}, color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation(
      Line(points = {{-120, 10}, {-100, 10}, {-100, 50}, {-110, 50}}, color = {0, 0, 127}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 4800, Tolerance = 1e-10, Interval = 1));
  end Multivariable_PID;

  model Approximation
    Modelica.Blocks.Continuous.TransferFunction Model(a = {1, 0.129}, b = {0.8061}) annotation(
      Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction Real_1(a = {-6803.58, -731.38, -19.4}, b = {-5214.72, -248.32}) annotation(
      Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction Real_2(a = {-74159.022, -14775, -942.84, -19.4}, b = {29997.4752, 3879.414, 124.74}) annotation(
      Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay Delay(delayTime = 6) annotation(
      Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_Real annotation(
      Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add e(k1 = -1) annotation(
      Placement(visible = true, transformation(origin = {88, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step Source annotation(
      Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(Model.u, Source.y) annotation(
      Line(points = {{-42, 50}, {-60, 50}, {-60, -30}, {-78, -30}, {-78, -30}}, color = {0, 0, 127}));
    connect(Source.y, Real_1.u) annotation(
      Line(points = {{-78, -30}, {-60, -30}, {-60, 10}, {-42, 10}, {-42, 10}}, color = {0, 0, 127}));
    connect(Source.y, Real_2.u) annotation(
      Line(points = {{-78, -30}, {-42, -30}, {-42, -30}, {-42, -30}}, color = {0, 0, 127}));
    connect(e.u1, Model.y) annotation(
      Line(points = {{76, 22}, {20, 22}, {20, 50}, {-18, 50}, {-18, 50}}, color = {0, 0, 127}));
    connect(e.u2, y_Real.y) annotation(
      Line(points = {{76, 10}, {66, 10}, {66, -10}, {62, -10}, {62, -10}}, color = {0, 0, 127}));
    connect(y_Real.u2, Delay.y) annotation(
      Line(points = {{38, -16}, {30, -16}, {30, -30}, {22, -30}, {22, -30}}, color = {0, 0, 127}));
    connect(Real_1.y, y_Real.u1) annotation(
      Line(points = {{-18, 10}, {30, 10}, {30, -4}, {38, -4}, {38, -4}}, color = {0, 0, 127}));
    connect(Real_2.y, Delay.u) annotation(
      Line(points = {{-19, -30}, {-2, -30}}, color = {0, 0, 127}));
  end Approximation;

  model Ideal
    Modelica.Blocks.Continuous.PI C_11(T = 10.1483, k = 0.2206) annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 11.30, k = -0.059) annotation(
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {16.7, 1}, b = {12.8}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {10.9, 1}, b = {6.6}) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {21.0, 1}, b = {-18.9}) annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {14.4, 1}, b = {-19.4}) annotation(
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation(
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {12.2}, b = {0}) annotation(
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {19.4}, b = {0}) annotation(
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_22 annotation(
      Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation(
      Placement(visible = true, transformation(origin = {42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation(
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11(k2 = 0) annotation(
      Placement(visible = true, transformation(origin = {170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22(k1 = 0) annotation(
      Placement(visible = true, transformation(origin = {170, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Modelica.Blocks.Nonlinear.FixedDelay L_11(delayTime = 1) annotation(
      Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 7) annotation(
      Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50)  annotation(
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(r_22.y, e_22.u1) annotation(
      Line(points = {{-138, -110}, {-130, -110}, {-130, -110}, {-128, -110}}, color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation(
      Line(points = {{-138, 50}, {-130, 50}, {-130, 50}, {-128, 50}}, color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation(
      Line(points = {{-138, -50}, {-100, -50}, {-100, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation(
      Line(points = {{-118, -70}, {-100, -70}, {-100, -110}, {-110, -110}, {-110, -110}, {-110, -110}}, color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation(
      Line(points = {{-138, -10}, {-100, -10}, {-100, 50}, {-110, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(G_22.y, L_22.u) annotation(
      Line(points = {{101, -110}, {119, -110}, {119, -110}, {117, -110}}, color = {0, 0, 127}));
    connect(L_22.y, y_22.u2) annotation(
      Line(points = {{141, -110}, {151, -110}, {151, -116}, {159, -116}, {159, -116}, {157, -116}, {157, -116}}, color = {0, 0, 127}));
    connect(G_12.y, L_12.u) annotation(
      Line(points = {{101, -70}, {119, -70}, {119, -70}, {117, -70}}, color = {0, 0, 127}));
    connect(L_12.y, y_11.u2) annotation(
      Line(points = {{141, -70}, {154, -70}, {154, 44}, {158, 44}}, color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation(
      Line(points = {{-158, -70}, {-140, -70}, {-140, -70}, {-142, -70}}, color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation(
      Line(points = {{-111, -110}, {-81, -110}, {-81, -110}, {-83, -110}}, color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation(
      Line(points = {{181, -110}, {186, -110}, {186, -108}, {193, -108}, {193, -138}, {-119, -138}, {-119, -116}, {-121, -116}, {-121, -118}, {-121, -118}}, color = {0, 0, 127}));
    connect(L_21.y, y_22.u1) annotation(
      Line(points = {{142, 10}, {152, 10}, {152, -104}, {158, -104}}, color = {0, 0, 127}));
    connect(G_22.u, u_22.y) annotation(
      Line(points = {{78, -110}, {65, -110}, {65, -108}, {52, -108}, {52, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(G_12.u, u_22.y) annotation(
      Line(points = {{78, -70}, {60, -70}, {60, -110}, {50, -110}, {50, -110}, {52, -110}}, color = {0, 0, 127}));
    connect(D_22.y, u_22.u2) annotation(
      Line(points = {{1, -110}, {11, -110}, {11, -116}, {29, -116}, {29, -116}, {27, -116}, {27, -116}}, color = {0, 0, 127}));
    connect(D_21.y, u_22.u1) annotation(
      Line(points = {{1, -70}, {10, -70}, {10, -68}, {21, -68}, {21, -102}, {29, -102}, {29, -105}, {27, -105}, {27, -104}}, color = {0, 0, 127}));
    connect(C_22.y, D_22.u) annotation(
      Line(points = {{-59, -110}, {-23, -110}, {-23, -110}, {-23, -110}}, color = {0, 0, 127}));
    connect(D_21.u, C_11.y) annotation(
      Line(points = {{-22, -70}, {-40, -70}, {-40, 50}, {-58, 50}}, color = {0, 0, 127}));
    connect(D_12.u, C_22.y) annotation(
      Line(points = {{-22, 10}, {-36, 10}, {-36, -110}, {-59, -110}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation(
      Line(points = {{182, 50}, {190, 50}, {190, 80}, {-120, 80}, {-120, 58}, {-120, 58}}, color = {0, 0, 127}));
    connect(L_11.y, y_11.u1) annotation(
      Line(points = {{142, 50}, {148, 50}, {148, 56}, {158, 56}, {158, 56}}, color = {0, 0, 127}));
    connect(D_11.y, u_11.u1) annotation(
      Line(points = {{2, 50}, {14, 50}, {14, 56}, {30, 56}, {30, 56}}, color = {0, 0, 127}));
    connect(G_21.y, L_21.u) annotation(
      Line(points = {{102, 10}, {116, 10}, {116, 10}, {118, 10}}, color = {0, 0, 127}));
    connect(G_11.y, L_11.u) annotation(
      Line(points = {{102, 50}, {118, 50}, {118, 50}, {118, 50}}, color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation(
      Line(points = {{-158, 10}, {-142, 10}, {-142, 10}, {-142, 10}}, color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation(
      Line(points = {{-120, 10}, {-100, 10}, {-100, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(G_21.u, u_11.y) annotation(
      Line(points = {{78, 10}, {60, 10}, {60, 50}, {54, 50}, {54, 50}, {54, 50}}, color = {0, 0, 127}));
    connect(D_12.y, u_11.u2) annotation(
      Line(points = {{2, 10}, {20, 10}, {20, 44}, {30, 44}, {30, 44}}, color = {0, 0, 127}));
    connect(u_11.y, G_11.u) annotation(
      Line(points = {{54, 50}, {76, 50}, {76, 50}, {78, 50}}, color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation(
      Line(points = {{-58, 50}, {-24, 50}, {-24, 50}, {-22, 50}}, color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation(
      Line(points = {{-110, 50}, {-84, 50}, {-84, 50}, {-82, 50}}, color = {0, 0, 127}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 4800, Tolerance = 1e-10, Interval = 1));
  end Ideal;
  annotation(
    uses(Modelica(version = "3.2.2")));
end WoodBerry;
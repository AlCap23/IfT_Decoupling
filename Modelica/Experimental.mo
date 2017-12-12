package Experimental

  model Inverse_Decoupling
    Modelica.Blocks.Continuous.PI C_11(T = 10., k = -1.8055) annotation(
      Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 20., initType = Modelica.Blocks.Types.Init.SteadyState, k = -0.1495) annotation(
      Placement(visible = true, transformation(origin = {-50, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {10., 1}, b = {-0.29}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {8., 1}, b = {0.625}) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {75., 1}, b = {-.5}) annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {20., 1}, b = {-1.75}) annotation(
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
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add ed_11(k2 = -1)  annotation(
      Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add ed_22(k1 = -1)  annotation(
      Placement(visible = true, transformation(origin = {-78, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Derivative d_12(T = 8., initType = Modelica.Blocks.Types.Init.SteadyState, k = 1.194) annotation(
      Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Derivative d_21(T = 75., k = -1.9098) annotation(
      Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Nonlinear.FixedDelay tau_12(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Nonlinear.FixedDelay tau_21(delayTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-152, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50) annotation(
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, width = 50) annotation(
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
      experiment(StartTime = 0, StopTime = 4800, Tolerance = 1e-8, Interval = 1));
  end Inverse_Decoupling;

  model Multivariable_PID
    Modelica.Blocks.Continuous.PI C_11(T = 1 / 30, k = -1.75 / 0.82 * 30) annotation(
      Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 1 / 40, k = -0.29 / 0.82 * 40) annotation(
      Placement(visible = true, transformation(origin = {-50, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {10, 1}, b = {-0.29}, y_start = 0) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {8, 1}, b = {0.625}, y_start = 0) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {75, 1}, b = {-0.5}, y_start = 0) annotation(
      Placement(visible = true, transformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {20, 1}, b = {-1.75}, y_start = 0) annotation(
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
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {132, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_12(T = 1 / 42, k = -0.625 / 0.82 * 42) annotation(
      Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay LC_21(delayTime = 1) annotation(
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay LC_12(delayTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22(k1 = -1)  annotation(
      Placement(visible = true, transformation(origin = {30, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11(k2 = -1)  annotation(
      Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain k1(k = 0.001) annotation(
      Placement(visible = true, transformation(origin = {-82, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain k2(k = 0.001) annotation(
      Placement(visible = true, transformation(origin = {-82, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_11(period = 2400, startTime = 0, width = 50) annotation(
      Placement(visible = true, transformation(origin = {-170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_22(offset = 0, period = 2400, startTime = 600, width = 50) annotation(
      Placement(visible = true, transformation(origin = {-170, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator KI(k = 0.5 / 0.82)  annotation(
      Placement(visible = true, transformation(origin = {-48, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(KI.y, LC_21.u) annotation(
      Line(points = {{-36, 10}, {-22, 10}, {-22, 10}, {-22, 10}}, color = {0, 0, 127}));
    connect(KI.u, k1.y) annotation(
      Line(points = {{-60, 10}, {-68, 10}, {-68, 50}, {-70, 50}, {-70, 50}}, color = {0, 0, 127}));
    connect(G_21.y, L_21.u) annotation(
      Line(points = {{103, 10}, {120, 10}}, color = {0, 0, 127}));
    connect(L_21.y, y_22.u1) annotation(
      Line(points = {{143, 10}, {152, 10}, {152, -104}, {158, -104}}, color = {0, 0, 127}));
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
    connect(r_11.y, e_11.u1) annotation(
      Line(points = {{-158, 50}, {-128, 50}, {-128, 50}, {-128, 50}}, color = {0, 0, 127}));
    connect(k1.y, C_11.u) annotation(
      Line(points = {{-70, 50}, {-64, 50}, {-64, 50}, {-62, 50}}, color = {0, 0, 127}));
    connect(k1.u, e_11.y) annotation(
      Line(points = {{-94, 50}, {-110, 50}, {-110, 50}, {-110, 50}}, color = {0, 0, 127}));
    connect(u_11.u1, C_11.y) annotation(
      Line(points = {{18, 56}, {0, 56}, {0, 50}, {-41, 50}}, color = {0, 0, 127}));
    connect(G_21.u, u_11.y) annotation(
      Line(points = {{80, 10}, {60, 10}, {60, 50}, {42, 50}}, color = {0, 0, 127}));
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

  model Ideal
    Modelica.Blocks.Continuous.PI C_11(T = 6.0768, k = -9.7363) annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 12.1537, k = -1.613) annotation(
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {10., 1}, b = {-0.29}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {8., 1}, b = {0.625 * 0.0}) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {75., 1}, b = {-0.5 * 0.0}) annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {20., 1}, b = {-1.75}) annotation(
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
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, width = 50) annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50) annotation(
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

  model Decentralized
    Modelica.Blocks.Continuous.PI C_11(T = 6.0768, k = -9.7363) annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 12.1537, k = -1.613) annotation(
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {10., 1}, b = {-0.29}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {8., 1}, b = {0.625}) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {75., 1}, b = {-0.5}) annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {20., 1}, b = {-1.75}) annotation(
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
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, width = 50) annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50) annotation(
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
  end Decentralized;

  model Static
    Modelica.Blocks.Continuous.PI C_11(T = 8.0245, k = -25.339) annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 24.891, k = -0.998) annotation(
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {10., 1}, b = {-0.29}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {8., 1}, b = {0.625}) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {75., 1}, b = {-0.5}) annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {20., 1}, b = {-1.75}) annotation(
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation(
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {0.29}, b = {0.625}) annotation(
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {1.75}, b = {-0.5}) annotation(
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
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, width = 50) annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50) annotation(
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
  end Static;

  model Dynamic
    Modelica.Blocks.Continuous.PI C_11(T = 17.425, k = -6.025) annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 10.623, k = -0.388) annotation(
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {10., 1}, b = {-0.29}) annotation(
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {8., 1}, b = {0.625}) annotation(
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {75., 1}, b = {-0.5}) annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {20., 1}, b = {-1.75}) annotation(
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation(
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {0.29 * 8.0,0.29}, b = {0.625 * 10,0.625}) annotation(
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {1.75 * 75.0,1.75}, b = {-0.5 * 20., -0.5}) annotation(
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
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 3) annotation(
      Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 2) annotation(
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation(
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation(
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, width = 50) annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50) annotation(
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.FixedDelay LD_12(delayTime = 2)  annotation(
      Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.FixedDelay LD_21(delayTime = 0)  annotation(
      Placement(visible = true, transformation(origin = {30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(LD_21.y, u_22.u1) annotation(
      Line(points = {{42, -70}, {52, -70}, {52, -90}, {18, -90}, {18, -104}, {28, -104}, {28, -104}}, color = {0, 0, 127}));
    connect(LD_21.u, D_21.y) annotation(
      Line(points = {{18, -70}, {0, -70}, {0, -70}, {2, -70}}, color = {0, 0, 127}));
    connect(LD_12.y, u_11.u2) annotation(
      Line(points = {{42, 10}, {48, 10}, {48, 30}, {14, 30}, {14, 44}, {30, 44}, {30, 44}}, color = {0, 0, 127}));
    connect(LD_12.u, D_12.y) annotation(
      Line(points = {{18, 10}, {0, 10}, {0, 10}, {2, 10}}, color = {0, 0, 127}));
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
    connect(u_11.y, G_11.u) annotation(
      Line(points = {{54, 50}, {76, 50}, {76, 50}, {78, 50}}, color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation(
      Line(points = {{-58, 50}, {-24, 50}, {-24, 50}, {-22, 50}}, color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation(
      Line(points = {{-110, 50}, {-84, 50}, {-84, 50}, {-82, 50}}, color = {0, 0, 127}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 4800, Tolerance = 1e-10, Interval = 1));
  end Dynamic;
  annotation(
    uses(Modelica(version = "3.2.2")));
end Experimental;
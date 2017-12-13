package Experimental_Gain

  model Ideal
    Modelica.Blocks.Continuous.PI C_11(T = 6.0768, k = -9.7363) annotation (
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 12.1537, k = -1.613) annotation (
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {10., 1}, b = {-0.29}) annotation (
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {8., 1}, b = {0.625 * 0.0}) annotation (
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {75., 1}, b = {-0.5 * 0.0}) annotation (
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {20., 1}, b = {-1.75}) annotation (
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation (
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {12.2}, b = {0}) annotation (
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {19.4}, b = {0}) annotation (
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_22 annotation (
      Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation (
      Placement(visible = true, transformation(origin = {42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation (
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11(k2 = 0) annotation (
      Placement(visible = true, transformation(origin = {170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22(k1 = 0) annotation (
      Placement(visible = true, transformation(origin = {170, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation (
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation (
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs_e1 annotation (
      Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation (
      Placement(visible = true, transformation(origin = {-130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_1 annotation (
      Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2 annotation (
      Placement(visible = true, transformation(origin = {-170, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Nonlinear.FixedDelay L_11(delayTime = 1) annotation (
      Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 3) annotation (
      Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 2) annotation (
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 2) annotation (
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation (
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation (
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, width = 50) annotation (
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50) annotation (
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(r_22.y, e_22.u1) annotation (
      Line(points={{-139,-110},{-130,-110},{-130,-110},{-128,-110}},          color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation (
      Line(points={{-139,50},{-130,50},{-130,50},{-128,50}},          color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation (
      Line(points={{-138,-50},{-100,-50},{-100,-110},{-111,-110},{-111,-110}},            color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation (
      Line(points={{-118,-70},{-100,-70},{-100,-110},{-110,-110},{-110,-110},{
            -111,-110}},                                                                                color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation (
      Line(points={{-138,-10},{-100,-10},{-100,50},{-110,50},{-110,50},{-111,50}},              color = {0, 0, 127}));
    connect(G_22.y, L_22.u) annotation (
      Line(points={{101,-110},{119,-110},{119,-110},{118,-110}},          color = {0, 0, 127}));
    connect(L_22.y, y_22.u2) annotation (
      Line(points={{141,-110},{151,-110},{151,-116},{159,-116},{159,-116},{158,
            -116},{158,-116}},                                                                                   color = {0, 0, 127}));
    connect(G_12.y, L_12.u) annotation (
      Line(points={{101,-70},{119,-70},{119,-70},{118,-70}},          color = {0, 0, 127}));
    connect(L_12.y, y_11.u2) annotation (
      Line(points = {{141, -70}, {154, -70}, {154, 44}, {158, 44}}, color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation (
      Line(points={{-158,-70},{-140,-70},{-140,-70},{-141,-70}},          color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation (
      Line(points={{-111,-110},{-81,-110},{-81,-110},{-82,-110}},          color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation (
      Line(points={{181,-110},{186,-110},{186,-108},{193,-108},{193,-138},{-119,
            -138},{-119,-116},{-121,-116},{-121,-118},{-120,-118}},                                                                                          color = {0, 0, 127}));
    connect(L_21.y, y_22.u1) annotation (
      Line(points={{141,10},{152,10},{152,-104},{158,-104}},          color = {0, 0, 127}));
    connect(G_22.u, u_22.y) annotation (
      Line(points={{78,-110},{65,-110},{65,-108},{52,-108},{52,-110},{51,-110}},              color = {0, 0, 127}));
    connect(G_12.u, u_22.y) annotation (
      Line(points={{78,-70},{60,-70},{60,-110},{50,-110},{50,-110},{51,-110}},              color = {0, 0, 127}));
    connect(D_22.y, u_22.u2) annotation (
      Line(points={{1,-110},{11,-110},{11,-116},{29,-116},{29,-116},{28,-116},{
            28,-116}},                                                                                   color = {0, 0, 127}));
    connect(D_21.y, u_22.u1) annotation (
      Line(points={{1,-70},{10,-70},{10,-68},{21,-68},{21,-102},{29,-102},{29,
            -105},{28,-105},{28,-104}},                                                                                      color = {0, 0, 127}));
    connect(C_22.y, D_22.u) annotation (
      Line(points={{-59,-110},{-23,-110},{-23,-110},{-22,-110}},          color = {0, 0, 127}));
    connect(D_21.u, C_11.y) annotation (
      Line(points={{-22,-70},{-40,-70},{-40,50},{-59,50}},          color = {0, 0, 127}));
    connect(D_12.u, C_22.y) annotation (
      Line(points = {{-22, 10}, {-36, 10}, {-36, -110}, {-59, -110}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation (
      Line(points={{181,50},{190,50},{190,80},{-120,80},{-120,58},{-120,58}},              color = {0, 0, 127}));
    connect(L_11.y, y_11.u1) annotation (
      Line(points={{141,50},{148,50},{148,56},{158,56},{158,56}},            color = {0, 0, 127}));
    connect(D_11.y, u_11.u1) annotation (
      Line(points={{1,50},{14,50},{14,56},{30,56},{30,56}},            color = {0, 0, 127}));
    connect(G_21.y, L_21.u) annotation (
      Line(points={{101,10},{116,10},{116,10},{118,10}},          color = {0, 0, 127}));
    connect(G_11.y, L_11.u) annotation (
      Line(points={{101,50},{118,50},{118,50},{118,50}},          color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation (
      Line(points={{-158,10},{-142,10},{-142,10},{-141,10}},          color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation (
      Line(points={{-118,10},{-100,10},{-100,50},{-111,50}},          color = {0, 0, 127}));
    connect(G_21.u, u_11.y) annotation (
      Line(points={{78,10},{60,10},{60,50},{54,50},{54,50},{53,50}},              color = {0, 0, 127}));
    connect(D_12.y, u_11.u2) annotation (
      Line(points={{1,10},{20,10},{20,44},{30,44},{30,44}},            color = {0, 0, 127}));
    connect(u_11.y, G_11.u) annotation (
      Line(points={{53,50},{76,50},{76,50},{78,50}},          color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation (
      Line(points={{-59,50},{-24,50},{-24,50},{-22,50}},          color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation (
      Line(points={{-111,50},{-84,50},{-84,50},{-82,50}},          color = {0, 0, 127}));
    annotation (
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 4800, Tolerance = 1e-10, Interval = 1),
      Icon(coordinateSystem(extent={{-500,-500},{500,500}}, initialScale=0.1)),
      Diagram(coordinateSystem(extent={{-500,-500},{500,500}}, initialScale=0.1)));
  end Ideal;

  model Decentralized
    Modelica.Blocks.Continuous.PI C_11(T = 6.0768, k = -9.7363) annotation (
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 12.1537, k = -1.613) annotation (
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {10., 1}, b = {-0.29}) annotation (
      Placement(visible = true, transformation(origin={178,50},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {8., 1}, b = {0.625}) annotation (
      Placement(visible = true, transformation(origin={178,10},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {75., 1}, b = {-0.5}) annotation (
      Placement(visible = true, transformation(origin={178,-70},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {20., 1}, b = {-1.75}) annotation (
      Placement(visible = true, transformation(origin={178,-110},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation (
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {12.2}, b = {0}) annotation (
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {19.4}, b = {0}) annotation (
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_22 annotation (
      Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation (
      Placement(visible = true, transformation(origin = {42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation (
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation (
      Placement(visible = true, transformation(origin={258,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation (
      Placement(visible = true, transformation(origin={258,-110},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation (
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation (
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs_e1 annotation (
      Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation (
      Placement(visible = true, transformation(origin = {-130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_1 annotation (
      Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2 annotation (
      Placement(visible = true, transformation(origin = {-170, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Nonlinear.FixedDelay L_11(delayTime = 1) annotation (
      Placement(visible = true, transformation(origin={218,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 3) annotation (
      Placement(visible = true, transformation(origin={218,10},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 2) annotation (
      Placement(visible = true, transformation(origin={218,-70},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 2) annotation (
      Placement(visible = true, transformation(origin={218,-110},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation (
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation (
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, width = 50) annotation (
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50) annotation (
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y_1
      annotation (Placement(transformation(extent={{306,38},{326,58}})));
    Modelica.Blocks.Interfaces.RealOutput y_2
      annotation (Placement(transformation(extent={{314,-118},{334,-98}})));
    Modelica.Blocks.Interfaces.RealOutput u_1
      annotation (Placement(transformation(extent={{-128,76},{-108,96}})));
    Modelica.Blocks.Interfaces.RealOutput u_2
      annotation (Placement(transformation(extent={{-124,-158},{-104,-138}})));
    Modelica.Blocks.Math.Gain K_11(k=1)
      annotation (Placement(transformation(extent={{80,40},{100,60}})));
    Modelica.Blocks.Math.Gain K_22(k=1)
      annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
  equation
    connect(r_22.y, e_22.u1) annotation (
      Line(points={{-139,-110},{-130,-110},{-130,-110},{-128,-110}},          color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation (
      Line(points={{-139,50},{-130,50},{-130,50},{-128,50}},          color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation (
      Line(points={{-138,-50},{-100,-50},{-100,-110},{-111,-110},{-111,-110}},            color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation (
      Line(points={{-118,-70},{-100,-70},{-100,-110},{-110,-110},{-110,-110},{
            -111,-110}},                                                                                color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation (
      Line(points={{-138,-10},{-100,-10},{-100,50},{-110,50},{-110,50},{-111,50}},              color = {0, 0, 127}));
    connect(G_22.y, L_22.u) annotation (
      Line(points={{189,-110},{207,-110},{206,-110}},                     color = {0, 0, 127}));
    connect(L_22.y, y_22.u2) annotation (
      Line(points={{229,-110},{239,-110},{239,-116},{247,-116},{246,-116}},                                      color = {0, 0, 127}));
    connect(G_12.y, L_12.u) annotation (
      Line(points={{189,-70},{207,-70},{206,-70}},                    color = {0, 0, 127}));
    connect(L_12.y, y_11.u2) annotation (
      Line(points={{229,-70},{242,-70},{242,44},{246,44}},          color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation (
      Line(points={{-158,-70},{-140,-70},{-140,-70},{-141,-70}},          color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation (
      Line(points={{-111,-110},{-81,-110},{-81,-110},{-82,-110}},          color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation (
      Line(points={{269,-110},{274,-110},{274,-108},{281,-108},{281,-138},{-31,
            -138},{-31,-116},{-33,-116},{-33,-118},{-120,-118}},                                                                                             color = {0, 0, 127}));
    connect(L_21.y, y_22.u1) annotation (
      Line(points={{229,10},{240,10},{240,-104},{246,-104}},          color = {0, 0, 127}));
    connect(D_22.y, u_22.u2) annotation (
      Line(points={{1,-110},{11,-110},{11,-116},{29,-116},{29,-116},{28,-116},{
            28,-116}},                                                                                   color = {0, 0, 127}));
    connect(D_21.y, u_22.u1) annotation (
      Line(points={{1,-70},{10,-70},{10,-68},{21,-68},{21,-102},{29,-102},{29,
            -105},{28,-105},{28,-104}},                                                                                      color = {0, 0, 127}));
    connect(C_22.y, D_22.u) annotation (
      Line(points={{-59,-110},{-23,-110},{-23,-110},{-22,-110}},          color = {0, 0, 127}));
    connect(D_21.u, C_11.y) annotation (
      Line(points={{-22,-70},{-40,-70},{-40,50},{-59,50}},          color = {0, 0, 127}));
    connect(D_12.u, C_22.y) annotation (
      Line(points = {{-22, 10}, {-36, 10}, {-36, -110}, {-59, -110}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation (
      Line(points={{269,50},{278,50},{278,80},{-32,80},{-32,58},{-120,58}},                color = {0, 0, 127}));
    connect(L_11.y, y_11.u1) annotation (
      Line(points={{229,50},{236,50},{236,56},{246,56}},                     color = {0, 0, 127}));
    connect(D_11.y, u_11.u1) annotation (
      Line(points={{1,50},{14,50},{14,56},{30,56},{30,56}},            color = {0, 0, 127}));
    connect(G_21.y, L_21.u) annotation (
      Line(points={{189,10},{204,10},{206,10}},                   color = {0, 0, 127}));
    connect(G_11.y, L_11.u) annotation (
      Line(points={{189,50},{206,50}},                            color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation (
      Line(points={{-158,10},{-142,10},{-142,10},{-141,10}},          color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation (
      Line(points={{-118,10},{-100,10},{-100,50},{-111,50}},          color = {0, 0, 127}));
    connect(D_12.y, u_11.u2) annotation (
      Line(points={{1,10},{20,10},{20,44},{30,44},{30,44}},            color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation (
      Line(points={{-59,50},{-24,50},{-24,50},{-22,50}},          color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation (
      Line(points={{-111,50},{-84,50},{-84,50},{-82,50}},          color = {0, 0, 127}));
    connect(G_11.u, G_21.u) annotation (Line(points={{166,50},{160,50},{160,10},
            {166,10}}, color={0,0,127}));
    connect(G_12.u, G_22.u) annotation (Line(points={{166,-70},{160,-70},{160,
            -110},{166,-110}}, color={0,0,127}));
    connect(K_11.u, u_11.y)
      annotation (Line(points={{78,50},{53,50}}, color={0,0,127}));
    connect(K_22.u, u_22.y)
      annotation (Line(points={{78,-110},{51,-110}}, color={0,0,127}));
    connect(K_22.y, G_22.u)
      annotation (Line(points={{101,-110},{166,-110}}, color={0,0,127}));
    connect(K_11.y, G_21.u) annotation (Line(points={{101,50},{160,50},{160,10},
            {166,10}}, color={0,0,127}));
    connect(y_1, e_11.u2) annotation (Line(points={{316,48},{278,48},{278,80},{
            -32,80},{-32,58},{-120,58}}, color={0,0,127}));
    connect(y_2, e_22.u2) annotation (Line(points={{324,-108},{281,-108},{281,
            -138},{-31,-138},{-31,-116},{-33,-116},{-33,-118},{-120,-118}},
          color={0,0,127}));
    connect(u_1, e_11.u1) annotation (Line(points={{-118,86},{-128,86},{-128,50}},
          color={0,0,127}));
    connect(u_2, u_2) annotation (Line(points={{-114,-148},{-114,-148},{-114,
            -148}}, color={0,0,127}));
    connect(u_2, e_22.u1) annotation (Line(points={{-114,-148},{-134,-148},{
            -134,-110},{-128,-110}}, color={0,0,127}));
    annotation (
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 4800, Tolerance = 1e-10, Interval = 1),
      Icon(coordinateSystem(extent={{-500,-500},{500,500}}, initialScale=0.1)),
      Diagram(coordinateSystem(extent={{-500,-500},{500,500}}, initialScale=0.1)));
  end Decentralized;

  model Static_Decoupling
    Modelica.Blocks.Continuous.PI C_11(T = 8.0245, k = -25.339) annotation (
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 24.891, k = -0.998) annotation (
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {10., 1}, b = {-0.29}) annotation (
      Placement(visible = true, transformation(origin={140,50},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {8., 1}, b = {0.625}) annotation (
      Placement(visible = true, transformation(origin={140,10},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {75., 1}, b = {-0.5}) annotation (
      Placement(visible = true, transformation(origin={140,-70},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {20., 1}, b = {-1.75}) annotation (
      Placement(visible = true, transformation(origin={140,-110},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation (
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {0.29}, b = {0.625}) annotation (
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {1.75}, b = {-0.5}) annotation (
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_22 annotation (
      Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation (
      Placement(visible = true, transformation(origin={36,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation (
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation (
      Placement(visible = true, transformation(origin={220,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation (
      Placement(visible = true, transformation(origin={220,-110},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation (
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation (
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs_e1 annotation (
      Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation (
      Placement(visible = true, transformation(origin = {-130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_1 annotation (
      Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2 annotation (
      Placement(visible = true, transformation(origin = {-170, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Nonlinear.FixedDelay L_11(delayTime = 1) annotation (
      Placement(visible = true, transformation(origin={180,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 3) annotation (
      Placement(visible = true, transformation(origin={180,10},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 2) annotation (
      Placement(visible = true, transformation(origin={180,-70},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 2) annotation (
      Placement(visible = true, transformation(origin={180,-110},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation (
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation (
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, width = 50) annotation (
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50) annotation (
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain K_11(k=1)
      annotation (Placement(transformation(extent={{80,40},{100,60}})));
    Modelica.Blocks.Math.Gain K_22(k=1)
      annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
    Modelica.Blocks.Interfaces.RealOutput y_1
      annotation (Placement(transformation(extent={{230,-16},{250,4}})));
    Modelica.Blocks.Interfaces.RealOutput y_2
      annotation (Placement(transformation(extent={{228,-48},{248,-28}})));
    Modelica.Blocks.Interfaces.RealOutput u_1
      annotation (Placement(transformation(extent={{-106,120},{-86,140}})));
    Modelica.Blocks.Interfaces.RealOutput u_2
      annotation (Placement(transformation(extent={{-124,-154},{-104,-134}})));
  equation
    connect(r_22.y, e_22.u1) annotation (
      Line(points={{-139,-110},{-130,-110},{-130,-110},{-128,-110}},          color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation (
      Line(points={{-139,50},{-130,50},{-130,50},{-128,50}},          color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation (
      Line(points={{-138,-50},{-100,-50},{-100,-110},{-111,-110},{-111,-110}},            color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation (
      Line(points={{-118,-70},{-100,-70},{-100,-110},{-110,-110},{-110,-110},{
            -111,-110}},                                                                                color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation (
      Line(points={{-138,-10},{-100,-10},{-100,50},{-110,50},{-110,50},{-111,50}},              color = {0, 0, 127}));
    connect(G_22.y, L_22.u) annotation (
      Line(points={{151,-110},{169,-110},{168,-110}},                     color = {0, 0, 127}));
    connect(L_22.y, y_22.u2) annotation (
      Line(points={{191,-110},{201,-110},{201,-116},{209,-116},{208,-116}},                                      color = {0, 0, 127}));
    connect(G_12.y, L_12.u) annotation (
      Line(points={{151,-70},{169,-70},{168,-70}},                    color = {0, 0, 127}));
    connect(L_12.y, y_11.u2) annotation (
      Line(points={{191,-70},{204,-70},{204,44},{208,44}},          color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation (
      Line(points={{-158,-70},{-140,-70},{-140,-70},{-141,-70}},          color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation (
      Line(points={{-111,-110},{-81,-110},{-81,-110},{-82,-110}},          color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation (
      Line(points={{231,-110},{236,-110},{236,-108},{243,-108},{243,-138},{-69,
            -138},{-69,-116},{-71,-116},{-71,-118},{-120,-118}},                                                                                             color = {0, 0, 127}));
    connect(L_21.y, y_22.u1) annotation (
      Line(points={{191,10},{202,10},{202,-104},{208,-104}},          color = {0, 0, 127}));
    connect(D_22.y, u_22.u2) annotation (
      Line(points={{1,-110},{11,-110},{11,-116},{29,-116},{29,-116},{28,-116},{
            28,-116}},                                                                                   color = {0, 0, 127}));
    connect(D_21.y, u_22.u1) annotation (
      Line(points={{1,-70},{10,-70},{10,-68},{21,-68},{21,-102},{29,-102},{29,
            -105},{28,-105},{28,-104}},                                                                                      color = {0, 0, 127}));
    connect(C_22.y, D_22.u) annotation (
      Line(points={{-59,-110},{-23,-110},{-23,-110},{-22,-110}},          color = {0, 0, 127}));
    connect(D_21.u, C_11.y) annotation (
      Line(points={{-22,-70},{-40,-70},{-40,50},{-59,50}},          color = {0, 0, 127}));
    connect(D_12.u, C_22.y) annotation (
      Line(points = {{-22, 10}, {-36, 10}, {-36, -110}, {-59, -110}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation (
      Line(points={{231,50},{240,50},{240,80},{-70,80},{-70,58},{-120,58}},                color = {0, 0, 127}));
    connect(L_11.y, y_11.u1) annotation (
      Line(points={{191,50},{198,50},{198,56},{208,56}},                     color = {0, 0, 127}));
    connect(D_11.y, u_11.u1) annotation (
      Line(points={{1,50},{14,50},{14,56},{24,56}},                    color = {0, 0, 127}));
    connect(G_21.y, L_21.u) annotation (
      Line(points={{151,10},{166,10},{168,10}},                   color = {0, 0, 127}));
    connect(G_11.y, L_11.u) annotation (
      Line(points={{151,50},{168,50}},                            color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation (
      Line(points={{-158,10},{-142,10},{-142,10},{-141,10}},          color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation (
      Line(points={{-118,10},{-100,10},{-100,50},{-111,50}},          color = {0, 0, 127}));
    connect(D_12.y, u_11.u2) annotation (
      Line(points={{1,10},{20,10},{20,44},{24,44}},                    color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation (
      Line(points={{-59,50},{-24,50},{-24,50},{-22,50}},          color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation (
      Line(points={{-111,50},{-84,50},{-84,50},{-82,50}},          color = {0, 0, 127}));
    connect(G_21.u, G_11.u) annotation (Line(points={{128,10},{120,10},{120,50},
            {128,50}}, color={0,0,127}));
    connect(G_12.u, G_22.u) annotation (Line(points={{128,-70},{120,-70},{120,
            -110},{128,-110}}, color={0,0,127}));
    connect(K_11.u, u_11.y)
      annotation (Line(points={{78,50},{47,50},{47,50}}, color={0,0,127}));
    connect(K_11.y, G_11.u) annotation (Line(points={{101,50},{104,50},{104,52},
            {120,52},{120,50},{128,50}}, color={0,0,127}));
    connect(K_22.y, G_22.u) annotation (Line(points={{101,-110},{106,-110},{106,
            -108},{120,-108},{120,-110},{128,-110}}, color={0,0,127}));
    connect(K_22.u, u_22.y) annotation (Line(points={{78,-110},{66,-110},{66,
            -108},{51,-108},{51,-110}}, color={0,0,127}));
    connect(y_1, e_11.u2) annotation (Line(points={{240,-6},{238,-6},{238,34},{
            236,34},{236,50},{240,50},{240,80},{-70,80},{-70,58},{-120,58}},
          color={0,0,127}));
    connect(y_2, e_22.u2) annotation (Line(points={{238,-38},{236,-38},{236,
            -108},{243,-108},{243,-138},{-69,-138},{-69,-116},{-71,-116},{-71,
            -118},{-120,-118}}, color={0,0,127}));
    connect(u_2, e_22.u1) annotation (Line(points={{-114,-144},{-128,-144},{
            -128,-110}}, color={0,0,127}));
    connect(u_1, e_11.u1) annotation (Line(points={{-96,130},{-128,130},{-128,
            50}}, color={0,0,127}));
    annotation (
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 4800, Tolerance = 1e-10, Interval = 1),
      Icon(coordinateSystem(extent={{-500,-500},{500,500}}, initialScale=0.1)),
      Diagram(coordinateSystem(extent={{-500,-500},{500,500}}, initialScale=0.1)));
  end Static_Decoupling;

  model Dynamic_Decoupling
    Modelica.Blocks.Continuous.PI C_11(T = 17.425, k = -6.025) annotation (
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 10.623, k = -0.388) annotation (
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {10., 1}, b = {-0.29}) annotation (
      Placement(visible = true, transformation(origin={162,50},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {8., 1}, b = {0.625}) annotation (
      Placement(visible = true, transformation(origin={162,10},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {75., 1}, b = {-0.5}) annotation (
      Placement(visible = true, transformation(origin={162,-70},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {20., 1}, b = {-1.75}) annotation (
      Placement(visible = true, transformation(origin={162,-110},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation (
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {0.29 * 8.0,0.29}, b = {0.625 * 10,0.625}) annotation (
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {1.75 * 75.0,1.75}, b = {-0.5 * 20., -0.5}) annotation (
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_22 annotation (
      Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation (
      Placement(visible = true, transformation(origin = {42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation (
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation (
      Placement(visible = true, transformation(origin={242,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation (
      Placement(visible = true, transformation(origin={242,-110},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation (
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation (
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs_e1 annotation (
      Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation (
      Placement(visible = true, transformation(origin = {-130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_1 annotation (
      Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2 annotation (
      Placement(visible = true, transformation(origin = {-170, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Nonlinear.FixedDelay L_11(delayTime = 1) annotation (
      Placement(visible = true, transformation(origin={202,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 3) annotation (
      Placement(visible = true, transformation(origin={202,10},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 2) annotation (
      Placement(visible = true, transformation(origin={202,-70},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 2) annotation (
      Placement(visible = true, transformation(origin={202,-110},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation (
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation (
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, width = 50) annotation (
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50) annotation (
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.FixedDelay LD_12(delayTime = 2)  annotation (
      Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.FixedDelay LD_21(delayTime = 0)  annotation (
      Placement(visible = true, transformation(origin = {30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain K_11(k=1)
      annotation (Placement(transformation(extent={{80,40},{100,60}})));
    Modelica.Blocks.Math.Gain K_22(k=1)
      annotation (Placement(transformation(extent={{80,-122},{100,-102}})));
    Modelica.Blocks.Interfaces.RealOutput y_1
      annotation (Placement(transformation(extent={{276,38},{296,58}})));
    Modelica.Blocks.Interfaces.RealOutput y_2
      annotation (Placement(transformation(extent={{282,-118},{302,-98}})));
    Modelica.Blocks.Interfaces.RealOutput u_1
      annotation (Placement(transformation(extent={{-120,68},{-100,88}})));
    Modelica.Blocks.Interfaces.RealOutput u_2
      annotation (Placement(transformation(extent={{-122,-154},{-102,-134}})));
  equation
    connect(LD_21.y, u_22.u1) annotation (
      Line(points={{41,-70},{52,-70},{52,-90},{18,-90},{18,-104},{28,-104},{28,
            -104}},                                                                                   color = {0, 0, 127}));
    connect(LD_21.u, D_21.y) annotation (
      Line(points={{18,-70},{0,-70},{0,-70},{1,-70}},          color = {0, 0, 127}));
    connect(LD_12.y, u_11.u2) annotation (
      Line(points={{41,10},{48,10},{48,30},{14,30},{14,44},{30,44},{30,44}},                color = {0, 0, 127}));
    connect(LD_12.u, D_12.y) annotation (
      Line(points={{18,10},{0,10},{0,10},{1,10}},          color = {0, 0, 127}));
    connect(r_22.y, e_22.u1) annotation (
      Line(points={{-139,-110},{-130,-110},{-130,-110},{-128,-110}},          color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation (
      Line(points={{-139,50},{-130,50},{-130,50},{-128,50}},          color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation (
      Line(points={{-138,-50},{-100,-50},{-100,-110},{-111,-110},{-111,-110}},            color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation (
      Line(points={{-118,-70},{-100,-70},{-100,-110},{-110,-110},{-110,-110},{
            -111,-110}},                                                                                color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation (
      Line(points={{-138,-10},{-100,-10},{-100,50},{-110,50},{-110,50},{-111,50}},              color = {0, 0, 127}));
    connect(G_22.y, L_22.u) annotation (
      Line(points={{173,-110},{191,-110},{190,-110}},                     color = {0, 0, 127}));
    connect(L_22.y, y_22.u2) annotation (
      Line(points={{213,-110},{223,-110},{223,-116},{231,-116},{230,-116}},                                      color = {0, 0, 127}));
    connect(G_12.y, L_12.u) annotation (
      Line(points={{173,-70},{191,-70},{190,-70}},                    color = {0, 0, 127}));
    connect(L_12.y, y_11.u2) annotation (
      Line(points={{213,-70},{226,-70},{226,44},{230,44}},          color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation (
      Line(points={{-158,-70},{-140,-70},{-140,-70},{-141,-70}},          color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation (
      Line(points={{-111,-110},{-81,-110},{-81,-110},{-82,-110}},          color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation (
      Line(points={{253,-110},{258,-110},{258,-108},{265,-108},{265,-138},{-47,
            -138},{-47,-116},{-49,-116},{-49,-118},{-120,-118}},                                                                                             color = {0, 0, 127}));
    connect(L_21.y, y_22.u1) annotation (
      Line(points={{213,10},{224,10},{224,-104},{230,-104}},          color = {0, 0, 127}));
    connect(D_22.y, u_22.u2) annotation (
      Line(points={{1,-110},{11,-110},{11,-116},{29,-116},{29,-116},{28,-116},{
            28,-116}},                                                                                   color = {0, 0, 127}));
    connect(C_22.y, D_22.u) annotation (
      Line(points={{-59,-110},{-23,-110},{-23,-110},{-22,-110}},          color = {0, 0, 127}));
    connect(D_21.u, C_11.y) annotation (
      Line(points={{-22,-70},{-40,-70},{-40,50},{-59,50}},          color = {0, 0, 127}));
    connect(D_12.u, C_22.y) annotation (
      Line(points = {{-22, 10}, {-36, 10}, {-36, -110}, {-59, -110}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation (
      Line(points={{253,50},{262,50},{262,80},{-48,80},{-48,58},{-120,58}},                color = {0, 0, 127}));
    connect(L_11.y, y_11.u1) annotation (
      Line(points={{213,50},{220,50},{220,56},{230,56}},                     color = {0, 0, 127}));
    connect(D_11.y, u_11.u1) annotation (
      Line(points={{1,50},{14,50},{14,56},{30,56},{30,56}},            color = {0, 0, 127}));
    connect(G_21.y, L_21.u) annotation (
      Line(points={{173,10},{188,10},{190,10}},                   color = {0, 0, 127}));
    connect(G_11.y, L_11.u) annotation (
      Line(points={{173,50},{190,50}},                            color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation (
      Line(points={{-158,10},{-142,10},{-142,10},{-141,10}},          color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation (
      Line(points={{-118,10},{-100,10},{-100,50},{-111,50}},          color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation (
      Line(points={{-59,50},{-24,50},{-24,50},{-22,50}},          color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation (
      Line(points={{-111,50},{-84,50},{-84,50},{-82,50}},          color = {0, 0, 127}));
    connect(G_11.u, G_21.u) annotation (Line(points={{150,50},{140,50},{140,10},
            {150,10}}, color={0,0,127}));
    connect(G_12.u, G_22.u) annotation (Line(points={{150,-70},{140,-70},{140,
            -110},{150,-110}}, color={0,0,127}));
    connect(u_2, e_22.u1) annotation (Line(points={{-112,-144},{-128,-144},{
            -128,-110}}, color={0,0,127}));
    connect(u_1, e_11.u1) annotation (Line(points={{-110,78},{-128,78},{-128,50}},
          color={0,0,127}));
    connect(K_11.u, u_11.y)
      annotation (Line(points={{78,50},{53,50}}, color={0,0,127}));
    connect(K_11.y, G_21.u) annotation (Line(points={{101,50},{140,50},{140,10},
            {150,10}}, color={0,0,127}));
    connect(K_22.u, u_22.y) annotation (Line(points={{78,-112},{70,-112},{70,
            -110},{51,-110}}, color={0,0,127}));
    connect(K_22.y, G_22.u) annotation (Line(points={{101,-112},{116,-112},{116,
            -110},{150,-110}}, color={0,0,127}));
    connect(y_2, e_22.u2) annotation (Line(points={{292,-108},{280,-108},{280,
            -106},{264,-106},{264,-108},{265,-108},{265,-138},{-47,-138},{-47,
            -116},{-49,-116},{-49,-118},{-120,-118}}, color={0,0,127}));
    connect(y_1, e_11.u2) annotation (Line(points={{286,48},{262,48},{262,80},{
            -48,80},{-48,58},{-120,58}}, color={0,0,127}));
    annotation (
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 4800, Tolerance = 1e-10, Interval = 1),
      Icon(coordinateSystem(extent={{-500,-500},{500,500}}, initialScale=0.1)),
      Diagram(coordinateSystem(extent={{-500,-500},{500,500}}, initialScale=0.1)));
  end Dynamic_Decoupling;

  model CentralizedPID
    Modelica.Blocks.Continuous.PI C_11(T = 1 / 30, k = -1.75 / 0.82 * 30) annotation (
      Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 1 / 40, k = -0.29 / 0.82 * 40) annotation (
      Placement(visible = true, transformation(origin = {-50, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {10, 1}, b = {-0.29}, y_start = 0) annotation (
      Placement(visible = true, transformation(origin={192,52},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {8, 1}, b = {0.625}, y_start = 0) annotation (
      Placement(visible = true, transformation(origin={192,12},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {75, 1}, b = {-0.5}, y_start = 0) annotation (
      Placement(visible = true, transformation(origin={190,-68},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {20, 1}, b = {-1.75}, y_start = 0) annotation (
      Placement(visible = true, transformation(origin={192,-108},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation (
      Placement(visible = true, transformation(origin={272,52},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation (
      Placement(visible = true, transformation(origin={272,-108},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation (
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation (
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs_e1 annotation (
      Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation (
      Placement(visible = true, transformation(origin = {-130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_1 annotation (
      Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2 annotation (
      Placement(visible = true, transformation(origin = {-170, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Nonlinear.FixedDelay L_11(delayTime = 1) annotation (
      Placement(visible = true, transformation(origin={232,52},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 3) annotation (
      Placement(visible = true, transformation(origin={234,12},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 2) annotation (
      Placement(visible = true, transformation(origin={232,-68},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 2) annotation (
      Placement(visible = true, transformation(origin={232,-108},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_12(T = 1 / 42, k = -0.625 / 0.82 * 42) annotation (
      Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay LC_21(delayTime = 1) annotation (
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay LC_12(delayTime = 0) annotation (
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22(k1 = -1)  annotation (
      Placement(visible = true, transformation(origin = {30, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11(k2 = -1)  annotation (
      Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain k1(k = 0.001) annotation (
      Placement(visible = true, transformation(origin = {-82, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain k2(k = 0.001) annotation (
      Placement(visible = true, transformation(origin = {-82, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_11(period = 2400, startTime = 0, width = 50) annotation (
      Placement(visible = true, transformation(origin = {-170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_22(offset = 0, period = 2400, startTime = 600, width = 50) annotation (
      Placement(visible = true, transformation(origin = {-170, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation (
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation (
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator KI(k = 0.5 / 0.82)  annotation (
      Placement(visible = true, transformation(origin = {-48, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain K_11(k=1)
      annotation (Placement(transformation(extent={{80,40},{100,60}})));
    Modelica.Blocks.Math.Gain K_22(k=1)
      annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
    Modelica.Blocks.Interfaces.RealOutput y_1
      annotation (Placement(transformation(extent={{316,-14},{336,6}})));
    Modelica.Blocks.Interfaces.RealOutput y_2
      annotation (Placement(transformation(extent={{314,-46},{334,-26}})));
    Modelica.Blocks.Interfaces.RealOutput u_1
      annotation (Placement(transformation(extent={{-138,70},{-118,90}})));
    Modelica.Blocks.Interfaces.RealOutput u_2
      annotation (Placement(transformation(extent={{-132,-160},{-112,-140}})));
  equation
    connect(KI.y, LC_21.u) annotation (
      Line(points={{-37,10},{-22,10},{-22,10},{-22,10}},          color = {0, 0, 127}));
    connect(KI.u, k1.y) annotation (
      Line(points={{-60,10},{-68,10},{-68,50},{-71,50},{-71,50}},            color = {0, 0, 127}));
    connect(G_21.y, L_21.u) annotation (
      Line(points={{203,12},{222,12}},      color = {0, 0, 127}));
    connect(L_21.y, y_22.u1) annotation (
      Line(points={{245,12},{254,12},{254,-102},{260,-102}},          color = {0, 0, 127}));
    connect(r_22.y, e_22.u1) annotation (
      Line(points={{-159,-110},{-127,-110},{-127,-110},{-128,-110}},          color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation (
      Line(points={{-138,-50},{-100,-50},{-100,-110},{-111,-110},{-111,-110}},            color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation (
      Line(points={{-138,-10},{-100,-10},{-100,50},{-111,50},{-111,50}},            color = {0, 0, 127}));
    connect(k2.u, e_22.y) annotation (
      Line(points={{-94,-110},{-103,-110},{-103,-110},{-112,-110},{-112,-110},{
            -111,-110},{-111,-110},{-111,-110}},                                                                                     color = {0, 0, 127}));
    connect(k2.y, C_22.u) annotation (
      Line(points={{-71,-110},{-67,-110},{-67,-110},{-61,-110},{-61,-110},{-62,
            -110},{-62,-110},{-62,-110}},                                                                                     color = {0, 0, 127}));
    connect(C_12.u, k2.y) annotation (
      Line(points={{-62,-70},{-65,-70},{-65,-70},{-68,-70},{-68,-110},{-70,-110},
            {-70,-111},{-70,-110},{-71,-110}},                                                                                         color = {0, 0, 127}));
    connect(u_22.u2, C_22.y) annotation (
      Line(points={{18,-116},{9,-116},{9,-116},{0,-116},{0,-110},{-20.5,-110},{
            -20.5,-110},{-39,-110}},                                                                                     color = {0, 0, 127}));
    connect(LC_21.y, u_22.u1) annotation (
      Line(points={{1,10},{6,10},{6,-104},{18,-104}},          color = {0, 0, 127}));
    connect(LC_12.u, C_12.y) annotation (
      Line(points={{-22,-70},{-38,-70},{-38,-70},{-39,-70}},          color = {0, 0, 127}));
    connect(LC_12.y, u_11.u2) annotation (
      Line(points = {{1, -70}, {12, -70}, {12, 44}, {18, 44}}, color = {0, 0, 127}));
    connect(G_22.y, L_22.u) annotation (
      Line(points={{203,-108},{221,-108},{220,-108}},                     color = {0, 0, 127}));
    connect(L_22.y, y_22.u2) annotation (
      Line(points={{243,-108},{253,-108},{253,-114},{261,-114},{260,-114}},                                      color = {0, 0, 127}));
    connect(L_12.y, y_11.u2) annotation (
      Line(points={{243,-68},{256,-68},{256,46},{260,46}},          color = {0, 0, 127}));
    connect(G_12.y, L_12.u) annotation (
      Line(points={{201,-68},{220,-68}},     color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation (
      Line(points={{-158,-70},{-140,-70},{-140,-70},{-141,-70}},          color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation (
      Line(points={{-118,-70},{-100,-70},{-100,-110},{-110,-110},{-110,-112},{
            -110,-110},{-111,-110}},                                                                                  color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation (
      Line(points={{283,-108},{295,-108},{295,-138},{-17,-138},{-17,-118},{-120,
            -118}},                                                                                    color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation (
      Line(points={{-159,50},{-128,50},{-128,50},{-128,50}},          color = {0, 0, 127}));
    connect(k1.y, C_11.u) annotation (
      Line(points={{-71,50},{-64,50},{-64,50},{-62,50}},          color = {0, 0, 127}));
    connect(k1.u, e_11.y) annotation (
      Line(points={{-94,50},{-110,50},{-110,50},{-111,50}},          color = {0, 0, 127}));
    connect(u_11.u1, C_11.y) annotation (
      Line(points={{18,56},{0,56},{0,50},{-39,50}},          color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation (
      Line(points={{283,52},{292,52},{292,82},{-18,82},{-18,58},{-120,58}},                color = {0, 0, 127}));
    connect(L_11.y, y_11.u1) annotation (
      Line(points={{243,52},{250,52},{250,58},{260,58}},                     color = {0, 0, 127}));
    connect(G_11.y, L_11.u) annotation (
      Line(points={{203,52},{220,52}},                            color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation (
      Line(points={{-158,10},{-142,10},{-142,10},{-141,10}},          color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation (
      Line(points={{-118,10},{-100,10},{-100,50},{-111,50}},          color = {0, 0, 127}));
    connect(u_2, e_22.u1) annotation (Line(points={{-122,-150},{-142,-150},{
            -142,-110},{-128,-110}}, color={0,0,127}));
    connect(u_1, e_11.u1) annotation (Line(points={{-128,80},{-144,80},{-144,50},
            {-128,50}}, color={0,0,127}));
    connect(K_11.u, u_11.y)
      annotation (Line(points={{78,50},{41,50}}, color={0,0,127}));
    connect(K_11.y, G_11.u)
      annotation (Line(points={{101,50},{180,50},{180,52}}, color={0,0,127}));
    connect(K_22.u, u_22.y)
      annotation (Line(points={{78,-110},{41,-110}}, color={0,0,127}));
    connect(K_22.y, G_22.u) annotation (Line(points={{101,-110},{110,-110},{110,
            -108},{180,-108}}, color={0,0,127}));
    connect(G_22.u, G_12.u) annotation (Line(points={{180,-108},{170,-108},{170,
            -68},{178,-68}}, color={0,0,127}));
    connect(G_21.u, G_11.u) annotation (Line(points={{180,12},{176,12},{176,14},
            {172,14},{172,52},{180,52}}, color={0,0,127}));
    connect(y_1, e_11.u2) annotation (Line(points={{326,-4},{292,-4},{292,82},{
            -18,82},{-18,58},{-120,58}}, color={0,0,127}));
    connect(y_2, e_22.u2) annotation (Line(points={{324,-36},{294,-36},{294,
            -108},{295,-108},{295,-138},{-17,-138},{-17,-118},{-120,-118}},
          color={0,0,127}));
    annotation (
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 4800, Tolerance = 1e-10, Interval = 1),
      Icon(coordinateSystem(extent={{-500,-500},{500,500}}, initialScale=0.1)),
      Diagram(coordinateSystem(extent={{-500,-500},{500,500}}, initialScale=0.1)));
  end CentralizedPID;

  model Inverse_Decoupling
    Modelica.Blocks.Continuous.PI C_11(T = 10., k = -1.8055) annotation (
      Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 20., initType = Modelica.Blocks.Types.Init.SteadyState, k = -0.1495) annotation (
      Placement(visible = true, transformation(origin = {-50, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {10., 1}, b = {-0.29}) annotation (
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {8., 1}, b = {0.625}) annotation (
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {75., 1}, b = {-0.5})
                                                                              annotation (
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {20., 1}, b = {-1.75}) annotation (
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation (
      Placement(visible = true, transformation(origin = {170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation (
      Placement(visible = true, transformation(origin = {170, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation (
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation (
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs_e1 annotation (
      Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation (
      Placement(visible = true, transformation(origin = {-130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_1 annotation (
      Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2 annotation (
      Placement(visible = true, transformation(origin = {-170, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Nonlinear.FixedDelay L_11(delayTime = 1) annotation (
      Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_21(delayTime = 3) annotation (
      Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_12(delayTime = 2) annotation (
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay L_22(delayTime = 2) annotation (
      Placement(visible = true, transformation(origin = {130, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add ed_11(k2 = -1)  annotation (
      Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add ed_22(k1 = -1)  annotation (
      Placement(visible = true, transformation(origin = {-78, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Derivative d_12(T = 8., initType = Modelica.Blocks.Types.Init.SteadyState, k = 1.194) annotation (
      Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Derivative d_21(T = 75., k = -1.9098) annotation (
      Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Nonlinear.FixedDelay tau_12(delayTime = 2) annotation (
      Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Nonlinear.FixedDelay tau_21(delayTime = 0) annotation (
      Placement(visible = true, transformation(origin = {-30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation (
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation (
      Placement(visible = true, transformation(origin = {-152, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 2400, startTime = 600, width = 50) annotation (
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 2400, width = 50) annotation (
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain K_11(k=1)
      annotation (Placement(transformation(extent={{20,38},{40,58}})));
    Modelica.Blocks.Math.Gain K_22(k=1)
      annotation (Placement(transformation(extent={{22,-120},{42,-100}})));
    Modelica.Blocks.Interfaces.RealOutput y_1
      annotation (Placement(transformation(extent={{210,-22},{230,-2}})));
    Modelica.Blocks.Interfaces.RealOutput y_2
      annotation (Placement(transformation(extent={{208,-54},{228,-34}})));
    Modelica.Blocks.Interfaces.RealOutput u_1
      annotation (Placement(transformation(extent={{-120,92},{-100,112}})));
    Modelica.Blocks.Interfaces.RealOutput u_2
      annotation (Placement(transformation(extent={{-128,-168},{-108,-148}})));
  equation
    connect(r_11.y, e_11.u1) annotation (
      Line(points={{-139,50},{-128,50},{-128,50},{-128,50}},          color = {0, 0, 127}));
    connect(r_22.y, e_22.u1) annotation (
      Line(points={{-139,-110},{-128,-110},{-128,-110},{-128,-110}},          color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation (
      Line(points={{-140,-52},{-100,-52},{-100,-110},{-111,-110},{-111,-110}},            color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation (
      Line(points={{-138,-10},{-100,-10},{-100,50},{-111,50},{-111,50}},            color = {0, 0, 127}));
    connect(d_21.u, tau_21.y) annotation (
      Line(points={{-58,-70},{-49,-70},{-49,-70},{-40,-70},{-40,-70},{-41,-70},
            {-41,-70},{-41,-70}},                                                                                     color = {0, 0, 127}));
    connect(tau_21.u, C_11.y) annotation (
      Line(points={{-18,-70},{0,-70},{0,50},{-39,50}},          color = {0, 0, 127}));
    connect(d_21.y, ed_22.u1) annotation (
      Line(points={{-81,-70},{-88,-70},{-88,-70},{-97,-70},{-97,-104},{-91,-104},
            {-91,-104},{-90,-104},{-90,-104}},                                                                                         color = {0, 0, 127}));
    connect(ed_22.u2, e_22.y) annotation (
      Line(points={{-90,-116},{-93,-116},{-93,-116},{-96,-116},{-96,-110},{-112,
            -110},{-112,-110},{-111,-110}},                                                                                      color = {0, 0, 127}));
    connect(ed_22.y, C_22.u) annotation (
      Line(points={{-67,-110},{-63,-110},{-63,-110},{-63,-110},{-63,-110},{-62,
            -110}},                                                                                 color = {0, 0, 127}));
    connect(G_22.y, L_22.u) annotation (
      Line(points={{101,-110},{109,-110},{109,-110},{117,-110},{117,-110},{117,
            -110},{117,-110},{118,-110}},                                                                                     color = {0, 0, 127}));
    connect(L_22.y, y_22.u2) annotation (
      Line(points={{141,-110},{145,-110},{145,-110},{149,-110},{149,-116},{157,
            -116},{157,-117},{157,-116},{158,-116}},                                                                                       color = {0, 0, 127}));
    connect(G_12.y, L_12.u) annotation (
      Line(points={{101,-70},{117,-70},{117,-70},{117,-70},{117,-70},{118,-70}},              color = {0, 0, 127}));
    connect(L_12.y, y_11.u2) annotation (
      Line(points = {{141, -70}, {154, -70}, {154, 44}, {158, 44}}, color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation (
      Line(points={{-158,-70},{-149,-70},{-149,-70},{-140,-70},{-140,-70},{-141,
            -70},{-141,-70},{-141,-70}},                                                                                      color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation (
      Line(points={{-118,-70},{-109,-70},{-109,-70},{-100,-70},{-100,-110},{
            -110,-110},{-110,-110},{-110,-110},{-111,-110}},                                                                                    color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation (
      Line(points={{181,-110},{191,-110},{191,-140},{-121,-140},{-121,-118},{
            -120,-118}},                                                                               color = {0, 0, 127}));
    connect(L_21.y, y_22.u1) annotation (
      Line(points={{141,10},{152,10},{152,-104},{158,-104}},          color = {0, 0, 127}));
    connect(tau_12.u, C_22.y) annotation (
      Line(points = {{-18, 10}, {4, 10}, {4, -110}, {-39, -110}}, color = {0, 0, 127}));
    connect(d_12.u, tau_12.y) annotation (
      Line(points={{-58,10},{-41,10}},      color = {0, 0, 127}));
    connect(d_12.y, ed_11.u2) annotation (
      Line(points={{-81,10},{-96,10},{-96,44},{-92,44}},          color = {0, 0, 127}));
    connect(ed_11.y, C_11.u) annotation (
      Line(points={{-69,50},{-64,50},{-64,50},{-62,50}},          color = {0, 0, 127}));
    connect(ed_11.u1, e_11.y) annotation (
      Line(points={{-92,56},{-98,56},{-98,50},{-111,50},{-111,50}},            color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation (
      Line(points={{181,50},{190,50},{190,80},{-120,80},{-120,58},{-120,58}},              color = {0, 0, 127}));
    connect(L_11.y, y_11.u1) annotation (
      Line(points={{141,50},{148,50},{148,56},{158,56},{158,56}},            color = {0, 0, 127}));
    connect(G_21.y, L_21.u) annotation (
      Line(points={{101,10},{116,10},{116,10},{118,10}},          color = {0, 0, 127}));
    connect(G_11.y, L_11.u) annotation (
      Line(points={{101,50},{118,50},{118,50},{118,50}},          color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation (
      Line(points={{-158,10},{-142,10},{-142,10},{-141,10}},          color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation (
      Line(points={{-118,10},{-100,10},{-100,50},{-111,50}},          color = {0, 0, 127}));
    connect(G_11.u, G_21.u) annotation (Line(points={{78,50},{66,50},{66,10},{
            78,10}}, color={0,0,127}));
    connect(G_12.u, G_22.u) annotation (Line(points={{78,-70},{68,-70},{68,-110},
            {78,-110}}, color={0,0,127}));
    connect(u_1, e_11.u1) annotation (Line(points={{-110,102},{-128,102},{-128,
            50}}, color={0,0,127}));
    connect(u_2, e_22.u1) annotation (Line(points={{-118,-158},{-134,-158},{
            -134,-110},{-128,-110}}, color={0,0,127}));
    connect(K_22.u, C_22.y) annotation (Line(points={{20,-110},{4,-108},{4,-110},
            {-39,-110}}, color={0,0,127}));
    connect(K_11.u, C_11.y) annotation (Line(points={{18,48},{2,48},{2,46},{0,
            46},{0,50},{-39,50}}, color={0,0,127}));
    connect(K_11.y, G_21.u) annotation (Line(points={{41,48},{66,48},{66,10},{
            78,10}}, color={0,0,127}));
    connect(K_22.y, G_22.u)
      annotation (Line(points={{43,-110},{78,-110}}, color={0,0,127}));
    connect(y_1, e_11.u2) annotation (Line(points={{220,-12},{188,-12},{188,50},
            {190,50},{190,80},{-120,80},{-120,58}}, color={0,0,127}));
    connect(y_2, e_22.u2) annotation (Line(points={{218,-44},{188,-44},{188,
            -110},{191,-110},{191,-140},{-121,-140},{-121,-118},{-120,-118}},
          color={0,0,127}));
    annotation (
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 4800, Tolerance = 1e-8, Interval = 1),
      Icon(coordinateSystem(extent={{-500,-500},{500,500}}, initialScale=0.1)),
      Diagram(coordinateSystem(extent={{-500,-500},{500,500}}, initialScale=0.1)));
  end Inverse_Decoupling;

  annotation (
    uses(Modelica(version = "3.2.2")));
end Experimental_Gain;

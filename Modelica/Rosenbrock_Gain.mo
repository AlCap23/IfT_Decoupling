package Rosenbrock_Gain
  model Decentralized
    Modelica.Blocks.Continuous.PI C_11(T = 0.607, k = 2.824) annotation (
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 0.607, k = 2.824) annotation (
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {1, 1}, b = {1}) annotation (
      Placement(visible = true, transformation(origin={120,50},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {1, 1}, b = {1}) annotation (
      Placement(visible = true, transformation(origin={120,10},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {1, 3}, b = {2}) annotation (
      Placement(visible = true, transformation(origin={120,-70},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {1, 1}, b = {1}) annotation (
      Placement(visible = true, transformation(origin={120,-110},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation (
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {3}, b = {0}) annotation (
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {1}, b = {0}) annotation (
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_22 annotation (
      Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation (
      Placement(visible = true, transformation(origin={30,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation (
      Placement(visible = true, transformation(origin={30,-110},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation (
      Placement(visible = true, transformation(origin={160,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation (
      Placement(visible = true, transformation(origin={160,-110},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation (
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation (
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs_e1 annotation (
      Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation (
      Placement(visible = true, transformation(origin = {-130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2 annotation (
      Placement(visible = true, transformation(origin = {-170, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_1 annotation (
      Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation (
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation (
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 200, width = 50)  annotation (
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 200,                  width = 50,
      startTime=50)                                                                             annotation (
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y_1
      annotation (Placement(transformation(extent={{202,40},{222,60}})));
    Modelica.Blocks.Interfaces.RealOutput y_2
      annotation (Placement(transformation(extent={{208,-120},{228,-100}})));
    Modelica.Blocks.Interfaces.RealOutput u_1
      annotation (Placement(transformation(extent={{-120,80},{-100,100}})));
    Modelica.Blocks.Interfaces.RealOutput u_2
      annotation (Placement(transformation(extent={{-124,-158},{-104,-138}})));
    Modelica.Blocks.Math.Gain K_11
      annotation (Placement(transformation(extent={{60,40},{80,60}})));
    Modelica.Blocks.Math.Gain K_22
      annotation (Placement(transformation(extent={{64,-120},{84,-100}})));
  equation
    connect(r_11.y, e_11.u1) annotation (
      Line(points={{-139,50},{-130,50},{-130,50},{-128,50}},          color = {0, 0, 127}));
    connect(r_22.y, e_22.u1) annotation (
      Line(points={{-139,-110},{-130,-110},{-128,-110}},                      color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation (
      Line(points={{-138,-50},{-100,-50},{-100,-110},{-111,-110},{-111,-110}},            color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation (
      Line(points={{-138,-10},{-100,-10},{-100,50},{-111,50},{-111,50}},            color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation (
      Line(points={{-158,-70},{-140,-70},{-140,-70},{-141,-70}},          color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation (
      Line(points={{-118,-70},{-100,-70},{-100,-110},{-111,-110},{-111,-110}},            color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation (
      Line(points={{-111,-110},{-83,-110},{-83,-110},{-82,-110}},          color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation (
      Line(points={{171,-110},{181,-110},{181,-140},{-91,-140},{-91,-118},{-120,
            -118}},                                                                                    color = {0, 0, 127}));
    connect(G_22.y, y_22.u2) annotation (
      Line(points={{131,-110},{139,-110},{139,-116},{148,-116}},                       color = {0, 0, 127}));
    connect(G_21.y, y_22.u1) annotation (
      Line(points={{131,10},{142,10},{142,-104},{148,-104}},          color = {0, 0, 127}));
    connect(D_22.y, u_22.u2) annotation (
      Line(points={{1,-110},{9,-110},{9,-116},{18,-116}},                      color = {0, 0, 127}));
    connect(D_21.y, u_22.u1) annotation (
      Line(points={{1,-70},{19,-70},{19,-104},{18,-104}},                      color = {0, 0, 127}));
    connect(C_22.y, D_22.u) annotation (
      Line(points={{-59,-110},{-25,-110},{-25,-110},{-22,-110}},          color = {0, 0, 127}));
    connect(D_21.u, C_11.y) annotation (
      Line(points={{-22,-70},{-40,-70},{-40,50},{-59,50}},          color = {0, 0, 127}));
    connect(G_12.y, y_11.u2) annotation (
      Line(points={{131,-70},{138,-70},{138,44},{148,44}},          color = {0, 0, 127}));
    connect(D_12.u, C_22.y) annotation (
      Line(points = {{-22, 10}, {-36, 10}, {-36, -110}, {-59, -110}}, color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation (
      Line(points={{-158,10},{-142,10},{-142,10},{-141,10},{-141,10}},            color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation (
      Line(points={{-118,10},{-100,10},{-100,50},{-111,50}},          color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation (
      Line(points={{171,50},{182,50},{182,80},{-90,80},{-90,58},{-120,58}},                color = {0, 0, 127}));
    connect(D_12.y, u_11.u2) annotation (
      Line(points={{1,10},{20,10},{20,44},{18,44}},                    color = {0, 0, 127}));
    connect(G_11.y, y_11.u1) annotation (
      Line(points={{131,50},{136,50},{136,56},{148,56}},                     color = {0, 0, 127}));
    connect(D_11.y, u_11.u1) annotation (
      Line(points={{1,50},{14,50},{14,56},{18,56}},                    color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation (
      Line(points={{-59,50},{-24,50},{-24,50},{-22,50}},          color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation (
      Line(points={{-111,50},{-84,50},{-84,50},{-82,50}},          color = {0, 0, 127}));
    connect(u_1, e_11.u1) annotation (Line(points={{-110,90},{-134,90},{-134,50},
            {-128,50}}, color={0,0,127}));
    connect(u_2, e_22.u1) annotation (Line(points={{-114,-148},{-136,-148},{
            -136,-110},{-128,-110}}, color={0,0,127}));
    connect(u_22.y, K_22.u) annotation (Line(points={{41,-110},{51.5,-110},{62,
            -110}}, color={0,0,127}));
    connect(K_22.y, G_22.u) annotation (Line(points={{85,-110},{108,-110},{108,
            -110}}, color={0,0,127}));
    connect(u_11.y, K_11.u)
      annotation (Line(points={{41,50},{49.5,50},{58,50}}, color={0,0,127}));
    connect(K_11.y, G_11.u)
      annotation (Line(points={{81,50},{108,50},{108,50}}, color={0,0,127}));
    connect(G_12.u, G_22.u) annotation (Line(points={{108,-70},{94,-70},{94,
            -110},{108,-110}}, color={0,0,127}));
    connect(G_21.u, G_11.u) annotation (Line(points={{108,10},{104,10},{104,12},
            {90,12},{90,50},{108,50}}, color={0,0,127}));
    connect(y_1, y_11.y)
      annotation (Line(points={{212,50},{171,50},{171,50}}, color={0,0,127}));
    connect(y_2, y_22.y)
      annotation (Line(points={{218,-110},{171,-110}}, color={0,0,127}));
    annotation (
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      Icon(coordinateSystem(extent = {{-300, -300}, {300, 300}})),
      Diagram(coordinateSystem(extent = {{-300, -300}, {300, 300}})),
      __OpenModelica_commandLineOptions = "",
  experiment(StartTime = 0, StopTime = 800, Tolerance = 1e-10, Interval = 1));
  end Decentralized;

  model Static_Decoupling
    Modelica.Blocks.Continuous.PI C_11(T = 1.16666666, k = 0.75) annotation (
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 0.607, k = 8.47) annotation (
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {1, 1}, b = {1}) annotation (
      Placement(visible = true, transformation(origin={126,46},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {1, 1}, b = {1}) annotation (
      Placement(visible = true, transformation(origin={126,6},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {1, 3}, b = {2}) annotation (
      Placement(visible = true, transformation(origin={126,-74},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {1, 1}, b = {1}) annotation (
      Placement(visible = true, transformation(origin={126,-114},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation (
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {3}, b = {-2}) annotation (
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {1}, b = {-1}) annotation (
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_22 annotation (
      Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation (
      Placement(visible = true, transformation(origin = {42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation (
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation (
      Placement(visible = true, transformation(origin={166,46},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation (
      Placement(visible = true, transformation(origin={166,-114},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation (
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation (
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IAE_1(y_start = 0)  annotation (
      Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2(y_start = 0)  annotation (
      Placement(visible = true, transformation(origin = {-150, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e1 annotation (
      Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation (
      Placement(visible = true, transformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator IE_1 annotation (
      Placement(visible = true, transformation(origin = {-130, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator IE_2(y_start = 0)  annotation (
      Placement(visible = true, transformation(origin = {-130, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 200, width = 50)  annotation (
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 200,                  width = 50,
      startTime=50)                                                                             annotation (
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain K_11
      annotation (Placement(transformation(extent={{66,40},{86,60}})));
    Modelica.Blocks.Math.Gain K_22
      annotation (Placement(transformation(extent={{66,-118},{86,-98}})));
    Modelica.Blocks.Interfaces.RealOutput y_1
      annotation (Placement(transformation(extent={{200,40},{220,60}})));
    Modelica.Blocks.Interfaces.RealOutput y_2
      annotation (Placement(transformation(extent={{200,-120},{220,-100}})));
    Modelica.Blocks.Interfaces.RealOutput u_1
      annotation (Placement(transformation(extent={{-116,70},{-96,90}})));
    Modelica.Blocks.Interfaces.RealOutput u_2
      annotation (Placement(transformation(extent={{-130,-154},{-110,-134}})));
  equation
    connect(r_22.y, e_22.u1) annotation (
      Line(points={{-139,-110},{-130,-110},{-128,-110}},                      color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation (
      Line(points={{-139,50},{-128,50},{-128,50},{-128,50}},          color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation (
      Line(points={{-118,-50},{-90,-50},{-90,-110},{-111,-110},{-111,-110}},            color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation (
      Line(points={{-118,-10},{-90,-10},{-90,50},{-111,50},{-111,50}},            color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation (
      Line(points={{-138,-70},{-129,-70},{-129,-70},{-122,-70},{-122,-70},{-122,
            -70},{-122,-70},{-121,-70}},                                                                                      color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation (
      Line(points={{-98,-70},{-93,-70},{-93,-70},{-90,-70},{-90,-110},{-110,
            -110},{-110,-110},{-110,-110},{-111,-110}},                                                                                    color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation (
      Line(points={{-111,-110},{-97,-110},{-97,-110},{-81,-110},{-81,-110},{-82,
            -110}},                                                                                  color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation (
      Line(points={{177,-114},{182,-114},{189,-114},{189,-144},{-83,-144},{-83,
            -118},{-120,-118}},                                                                                                  color = {0, 0, 127}));
    connect(G_22.y, y_22.u2) annotation (
      Line(points={{137,-114},{141,-114},{145,-114},{145,-120},{153,-120},{154,
            -120}},                                                                                                                        color = {0, 0, 127}));
    connect(G_21.y, y_22.u1) annotation (
      Line(points={{137,6},{148,6},{148,-108},{154,-108}},            color = {0, 0, 127}));
    connect(D_22.y, u_22.u2) annotation (
      Line(points={{1,-110},{5,-110},{5,-110},{11,-110},{11,-116},{29,-116},{29,
            -116},{28,-116},{28,-116}},                                                                                        color = {0, 0, 127}));
    connect(D_21.y, u_22.u1) annotation (
      Line(points={{1,-70},{10,-70},{10,-70},{19,-70},{19,-104},{27,-104},{27,
            -105},{27,-104},{28,-104}},                                                                                      color = {0, 0, 127}));
    connect(C_22.y, D_22.u) annotation (
      Line(points={{-59,-110},{-41,-110},{-41,-110},{-23,-110},{-23,-110},{-24,
            -110},{-24,-110},{-22,-110}},                                                                                     color = {0, 0, 127}));
    connect(D_21.u, C_11.y) annotation (
      Line(points={{-22,-70},{-40,-70},{-40,50},{-59,50}},          color = {0, 0, 127}));
    connect(G_12.y, y_11.u2) annotation (
      Line(points={{137,-74},{144,-74},{144,40},{154,40}},          color = {0, 0, 127}));
    connect(D_12.u, C_22.y) annotation (
      Line(points = {{-22, 10}, {-36, 10}, {-36, -110}, {-59, -110}}, color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation (
      Line(points={{177,46},{188,46},{188,76},{-84,76},{-84,58},{-120,58}},                color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation (
      Line(points={{-98,10},{-90,10},{-90,50},{-111,50},{-111,50}},            color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation (
      Line(points={{-138,10},{-122,10},{-122,10},{-121,10}},          color = {0, 0, 127}));
    connect(D_12.y, u_11.u2) annotation (
      Line(points={{1,10},{20,10},{20,44},{30,44},{30,44}},            color = {0, 0, 127}));
    connect(G_11.y, y_11.u1) annotation (
      Line(points={{137,46},{142,46},{142,52},{154,52}},                     color = {0, 0, 127}));
    connect(D_11.y, u_11.u1) annotation (
      Line(points={{1,50},{14,50},{14,56},{30,56},{30,56}},            color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation (
      Line(points={{-59,50},{-24,50},{-24,50},{-22,50}},          color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation (
      Line(points={{-111,50},{-84,50},{-84,50},{-82,50}},          color = {0, 0, 127}));
    connect(G_21.u, G_11.u) annotation (Line(points={{114,6},{100,6},{100,46},{
            114,46}}, color={0,0,127}));
    connect(G_22.u, G_12.u) annotation (Line(points={{114,-114},{108,-114},{108,
            -112},{100,-112},{100,-74},{114,-74}}, color={0,0,127}));
    connect(K_22.u, u_22.y) annotation (Line(points={{64,-108},{51,-108},{51,
            -110}}, color={0,0,127}));
    connect(K_11.u, u_11.y)
      annotation (Line(points={{64,50},{53,50},{53,50}}, color={0,0,127}));
    connect(K_11.y, G_11.u) annotation (Line(points={{87,50},{90,50},{90,48},{
            104,48},{104,46},{114,46}}, color={0,0,127}));
    connect(K_22.y, G_12.u) annotation (Line(points={{87,-108},{90,-108},{90,
            -104},{100,-104},{100,-74},{114,-74}}, color={0,0,127}));
    connect(y_1, y_11.y)
      annotation (Line(points={{210,50},{177,50},{177,46}}, color={0,0,127}));
    connect(y_2, y_22.y) annotation (Line(points={{210,-110},{204,-110},{204,
            -114},{177,-114},{177,-114}}, color={0,0,127}));
    connect(u_1, e_11.u1) annotation (Line(points={{-106,80},{-134,80},{-134,50},
            {-128,50}}, color={0,0,127}));
    connect(u_2, e_22.u1) annotation (Line(points={{-120,-144},{-126,-144},{
            -126,-140},{-134,-140},{-134,-110},{-128,-110}}, color={0,0,127}));
    annotation (
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 800, Tolerance = 1e-10, Interval = 0.01));
  end Static_Decoupling;

  model Dynamic_Decoupling
    Modelica.Blocks.Continuous.PI C_11(T = 1.16666, k = 0.75) annotation (
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 1.16666, k = 0.75) annotation (
      Placement(visible = true, transformation(origin = {-68, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {1, 1}, b = {1}) annotation (
      Placement(visible = true, transformation(origin={144,50},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {1, 1}, b = {1}) annotation (
      Placement(visible = true, transformation(origin={144,10},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {1, 3}, b = {2}) annotation (
      Placement(visible = true, transformation(origin={144,-70},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {1, 1}, b = {1}) annotation (
      Placement(visible = true, transformation(origin={144,-110},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_11 annotation (
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_12(a = {1, 3}, b = {-2, -2}) annotation (
      Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_21(a = {1}, b = {-1}) annotation (
      Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction D_22 annotation (
      Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation (
      Placement(visible = true, transformation(origin = {42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation (
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation (
      Placement(visible = true, transformation(origin={184,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation (
      Placement(visible = true, transformation(origin={184,-110},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation (
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation (
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator IAE_1 annotation (
      Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2 annotation (
      Placement(visible = true, transformation(origin = {-150, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e1 annotation (
      Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation (
      Placement(visible = true, transformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator IE_1 annotation (
      Placement(visible = true, transformation(origin = {-130, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator IE_2 annotation (
      Placement(visible = true, transformation(origin = {-130, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 200, startTime = 0, width = 50)  annotation (
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 200,                  width = 50,
      startTime=50)                                                                             annotation (
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain K_11(k=4.3)
      annotation (Placement(transformation(extent={{76,40},{96,60}})));
    Modelica.Blocks.Math.Gain K_22(k=4.3)
      annotation (Placement(transformation(extent={{66,-118},{86,-98}})));
    Modelica.Blocks.Interfaces.RealOutput y_1
      annotation (Placement(transformation(extent={{216,-14},{236,6}})));
    Modelica.Blocks.Interfaces.RealOutput y_2
      annotation (Placement(transformation(extent={{212,-58},{232,-38}})));
    Modelica.Blocks.Interfaces.RealOutput u_1
      annotation (Placement(transformation(extent={{-280,-6},{-260,14}})));
    Modelica.Blocks.Interfaces.RealOutput u_2
      annotation (Placement(transformation(extent={{-164,-170},{-144,-150}})));
  equation
    connect(r_22.y, e_22.u1) annotation (
      Line(points={{-139,-110},{-128,-110}},                                  color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation (
      Line(points={{-139,50},{-128,50},{-128,50},{-128,50},{-128,50}},            color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation (
      Line(points={{-118,-10},{-90,-10},{-90,50},{-111,50}},                      color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation (
      Line(points={{-118,-50},{-90,-50},{-90,-110},{-111,-110},{-111,-110}},            color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation (
      Line(points={{-138,-70},{-130,-70},{-130,-70},{-122,-70},{-122,-70},{-122,
            -70},{-122,-70},{-121,-70}},                                                                                      color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation (
      Line(points={{-98,-70},{-94,-70},{-94,-70},{-90,-70},{-90,-110},{-112,
            -110},{-112,-110},{-111,-110},{-111,-110}},                                                                                    color = {0, 0, 127}));
    connect(y_22.y, e_22.u2) annotation (
      Line(points={{195,-110},{207,-110},{207,-140},{-65,-140},{-65,-118},{-120,
            -118}},                                                                                    color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation (
      Line(points={{-111,-110},{-80,-110}},      color = {0, 0, 127}));
    connect(G_22.y, y_22.u2) annotation (
      Line(points={{155,-110},{159,-110},{163,-110},{163,-116},{173,-116},{173,
            -117},{172,-117},{172,-116}},                                                                                                  color = {0, 0, 127}));
    connect(G_21.y, y_22.u1) annotation (
      Line(points={{155,10},{166,10},{166,-104},{172,-104}},          color = {0, 0, 127}));
    connect(D_22.y, u_22.u2) annotation (
      Line(points={{1,-110},{5,-110},{5,-110},{9,-110},{9,-116},{27,-116},{27,
            -117},{27,-116},{28,-116}},                                                                                      color = {0, 0, 127}));
    connect(D_21.y, u_22.u1) annotation (
      Line(points={{1,-70},{10,-70},{10,-70},{21,-70},{21,-104},{27,-104},{27,
            -104},{27,-104},{28,-104}},                                                                                      color = {0, 0, 127}));
    connect(C_22.y, D_22.u) annotation (
      Line(points = {{-57, -110}, {-22, -110}}, color = {0, 0, 127}));
    connect(D_21.u, C_11.y) annotation (
      Line(points={{-22,-70},{-40,-70},{-40,50},{-59,50}},          color = {0, 0, 127}));
    connect(G_12.y, y_11.u2) annotation (
      Line(points={{155,-70},{162,-70},{162,44},{172,44}},          color = {0, 0, 127}));
    connect(D_12.u, C_22.y) annotation (
      Line(points = {{-22, 10}, {-36, 10}, {-36, -110}, {-57, -110}}, color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation (
      Line(points={{-98,10},{-90,10},{-90,50},{-111,50},{-111,50}},            color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation (
      Line(points={{-138,10},{-122,10},{-121,10}},                    color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation (
      Line(points={{195,50},{206,50},{206,80},{-66,80},{-66,58},{-120,58}},                color = {0, 0, 127}));
    connect(D_12.y, u_11.u2) annotation (
      Line(points={{1,10},{20,10},{20,44},{30,44},{30,44}},            color = {0, 0, 127}));
    connect(G_11.y, y_11.u1) annotation (
      Line(points={{155,50},{160,50},{160,56},{172,56}},                     color = {0, 0, 127}));
    connect(D_11.y, u_11.u1) annotation (
      Line(points={{1,50},{14,50},{14,56},{30,56},{30,56}},            color = {0, 0, 127}));
    connect(C_11.y, D_11.u) annotation (
      Line(points={{-59,50},{-24,50},{-24,50},{-22,50}},          color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation (
      Line(points={{-111,50},{-84,50},{-84,50},{-82,50}},          color = {0, 0, 127}));
    connect(G_21.u, G_11.u) annotation (Line(points={{132,10},{122,10},{122,12},
            {118,12},{118,50},{132,50}}, color={0,0,127}));
    connect(G_12.u, G_22.u) annotation (Line(points={{132,-70},{120,-70},{120,
            -110},{132,-110}}, color={0,0,127}));
    connect(K_11.u, u_11.y) annotation (Line(points={{74,50},{68,50},{68,52},{
            53,52},{53,50}}, color={0,0,127}));
    connect(K_22.u, u_22.y) annotation (Line(points={{64,-108},{58,-108},{58,
            -110},{51,-110}}, color={0,0,127}));
    connect(K_22.y, G_22.u) annotation (Line(points={{87,-108},{120,-108},{120,
            -110},{132,-110}}, color={0,0,127}));
    connect(K_11.y, G_11.u)
      annotation (Line(points={{97,50},{132,50}}, color={0,0,127}));
    connect(y_1, e_11.u2) annotation (Line(points={{226,-4},{206,-4},{206,80},{
            -66,80},{-66,58},{-120,58}}, color={0,0,127}));
    connect(y_2, e_22.u2) annotation (Line(points={{222,-48},{204,-48},{204,
            -110},{207,-110},{207,-140},{-65,-140},{-65,-118},{-120,-118}},
          color={0,0,127}));
    connect(u_2, e_22.u1) annotation (Line(points={{-154,-160},{-200,-160},{
            -200,-126},{-128,-126},{-128,-110}}, color={0,0,127}));
    connect(u_1, e_11.u1) annotation (Line(points={{-270,4},{-194,4},{-194,90},
            {-128,90},{-128,50}}, color={0,0,127}));
    annotation (
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 800, Tolerance = 1e-10, Interval = 1));
  end Dynamic_Decoupling;

  model CentralizedPID
    Modelica.Blocks.Continuous.PI C_11(T = 0.3, k = 1) annotation (
      Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 0.3, k = 1) annotation (
      Placement(visible = true, transformation(origin = {-30, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {1, 1}, b = {1}) annotation (
      Placement(visible = true, transformation(origin={184,54},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_21(a = {1, 1}, b = {1}) annotation (
      Placement(visible = true, transformation(origin={184,14},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_12(a = {1, 3}, b = {2}) annotation (
      Placement(visible = true, transformation(origin={184,-66},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {1, 1}, b = {1}) annotation (
      Placement(visible = true, transformation(origin={184,-106},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_11 annotation (
      Placement(visible = true, transformation(origin = {42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u_22 annotation (
      Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_11 annotation (
      Placement(visible = true, transformation(origin={224,54},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add y_22 annotation (
      Placement(visible = true, transformation(origin={224,-106},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Modelica.Blocks.Continuous.PI C_12(T = 1, k = -2) annotation (
      Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_21(T = 0.3, k = -1) annotation (
      Placement(visible = true, transformation(origin = {-30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain ki_11(k=0.1715) annotation (
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain ki_22(k=0.1715)
                                             annotation (
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator IE_1 annotation (
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator IE_2 annotation (
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 200, width = 50)  annotation (
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 200,                  width = 50,
      startTime=50)                                                                             annotation (
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain K_11(k=1)
      annotation (Placement(transformation(extent={{100,40},{120,60}})));
    Modelica.Blocks.Math.Gain K_22(k=1)
      annotation (Placement(transformation(extent={{110,-120},{130,-100}})));
    Modelica.Blocks.Interfaces.RealOutput y_1
      annotation (Placement(transformation(extent={{246,-10},{266,10}})));
    Modelica.Blocks.Interfaces.RealOutput y_2
      annotation (Placement(transformation(extent={{242,-54},{262,-34}})));
    Modelica.Blocks.Interfaces.RealOutput u_1
      annotation (Placement(transformation(extent={{-280,-6},{-260,14}})));
    Modelica.Blocks.Interfaces.RealOutput u_2
      annotation (Placement(transformation(extent={{-266,-40},{-246,-20}})));
  equation
    connect(r_22.y, e_22.u1) annotation (
      Line(points={{-139,-110},{-128,-110}},                                  color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation (
      Line(points={{-139,50},{-128,50},{-128,50},{-128,50}},          color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation (
      Line(points={{-138,-50},{-100,-50},{-100,-110},{-111,-110},{-111,-110}},            color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation (
      Line(points={{-138,-10},{-100,-10},{-100,50},{-111,50},{-111,50}},            color = {0, 0, 127}));
    connect(ki_22.u, e_22.y) annotation (
      Line(points={{-82,-110},{-97,-110},{-112,-110},{-111,-110}},                                                                 color = {0, 0, 127}));
    connect(ki_22.y, C_22.u) annotation (
      Line(points={{-59,-110},{-41,-110},{-42,-110}},                     color = {0, 0, 127}));
    connect(C_12.u, ki_22.y) annotation (
      Line(points = {{-42, 10}, {-56, 10}, {-56, -110}, {-59, -110}}, color = {0, 0, 127}));
    connect(C_21.y, u_22.u1) annotation (
      Line(points={{-19,-70},{1,-70},{1,-104},{29,-104},{29,-104},{28,-104},{28,
            -104}},                                                                                    color = {0, 0, 127}));
    connect(C_21.u, ki_11.y) annotation (
      Line(points={{-42,-70},{-52,-70},{-52,50},{-59,50}},          color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation (
      Line(points={{-158,-70},{-140,-70},{-140,-70},{-141,-70},{-141,-70},{-141,
            -70}},                                                                                  color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation (
      Line(points={{-118,-70},{-109,-70},{-109,-70},{-100,-70},{-100,-110},{
            -110,-110},{-110,-113},{-110,-110},{-111,-110}},                                                                                    color = {0, 0, 127}));
    connect(e_22.u2, y_22.y) annotation (
      Line(points={{-120,-118},{-26,-118},{-26,-114},{-26,-136},{244,-136},{244,
            -106},{236,-106},{236,-109},{236,-106},{235,-106}},                                                                                                           color = {0, 0, 127}));
    connect(G_22.y, y_22.u2) annotation (
      Line(points={{195,-106},{199,-106},{205,-106},{205,-112},{213,-112},{213,
            -113},{212,-113},{212,-112}},                                                                                                  color = {0, 0, 127}));
    connect(G_21.y, y_22.u1) annotation (
      Line(points={{195,14},{206,14},{206,-100},{212,-100}},          color = {0, 0, 127}));
    connect(C_22.y, u_22.u2) annotation (
      Line(points={{-19,-110},{-5,-110},{-5,-110},{9,-110},{9,-116},{29,-116},{
            29,-116},{28,-116},{28,-116}},                                                                                       color = {0, 0, 127}));
    connect(G_12.y, y_11.u2) annotation (
      Line(points={{195,-66},{202,-66},{202,48},{212,48}},          color = {0, 0, 127}));
    connect(ki_11.y, C_11.u) annotation (
      Line(points={{-59,50},{-42,50}},                            color = {0, 0, 127}));
    connect(ki_11.u, e_11.y) annotation (
      Line(points={{-82,50},{-110,50},{-111,50}},                    color = {0, 0, 127}));
    connect(C_11.y, u_11.u1) annotation (
      Line(points={{-19,50},{8,50},{8,56},{30,56},{30,56}},            color = {0, 0, 127}));
    connect(C_12.y, u_11.u2) annotation (
      Line(points={{-19,10},{8,10},{8,44},{30,44},{30,44}},            color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation (
      Line(points={{-158,10},{-142,10},{-142,10},{-141,10}},          color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation (
      Line(points={{-118,10},{-100,10},{-100,50},{-111,50}},          color = {0, 0, 127}));
    connect(y_11.y, e_11.u2) annotation (
      Line(points={{235,54},{246,54},{246,84},{-26,84},{-26,58},{-120,58}},                color = {0, 0, 127}));
    connect(G_11.y, y_11.u1) annotation (
      Line(points={{195,54},{200,54},{200,60},{212,60}},                     color = {0, 0, 127}));
    connect(G_11.u, G_21.u) annotation (Line(points={{172,54},{164,54},{156,54},
            {156,14},{172,14}}, color={0,0,127}));
    connect(G_12.u, G_22.u) annotation (Line(points={{172,-66},{158,-66},{158,
            -106},{172,-106}}, color={0,0,127}));
    connect(K_11.u, u_11.y)
      annotation (Line(points={{98,50},{53,50}},         color={0,0,127}));
    connect(K_11.y, G_21.u) annotation (Line(points={{121,50},{156,50},{156,14},
            {172,14}}, color={0,0,127}));
    connect(K_22.y, G_22.u) annotation (Line(points={{131,-110},{158,-110},{158,
            -106},{172,-106}}, color={0,0,127}));
    connect(K_22.u, u_22.y) annotation (Line(points={{108,-110},{51,-110}},
                    color={0,0,127}));
    connect(y_1, e_11.u2) annotation (Line(points={{256,0},{240,0},{240,54},{
            246,54},{246,84},{-26,84},{-26,58},{-120,58}}, color={0,0,127}));
    connect(y_2, y_22.y) annotation (Line(points={{252,-44},{240,-44},{240,-106},
            {235,-106}}, color={0,0,127}));
    connect(u_2, e_22.u1) annotation (Line(points={{-256,-30},{-256,-152},{-128,
            -152},{-128,-110}}, color={0,0,127}));
    connect(u_1, e_11.u1) annotation (Line(points={{-270,4},{-232,4},{-232,86},
            {-208,86},{-208,80},{-128,80},{-128,50}}, color={0,0,127}));
    annotation (
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 800, Tolerance = 1e-10, Interval = 1));
  end CentralizedPID;

  model Ideal
    Modelica.Blocks.Continuous.PI C_11(T = 0.607, k = 2.824) annotation (
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI C_22(T = 0.607, k = 2.824) annotation (
      Placement(visible = true, transformation(origin = {-70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_11(a = {1, 1}, b = {1}) annotation (
      Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction G_22(a = {1, 1}, b = {1}) annotation (
      Placement(visible = true, transformation(origin = {90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback e_11 annotation (
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Feedback e_22 annotation (
      Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs_e1 annotation (
      Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Math.Abs abs_e2 annotation (
      Placement(visible = true, transformation(origin = {-130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_2 annotation (
      Placement(visible = true, transformation(origin = {-170, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IAE_1 annotation (
      Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_2 annotation (
      Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Continuous.Integrator IE_1 annotation (
      Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse r_11(amplitude = 1, period = 200, width = 50)  annotation (
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse r_22(amplitude = 1, period = 200,                  width = 50,
      startTime=50)                                                                             annotation (
      Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain K_11(k=6.8)
      annotation (Placement(transformation(extent={{0,40},{20,60}})));
    Modelica.Blocks.Math.Gain K_22(k=6.8)
      annotation (Placement(transformation(extent={{0,-120},{20,-100}})));
    Modelica.Blocks.Interfaces.RealOutput y_1
      annotation (Placement(transformation(extent={{140,40},{160,60}})));
    Modelica.Blocks.Interfaces.RealOutput y_2
      annotation (Placement(transformation(extent={{140,-120},{160,-100}})));
    Modelica.Blocks.Interfaces.RealOutput u_1
      annotation (Placement(transformation(extent={{-120,80},{-100,100}})));
    Modelica.Blocks.Interfaces.RealOutput u_2
      annotation (Placement(transformation(extent={{-120,-180},{-100,-160}})));
  equation
    connect(r_22.y, e_22.u1) annotation (
      Line(points={{-139,-110},{-128,-110}},                                  color = {0, 0, 127}));
    connect(r_11.y, e_11.u1) annotation (
      Line(points={{-139,50},{-128,50},{-128,50},{-128,50}},          color = {0, 0, 127}));
    connect(G_22.y, e_22.u2) annotation (
      Line(points={{101,-110},{120,-110},{120,-140},{-120,-140},{-120,-118},{
            -120,-118}},                                                                               color = {0, 0, 127}));
    connect(G_11.y, e_11.u2) annotation (
      Line(points={{101,50},{120,50},{120,80},{-120,80},{-120,58},{-120,58}},              color = {0, 0, 127}));
    connect(IE_2.u, e_22.y) annotation (
      Line(points={{-138,-50},{-100,-50},{-100,-110},{-111,-110},{-111,-110}},            color = {0, 0, 127}));
    connect(IE_1.u, e_11.y) annotation (
      Line(points={{-138,-10},{-100,-10},{-100,50},{-111,50},{-111,50}},            color = {0, 0, 127}));
    connect(IAE_2.u, abs_e2.y) annotation (
      Line(points={{-158,-70},{-140,-70},{-140,-70},{-141,-70}},          color = {0, 0, 127}));
    connect(abs_e2.u, e_22.y) annotation (
      Line(points={{-118,-70},{-100,-70},{-100,-110},{-111,-110},{-111,-110}},            color = {0, 0, 127}));
    connect(e_22.y, C_22.u) annotation (
      Line(points={{-111,-110},{-83,-110},{-83,-110},{-82,-110}},          color = {0, 0, 127}));
    connect(IAE_1.u, abs_e1.y) annotation (
      Line(points={{-158,10},{-142,10},{-141,10}},                                color = {0, 0, 127}));
    connect(abs_e1.u, e_11.y) annotation (
      Line(points={{-118,10},{-100,10},{-100,50},{-111,50}},          color = {0, 0, 127}));
    connect(e_11.y, C_11.u) annotation (
      Line(points={{-111,50},{-84,50},{-84,50},{-82,50}},          color = {0, 0, 127}));
    connect(K_11.u, C_11.y)
      annotation (Line(points={{-2,50},{-59,50}}, color={0,0,127}));
    connect(K_11.y, G_11.u)
      annotation (Line(points={{21,50},{49.5,50},{78,50}}, color={0,0,127}));
    connect(K_22.u, C_22.y)
      annotation (Line(points={{-2,-110},{-59,-110}}, color={0,0,127}));
    connect(K_22.y, G_22.u) annotation (Line(points={{21,-110},{49.5,-110},{78,
            -110}}, color={0,0,127}));
    connect(G_11.y, y_1)
      annotation (Line(points={{101,50},{150,50}},          color={0,0,127}));
    connect(y_2, G_22.y) annotation (Line(points={{150,-110},{101,-110},{101,
            -110}}, color={0,0,127}));
    connect(r_11.y, u_1) annotation (Line(points={{-139,50},{-136,50},{-136,90},
            {-110,90}}, color={0,0,127}));
    connect(u_2, e_22.u1) annotation (Line(points={{-110,-170},{-134,-170},{
            -134,-110},{-128,-110}}, color={0,0,127}));
    annotation (
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      Icon(coordinateSystem(extent = {{-300, -300}, {300, 300}})),
      Diagram(coordinateSystem(extent = {{-300, -300}, {300, 300}})),
      __OpenModelica_commandLineOptions = "",
  experiment(
        StopTime=800,
        Interval=1,
        Tolerance=1e-010),
      __Dymola_experimentSetupOutput,
      __Dymola_experimentFlags(
        Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),

        Evaluate=false,
        OutputCPUtime=false,
        OutputFlatModelica=false));
  end Ideal;
  annotation (
    uses(Modelica(version = "3.2.2")),
    experiment,
    __Dymola_experimentSetupOutput(doublePrecision=true),
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=false,
      OutputFlatModelica=false));
end Rosenbrock_Gain;

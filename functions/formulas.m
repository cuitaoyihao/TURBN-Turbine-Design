P_TTt = @(Pt,Tt,T,y)(Pt*(T/Tt)^(y/(y-1)));
P_TTt_Matrix = @(Pt,Tt,T,y)(Pt.*(T./Tt).^(y/(y-1)));
Pt_phi = @(Pt1,Tt2,T2,y,phi)(Pt1/(1+phi*(1-(T2/Tt2)^(y/(y-1)))));
T_Tt = @(Ttx,Mx,y)(Ttx/(1+((y-1)/2)*Mx^2));
V_Tt = @(Ttx,Mx,y,gc,R)(sqrt(2*gc*(y/(y-1))*R*Ttx/(1+2/((y-1)*Mx^2))));
Sai = @(Tt1,Tt3,wr,gc,y,R)((Tt1-Tt3)*gc*(y/(y-1))*R/(wr)^2);
%one unknown parameter from below
alpha2_ = @(u3_u2,alpha3,sai,wr,V2)(asin( ((sai*wr/V2) - (u3_u2*tan(alpha3)) * sqrt(1 + (u3_u2*tan(alpha3))^2 - (sai*wr/V2)^2) )/(1+(u3_u2*tan(alpha3))^2)         ));
alpha3_ = @(u3_u2,alpha2,sai,wr,V2)( (sai*wr/(cos(alpha2)*V2)- tan(alpha2))/u3_u2);
Tt3_ = @(Tt1,wr,u3_u2,V2,alpha2,alpha3,y,R)(Tt1 - (wr*V2/(gc*(y/(y-1))*R))*(sin(alpha2) + (u3_u2*cos(alpha2)*tan(alpha3))) );
%unknown mach2
V2_ = @(u3_u2,alpha2,alpha3,sai,wr)(  (sai*wr)/(sin(alpha2)+ u3_u2*cos(alpha2)*tan(alpha3))  );
M2_ = @(V2,Tt2,gc,y,R)(V2/(sqrt((y-1)*gc*(y/(y-1))*R*Tt2 - ((y-1)/2)*V2^2 ) ) );
%
Ai_ = @(m_dot,Tti,Pti,alpha_i,MFPi)(m_dot*sqrt(Tti)/(Pti*(cos(alpha_i))*MFPi));
MFP = @(M,y,gc,R)( sqrt(y*gc/R)*M*(1+(y-1)*M^2/2)^(-(y+1)/(2*(y-1))) );%very important mass flow parameter 
Zs_cx_s =@(alpha_1,u1,alpha_2,u2)(2*cos(alpha_2)^2*(tan(alpha_1)+(u2/u1)*tan(alpha_2))*(u1/u2)^2) ;
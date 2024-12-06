function P = bezier3(P0, P1c, P2c, P3, t)
% BEZIER3  Generate a single point P = [x y] from a
% single t value, on the cubic Bezier curve from
% point P0 to point P3.  Uses control points P1c
% and P2c.

A=lerp(P0,P1c,t);
B=lerp(P1c,P2c,t);
C=lerp(P2c,P3,t);
D=lerp(A,B,t);
E=lerp(B,C,t);
P=lerp(D,E,t);

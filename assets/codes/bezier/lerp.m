function P = lerp(P0, P1, t)
% LERP  Generate a single point P = [x y]
% from a single t value, on the line between
% P0 = [x0 y0] and P1 = [x1 y1].

P = (1-t) * P0 + t * P1;

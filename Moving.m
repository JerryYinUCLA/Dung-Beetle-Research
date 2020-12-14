function [ x_new, y_new] = Moving( x, y, v, delta_t, x_part, y_part )
x_new = x + v * x_part * delta_t;
y_new = y + v * y_part * delta_t;
end


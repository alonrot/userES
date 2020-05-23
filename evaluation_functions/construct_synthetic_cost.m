%
% Copyright 2017 Max Planck Society. All rights reserved.
% 
% Alonso Marco
% Max Planck Institute for Intelligent Systems
% Autonomous Motion Department
% amarco(at)tuebingen.mpg.de
%
function J = construct_synthetic_cost(std_n,D)
        
    % Load pre-computed synthetic functions:
    switch D
        case 1
            load('synthetic_function_1D');
        case 2
            load('synthetic_function_2D');
        otherwise
            J = @(x,foo) sum(x.^2);
            return;
    end
    
    % Actual functions:
    J = @(x,foo) get_J(x,foo,f,x_drawn_vec,std_n);

end

function J_val = get_J(x,foo,f,x_drawn_vec,std_n)

    % Error checking:
    error_checking(x,x_drawn_vec);
    
    % Evaluate:
    J_val = f(x) + std_n * randn;

end

function error_checking(th,x_drawn_vec)

    error_msg = 'The requested th is out of the limits where J(th) is defined';
    if any( th < x_drawn_vec(1,:) ) || any( th > x_drawn_vec(end,:) )
        error(error_msg);
    end

end
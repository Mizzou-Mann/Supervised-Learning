% Load data
x = [1.47 1.5 1.52 1.55 1.57 1.6 1.63 1.65 1.68 1.7 1.73 1.75 1.78 1.8 1.83]';
y = [52.21 53.12 54.48 55.84 57.2 58.57 59.93 61.29 63.11 64.47 66.28 68.1 69.92 72.19 74.46]';

max_degree = 5;
% Regression models
Beta = cell(max_degree, 1);

x_value = linspace(1.3, 2)';
for p = 1:max_degree
    display('polynomial regression:');
    display(p);
    Beta{p} = p_regression(x, y, p);
    
    A = make_A(x_value, p);
    if p > 1 
        figure;
        scatter(x, y); hold on;
        plot(x_value, A(:,1:end-1)*Beta{p-1}, 'r');
        plot(x_value, A*Beta{p}, 'g');
        hold off;
        
        xlim([1.3 2]); ylim([40 100]);
        xlabel('Height');
        ylabel('Weight');
        legend('Data', [num2str(p-1) ' degree polynomial'], [num2str(p) ' degree polynomial']);
    end
end
function visualize(x_min, x_max, X, T, analytical_grid, numerical_grid)
    scrsz = get(0, 'ScreenSize');

    %% 1. ����������� ������� � ������������ �������

    figure('Position', [50 125 scrsz(3)-250 scrsz(4)-250], 'Name', '1. ����������� ������� � ������������ �������', 'NumberTitle', 'off');

    % ������ ����������� ������� �������
    subplot(1, 2, 1);
    grid on;
    hold on;
        surf(X, T, analytical_grid, 'EdgeColor', 'none');
        set(gca, 'CameraPosition', [0, 0, 60]);
        title('����������� ������� �������');
        xlabel('x');
        ylabel('t');
        zlabel('u(x,t)');
    hold off;

    % ������ ����������� ������������ �������
    subplot(1, 2, 2);
    grid on;
    hold on;
        surf(X, T, numerical_grid, 'EdgeColor', 'none');
        set(gca, 'CameraPosition', [0, 0, 60]);
        title('����������� ������������ �������');
        xlabel('x');
        ylabel('t');
        zlabel('u(x,t)');
    hold off;


    %% 2. ����� ������ ������� � ������������ �������

    figure('Position', [75 100 scrsz(3)-250 scrsz(4)-250], 'Name', '2. ����� ������ ������� � ������������ �������', 'NumberTitle', 'off');

    % ������ ����� ������ ������� �������
    subplot(1, 2, 1);
    grid on;
    hold on;
        [C, h] = contour(X, T, analytical_grid, 10, 'LineWidth', 2);
        clabel(C, h);
        colorbar;
        title('����� ������ ������� �������');
        xlabel('x');
        ylabel('t');
    hold off;

    % ������ ����� ������ ������������ �������
    subplot(1, 2, 2);
    grid on;
    hold on;
        [C, h] = contour(X, T, numerical_grid, 8, 'LineWidth', 2);
        clabel(C, h);
        colorbar;
        title('����� ������ ������������ �������');
        xlabel('x');
        ylabel('t');
    hold off;


    %% 3. ����� ������ ���������� � ������������� �����������

    figure('Position', [100 75 scrsz(3)-250 scrsz(4)-250], 'Name', '3. ����� ������ ���������� � ������������� �����������', 'NumberTitle', 'off');

    % ������ ����� ������ ���������� �����������
    subplot(1, 2, 1);
    hold on;
        [C, h] = contour(X, T, abs(analytical_grid - numerical_grid), 8, 'LineWidth', 2);
        clabel(C, h);
        colorbar;
        title('����� ������ ���������� �����������');
        xlabel('x');
        ylabel('t');
    hold off;

    % ������ ����� ������ ������������� �����������
    subplot(1, 2, 2);
    hold on;
        [C, h] = contour(X, T, abs((analytical_grid - numerical_grid) ./ analytical_grid), 8, 'LineWidth', 2);
        clabel(C, h);
        colorbar;
        title('����� ������ ������������� �����������');
        xlabel('x');
        ylabel('t');
    hold off;
    
    %% 4. �������� �������
    
    figure('Position', [125 50 scrsz(3)-250 scrsz(4)-250], 'Name', '4. �������� �������', 'NumberTitle', 'off');
    
    % ������ �������� �������������� �������
    u_min = min(analytical_grid(:));
    u_max = max(analytical_grid(:));
    axis([x_min x_max u_min u_max]);
    w = 0;
    while(w ~= 1)
        for t = 1:length(T)
            plot(X, analytical_grid(:, t), 'color', 'r', 'LineWidth', 2);
            grid on;
            xlim([x_min x_max]);
            ylim([u_min u_max]);
            title(sprintf('�������� �������������� �������: t = %.1f', T(t)));
            xlabel ('x');
            ylabel ('u(x,t)');
            pause(0.05);
        end
        title('�������� ���� ����� ��� ������� ��� ������� ����� ������� �� ���������� ��� ����������.');
        w = waitforbuttonpress;
    end   
    close;
end
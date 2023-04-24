p = input('População Inicial P = ');
n = input('Número de interações N = ');

J = [transp(1 : p), transp(0 : 1 / (p - 1) : 1), zeros(p, 1)];  % criação dos jogadores
T = [3 0; 5 1];                                                 % matriz do jogo

for i = 1 : n                                                   % jogo sendo executado n vezes
    
    a = 1 + round((p - 1) .* rand);                         % escolha do jogador a
    b = 1 + round((p - 1) .* rand);                         % escolha do jogador b
    
    ea = rand;                                              % gerador aleatorio da estrategia do jogador a
    eb = rand;                                              % gerador aleatorio da estrategia do jogador b
    
    if a == b

        a = 1 + round((p - 1) .* rand);                     % escolha do jogador a
        b = 1 + round((p - 1) .* rand);                     % escolha do jogador b
        ea = rand;                                          % gerador aleatorio da estrategia do jogador a
        eb = rand;                                          % gerador aleatorio da estrategia do jogador b

    else
    
        if ea <= (J(a, 2) + 3 * J(b, 2)) / 4                % escolha da jogada do jogador a

            ja = 1;

        else

            ja = 0;

        end
        
        if eb <= (J(b, 2) + 3 * J(a, 2)) / 4                % escolha da jogada do jogador b
            
            jb = 1;

        else
        
            jb = 0;

        end

        if ja == 1 && jb == 1

            J(a, 3) = J(a, 3) + T(1, 1);
            J(b, 3) = J(b, 3) + T(1, 1);

        elseif ja == 1 && jb == 0

            J(a, 3) = J(a, 3) + T(1, 2);
            J(b, 3) = J(b, 3) + T(2, 1);
        
        elseif ja == 0 && jb == 1

            J(a, 3) = J(a, 3) + T(2, 1);
            J(b, 3) = J(b, 3) + T(1, 2);
        
        elseif ja == 0 && jb == 0

            J(a, 3) = J(a, 3) + T(2, 2);
            J(b, 3) = J(b, 3) + T(2, 2);
        
        end

    end

end

aux=figure(1);                                              % gerando o gráfico
set(aux, 'Name', 'Ganhos Individuais Baseados na Reputação')
plot(J(:, 2), J(:, 3), 'b*')


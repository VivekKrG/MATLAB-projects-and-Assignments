function [] = tictactoe()
    % Setup the figure/windows for the game
    close all
    figure('Name','Tic Tac Toe');
    plot(-1. -1)
    axis([0 3 0 3])
    set(gca,'xTick',0:3)
    set(gca,'yTick',0:3)
    set(gca,'xTickLabel','')
    set(gca,'yTickLabel','')
    xlabel('Player: X')
    grid on
    shg
    
    is_x = 1; % keeps track of the current player
    state = [[-1 -1 -1]
             [-1 -1 -1]
             [-1 -1 -1]]; % the state of the game (-1 none, 0 = 0, 1 = X)
    winner = -1; % is there a winner? is it a tie?
    
    % The main game loop. Continue until the game ends with winner ~= -1
    while winner == -1
        next = play(is_x, state); % play a single round
        if next == -1 % if the player clicks on a filled in slot, ask them to try again
           title('Invalid move, please try again');
        else
           state = next; % advance the current state
           title('');
           is_x = mod(is_x + 1,2); % pick the next player and update the player label
           if is_x == 1
               xlabel('Player: X');
           else
               xlabel('Player: O');
           end
           winner = won(state); % check to see if the game is in a winning state
        end
    end
    
    if winner == 0 % O won
        warndlg('O wins');
        title('O wins');
        xlabel('');
    elseif winner == 1 % X won
        warndlg('X wins');
        title('X wins');
        xlabel('');
    else % else it's a tie
        warndlg('Tie');
        title('Tie');
        xlabel('');
    end
end

% The state function takes in the current player and the previous state the
% game is in and simulates a single round.
function state = play(is_x, state)
    [x, y] = ginput(1); % get the mouse position with respect to the plot
    [col, row] = position(x, y); % get the corresponding row/col (note row starts off with 0 at the bottom)
    row = 2 - row; % the actual row within the state matrix
    if state(col+1, row+1) ~= -1 % if the player tries to click on a filled spot
       state = -1; % invalid, ask the player to try again
    else
        state(col+1, row+1) = is_x; % set the state and draw the X and the O
        if is_x
            drawX(col, 2 - row);
        else
            drawO(col, 2 - row);
        end
    end
end

% The won function calculates if the current game state is in a winning
% state.
function won = won(state)
    % Horizontal
    if (state(1,1) == state(1,2) && state(1,1) == state(1,3) && state(1,1) ~= -1)
        won = state(1,1);
    elseif (state(2,1) == state(2,2) && state(2,1) == state(2,3) && state(2,1) ~= -1)
        won = state(2,1);
    elseif (state(3,1) == state(3,2) && state(3,1) == state(3,3) && state(3,1) ~= -1)
        won = state(3,1);
    % Vertical
    elseif (state(1,1) == state(2,1) && state(1,1) == state(3,1) && state(3,1) ~= -1) 
        won = state(1,1);
    elseif (state(1,2) == state(2,2) && state(1,2) == state(3,2) && state(1,2) ~= -1) 
        won = state(1,2);
    elseif (state(1,3) == state(2,3) && state(1,3) == state(3,3) && state(1,3) ~= -1) 
        won = state(1,3);
    % Diagonal
    elseif (state(1,1) == state(2,2) && state(1,1) == state(3,3) && state(1,1) ~= -1)
        won = state(1,1);
    elseif (state(1,3) == state(2,2) && state(1,3) == state(3,1) && state(2,2) ~= -1)
        won = state(1,3);
    % If no more slots are open, it's a tie
    elseif ~ismember(state, -1)
        won = 2;
    else
        won = -1;
    end
end

% Returns the rounded off position of the mouse
function [col, row] = position(x, y)
    col = floor(x);
    row = floor(y);
    if col > 2 % if we're right on the 3 line, we count it as 2
        col = 2;
    end
    
    if row > 2
        row = 2;
    end
end

function drawX(col, row)

    hold on
    x = 0:1;
    pos = 0:1;
    neg = 1-x;
    plot(x+col, pos+row)
    plot(x+col, neg+row)
    hold off
end

function drawO(col, row)
    hold on
    t = 0:0.1:1;
    x = t.^0.4 ;
    y = t;
    plot(x+col, y+row)
    hold off
end

blackBox
loopNumber=10;

% Find handle to hidden figure
temp = get(0,'showHiddenHandles');
set(0,'showHiddenHandles','on');
hfig = gcf;
% Get the handles structure
handles = guidata(hfig);


% This will let you pick the File radio button
set(handles.radioFile, 'Value', 0);
% This changes the start time
set(handles.axisStart, 'String', '0');
% This changes the end time
set(handles.axisEnd, 'String', '10');
% This changes the step size
set(handles.stepSize, 'String', '0.001');
% This changes the refine output
set(handles.refineOutput, 'String', '1');


for i=1:loopNumber

    % This changes the save file name
    saveTo = sprintf('sin%dt',i);
    set(handles.saveFile, 'String', saveTo);
    attempt_func = sprintf('sin(%d*t)',i);
    set(handles.input, 'String', attempt_func );
    
    % When you go to run the GUI, there is still a bug in the program.
    % If you change the equation in the Field textbox, when you Run the GUI
    % right afterwards, it runs the old equation. The next Run will use the new
    % equation and any subsequent run there after.
    set(handles.axisEnd, 'String', '1');
    blackBox('run_Callback',handles.run,[],handles);
    set(handles.axisEnd, 'String', '10');
    blackBox('run_Callback',handles.run,[],handles);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    


    blackBox('input_Callback',handles.input,[],handles);
    % Use the run button
    blackBox('run_Callback',handles.run,[],handles);
    % Use the save button
    blackBox('save_Callback',handles.save,[],handles);
    %end of loop

end

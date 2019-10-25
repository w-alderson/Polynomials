function [string] = printError( error )
% takes an error and prints out readable output for tutors/students
% for the purposes of debugging/checking marking

    

    string = sprintf(strcat([ error.identifier '\n' error.message '\n' ]));

    stackLength = length(error.stack);
    stackPosition = 1;

    % only print out stack elements up to three steps away from the initial
    % error
    
    string = strcat([ string ...
        '>>error began here>> ']);
    while stackPosition <= min(stackLength,3)

        stringAddendum = sprintf('error in program %s at line %d\n',  ...
            error.stack(stackPosition).name, error.stack(stackPosition).line);
        string = sprintf( '%s %s', string,  stringAddendum );
        
        stackPosition = stackPosition + 1;
    end
    
    if nargout == 0
        
        fprintf(1,string);
    end
    
end
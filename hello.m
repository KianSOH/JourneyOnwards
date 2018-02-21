function hello() %a switch-case-otherwise function demo to show that it can accept strings
    
    STR = input('How are you?')

switch STR
    
    case 'good'
      fprintf('I am good too, have a wonderful day!\n');
            
    case 'fine'
      fprintf('I am happy to learn that you are fine! have a fine & dandy day\n');
   
    case 'excellent'
      fprintf('Excellent is the word! Have an excellent day!\n');
     
    case 'great'
      fprintf('Great! I feel great too!\n');
      
    case 'happy'
      fprintf('I feel happy too! Have a happy day!\n');
      
    case 'alive'
      fprintf('You mean you were dead? type happy!\n');
      
    case 'aweful'
      fprintf('Don''t feel bad, time for you to take a break!\n');
     
   otherwise
      fprintf('Response must be good,fine,excellent,great,happy,alive,aweful\n');
      return 
end
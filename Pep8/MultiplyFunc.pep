;Multiply two numbers
;Written by Isaac Meisner, Jeff Hartman, and TJ Broadus

         BR      main        

counter: .equate 0           ; local variable #2d
sum:     .equate 2           ; local variable #2d
y:       .equate 8           ; function parameter #2d
x:       .equate 6           ; function parameter #2d
retVal:  .equate 10          ; return value #2d

multiply:subsp   4, i        ; push #sum #counter
         sta     counter,s   
         br      while      

while:   lda    sum, s
         adda    x,s      
         sta     sum,s
         lda     counter, s
         suba    1,i       
         sta     counter, s        
         cpa     0,i         
         brgt    while
         lda     sum, s
         addsp   4, i        ; pop #counter #sum 
         ret0

product: .equate 4           ; local var #2d
num2:    .equate 2           ; local var #2d 
num1:    .equate 0           ; local var #2d

main:    subsp   6,i         ; push var #product #num2 and #num1 
         deci    num1,s      ; cin >> num1
         deci    num2,s      ; cin >> num2
         lda     num1, s     ; A = num1
         sta     -6, s       ; x = A;
         lda     num2, s     ; A = num2
         sta     -4, s       ; y = A
         subsp   6, i        ; push function parameter #retVal #y and #x 
         call    multiply
         addsp   6, i        ; pop #x #y #retVal    
         addsp   4,i         ; pop #num1 and #num2
         sta     product, s
         deco    product, s
         addsp   2, i        ; pop #product      
         STOP                
         .END                  
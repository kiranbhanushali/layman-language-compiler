
# Project defination
**Make a translator for language described as follows-
Following is a valid sentence in a layman friendly
“comparison ” program. Generate its appropriate
language description and compiler-**

Valid sentences in language :
*	Which is bigger number 7 or 2?
*	From 7 and 2 which is larger ?
*	Is 7 bigger than 2?
*	Is 2 smaller than 4?
*	Which is smaller between 4 and 9?
*	Which is smaller number 44 or 22?




# Grammer Rules
```
statement : WHICH IS the operator stm1 EOL 
          | FROM num AND num WHICH IS operator EOL  
          | IS num operator THAN num EOL  



stm1:    NUMBER num OR num
     |   BETWEEN num AND num     ;


operator: LESSER
        | LARGER
        | BIGGER
        | SMALLER
        ;

num : NUM
    ;

the : THE 
    |  /*epsilon*/ ; 

```



# WebApp
Technologies used : HTML ,  bootstrap , jquery , NodeJS , Express 
Link : [https://online-layman-compiler.herokuapp.com/](https://online-layman-compiler.herokuapp.com/)
	
###  To Run locally 
* clone repo and go to web app folder
* run  ```npm install```  
* run ``` node index.js```


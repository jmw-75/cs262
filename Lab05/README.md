CS 262 - Lab #5

This lab is based on: https://cs.calvin.edu/courses/cs/262/kvlinden/05design/lab.html

I refactored a previous solution from Lab04 to modularize the system and added a few new features. 

Answers to the lab questions: 
	1. Of what benefit was the refactoring phase of this lab?
		The benefit of refactoring was that is spread the code out from the app.js file rather than crunching it all inside
		This allows for easier understanding and cleaner code for the users.

	2. What do the export commands do?
		export allows for a function to be used in anoter function. This makes it easy to spread out work among different directories and simply call a function to use it and import it.

	3. This appliacation uses stack navigation. What does the stack do here? What is the deepest this stack can get in this application?
		The stack provides a way for you to navigate to different screens. The deepest that this application can do is
		from home > details > about.

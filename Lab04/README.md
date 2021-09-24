CS 262 - Lab 04

This lab is based on https://cs.calvin.edu/courses/cs/262/kvlinden/04analysis/lab.html

I followed instructions created by React navigation to create a two-page application done

Answers to the lab questions:

PART ONE:
a. What React construct is used ot im plement separate pages of an application (cf. separate webpages on the Web)?
	We used function to create a new screen in addition to home. This creates an additional route to home that is specified by a screen component.
        The name prop and the name of the route correspond to one another and are used to navigate. 
b. What is the React Navigation concept that is analogous to a URL/URI on the Web?
	The React Navigation concept that is analogous to a URL/URI on the web is the <a> tag that is used for when a user clock on a link, it pushes
        the URL to the browswer history stack.
c. The onPress event handler for the home screen component is specified as () => navigation.navigate('Details'). Can we just say navigation.navigate('Details')? Why or why not?
	The reason that the "() =>" must be included is because that states where we currently are and inside the second pair of () states where we want to go when the button is clicked. 
	Without it there would be no place assigned to come from and would cause an error.

PART TWO:
a. Explain how the hard-coded movie list is presented as a list of titles on the homepage.
	There is a 'database' with the movies and data about them listed from which the titles are displayed on the Homepage when pulled.
b. Explain how the details screen presents the details of a single movie.
	On the click of a title from the homepage, the details page pulls all three data points from the 'database' displaying them.

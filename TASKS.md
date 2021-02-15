# Dear candidate!

I hope you successfully prepared the project with the instructions in the [Readme](README.md) and ready to solve some exciting exercises.

Let me remind you that you do NOT need to finish all the exercises in order to succeed. We'd rather like to learn the way you think, solve problems and your general knowledge on the topic by watching you work, than to just discuss the sheer number of LoC you wrote.

If you come across an obstacle which proves to be difficult, feel encouraged to ask us anything! We'll be glad to answer or ask some leading questions. (Or just utilize Google, StackOverflow or https://guides.rubyonrails.org/ to your liking.)

I wish you success!

## Overview

Feel free to choose from the following tasks based on your skills and preferences:

* [Pagination](#pagination)
* [Routing](#routing)
* [Validations](#validations)
* [Statistics](#statistics)

## Let's begin!

### Validations

Add a new `number_of_guests` field to Bookings with validations on it.

1. Create a new migration
2. Define a validation to allow only between 1-8
3. Add an input field to the booking form
4. Customize the error message on the page if the input is invalid

### Routing

Create a new page for houses (e.g.: `/houses/1`)

1. Create a new route and a new controller for the houses
2. Make the house links work on the bookings page
3. Display the booked days for the selected house
4. Order the bookings by their dates
5. Add option to revert the list

### Pagination

Add pagination to `/bookings`

1. Use a gem to do this! We suggest `pagy`, but you can use your preferences if you have any
2. Make it so, that every page only displays four bookings
3. Add option to define a per page value

### Statistics

The current statistics page is broken, let's fix the calculations.

1. Find the house with the most bookings
2. Calculate the most successful year

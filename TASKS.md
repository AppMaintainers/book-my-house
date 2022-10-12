# Dear Candidate!

We hope that you had no trouble following the [Readme](README.md) instructions. Now that you're all setup, let's solve some exciting exercises!

Let us remind you that finishing every exercise is NOT a requirement. We do NOT measure your performance by the sheer amount code you've written. Instead, we are much more excited to see the way you think and solve problems.

If you feel a bit stuck or a task proves to be too difficult, feel free to ask for help. We're here to give you hints and tips about the topic. You are also encouraged to use Google, StackOverflow and https://guides.rubyonrails.org/ .

I wish you success!

## Overview

Here you can see the list of all available exercises. Choose whichever you'd like and if you're finished with it, move on to the next one!

* [Pagination](#pagination)
* [Routing](#routing)
* [Validations](#validations)
* [Statistics](#statistics)
* [React](#react)

## Exercises

### Validations

Add a new field `number_of_guests` with validations to Bookings

1. Create a new migration
2. Define a validation to allow only between 1-8 guests
3. Add an input field to the booking form
4. Customize the error message on the page if the input is invalid

### Routing

Create a new page for houses (e.g.: `/houses/1`)

1. Create a new route and a new controller for houses
2. Make the house links work on the bookings page
3. Display the booked days for the selected house
4. Order the bookings by their dates
5. Add option to revert the list of the booked days

### Pagination

Add pagination to `/bookings`

1. Use a gem to do this! We suggest `pagy`, but if you have a preference for a different gem, feel free to use that one
2. Make it so, that every page only displays four bookings
3. Add an option to define a per page value

### Statistics

The current statistics page is broken, let's fix the calculations.

1. Find the house with the most bookings
2. Calculate the most successful year with the most bookings.

### React

We've started working on recreating the booking query page with React.
You can check it on `/query/new?react`. Finish the work by implementing the following:

1. Create a form with 3 input fields: year, month and day
2. On submission, make a `POST` request to `/api/query`
3. Display the results in a different component
4. Make sure to handle request errors
5. Make sure to disable the submit button while we are fetching the response

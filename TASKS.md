# Book My House — Interview Tasks

Welcome! Below are 7 tasks ordered by difficulty. You do **not** need to complete
all of them. We care more about your approach, code quality, and reasoning
than the number of tasks finished. Feel free to tackle them in any order,
though the numbered sequence tells a coherent story.

Run `bin/rails test test/tasks/` to see which task tests pass.
Visit `/tasks` in your browser for a live progress dashboard.

---

## Starter Tasks

### Task 1: Add Guest Count

**File hints:** `app/models/booking.rb`, `db/migrate/`, `app/views/bookings/`
**Tests:** `bin/rails test test/tasks/task1_guest_count_test.rb`

The booking form only captures date and house. Add a `number_of_guests` field.

- [ ] Create a migration adding `number_of_guests` (integer) to bookings
- [ ] Add validations: required, minimum 1, maximum 12
- [ ] Add a number input to the booking form
- [ ] Display guest count on the bookings index page
- [ ] Permit the new parameter in the controller

---

### Task 2: House Show Page

**File hints:** `config/routes.rb`, `app/controllers/`, `app/views/houses/`
**Tests:** `bin/rails test test/tasks/task2_house_show_test.rb`

House names on the bookings page link to `#`. Create a real house detail page.

- [ ] Add a route: `GET /houses/:id`
- [ ] Create `HousesController#show`
- [ ] Create a view showing house name (`<h1>`), city, and its bookings
- [ ] Update the booking partial to link to the house show page
- [ ] Handle houses with no bookings ("No bookings yet.")

---

## Intermediate Tasks

### Task 3: Fix Statistics

**File hints:** `app/controllers/statistics_controller.rb`
**Tests:** `bin/rails test test/tasks/task3_statistics_test.rb`

The statistics page shows hardcoded wrong data. Make it calculate real values.

- [ ] Calculate the most popular house (most bookings) with a database query
- [ ] Calculate the most successful year (most bookings)
- [ ] Add average bookings per house (rounded to 1 decimal)
- [ ] Handle the case where there are no bookings ("No data available")

---

### Task 4: Paginate Bookings

**File hints:** `app/controllers/bookings_controller.rb`, `app/views/bookings/index.html.erb`
**Tests:** `bin/rails test test/tasks/task4_pagination_test.rb`

60+ bookings on one page is unwieldy. Add pagination without using a gem.

- [ ] Show 10 bookings per page using `limit` and `offset`
- [ ] Add "Previous" / "Next" navigation links
- [ ] Show "Page X of Y" indicator
- [ ] Hide "Previous" on page 1, "Next" on the last page

---

### Task 5: Delete Bookings with Stimulus Confirmation

**File hints:** `app/javascript/controllers/`, `app/views/bookings/`
**Tests:** `bin/rails test test/tasks/task5_stimulus_delete_test.rb`

Add the ability to cancel bookings with a custom confirmation dialog.

- [ ] Add `destroy` action to `BookingsController`
- [ ] Add a route for `DELETE /bookings/:id`
- [ ] Add a "Cancel" button to each booking on the index
- [ ] Create a `confirm` Stimulus controller for inline confirmation (not `window.confirm`)
- [ ] Confirming deletes the booking; declining hides the prompt
- [ ] Show a flash notice after successful deletion

---

## Advanced Tasks

### Task 6: React Booking Query Form

**File hints:** `app/javascript/components/BookingForm.jsx`
**Tests:** `bin/rails test test/tasks/task6_react_query_test.rb`

The React component at `/query/new?react` is a stub. Build it out.

- [ ] Add a date input (`<input type="date">`)
- [ ] Add a "Check Availability" submit button
- [ ] POST to `/api/query` with `{ booking: { year, month, day } }`
- [ ] Display "Available!" or "Booked" based on response
- [ ] Show a loading state during the request
- [ ] Handle and display network errors

---

### Task 7: House Availability Calendar (React)

**File hints:** `app/javascript/components/AvailabilityCalendar.jsx`, `app/controllers/api/`
**Tests:** `bin/rails test test/tasks/task7_calendar_api_test.rb`

Build a visual monthly calendar on the house show page (requires Task 2).

- [ ] Create API endpoint: `GET /api/houses/:id/bookings?month=YYYY-MM`
- [ ] Build `AvailabilityCalendar` React component
- [ ] Render a month grid with Sun–Sat headers
- [ ] Highlight booked days with a distinct background color
- [ ] Add Previous / Next month navigation
- [ ] Fetch new data when navigating between months
- [ ] Mount the component on the house show page

---

## Tips

- Run all task tests: `bin/rails test test/tasks/`
- Run a single task's tests: `bin/rails test test/tasks/task1_guest_count_test.rb`
- Check progress in browser: visit `/tasks`
- The existing tests in `test/models/` should continue to pass
- Pico CSS is classless — use semantic HTML (`<table>`, `<article>`, `<nav>`) and it will look good automatically
- React components are mounted via `data-react-component` attributes — see `app/javascript/mount_react.js` for how it works
- Look at existing code for patterns before writing new code
- Feel free to ask us questions — we're here to help!

# MyJST

## Goal

- Create an all-in-one job search tracker and TODO list application

## Features

- User accounts with auth
- Job search tracker
  - Applied to, to apply, in communication with
- Status is color coded
- ToDo list

## Stack

- Rails, Vue, Postgresql, RSpec

## MyJst TODO

- [x] Setup application
- [x] Build db
- [x] Build out basic backend
- [x] Build out basic frontend
- [x] Get data from DB on frontend
- [x] Make frontned better
  - [x] header MyJST | ToDos as buttons that load each respective component
- [ ] Build out ToDo page
  - [x] Add expandable rows to show description
  - [ ] CSS
    - Dont stretch to fill whole page
- [ ] Welcome page
  - Sign In / Sign Out buttons
  - Information about what the app does
  - Video demonstration
- [ ] Improve routes on backend
  - initial visit direct to welcome page
  - if user has an account and stays signed in go directly to their page
  - otherwise welcome page
- [ ] ToDo Improvements
  - Multiple lists
  - Dropdown to change which list is shown
- [ ] Add extra items like auth
- [ ] Stretch goals

## DB Structure

User -< Jobs
User -< Tasks (ToDo items)
User:

- First name
- Last name
- email
- username
- password

Job:

- Company
- Position Title
- Status (to apply, applied to, in communication with, deadend)
- Contact
- userID

Task:

- Title
- Additional details (can be blank)
- userID

## Stretch Goals

- Mobile app/PWA

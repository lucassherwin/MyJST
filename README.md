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

- [ x ] Setup application
- [ x ] Build db
- [ x ] Build out basic backend
- [ x ] Build out basic frontend
- [ x ] Get data from DB on frontend
- [ ] Make frontned better
  - [ ] header MyJST | ToDos as buttons that load each respective component
  - [ ] welcome page
- [ ] Add extra items like auth
- protected routes
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

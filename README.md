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

- [ ] Setup application
- [ ] Build db
- [ ] Build out basic backend
- [ ] Build out basic frontend
- [ ] Get data from DB on frontend
- [ ] Make frontned better
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

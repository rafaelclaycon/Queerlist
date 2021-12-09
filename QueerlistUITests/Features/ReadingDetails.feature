Feature: Reading details

Scenario: Read a personality's details
  Given that I have opened the app
  And I see the list of personalities
  When I tap on any given personality
  Then I see the personality details
  And I see a brief description of who that person is

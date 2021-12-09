Feature: Checking spells

Scenario: Figure out what a spell does
  Given that I have opened the app
  And I see the list of spells
  When I tap on any given spell
  Then I see the spell details
  And I see a description of what that spell does

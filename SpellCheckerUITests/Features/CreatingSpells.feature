Feature: Creating spells

@createNewJinx
Scenario: Create a new jinx
  Given that I have opened the app
  And I see the list of spells
  When I tap the plus button at the top
  Then I see the New Spell screen
  And I see the new spell name field
  When I tap that field
#  Then I see the keyboard
#  And I see that the keyboard is in full text mode
  When I type "Impedimenta"
#  And I tap the next field

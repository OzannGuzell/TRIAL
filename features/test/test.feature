Feature: ActionBarTabs Feature

  Background:
    Given open the homepage

  Scenario: Add and Remove Tab(1)
    And go to action bar tab
    And clicks toggle tab mode
    And click add new tab
    When remove last tab
    Then remove all tabs

  Scenario: Change TextBox and NavigationBar Texts(2)
    And go to custom title menu
    When changing textBox fields
    Then user should see change textbox

  Scenario: Verify List Dialog Message(3)
    And go to list dialog menu
    When select random command
    Then verify select command

  Scenario: Check Menu A and Menu B(5)
    And go to context menu
    When click long press me button
    Then user should see Menu A and Menu B

  Scenario: Hide And Show(6)
    And go to hide and show menu
    When second click hide button
    Then second click show button


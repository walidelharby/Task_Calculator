# Task_Calculator
Calculator & Conventer

# Features


The application contains 2 tabs,
1) Calculator screen tab
 
i.Screen should contain:
7 buttons for (multiplication, division, addition, subtraction, equal, undo and redo).
o undo and redo buttons to be enabled only when they could execute their functions.
o Equal button to be active only when operation button ‘*, +, /, -‘ is selected and text field is
not empty.
o Selecting any operation button ‘*, +, /, -’ should deselect all of the other operations buttons.
Text field that accepts numbers only which is the second operand in all operation performed as the first operand would be the last result value that is initially equals zero.
Label to show the result of the operations.
Flow layout collection view with a cell contains only a bordered Label to show the history of the operations performed, cell should fit the label with a little padding, so cells size is not fixed.
Screen should do the following:
User should select the needed operation ‘ex: +’ then enters the second operand in the text field ‘ex: 5’ then tap on equal to perform that operation on the first operand that has initial value of zero.
Once the operation is done
o Result label should have the operation result ‘ex: 5’.
o Text field to be empty.
o Operation button to be deselected.
o Collection view to add an item of the operation done ‘ex: + 5’ in the first index.
Collection view cell selection should undo this operation, considering point 1&2 check the
below sequence example
o result = 25.
o user select ‘+ 5’ item from collection view. o result should equal 20.
Undo and Redo buttons to perform undo redo actions on the previously performed operations,
considering point 1&2 check the below sequence example
o result = 25 and last two operations in sequence were ‘+ 2’ then ‘*5’. o undo twice should make result equals 3.
o Redo should make result equals 5.
o add 3 ‘+3’ result equals 8.
o undo 4 times would make result equals 25 again.
  ii.
 2)
Currency converter screen tab
• Screen contains 3 UI elements (‘USD’ label, ‘EGP’ text field, and ‘Convert’ button).
• This screen is responsible for converting the ‘EGP’ text field value from EGP to USD.
• Once the user tapped this tab, the ‘EGP’ text field value should equal to the Calculator result.
• When the user taps the ‘Convert’ button, application should hit any currency converter API and show the USD value in the ‘USD’ label.
• If the user changed the ‘EGP’ text field value and made a successful conversion, the Calculator result should equal the new ‘EGP’ text field value. Which should act as if a new operation has been done on the calculator to reach this result. For example,
o Calculator result = 10.
o User tap converter tab where the EGP text field should contain 10.
o User modified the EGP text field value to 20.
o User tapped convert button and conversion has been done successfully.
o User tap calculator tab, result should = 20 as if an operation “*2” has been performed implicitly and it should be shown in the collection view.



# Run Requirements
Version 13.2.1 (13C100)
Swift 5

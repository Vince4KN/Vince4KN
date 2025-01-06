
Sub CopyValuesFromThreeSheets()

  Dim srcWorkbook As Workbook
  Dim destWorkbook As Workbook
  Dim srcWorksheet1 As Worksheet, srcWorksheet2 As Worksheet, srcWorksheet3 As Worksheet
  Dim destWorksheet1 As Worksheet, destWorksheet2 As Worksheet, destWorksheet3 As Worksheet
  Dim srcRange As Range
  Dim destRange As Range
  Dim destWorkbookPath As String

  ' Set the source workbook (ThisWorkbook assumes the code is in the source workbook)
  Set srcWorkbook = ThisWorkbook

  ' Define source worksheet names
  Dim srcSheet1Name As String, srcSheet2Name As String, srcSheet3Name As String
  srcSheet1Name = "detailsOfTheSku"  ' Replace with your actual source sheet 1 name
  srcSheet2Name = "orderDetails"  ' Replace with your actual source sheet 2 name
  srcSheet3Name = "Supplier"  ' Replace with your actual source sheet 3 name

  ' Set the destination workbook path
  destWorkbookPath = "C:\Users\Vince.Ambrose\OneDrive - Kuehne+Nagel\Documents\USLCZ01 Automation Testing Files\ORDER BUILDER\InbData.xlsx"  ' Change to your destination workbook path (if needed)

  ' Open the destination workbook
  Set destWorkbook = Workbooks.Open(destWorkbookPath)

  ' Define destination worksheet names
  Dim destSheet1Name As String, destSheet2Name As String, destSheet3Name As String
  destSheet1Name = "detailsOfTheSku"  ' Replace with your actual destination sheet 1 name
  destSheet2Name = "orderDetails"  ' Replace with your actual destination sheet 2 name
  destSheet3Name = "Supplier"  ' Replace with your actual destination sheet 3 name

  ' Set source ranges (adjust as needed)
  Set srcRange = srcWorkbook.Sheets("detailsOfTheSku").Range("A2:O11")  ' Replace with your actual source range for sheet 1
  
  ' Copy and paste to the first sheet
  Set destWorksheet1 = destWorkbook.Sheets("detailsOfTheSku")
  Set destRange = destWorksheet1.Range("A2")  ' Change to your destination start cell (adjust if needed)
  srcRange.Copy
  destRange.PasteSpecial Paste:=xlPasteValues

  ' Set source range for sheet 2 (adjust as needed)
  Set srcRange = srcWorkbook.Sheets("orderDetails").Range("A2:D2")  ' Replace with your actual source range for sheet 2

  ' Copy and paste to the second sheet
  Set destWorksheet2 = destWorkbook.Sheets("orderDetails")
  Set destRange = destWorksheet2.Range("A2")  ' Change to your destination start cell (adjust if needed)
  srcRange.Copy
  destRange.PasteSpecial Paste:=xlPasteValues

  ' Set source range for sheet 3 (adjust as needed)
  Set srcRange = srcWorkbook.Sheets(srcSheet3Name).Range("A2:F2")  ' Replace with your actual source range for sheet 3

  ' Copy and paste to the third sheet
  Set destWorksheet3 = destWorkbook.Sheets(destSheet3Name)
  Set destRange = destWorksheet3.Range("A2")  ' Change to your destination start cell (adjust if needed)
  srcRange.Copy
  destRange.PasteSpecial Paste:=xlPasteValues

  ' Save and close the destination workbook
  destWorkbook.Save
  destWorkbook.Close

  ' Optional: clear the clipboard
  Application.CutCopyMode = False

End Sub

Private Sub Worksheet_SelectionChange(ByVal Target As Range)

End Sub

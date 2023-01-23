Attribute VB_Name = "Module1"
Sub stocks()

     For Each ws In Worksheets
    
        Dim WorksheetName As String
        Dim LastRow As Long
        Dim Ticker As Long
        Ticker = 2
        
        ws.Cells(1, 9).Value = "Ticker"
        ws.Cells(1, 10).Value = "Yearly Change"
        ws.Cells(1, 11).Value = "Percent Change"
        ws.Cells(1, 12).Value = "Total Stock Volume"
        
        ws.Cells(2, 15).Value = "Greatest % Increase"
        ws.Cells(3, 15).Value = "Greatest % Decrease"
        ws.Cells(4, 15).Value = "Greatest Total Volume"
        ws.Cells(1, 16).Value = "Ticker"
        ws.Cells(1, 17).Value = "Value"

        WorksheetName = ws.Name
        LastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row
        
        
        j = 2
        For i = 2 To LastRow
        
            If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
                
                ws.Cells(Ticker, 9).Value = ws.Cells(i, 1).Value
                ws.Cells(Ticker, 10).Value = ws.Cells(i, 6).Value - ws.Cells(j, 3).Value
                
                    If ws.Cells(Ticker, 10).Value > 0 Then
                
                        ws.Cells(Ticker, 10).Interior.ColorIndex = 4
                
                    Else
                
                        ws.Cells(Ticker, 10).Interior.ColorIndex = 3
                
                    End If
                    
                    If ws.Cells(j, 3).Value <> 0 Then
                        Change = ((ws.Cells(i, 6).Value - ws.Cells(j, 3).Value) / ws.Cells(j, 3).Value)
                    
                        ws.Cells(Ticker, 11).Value = Format(Change, "Percent")
                    
                    Else
                    
                        ws.Cells(Ticker, 11).Value = Format(0, "Percent")
                    
                    End If
                    
                ws.Cells(Ticker, 12).Value = WorksheetFunction.Sum(Range(ws.Cells(j, 7), ws.Cells(i, 7)))
                
                
                Ticker = Ticker + 1
                j = i + 1
                
                End If
        
        Next i
        
    Next ws

End Sub

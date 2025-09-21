import gintro/[gtk, gobject]
import strutils

proc onClick(btn: Button, entry1, entry2: Entry, op: ComboBoxText, result: Label) =
  let a = parseFloat(entry1.text)
  let b = parseFloat(entry2.text)
  var r: float
  case op.activeText
  of "+": r = a + b
  of "-": r = a - b
  of "*": r = a * b
  of "/": r = if b == 0: 0 else: a / b
  else: discard
  result.setText("Hasil: " & $r)

proc main =
  gtk.init()
  let win = newApplicationWindow()
  win.title = "Kalkulator Nim"
  win.setDefaultSize(250, 150)

  let grid = newGrid()
  let e1 = newEntry()
  let e2 = newEntry()
  let combo = newComboBoxText()
  for op in ["+", "-", "*", "/"]: combo.appendText(op)
  combo.setActive(0)
  let btn = newButton("Hitung")
  let lbl = newLabel("Hasil: ")

  grid.attach(e1, 0,0,2,1)
  grid.attach(e2, 0,1,2,1)
  grid.attach(combo, 0,2,2,1)
  grid.attach(btn, 0,3,2,1)
  grid.attach(lbl, 0,4,2,1)

  btn.connect("clicked", onClick, e1, e2, combo, lbl)
  win.add(grid)
  win.showAll()
  gtk.main()

main()

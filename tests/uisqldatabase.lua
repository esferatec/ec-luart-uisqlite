local ui = require("ui")
local sql = require("sqlite")

local uisql = require("ecluart.uisqldatabase")

local db = sql.Database("tests\\northwind.db")
local tbl = ""

local win = ui.Window("UI SQL Database", "fixed", 560, 500)
win.fontsize = 10

ui.Label(win, "Strcuture Tree:", 10, 10)
local sqllist = uisql.StructureTree(win, db, 10, 30, 250, 450)

ui.Label(win, "Column Type List:", 300, 10)
local collist = uisql.ColumnTypeList(win, 300, 30, 250, 200)

ui.Label(win, "Schema Type List:", 300, 250)
local schlist = uisql.SchemaTypeList(win, 300, 270, 250, 200)

ui.run(win):wait()

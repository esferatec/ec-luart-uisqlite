local ui = require("ui")
local sql = require("sqlite")

local uisql = require("ecluart.uisqltrigger")

local db = sql.Database("tests\\northwind.db")
local tbl = ""

local win = ui.Window("UI SQL Trigger", "fixed", 560, 500)
win.fontsize = 10

ui.Label(win, "Trigger List:", 10, 10)
local sqllist = uisql.TriggerList(win, db, 10, 30, 250, 200)
sqllist.selected = sqllist.items[1]
tbl = sqllist.items[1].text

ui.Label(win, "Trigger Statement Edit:", 10, 250)
local sqledit = uisql.TriggerStatementEdit(win, db, tbl, 10, 270, 540, 210)

function sqllist:onSelect(item)
	sqledit:update(db, item.text)
end

ui.run(win):wait()

local ui = require("ui")
local sql = require("sqlite")

local uisql = require("ecluart.uisqlview")

local db = sql.Database("tests\\northwind.db")
local tbl = ""

local win = ui.Window("UI SQL View", "fixed", 560, 500)
win.fontsize = 10

ui.Label(win, "View List:", 10, 10)
local sqllist = uisql.ViewList(win, db, 10, 30, 250, 200)
sqllist.selected = sqllist.items[1]
tbl = sqllist.items[1].text

ui.Label(win, "View Column List:", 300, 10)
local collist = uisql.ViewColumnList(win, db, tbl, 300, 30, 250, 200)

ui.Label(win, "View Statement Edit:", 10, 250)
local sqledit = uisql.ViewStatementEdit(win, db, tbl, 10, 270, 540, 210)

function sqllist:onSelect(item)
	collist:update(db, item.text)
	sqledit:update(db, item.text)
end

ui.run(win):wait()

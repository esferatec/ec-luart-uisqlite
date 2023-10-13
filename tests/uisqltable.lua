local ui = require("ui")
local sql = require("sqlite")

local uisql = require("ecluart.uisqltable")

local db = sql.Database("tests\\northwind.db")
local tbl = ""

local win = ui.Window("UI SQL Table", "fixed", 560, 500)
win.fontsize = 10

ui.Label(win, "Table List:", 10, 10)
local sqllist = uisql.TableList(win, db, 10, 30, 250, 200)
sqllist.selected = sqllist.items[1]
tbl = sqllist.items[1].text

ui.Label(win, "Table Column List:", 300, 10)
local collist = uisql.TableColumnList(win, db, tbl, 300, 30, 250, 200)

ui.Label(win, "Table Statement Edit:", 10, 250)
local sqledit = uisql.TableStatementEdit(win, db, tbl, 10, 270, 540, 210)

function sqllist:onSelect(item)
	collist:update(db, item.text)
	sqledit:update(db, item.text)
end

ui.run(win):wait()
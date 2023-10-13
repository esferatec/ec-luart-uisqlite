local ui = require("ui")
local sql = require("sqlite")

local uisqld = require("uit.uisqldatabase")
local uisqlt = require("uit.uisqltable")
local uisqli = require("uit.uisqlindex")
local uisqlv = require("uit.uisqlview")
local uisqlg = require("uit.uisqltrigger")

local db = sql.Database("examples\\northwind.db")

local win = ui.Window("SqliteDatabaseViewer", "fixed", 680, 670)
win.fontsize = 10

ui.Label(win, "Structure Tree:", 10, 10)
local dtree = uisqld.StructureTree(win, db, 10, 30, 200, 200)

ui.Label(win, "Table List:", 240, 10)
local tblist = uisqlt.TableList(win, db, 240, 30, 200, 200)

ui.Label(win, "Table Combobox:", 470, 10)
local tbcombobox = uisqlt.TableCombobox(win, db, 470, 30, 200, 200)

ui.Label(win, "Schema Type List:", 10, 250)
local tcllist = uisqld.SchemaTypeList(win, 10, 270, 200, 200)

ui.Label(win, "Table Column List:", 240, 250)
local tcllist = uisqlt.TableColumnList(win, db, "Customers", 240, 270, 200, 200)

ui.Label(win, "Table Column Combobox:", 470, 250)
local tccombobox = uisqlt.TableColumnCombobox(win, db, "Customers", 470, 270, 200, 200)

ui.Label(win, "Column Type Combobox:", 470, 310)
local ctcombobox = uisqld.ColumnTypeCombobox(win, 470, 330, 200, 200)

ui.Label(win, "Trigger Statement Edit:", 10, 490)
--local tsqledit = uisqlg.TriggerStatementEdit(win, db, "validate_email_before_insert_leads", 10, 510, 660, 140)
local tsqledit = uisqlt.TableStatementEdit(win, db, "Categories", 10, 510, 660, 140)

--ui.Label(win, "Column Type List:", 240, 490)
--local ctlist = uisqld.ColumnTypeList(win, 240, 510, 200, 140)

win:show()

function dtree:onSelect(item)
if type(item.parent) == "TreeItem" then
	ui.info("Welcome "..item.parent.text.." !")	
end


end

while win.visible do
	ui.update()
end
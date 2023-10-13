local ui = require("ui")
local sqlcommand = require("ecluart.sqlcommand")
local uisqlite = require("ecluart.uisqlite")

local uisqltable = {}

-- Creates a new table combobox object.
local TableCombobox = Object(ui.Combobox)

-- Overrides the default combobox constructor.
function TableCombobox:constructor(parent, database, ...)
  super(self).constructor(self, parent, {}, ...)
  self:update(database)
end

-- Updates the tabel combobox items.
function TableCombobox:update(database)
  self.items = sqlcommand.getAllTables(database)
end

-- Initializes a new table combobox instance.
function uisqltable.TableCombobox(parent, database, ...)
  return TableCombobox(parent, database, ...)
end

-- Creates a new table list object.
local TableList = Object(ui.List)

-- Overrides the default list constructor.
function TableList:constructor(parent, database, ...)
  super(self).constructor(self, parent, {}, ...)
  self:update(database)
end

-- Updates the table list items.
function TableList:update(database)
  self.items = sqlcommand.getAllTables(database)
end

-- Initializes a new table list instance.
function uisqltable.TableList(parent, database, ...)
  return TableList(parent, database, ...)
end

-- Creates a new table statement edit object.
local TableStatementEdit = Object(uisqlite.BaseSqlEdit)

-- Overrides the default edit constructor.
function TableStatementEdit:constructor(parent, database, table, ...)
  super(self).constructor(self, parent, "", ...)
  self:update(database, table)
end

-- Updates the table statement edit text.
function TableStatementEdit:update(database, table)
  self.text = sqlcommand.getTableStatement(database, table)
  self.caret = 1
end

-- Initializes a new table statement edit instance.
function uisqltable.TableStatementEdit(parent, database, table, ...)
  return TableStatementEdit(parent, database, table, ...)
end

-- Creates a new table column list object.
local TableColumnList = Object(ui.List)

-- Overrides the default list constructor.
function TableColumnList:constructor(parent, database, table, ...)
  super(self).constructor(self, parent, {}, ...)
  self:update(database, table)
end

-- Updates the table column list items.
function TableColumnList:update(database, table)
  self.items = sqlcommand.getAllTableColumns(database, table)
end

-- Initializes a new table column list instance.
function uisqltable.TableColumnList(parent, database, table, ...)
  return TableColumnList(parent, database, table, ...)
end

-- Creates a new table column combobox object.
local TableColumnCombobox = Object(ui.Combobox)

-- Overrides the default combobox constructor.
function TableColumnCombobox:constructor(parent, database, table, ...)
  super(self).constructor(self, parent, {}, ...)
  self:update(database, table)
end

-- Updates the table column combobox items.
function TableColumnCombobox:update(database, table)
  self.items = sqlcommand.getAllTableColumns(database, table)
end

-- Initializes a new table column combobox instance.
function uisqltable.TableColumnCombobox(parent, database, table, ...)
  return TableColumnCombobox(parent, database, table, ...)
end

return uisqltable

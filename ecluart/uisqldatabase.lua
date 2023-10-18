local ui = require("ui")
local sqlcommand = require("ecluart.sqlcommand")

local uisqldatabase = {}

-- Creates a new schema type list object.
local SchemaTypeList = Object(ui.List)

-- Overrides the default list constructor.
function SchemaTypeList:constructor(parent, ...)
  super(self).constructor(self, parent, {}, ...)
  self.items = sqlcommand.getAllSchemaTypes()
end

-- Initializes a new schema type list instance.
function uisqldatabase.SchemaTypeList(parent, ...)
  return SchemaTypeList(parent, ...)
end

-- Creates a new schema type combobox object.
local SchemaTypeCombobox = Object(ui.Combobox)

-- Overrides the default combobox constructor.
function SchemaTypeCombobox:constructor(parent, ...)
  super(self).constructor(self, parent, {}, ...)
  self.items = sqlcommand.getAllSchemaTypes()
end

-- Initializes a new schema column combobox instance.
function uisqldatabase.SchemaTypeCombobox(parent, ...)
  return SchemaTypeCombobox(parent, ...)
end

-- Creates a new column type list object.
local ColumnTypeList = Object(ui.List)

-- Overrides the default list constructor.
function ColumnTypeList:constructor(parent, ...)
  super(self).constructor(self, parent, {}, ...)
  self.items = sqlcommand.getAllColumnTypes()
end

-- Initializes a new column type list instance.
function uisqldatabase.ColumnTypeList(parent, ...)
  return ColumnTypeList(parent, ...)
end

-- Creates a new column type combobox object.
local ColumnTypeCombobox = Object(ui.Combobox)

-- Overrides the default combobox constructor.
function ColumnTypeCombobox:constructor(parent, ...)
  super(self).constructor(self, parent, {}, ...)
  self.items = sqlcommand.getAllColumnTypes()
end

-- Initializes a new column type combobox instance.
function uisqldatabase.ColumnTypeCombobox(parent, ...)
  return ColumnTypeCombobox(parent, ...)
end

-- Creates a new strcuture tree object.
local StructureTree = Object(ui.Tree)

-- Overrides the default tree constructor.
function StructureTree:constructor(parent, database, ...)
  super(self).constructor(self, parent, {}, ...)
  self.tables = "Tables"
  self.indexes = "Indexes"
  self.views = "Views"
  self.triggers = "Trigger"
  self:update(database)
end

-- Updates the strcuture tree items.
function StructureTree:update(database)
  local header = ""

  header = self:add(self.tables .. " (" .. sqlcommand.countAllTables(database) .. ")")
  header.subitems = sqlcommand.getAllTables(database)

  header = self:add(self.indexes .. " (" .. sqlcommand.countAllIndexes(database) .. ")")
  header.subitems = sqlcommand.getAllIndexes(database)

  header = self:add(self.views .. " (" .. sqlcommand.countAllViews(database) .. ")")
  header.subitems = sqlcommand.getAllViews(database)

  header = self:add(self.triggers .. " (" .. sqlcommand.countAllTriggers(database) .. ")")
  header.subitems = sqlcommand.getAllTriggers(database)
end

-- Initializes a new structure tree instance.
function uisqldatabase.StructureTree(parent, database, ...)
  return StructureTree(parent, database, ...)
end

return uisqldatabase

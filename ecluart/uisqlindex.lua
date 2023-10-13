local ui = require("ui")
local sqlcommand = require("ecluart.sqlcommand")
local uisqlite = require("ecluart.uisqlite")

local uisqlindex = {}

-- Creates a new index combobox object.
local IndexCombobox = Object(ui.Combobox)

-- Overrides the default combobox constructor.
function IndexCombobox:constructor(parent, database, ...)
    super(self).constructor(self, parent, {}, ...)
    self:update(database)
end

-- Updates the index combobox items.
function IndexCombobox:update(database)
    self.items = sqlcommand.getAllIndices(database)
end

-- Initializes a new index combobox instance.
function uisqlindex.IndexCombobox(parent, database, ...)
    return IndexCombobox(parent, database, ...)
end

-- Creates a new index list object.
local IndexList = Object(ui.List)

-- Overrides the default list constructor.
function IndexList:constructor(parent, database, ...)
    super(self).constructor(self, parent, {}, ...)
    self:update(database)
end

-- Updates the index list items.
function IndexList:update(database)
    self.items = sqlcommand.getAllIndices(database)
end

-- Initializes a new index list instance.
function uisqlindex.IndexList(parent, database, ...)
    return IndexList(parent, database, ...)
end

-- Creates a new index column list object.
local IndexColumnList = Object(ui.List)

-- Overrides the default list constructor.
function IndexColumnList:constructor(parent, database, table, ...)
    super(self).constructor(self, parent, {}, ...)
    self:update(database, table)
end

-- Updates the index column list items.
function IndexColumnList:update(database, table)
    self.items = sqlcommand.getAllIndexColumns(database, table)
end

-- Initializes a new index column list instance.
function uisqlindex.IndexColumnList(parent, database, table, ...)
    return IndexColumnList(parent, database, table, ...)
end

-- Creates a new index column combobox object.
local IndexColumnCombobox = Object(ui.Combobox)

-- Overrides the default combobox constructor.
function IndexColumnCombobox:constructor(parent, database, table, ...)
    super(self).constructor(self, parent, {}, ...)
    self:update(database, table)
end

-- Updates the index column combobox items.
function IndexColumnCombobox:update(database, table)
    self.items = sqlcommand.getAllIndexColumns(database, table)
end

-- Initializes a new index column combobox instance.
function uisqlindex.IndexColumnCombobox(parent, database, table, ...)
    return IndexColumnCombobox(parent, database, table, ...)
end

-- Creates a new index statement edit object.
local IndexStatementEdit = Object(uisqlite.BaseSqlEdit)

-- Overrides the default edit constructor.
function IndexStatementEdit:constructor(parent, database, index, ...)
    super(self).constructor(self, parent, "", ...)
    self:update(database, index)
end

-- Updates the index statement edit text.
function IndexStatementEdit:update(database, index)
    self.text = sqlcommand.getIndexStatement(database, index)
    self.caret = 1
end

-- Initializes a new index statement edit instance.
function uisqlindex.IndexStatementEdit(parent, database, index, ...)
    return IndexStatementEdit(parent, database, index, ...)
end

return uisqlindex

local ui = require("ui")
local sqlcommand = require("ecluart.sqlcommand")
local uisqlite = require("ecluart.uisqlite")

local uisqlview = {}

-- Creates a new view combobox object.
local ViewCombobox = Object(ui.Combobox)

-- Overrides the default combobox constructor.
function ViewCombobox:constructor(parent, database, ...)
    super(self).constructor(self, parent, {}, ...)
    self:update(database)
end

-- Updates the view combobox items.
function ViewCombobox:update(database)
    self.items = sqlcommand.getAllViews(database)
end

-- Initializes a new view combobox instance.
function uisqlview.ViewCombobox(parent, database, ...)
    return ViewCombobox(parent, database, ...)
end

-- Creates a new view list object.
local ViewList = Object(ui.List)

-- Overrides the default list constructor.
function ViewList:constructor(parent, database, ...)
    super(self).constructor(self, parent, {}, ...)
    self:update(database)
end

-- Updates the view list items.
function ViewList:update(database)
    self.items = sqlcommand.getAllViews(database)
end

-- Initializes a new view list instance.
function uisqlview.ViewList(parent, database, ...)
    return ViewList(parent, database, ...)
end

-- Creates a new view column list object.
local ViewColumnList = Object(ui.List)

-- Overrides the default list constructor.
function ViewColumnList:constructor(parent, database, table, ...)
    super(self).constructor(self, parent, {}, ...)
    self:update(database, table)
end

-- Updates the view column list items.
function ViewColumnList:update(database, table)
    self.items = sqlcommand.getAllViewColumns(database, table)
end

-- Initializes a new view column list instance.
function uisqlview.ViewColumnList(parent, database, table, ...)
    return ViewColumnList(parent, database, table, ...)
end

-- Creates a new view column combobox object.
local ViewColumnCombobox = Object(ui.Combobox)

-- Overrides the defaultcombobox constructor.
function ViewColumnCombobox:constructor(parent, database, table, ...)
    super(self).constructor(self, parent, {}, ...)
    self:update(database, table)
end

-- Updates the view column combobox items.
function ViewColumnCombobox:update(database, table)
    self.items = sqlcommand.getAllViewColumns(database, table)
end

-- Initializes a new view column combobox instance.
function uisqlview.ViewColumnCombobox(parent, database, table, ...)
    return ViewColumnCombobox(parent, database, table, ...)
end

-- Creates a new view statement edit object.
local ViewStatementEdit = Object(uisqlite.BaseSqlEdit)

-- Overrides the default edit constructor.
function ViewStatementEdit:constructor(parent, database, view, ...)
    super(self).constructor(self, parent, "", ...)
    self:update(database, view)
end

-- Updates the view statement edit text.
function ViewStatementEdit:update(database, view)
    self.text = sqlcommand.getViewStatement(database, view)
    self.caret = 1
end

-- Initializes a new view statement edit instance.
function uisqlview.ViewStatementEdit(parent, database, view, ...)
    return ViewStatementEdit(parent, database, view, ...)
end

return uisqlview

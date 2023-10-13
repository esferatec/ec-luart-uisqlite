local ui = require("ui")
local sqlcommand = require("ecluart.sqlcommand")
local uisqlite = require("ecluart.uisqlite")

local uisqltrigger = {}

-- Creates a new trigger combobox object.
local TriggerCombobox = Object(ui.Combobox)

-- Overrides the default combobox constructor.
function TriggerCombobox:constructor(parent, database, ...)
    super(self).constructor(self, parent, {}, ...)
    self:update(database)
end

-- Updates the trigger combobox items.
function TriggerCombobox:update(database)
    self.items = sqlcommand.getAllTriggers(database)
end

-- Initializes a new trigger combobox instance.
function uisqltrigger.TriggerCombobox(parent, database, ...)
    return TriggerCombobox(parent, database, ...)
end

-- Creates a new trigger list object.
local TriggerList = Object(ui.List)

-- Overrides the default list constructor.
function TriggerList:constructor(parent, database, ...)
    super(self).constructor(self, parent, {}, ...)
    self:update(database)
end

-- Updates the trigger list items.
function TriggerList:update(database)
    self.items = sqlcommand.getAllTriggers(database)
end

-- Initializes a new trigger list instance.
function uisqltrigger.TriggerList(parent, database, ...)
    return TriggerList(parent, database, ...)
end

-- Creates a new trigger statement edit object.
local TriggerStatementEdit = Object(uisqlite.BaseSqlEdit)

-- Overrides the default edit constructor.
function TriggerStatementEdit:constructor(parent, database, trigger, ...)
    super(self).constructor(self, parent, "", ...)
    self:update(database, trigger)
end

-- Updates the trigger statement edit text.
function TriggerStatementEdit:update(database, trigger)
    self.text = sqlcommand.getTriggerStatement(database, trigger)
    self.caret = 1
end

-- Initializes a new trigger statement edit instance.
function uisqltrigger.TriggerStatementEdit(parent, database, trigger, ...)
    return TriggerStatementEdit(parent, database, trigger, ...)
end

return uisqltrigger

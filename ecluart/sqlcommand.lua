local db = require("sqlite")

local sqlcommand = {}

-- Defines specific error massages.
local ERRORMESSAGE = {
  notdatabase = "Parameter must be database: ",
  notstring = "Parameter must be string: "
}

-- Checks if the parameter is a database type.
local function isDatabase(parameter)
  return type(parameter) == "Database"
end

-- Checks if the parameter is a string type.
local function isString(parameter)
  return type(parameter) == "string"
end

--#region get functions

-- Gets all tables of the database.
function sqlcommand.getAllTables(source)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")

  local allNames = {}

  for currentTable in source:query("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%' ORDER BY name;") do
    table.insert(allNames, currentTable.name)
  end

  return allNames
end

-- Gets all views of the database.
function sqlcommand.getAllViews(source)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")

  local allNames = {}

  for currentTable in source:query("SELECT name FROM sqlite_master WHERE type='view' AND name NOT LIKE 'sqlite_%' ORDER BY name;") do
    table.insert(allNames, currentTable.name)
  end

  return allNames
end

-- Gets all indices of the database.
function sqlcommand.getAllIndices(source)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")

  local allNames = {}

  for currentTable in source:query("SELECT name FROM sqlite_master WHERE type='index' AND name NOT LIKE 'sqlite_%' ORDER BY name;") do
    table.insert(allNames, currentTable.name)
  end

  return allNames
end

-- Gets all triggers of the database.
function sqlcommand.getAllTriggers(source)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")

  local allNames = {}

  for currentTrigger in source:query("SELECT name FROM sqlite_master WHERE type='trigger' AND name NOT LIKE 'sqlite_%' ORDER BY name;") do
    table.insert(allNames, currentTrigger.name)
  end

  return allNames
end

-- Gets all columns of a table.
function sqlcommand.getAllTableColumns(source, name)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")
  assert(isString(name), ERRORMESSAGE.notstring .. "name")

  local allNames = {}

  for currentColumn in source:query("PRAGMA table_info('" .. name .. "');") do
    table.insert(allNames, currentColumn.name)
  end

  return allNames
end

-- Gets all columns of a view.
function sqlcommand.getAllViewColumns(source, name)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")
  assert(isString(name), ERRORMESSAGE.notstring .. "name")

  local allNames = {}

  for currentColumn in source:query("PRAGMA table_info('" .. name .. "')") do
    table.insert(allNames, currentColumn.name)
  end

  return allNames
end

-- Gets all columns of an index.
function sqlcommand.getAllIndexColumns(source, name)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")
  assert(isString(name), ERRORMESSAGE.notstring .. "name")

  local allNames = {}

  for currentColumn in source:query("PRAGMA index_info('" .. name .. "');") do
    table.insert(allNames, currentColumn.name)
  end

  return allNames
end

-- Gets all schema types.
function sqlcommand.getAllSchemaTypes()
  return { "table", "view", "index", "trigger" }
end

-- Gets all column types.
function sqlcommand.getAllColumnTypes()
  return { "TEXT", "INTEGER", "REAL", "NUMBERIC", "BLOB" }
end

-- Gets the sql statment of a table.
function sqlcommand.getTableStatement(source, name)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")
  assert(isString(name), ERRORMESSAGE.notstring .. "name")

  local currentStatment = source:exec("SELECT sql FROM sqlite_master WHERE type='table' AND name='" .. name .. "';")

  return currentStatment and currentStatment.sql or ""
end

-- Gets the sql statment of a view.
function sqlcommand.getViewStatement(source, name)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")
  assert(isString(name), ERRORMESSAGE.notstring .. "name")

  local currentStatment = source:exec("SELECT sql FROM sqlite_master WHERE type='view' AND name='" .. name .. "';")

  return currentStatment and currentStatment.sql or ""
end

-- Gets the sql statment of a index.
function sqlcommand.getIndexStatement(source, name)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")
  assert(isString(name), ERRORMESSAGE.notstring .. "name")

  local currentStatment = source:exec("SELECT sql FROM sqlite_master WHERE type='index' AND name='" .. name .. "';")

  return currentStatment and currentStatment.sql or ""
end

-- Gets the sql statment of a trigger.
function sqlcommand.getTriggerStatement(source, name)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")
  assert(isString(name), ERRORMESSAGE.notstring .. "name")

  local currentStatment = source:exec("SELECT sql FROM sqlite_master WHERE type='trigger' AND name='" .. name .. "';")

  return currentStatment and currentStatment.sql or ""
end

--#endregion

--#region count functions

-- Counts alle tables of the database.
function sqlcommand.countAllTables(source)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")
  local totalTables = source:exec("SELECT count(*) FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';")
  return totalTables["count(*)"]
end

-- Counts alle views of the database.
function sqlcommand.countAllViews(source)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")
  local totalViews = source:exec("SELECT count(*) FROM sqlite_master WHERE type='view' AND name NOT LIKE 'sqlite_%';")
  return totalViews["count(*)"]
end

-- Counts alle indices of the database.
function sqlcommand.countAllIndices(source)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")
  local totalIndices = source:exec("SELECT count(*) FROM sqlite_master WHERE type='index' AND name NOT LIKE 'sqlite_%';")
  return totalIndices["count(*)"]
end

-- Counts alle triggers of the database.
function sqlcommand.countAllTriggers(source)
  assert(isDatabase(source), ERRORMESSAGE.notdatabase .. "source")
  local totalTriggers = source:exec(
    "SELECT count(*) FROM sqlite_master WHERE type='trigger' AND name NOT LIKE 'sqlite_%';")
  return totalTriggers["count(*)"]
end

--#endregion

return sqlcommand

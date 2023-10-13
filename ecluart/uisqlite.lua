local ui = require("ui")

local uisqlite = {}

-- Creates a new sql syntax edit object.
local BaseSqlEdit = Object(ui.Edit)

-- Overrides the default edit constructor.
function BaseSqlEdit:constructor(...)
    super(self).constructor(self, ...)

    self.kwcolor = 0x1570CB
    self.kwlist = {
        ["ABORT"] = true,
        ["ACTION"] = true,
        ["ADD"] = true,
        ["AFTER"] = true,
        ["ALL"] = true,
        ["ALTER"] = true,
        ["ALWAYS"] = true,
        ["ANALYZE"] = true,
        ["AND"] = true,
        ["AS"] = true,
        ["ASC"] = true,
        ["ATTACH"] = true,
        ["AUTOINCREMENT"] = true,
        ["BEFORE"] = true,
        ["BEGIN"] = true,
        ["BETWEEN"] = true,
        ["BY"] = true,
        ["CASCADE"] = true,
        ["CASE"] = true,
        ["CAST"] = true,
        ["CHECK"] = true,
        ["COLLATE"] = true,
        ["COLUMN"] = true,
        ["COMMIT"] = true,
        ["CONFLICT"] = true,
        ["CONSTRAINT"] = true,
        ["CREATE"] = true,
        ["CROSS"] = true,
        ["CURRENT"] = true,
        ["CURRENT_DATE"] = true,
        ["CURRENT_TIME"] = true,
        ["CURRENT_TIMESTAMP"] = true,
        ["DATABASE"] = true,
        ["DEFAULT"] = true,
        ["DEFERRABLE"] = true,
        ["DEFERRED"] = true,
        ["DELETE"] = true,
        ["DESC"] = true,
        ["DETACH"] = true,
        ["DISTINCT"] = true,
        ["DO"] = true,
        ["DROP"] = true,
        ["EACH"] = true,
        ["ELSE"] = true,
        ["END"] = true,
        ["ESCAPE"] = true,
        ["EXCEPT"] = true,
        ["EXCLUDE"] = true,
        ["EXCLUSIVE"] = true,
        ["EXISTS"] = true,
        ["EXPLAIN"] = true,
        ["FAIL"] = true,
        ["FILTER"] = true,
        ["FIRST"] = true,
        ["FOLLOWING"] = true,
        ["FOR"] = true,
        ["FOREIGN"] = true,
        ["FROM"] = true,
        ["FULL"] = true,
        ["GENERATED"] = true,
        ["GLOB"] = true,
        ["GROUP"] = true,
        ["GROUPS"] = true,
        ["HAVING"] = true,
        ["IF"] = true,
        ["IGNORE"] = true,
        ["IMMEDIATE"] = true,
        ["IN"] = true,
        ["INDEX"] = true,
        ["INDEXED"] = true,
        ["INITIALLY"] = true,
        ["INNER"] = true,
        ["INSERT"] = true,
        ["INSTEAD"] = true,
        ["INTERSECT"] = true,
        ["INTO"] = true,
        ["IS"] = true,
        ["ISNULL"] = true,
        ["JOIN"] = true,
        ["KEY"] = true,
        ["LAST"] = true,
        ["LEFT"] = true,
        ["LIKE"] = true,
        ["LIMIT"] = true,
        ["MATCH"] = true,
        ["MATERIALIZED"] = true,
        ["NATURAL"] = true,
        ["NO"] = true,
        ["NOT"] = true,
        ["NOTHING"] = true,
        ["NOTNULL"] = true,
        ["NULL"] = true,
        ["NULLS"] = true,
        ["OF"] = true,
        ["OFFSET"] = true,
        ["ON"] = true,
        ["OR"] = true,
        ["ORDER"] = true,
        ["OTHERS"] = true,
        ["OUTER"] = true,
        ["OVER"] = true,
        ["PARTITION"] = true,
        ["PLAN"] = true,
        ["PRAGMA"] = true,
        ["PRECEDING"] = true,
        ["PRIMARY"] = true,
        ["QUERY"] = true,
        ["RAISE"] = true,
        ["RANGE"] = true,
        ["RECURSIVE"] = true,
        ["REFERENCES"] = true,
        ["REGEXP"] = true,
        ["REINDEX"] = true,
        ["RELEASE"] = true,
        ["RENAME"] = true,
        ["REPLACE"] = true,
        ["RESTRICT"] = true,
        ["RETURNING"] = true,
        ["RIGHT"] = true,
        ["ROLLBACK"] = true,
        ["ROW"] = true,
        ["ROWS"] = true,
        ["SAVEPOINT"] = true,
        ["SELECT"] = true,
        ["SET"] = true,
        ["TABLE"] = true,
        ["TEMP"] = true,
        ["TEMPORARY"] = true,
        ["THEN"] = true,
        ["TIES"] = true,
        ["TO"] = true,
        ["TRANSACTION"] = true,
        ["TRIGGER"] = true,
        ["UNBOUNDED"] = true,
        ["UNION"] = true,
        ["UNIQUE"] = true,
        ["UPDATE"] = true,
        ["USING"] = true,
        ["VACUUM"] = true,
        ["VALUES"] = true,
        ["VIEW"] = true,
        ["VIRTUAL"] = true,
        ["WHEN"] = true,
        ["WHERE"] = true,
        ["WINDOW"] = true,
        ["WITH"] = true,
        ["WITHOUT"] = true
    }
end

-- Overrides the default edit event.
function BaseSqlEdit:onChange()
    self.selection.visible = false
    local from = self.selection.from
    local to = self.selection.to

    self.selection.from = 1
    self.selection.to = 0
    self.selection.fgcolor = 0x000000

    local start = 1
    local text = self.text:gsub("\r\n", "\n")

    while start < string.len(text) do
        local s, e = text:find("%u+", start)
        if s ~= nil then
            local word = text:sub(s, e)
            start = e + 1
            if self.kwlist[word] ~= nil then
                self.selection.from = s
                self.selection.to = start
                self.selection.fgcolor = self.kwcolor
            end
        else
            break;
        end
    end

    self.selection.from = from
    self.selection.to = to
    self.selection.visible = true
end

-- Initializes a new sql syntax edit instance.
uisqlite.BaseSqlEdit = BaseSqlEdit

return uisqlite

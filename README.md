# ec-luart-uisqlite

This project provides sqlite ui objects for [LuaRT](https://www.luart.org/).
It has been designed to simplify and improve the creation of graphical user interfaces with the LuaRT ui module.

![example](/readme.png)

[![Lua 5.4.6](https://badgen.net/badge/Lua/5.4.6/yellow)](https://github.com/lua/lua)
[![LuaRT 1.5.2](https://badgen.net/badge/LuaRT/1.5.2/blue)](https://github.com/samyeyo/LuaRT)
[![LuaCheck 1.1.1](https://badgen.net/badge/LuaCheck/1.1.1/green)](https://github.com/lunarmodules/luacheck)

## Features

The module provides the following sqlite objects:

| Name | Description | Module |
| --- | --- | --- |
| StructureTree | Represents a tree control that shows alltables, indixes, views and triggers of a database. | uisqldatabase.lua
| TableCombobox | Represents a combobox control that shows all tables of a database. | uisqltable.lua
| TableList | Represents a list control that shows all tables of a database. | uisqltable.lua
| TableStatementEdit | Represents a edit control that shows the sql statement of a sepcific table. | uisqltable.lua
| TableColumnCombobox | Represents a combobox control that shows all columns of a sepcific table. | uisqltable.lua
| TableColumnList | Represents a list control that shows all columns of a sepcific table. | uisqltable.lua
| ViewCombobox | Represents a combobox control that shows all views of a database. | uisqlview.lua
| ViewList | Represents a list control that shows all views of a database. | uisqlview.lua
| ViewStatementEdit | Represents a edit control that shows the sql statement of a sepcific view. | uisqlview.lua
| ViewColumnCombobox | Represents a combobox control that shows all columns of a sepcific view. | uisqlview.lua
| ViewColumnList | Represents a list control that shows all columns of a sepcific view. | uisqlview.lua
| IndexCombobox | Represents a combobox control that shows all indexes of a database. | uisqlindex.lua
| IndexList | Represents a list control that shows all indexes of a database. | uisqlindex.lua
| IndexStatementEdit | Represents a edit control that shows the sql statement of a sepcific index. | uisqlindex.lua
| IndexColumnCombobox | Represents a combobox control that shows all columns of a sepcific index. | uisqlindex.lua
| IndexColumnList | Represents a list control that shows all columns of a sepcific index. | uisqlindex.lua
| TriggerCombobox | Represents a combobox control that shows all triggers of a database. | uisqltrigger.lua
| TriggerList | Represents a list control that shows all triggers of a database. | uisqltrigger.lua
| TriggerStatementEdit | Represents a edit control that shows the sql statement of a sepcific trigger. | uisqltrigger.lua

More detailed descriptions and usage examples can be found in the docs folder.

## Installation

1. Create a folder called "ecluart" in your application.
2. Copy the all "*.lua" file into this folder.

```text
[programm]
|
|----ecluart
|   |
|   |----sqlcommand.lua
|   |----uisqldatabase.lua
|   |----uisqlindex.lua
|   |----uisqlite.lua
|   |----uisqltable.lua
|   |----uisqltrigger.lua
|   |----uisqlview.lua
|   |----...
|
|----app.wlua
```

## Usage

The database module can be loaded using the function *require()*:

```lua
local uisqldatabase = require("ecluart.uisqldatabase") 
```

The table module can be loaded using the function *require()*:

```lua
local uisqltable = require("ecluart.uisqltable") 
```

The view module can be loaded using the function *require()*:

```lua
local uisqlview = require("ecluart.uisqlview") 
```

The index module can be loaded using the function *require()*:

```lua
local uisqlindex = require("ecluart.uisqlindex") 
```

The trigger module can be loaded using the function *require()*:

```lua
local uisqltrigger = require("ecluart.uisqltrigger") 
```

## License

Copyright (c) 2023 by esferatec.
It is open source, released under the MIT License.
See full copyright notice in the LICENSE.md file.

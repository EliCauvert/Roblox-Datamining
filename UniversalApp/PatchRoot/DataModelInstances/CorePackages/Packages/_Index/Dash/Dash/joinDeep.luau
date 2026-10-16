local Parent = script.Parent
local NoneModule = require(Parent.None)
local _ = require(Parent.Types)
local ForEachModule = require(Parent.forEach)

local function joinDeep(Tbl, NoneModule1) --[[ Line: 21 ]]
	-- upvalues: ForEachModule (copy), joinDeep (copy), NoneModule (copy)
	local Copy = table.clone(Tbl)
	ForEachModule(NoneModule1, function(NoneModule1, Key) --[[ Line: 24 ]]
		-- upvalues: Tbl (copy), Copy (copy), joinDeep (upval), NoneModule (upval)
		if typeof(Tbl[Key]) == "table" and typeof(NoneModule1) == "table" then
			Copy[Key] = joinDeep(Tbl[Key], NoneModule1)
			
			return
		end
		if NoneModule1 == NoneModule then
			Copy[Key] = nil
			
			return
		else
			Copy[Key] = NoneModule1
		end
	end)
	
	return Copy
end

return joinDeep
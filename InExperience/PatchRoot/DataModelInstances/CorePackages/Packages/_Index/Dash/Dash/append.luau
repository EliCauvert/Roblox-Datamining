local Parent = script.Parent
local NoneModule = require(Parent.None)
local ForEachArgsModule = require(Parent.forEachArgs)
local ForEachModule = require(Parent.forEach)
local InsertFunction = table.insert

return function(p1, ...) --[[ Line: 16 | Named "append" ]]
	-- upvalues: ForEachArgsModule (copy), NoneModule (copy), ForEachModule (copy), InsertFunction (copy)
	ForEachArgsModule(function(NoneModule1) --[[ Line: 17 ]]
		-- upvalues: NoneModule (upval), ForEachModule (upval), p1 (copy), InsertFunction (upval)
		if NoneModule1 ~= NoneModule and NoneModule1 ~= nil then
			ForEachModule(NoneModule1, function(p2) --[[ Line: 21 ]]
				-- upvalues: p1 (upval), InsertFunction (upval)
				InsertFunction(p1, p2)
			end)
			
			return
		end
	end, ...)
	
	return p1
end
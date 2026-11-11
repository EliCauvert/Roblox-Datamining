local Parent = script.Parent
local NoneModule = require(Parent.None)
local _ = require(Parent.Types)
local ForEachModule = require(Parent.forEach)
local ForEachArgsModule = require(Parent.forEachArgs)

return function(NoneModules, ...)
	-- upvalues: ForEachArgsModule (copy), NoneModule (copy), ForEachModule (copy)
	ForEachArgsModule(function(NoneModule1)
		-- upvalues: NoneModule (upval), ForEachModule (upval), NoneModules (copy)
		if NoneModule1 ~= nil and NoneModule1 ~= NoneModule then
			ForEachModule(NoneModule1, function(NoneModule1, Key)
				-- upvalues: NoneModule (upval), NoneModules (upval)
				if NoneModule1 == NoneModule then
					NoneModules[Key] = nil
					
					return
				else
					NoneModules[Key] = NoneModule1
				end
			end)
			
			return
		end
	end, ...)
	
	return NoneModules
end
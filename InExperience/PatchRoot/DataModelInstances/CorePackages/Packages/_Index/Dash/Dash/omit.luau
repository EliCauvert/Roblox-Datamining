local Parent = script.Parent
local CollectSetModule = require(Parent.collectSet)
local ForEachModule = require(Parent.forEach)
local _ = require(Parent.Types)

return function(p1, p2) --[[ Line: 16 | Named "omit" ]]
	-- upvalues: CollectSetModule (copy), ForEachModule (copy)
	local t = {}
	local CollectSetModuleResult = CollectSetModule(p2)
	ForEachModule(p1, function(_, Key) --[[ Line: 19 ]]
		-- upvalues: CollectSetModuleResult (copy), t (copy), p1 (copy)
		if not CollectSetModuleResult[Key] then
			t[Key] = p1[Key]
		end
	end)
	
	return t
end
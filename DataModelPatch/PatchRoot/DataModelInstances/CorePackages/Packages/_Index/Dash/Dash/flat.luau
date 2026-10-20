local Parent = script.Parent
local AppendModule = require(Parent.append)
local ForEachModule = require(Parent.forEach)

return function(p1)
	-- upvalues: ForEachModule (copy), AppendModule (copy)
	local t = {}
	ForEachModule(p1, function(p2)
		-- upvalues: AppendModule (upval), t (copy)
		AppendModule(t, p2)
	end)
	
	return t
end
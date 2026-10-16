local Parent = script.Parent.Parent
local GetDeepValueModule = require(Parent.getDeepValue)
local _ = require(Parent.RoduxAliasesTypes)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: GetDeepValueModule (copy)
	local KeyPath = p1.keyPath
	
	return function(p2, p3) --[[ Line: 10 ]]
		-- upvalues: GetDeepValueModule (upval), KeyPath (copy)
		return GetDeepValueModule(p2, KeyPath .. ".byUserId")[p3]
	end
end
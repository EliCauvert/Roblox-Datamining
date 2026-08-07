local parent = script.Parent.Parent
local getDeepValueModule = require(parent.getDeepValue)
local _ = require(parent.RoduxAliasesTypes)

return function(p0) --[[ line: 8 ]]
	-- upvalues: getDeepValueModule (ref)
	local keyPath = p0.keyPath
	
	return function(p1, p2) --[[ line: 10 ]]
		-- upvalues: getDeepValueModule (copy), keyPath (ref)
		return getDeepValueModule(p1, keyPath .. ".byUserId")[p2]
	end
end
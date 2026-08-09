local parent = script.Parent.Parent
local llamaModule = require(parent.Parent.llama)
local _ = require(parent.roduxFriendsTypes)
local getDeepValueModule = require(parent.getDeepValue)

local var2 = function(p0, p1) --[[ line: 10 ]]
	return p0.rank < p1.rank
end

return function(p2) --[[ line: 18 ]]
	-- upvalues: getDeepValueModule (ref), llamaModule (ref), var2 (ref)
	local keyPath = p2.keyPath
	
	return function(p3, p4) --[[ line: 20 ]]
		-- upvalues: getDeepValueModule (copy), keyPath (ref), llamaModule (copy), var2 (copy)
		return llamaModule.List.sort(llamaModule.Dictionary.values(getDeepValueModule(p3, string.format("%s.recommendations.byUserId.%s", keyPath, p4)) or {}), var2)
	end
end
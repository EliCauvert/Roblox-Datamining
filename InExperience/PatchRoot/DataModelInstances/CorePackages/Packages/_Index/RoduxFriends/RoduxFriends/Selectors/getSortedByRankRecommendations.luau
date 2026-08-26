local parent = script.Parent.Parent
local llamaModule = require(parent.Parent.llama)
local _ = require(parent.roduxFriendsTypes)
local getDeepValueModule = require(parent.getDeepValue)

local var1 = function(p1, p2)
	return p1.rank < p2.rank
end

return function(p1)
	-- upvalues: getDeepValueModule (ref), llamaModule (ref), var1 (ref)
	local keyPath = p1.keyPath
	
	return function(p2, p3)
		-- upvalues: getDeepValueModule (copy), keyPath (ref), llamaModule (copy), var1 (copy)
		return llamaModule.List.sort(llamaModule.Dictionary.values(getDeepValueModule(p2, string.format("%s.recommendations.byUserId.%s", keyPath, p3)) or {}), var1)
	end
end
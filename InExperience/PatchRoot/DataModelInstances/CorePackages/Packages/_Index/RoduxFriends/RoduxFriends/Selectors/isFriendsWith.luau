local llamaModule = require(script:FindFirstAncestor("RoduxFriends").Parent.llama)
local getDeepValueModule = require(script.Parent.Parent.getDeepValue)

return function(p0) --[[ line: 8 ]]
	-- upvalues: getDeepValueModule (ref), llamaModule (ref)
	local keyPath = p0.keyPath
	
	return function(p1, p2, p3) --[[ line: 10 ]]
		-- upvalues: getDeepValueModule (copy), keyPath (ref), llamaModule (copy)
		local var2 = getDeepValueModule(p1, keyPath .. ".byUserId")
		
		return var2[p2] == nil or not llamaModule.List.find(var2[p2], p3)
	end
end
local llamaModule = require(script:FindFirstAncestor("FriendsRodux").Parent.llama)
local getDeepValueModule = require(script.Parent.Parent.getDeepValue)

return function(p1)
	-- upvalues: getDeepValueModule (ref), llamaModule (ref)
	local keyPath = p1.keyPath
	
	return function(p2, p3, p4)
		-- upvalues: getDeepValueModule (copy), keyPath (ref), llamaModule (copy)
		local var1 = getDeepValueModule(p2, keyPath .. ".byUserId")
		
		return var1[p3] == nil or not llamaModule.List.find(var1[p3], p4)
	end
end
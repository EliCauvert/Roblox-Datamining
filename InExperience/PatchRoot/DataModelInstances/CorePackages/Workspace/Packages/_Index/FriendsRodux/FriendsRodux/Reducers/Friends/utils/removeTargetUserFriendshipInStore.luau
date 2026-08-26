local llamaModule = require(script:FindFirstAncestor("FriendsRodux").Parent.llama)
local removeUserModule = require(script.Parent.removeUser)

return function(p1, p2)
	-- upvalues: llamaModule (ref), removeUserModule (ref)
	local var1 = tostring(p2.additionalData.currentUserId)
	local var2 = tostring(p2.namedIds.users)
	local var3 = llamaModule.Dictionary.join(p1, {
		[var1] = removeUserModule(p1[var1], var2),
		[var2] = removeUserModule(p1[var2], var1)
	})
	var3[var2] = nil
	
	return var3
end
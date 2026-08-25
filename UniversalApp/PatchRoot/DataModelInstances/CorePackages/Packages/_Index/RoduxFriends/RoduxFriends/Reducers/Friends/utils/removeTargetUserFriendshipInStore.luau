local llamaModule = require(script:FindFirstAncestor("RoduxFriends").Parent.llama)
local removeUserModule = require(script.Parent.removeUser)

return function(p0, p1)
	-- upvalues: llamaModule (ref), removeUserModule (ref)
	local var2 = tostring(p1.additionalData.currentUserId)
	local var3 = tostring(p1.namedIds.users)
	local var4 = llamaModule.Dictionary.join(p0, {
		[var2] = removeUserModule(p0[var2], var3),
		[var3] = removeUserModule(p0[var3], var2)
	})
	var4[var3] = nil
	
	return var4
end
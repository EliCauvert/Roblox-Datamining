local populateUserWithStateModule = require(script:FindFirstAncestor("AppChat").Users.populateUserWithState)
local loggerModule = require(script.Parent.Parent.Logger)

return function(p1, p2, p3)
	-- upvalues: populateUserWithStateModule (ref), loggerModule (ref)
	local users = p1.Users
	local t = {}
	
	for i, v in pairs(p2) do
		local var1 = users[v]
		local var2 = if p3 then p3[i] else nil
		
		if var1 then
			t[var1.id] = populateUserWithStateModule(p1, var1, var2)
		else
			loggerModule:warning("user is required in selectChatUserEntryModelList")
		end
	end
	return t
end
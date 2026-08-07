local populateUserWithStateModule = require(script:FindFirstAncestor("AppChat").Users.populateUserWithState)
local loggerModule = require(script.Parent.Parent.Logger)

return function(p0, p1, p2) --[[ line: 5 ]]
	-- upvalues: populateUserWithStateModule (ref), loggerModule (ref)
	local users = p0.Users
	local t = {}
	
	for i, v in pairs(p1) do
		local var3 = users[v]
		local var4 = if p2 then p2[i] else nil
		
		if var3 then
			t[var3.id] = populateUserWithStateModule(p0, var3, var4)
		else
			loggerModule:warning("user is required in selectChatUserEntryModelList")
		end
	end
	return t
end
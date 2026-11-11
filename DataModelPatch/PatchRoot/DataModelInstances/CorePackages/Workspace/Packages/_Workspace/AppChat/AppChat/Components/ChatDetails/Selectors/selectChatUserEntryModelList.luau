local PopulateUserWithStateModule = require(script:FindFirstAncestor("AppChat").Users.populateUserWithState)
local LoggerModule = require(script.Parent.Parent.Logger)

return function(p1, List, p2)
	-- upvalues: PopulateUserWithStateModule (copy), LoggerModule (copy)
	local Users = p1.Users
	local t = {}
	
	for i, value in pairs(List) do
		local User = Users[value]
		local v1 = if p2 then p2[i] else nil
		
		if User then
			t[User.id] = PopulateUserWithStateModule(p1, User, v1)
		else
			LoggerModule:warning("user is required in selectChatUserEntryModelList")
		end
	end
	return t
end
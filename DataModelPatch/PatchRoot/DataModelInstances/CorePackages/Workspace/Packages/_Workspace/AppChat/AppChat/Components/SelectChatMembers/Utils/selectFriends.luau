local PopulateUserWithStateModule = require(script:FindFirstAncestor("AppChat").Users.populateUserWithState)
local IsUserInConversationModule = require(script.Parent.isUserInConversation)

return function(p1, p2)
	-- upvalues: IsUserInConversationModule (copy), PopulateUserWithStateModule (copy)
	local t = {}
	
	for _, user in pairs(p1.Users) do
		if user.id ~= tostring(p1.LocalUserId) and user.isFriend and not IsUserInConversationModule(user.id, p2) then
			t[user.id] = PopulateUserWithStateModule(p1, user)
		end
	end
	return t
end
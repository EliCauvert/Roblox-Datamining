local populateUserWithStateModule = require(script:FindFirstAncestor("AppChat").Users.populateUserWithState)
local isUserInConversationModule = require(script.Parent.isUserInConversation)

return function(p1, p2)
	-- upvalues: isUserInConversationModule (ref), populateUserWithStateModule (ref)
	local t = {}
	
	for i, v in pairs(p1.Users) do
		if v.id ~= tostring(p1.LocalUserId) and v.isFriend and not isUserInConversationModule(v.id, p2) then
			t[v.id] = populateUserWithStateModule(p1, v)
		end
	end
	return t
end
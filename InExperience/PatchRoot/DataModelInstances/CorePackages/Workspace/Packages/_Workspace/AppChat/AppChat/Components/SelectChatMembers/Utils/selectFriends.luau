local populateUserWithStateModule = require(script:FindFirstAncestor("AppChat").Users.populateUserWithState)
local isUserInConversationModule = require(script.Parent.isUserInConversation)

return function(p0, p1)
	-- upvalues: isUserInConversationModule (ref), populateUserWithStateModule (ref)
	local t = {}
	
	for i, v in pairs(p0.Users) do
		if v.id ~= tostring(p0.LocalUserId) and v.isFriend and not isUserInConversationModule(v.id, p1) then
			t[v.id] = populateUserWithStateModule(p0, v)
		end
	end
	return t
end
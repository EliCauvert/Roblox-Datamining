local parent = script:FindFirstAncestor("AppChat").Parent
local userModel = require(parent.UserLib).Models.UserModel
local presenceType = require(parent.GraphQLServer).types.PresenceType

return function(p1)
	-- upvalues: presenceType (ref), userModel (ref)
	return if p1 == presenceType.Online then userModel.PresenceType.ONLINE elseif p1 == presenceType.InGame then userModel.PresenceType.IN_GAME elseif p1 == presenceType.InStudio then userModel.PresenceType.IN_STUDIO else userModel.PresenceType.OFFLINE
end
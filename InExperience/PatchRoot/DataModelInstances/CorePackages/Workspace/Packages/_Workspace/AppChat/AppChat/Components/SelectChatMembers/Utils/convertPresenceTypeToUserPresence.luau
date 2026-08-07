local parent = script:FindFirstAncestor("AppChat").Parent
local userModel = require(parent.UserLib).Models.UserModel
local presenceType = require(parent.GraphQLServer).types.PresenceType

return function(p0) --[[ line: 9 ]]
	-- upvalues: presenceType (ref), userModel (ref)
	return if p0 == presenceType.Online then userModel.PresenceType.ONLINE elseif p0 == presenceType.InGame then userModel.PresenceType.IN_GAME elseif p0 == presenceType.InStudio then userModel.PresenceType.IN_STUDIO else userModel.PresenceType.OFFLINE
end
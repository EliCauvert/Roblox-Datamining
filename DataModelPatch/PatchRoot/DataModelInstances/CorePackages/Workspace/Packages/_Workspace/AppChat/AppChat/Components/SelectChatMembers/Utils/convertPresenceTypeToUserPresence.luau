local Parent = script:FindFirstAncestor("AppChat").Parent
local UserModel = require(Parent.UserLib).Models.UserModel
local PresenceType = require(Parent.GraphQLServer).types.PresenceType

return function(InGame)
	-- upvalues: PresenceType (copy), UserModel (copy)
	return if InGame == PresenceType.Online then UserModel.PresenceType.ONLINE elseif InGame == PresenceType.InGame then UserModel.PresenceType.IN_GAME elseif InGame == PresenceType.InStudio then UserModel.PresenceType.IN_STUDIO else UserModel.PresenceType.OFFLINE
end
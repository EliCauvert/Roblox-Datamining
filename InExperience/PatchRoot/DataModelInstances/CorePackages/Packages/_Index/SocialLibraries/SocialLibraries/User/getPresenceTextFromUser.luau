local UserModel = require(script:FindFirstAncestor("SocialLibraries").dependencies).UserModel

return function(p1): string
	-- upvalues: UserModel (copy)
	local Presence = p1.presence
	local LastLocation = p1.lastLocation
	
	return if Presence == UserModel.PresenceType.OFFLINE then "Common.Presence.Label.Offline" elseif Presence == UserModel.PresenceType.ONLINE then "Common.Presence.Label.Online" elseif Presence == UserModel.PresenceType.IN_GAME or Presence == UserModel.PresenceType.IN_STUDIO then if LastLocation then tostring(LastLocation) else "Common.Presence.Label.Online" else ""
end
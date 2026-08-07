local userModel = require(script:FindFirstAncestor("SocialLibraries").dependencies).UserModel

return function(p0) --[[ line: 5 ]]
	-- upvalues: userModel (ref)
	local presence = p0.presence
	local lastLocation = p0.lastLocation
	
	return if presence == userModel.PresenceType.OFFLINE then "Common.Presence.Label.Offline" elseif presence == userModel.PresenceType.ONLINE then "Common.Presence.Label.Online" elseif not (presence ~= userModel.PresenceType.IN_GAME and presence ~= userModel.PresenceType.IN_STUDIO) then if lastLocation then tostring(lastLocation) else "Common.Presence.Label.Online" else ""
end
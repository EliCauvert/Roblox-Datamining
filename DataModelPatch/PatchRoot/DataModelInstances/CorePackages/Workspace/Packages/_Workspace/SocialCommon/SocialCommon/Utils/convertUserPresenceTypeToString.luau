local PresenceType = require(script:FindFirstAncestor("SocialCommon").Parent.LuaSocialLibrariesDeps).RoduxPresence.config({ keyPath = "SocialCommon.Presence" }).Enums.PresenceType

return function(InGame): string
	-- upvalues: PresenceType (copy)
	return if InGame == PresenceType.Online then "Online" elseif InGame == PresenceType.InStudio then "InStudio" elseif InGame == PresenceType.InGame then "InGame" else "Offline"
end
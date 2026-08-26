local presenceType = require(script:FindFirstAncestor("SocialCommon").Parent.LuaSocialLibrariesDeps).RoduxPresence.config({ keyPath = "SocialCommon.Presence" }).Enums.PresenceType

return function(p1)
	-- upvalues: presenceType (ref)
	return if p1 == presenceType.Online then "Online" elseif p1 == presenceType.InStudio then "InStudio" elseif p1 == presenceType.InGame then "InGame" else "Offline"
end
local presenceType = require(script:FindFirstAncestor("SocialCommon").Parent.LuaSocialLibrariesDeps).RoduxPresence.config({ keyPath = "SocialCommon.Presence" }).Enums.PresenceType

return function(p0)
	-- upvalues: presenceType (ref)
	return if p0 == presenceType.Online then "Online" elseif p0 == presenceType.InStudio then "InStudio" elseif p0 == presenceType.InGame then "InGame" else "Offline"
end
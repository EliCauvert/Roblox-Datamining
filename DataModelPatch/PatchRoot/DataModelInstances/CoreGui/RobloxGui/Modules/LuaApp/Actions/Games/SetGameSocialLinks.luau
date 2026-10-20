return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(UniverseId, SocialLinks)
	assert(type(UniverseId) == "string", string.format("SetGameSocialLinks action expects universeId to be a string, was %s", (type(UniverseId))))
	assert(type(SocialLinks) == "table", string.format("SetGameSocialLinks action expects socialLinks to be a table, was %s", (type(SocialLinks))))
	
	return { universeId = UniverseId, socialLinks = SocialLinks }
end)
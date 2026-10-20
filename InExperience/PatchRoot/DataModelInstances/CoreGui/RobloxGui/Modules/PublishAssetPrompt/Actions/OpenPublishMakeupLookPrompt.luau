return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(PromptType, Guid, Scopes, MakeupEntries)
	return {
		promptInfo = {
			promptType = PromptType,
			guid = Guid,
			scopes = Scopes,
			makeupEntries = MakeupEntries
		}
	}
end)
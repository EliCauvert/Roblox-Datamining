return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(PromptType, Guid, Scopes, MakeupEntries) --[[ Line: 20 ]]
	return {
		promptInfo = {
			promptType = PromptType,
			guid = Guid,
			scopes = Scopes,
			makeupEntries = MakeupEntries
		}
	}
end)
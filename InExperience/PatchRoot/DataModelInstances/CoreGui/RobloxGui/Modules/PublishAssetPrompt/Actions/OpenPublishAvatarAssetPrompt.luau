return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(PromptType, AccessoryType, Guid, Scopes)
	return {
		promptInfo = {
			promptType = PromptType,
			accessoryType = AccessoryType,
			guid = Guid,
			scopes = Scopes
		}
	}
end)
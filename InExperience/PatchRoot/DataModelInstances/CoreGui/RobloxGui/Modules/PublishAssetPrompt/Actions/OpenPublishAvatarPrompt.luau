return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(PromptType, Guid, Scopes) --[[ Line: 19 ]]
	return {
		promptInfo = { promptType = PromptType, guid = Guid, scopes = Scopes }
	}
end)
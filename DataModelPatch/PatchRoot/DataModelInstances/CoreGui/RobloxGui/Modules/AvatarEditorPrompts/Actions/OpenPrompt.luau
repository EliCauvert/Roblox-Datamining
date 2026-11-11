return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(PromptType, PromptInfo)
	return { promptType = PromptType, promptInfo = PromptInfo }
end)
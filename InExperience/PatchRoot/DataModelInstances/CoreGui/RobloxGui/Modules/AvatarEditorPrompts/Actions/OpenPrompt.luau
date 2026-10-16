return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(PromptType, PromptInfo) --[[ Line: 5 ]]
	return { promptType = PromptType, promptInfo = PromptInfo }
end)
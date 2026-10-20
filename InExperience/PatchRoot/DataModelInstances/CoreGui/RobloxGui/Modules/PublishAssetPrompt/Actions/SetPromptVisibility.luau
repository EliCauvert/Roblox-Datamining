return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(PromptVisible)
	return { promptVisible = PromptVisible }
end)
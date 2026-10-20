return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Character)
	return { type = script.Name, character = Character }
end)
return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Emotes)
	return { emotes = Emotes }
end)
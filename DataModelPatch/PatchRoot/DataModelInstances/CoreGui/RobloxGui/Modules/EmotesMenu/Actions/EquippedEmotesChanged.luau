return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(EquippedEmotes)
	return { equippedEmotes = EquippedEmotes }
end)
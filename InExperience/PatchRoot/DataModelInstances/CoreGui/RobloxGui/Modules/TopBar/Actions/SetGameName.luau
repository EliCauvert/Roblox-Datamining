return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateGameInfoRodux) then nil else require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return { gameName = p1 }
end)
return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateGameInfoRodux) then nil else require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 11 ]]
	return { gameName = p0 }
end)
return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateDisplayOptionsRodux) then nil else require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return { isSmallTouchDevice = p1 }
end)
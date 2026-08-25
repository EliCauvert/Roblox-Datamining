return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateDisplayOptionsRodux) then nil else require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0)
	return { open = p0 }
end)
return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateMoreMenuRodux) then nil else require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0)
	return { open = p0 }
end)
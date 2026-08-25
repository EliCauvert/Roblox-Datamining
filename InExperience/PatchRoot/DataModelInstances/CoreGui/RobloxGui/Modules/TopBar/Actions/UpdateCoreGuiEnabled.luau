return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateCoreGuiRodux) then nil else require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { coreGuiType = p0, enabled = p1 }
end)
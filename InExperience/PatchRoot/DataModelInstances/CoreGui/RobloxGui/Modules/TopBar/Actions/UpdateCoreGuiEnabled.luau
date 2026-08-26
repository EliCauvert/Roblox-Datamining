return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateCoreGuiRodux) then nil else require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { coreGuiType = p1, enabled = p2 }
end)
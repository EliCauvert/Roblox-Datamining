return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateCoreGuiRodux) then nil else require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0, p1) --[[ line: 11 ]]
	return { coreGuiType = p0, enabled = p1 }
end)
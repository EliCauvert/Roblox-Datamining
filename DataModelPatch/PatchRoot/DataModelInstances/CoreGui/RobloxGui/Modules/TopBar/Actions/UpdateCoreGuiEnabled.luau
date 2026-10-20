local MakeActionCreatorFunction = require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator

return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateCoreGuiRodux) then nil else MakeActionCreatorFunction(script.Name, function(CoreGuiType, Enabled)
	return { coreGuiType = CoreGuiType, enabled = Enabled }
end)
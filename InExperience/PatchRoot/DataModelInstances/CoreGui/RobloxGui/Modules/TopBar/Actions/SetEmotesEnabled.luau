local MakeActionCreatorFunction = require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator

return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateMoreMenuRodux) then nil else MakeActionCreatorFunction(script.Name, function(Enabled)
	return { enabled = Enabled }
end)
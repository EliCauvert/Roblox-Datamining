local CorePackages = game:GetService("CorePackages")
local MakeActionCreatorFunction = require(CorePackages.Packages.Rodux).makeActionCreator

return if require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar then nil else MakeActionCreatorFunction(script.Name, function(Health, MaxHealth)
	return { health = Health, maxHealth = MaxHealth }
end)
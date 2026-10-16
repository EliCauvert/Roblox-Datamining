local CorePackages = game:GetService("CorePackages")
local MakeActionCreatorFunction = require(CorePackages.Packages.Rodux).makeActionCreator

return if require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar then nil else MakeActionCreatorFunction(script.Name, function(IsDead) --[[ Line: 9 ]]
	return { isDead = IsDead }
end)
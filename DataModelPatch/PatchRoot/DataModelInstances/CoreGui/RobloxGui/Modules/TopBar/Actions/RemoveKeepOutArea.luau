local CorePackages = game:GetService("CorePackages")
local MakeActionCreatorFunction = require(CorePackages.Packages.Rodux).makeActionCreator

return if require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeKeepOutAreas then nil else MakeActionCreatorFunction(script.Name, function(Id)
	return { id = Id }
end)
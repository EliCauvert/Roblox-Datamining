local CorePackages = game:GetService("CorePackages")
local MakeActionCreatorFunction = require(CorePackages.Packages.Rodux).makeActionCreator

return if require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeMenuOpen then nil else MakeActionCreatorFunction(script.Name, function(InspectMenuOpen)
	return { inspectMenuOpen = InspectMenuOpen }
end)
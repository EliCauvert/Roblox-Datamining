local CorePackages = game:GetService("CorePackages")
local MakeActionCreatorFunction = require(CorePackages.Packages.Rodux).makeActionCreator

return if require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize then nil else MakeActionCreatorFunction(script.Name, function(ScreenSize) --[[ Line: 11 ]]
	return { screenSize = ScreenSize }
end)
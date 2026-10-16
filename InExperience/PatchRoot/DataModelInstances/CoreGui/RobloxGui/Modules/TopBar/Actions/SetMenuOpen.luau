local CorePackages = game:GetService("CorePackages")
local MakeActionCreatorFunction = require(CorePackages.Packages.Rodux).makeActionCreator

return if require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeMenuOpen then nil else MakeActionCreatorFunction(script.Name, function(MenuOpen) --[[ Line: 9 ]]
	return { menuOpen = MenuOpen }
end)
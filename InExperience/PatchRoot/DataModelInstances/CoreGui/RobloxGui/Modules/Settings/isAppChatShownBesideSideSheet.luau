local InExperienceSideSheetModule = require(game:GetService("CorePackages").Workspace.Packages.InExperienceSideSheet)
local FFlagKeepSideSheetOpenBesideMenu = InExperienceSideSheetModule.Flags.FFlagKeepSideSheetOpenBesideMenu
local ConnectDropdown = InExperienceSideSheetModule.Constants.IntegrationIds.ConnectDropdown

return function(): boolean
	-- upvalues: FFlagKeepSideSheetOpenBesideMenu (copy), InExperienceSideSheetModule (copy), ConnectDropdown (copy)
	return FFlagKeepSideSheetOpenBesideMenu and InExperienceSideSheetModule.getWindowShownBesideSideSheet(false) == ConnectDropdown
end
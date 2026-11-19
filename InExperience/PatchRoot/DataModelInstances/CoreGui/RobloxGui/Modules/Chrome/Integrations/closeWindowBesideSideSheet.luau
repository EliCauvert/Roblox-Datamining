local InExperienceSideSheetModule = require(game:GetService("CorePackages").Workspace.Packages.InExperienceSideSheet)
local ServiceModule = require(script:FindFirstAncestor("Chrome").Service)
local FFlagKeepSideSheetOpenBesideMenu = InExperienceSideSheetModule.Flags.FFlagKeepSideSheetOpenBesideMenu

return function(WindowShownBesideSideSheet)
	-- upvalues: FFlagKeepSideSheetOpenBesideMenu (copy), InExperienceSideSheetModule (copy), ServiceModule (copy)
	local IsWindowShownBesideSideSheetMatch: boolean = FFlagKeepSideSheetOpenBesideMenu and InExperienceSideSheetModule.getWindowShownBesideSideSheet(false) == WindowShownBesideSideSheet
	
	if IsWindowShownBesideSideSheetMatch then
		InExperienceSideSheetModule.setWindowShownBesideSideSheet(nil)
	end
	ServiceModule:toggleWindow(WindowShownBesideSideSheet)
	
	if IsWindowShownBesideSideSheetMatch then
		InExperienceSideSheetModule.toggleSideSheet(false)
		InExperienceSideSheetModule.logSidesheetClosed(InExperienceSideSheetModule.Analytics.Source.WindowClosed)
	end
end
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local IntervalPerformanceTracker = require(CorePackages.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local FFlagAXEditorSubcategoryFilters = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEditorSubcategoryFilters
local FIntAXFPSDurationForCatSubCatModule = require(Modules.AvatarExperience.Flags.FIntAXFPSDurationForCatSubCat)
local TopLevelFPSForCatSubCat = ConstantsModule.Counter.TopLevelFPSForCatSubCat

return function(p1, p2, Nav, SubNav, p3)
	-- upvalues: ArgCheckModule (copy), FFlagAXEditorSubcategoryFilters (copy), ConstantsModule (copy), IntervalPerformanceTracker (copy), TopLevelFPSForCatSubCat (copy), FIntAXFPSDurationForCatSubCatModule (copy)
	ArgCheckModule.isType(p2, "string", "clickNavigationTab event expects eventContext to be a string")
	ArgCheckModule.isType(Nav, "string", "clickNavigationTab event expects categoryName to be a string")
	ArgCheckModule.isType(SubNav, "string", "clickNavigationTab event expects subCategoryName to be a string")
	
	if FFlagAXEditorSubcategoryFilters then
		ArgCheckModule.isType(p3, "string", "clickNavigationTab event expects subcategoryFilterName to be a string")
	end
	local config = {
		feature = ConstantsModule.AnalyticsTag,
		nav = Nav,
		subNav = SubNav,
		subNavFilter = if FFlagAXEditorSubcategoryFilters then p3 else nil
	}
	IntervalPerformanceTracker:startTracking(TopLevelFPSForCatSubCat.Editor, FIntAXFPSDurationForCatSubCatModule, nil, true, true)
	p1:sendTelemetryEvent(p2, "avatarEditorNavButtonClick", config)
end
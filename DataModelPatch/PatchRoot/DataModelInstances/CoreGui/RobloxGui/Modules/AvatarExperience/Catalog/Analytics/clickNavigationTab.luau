local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local IntervalPerformanceTracker = require(CorePackages.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker
local FIntAXFPSDurationForCatSubCatModule = require(Modules.AvatarExperience.Flags.FIntAXFPSDurationForCatSubCat)
local TopLevelFPSForCatSubCat = ConstantsModule.Counter.TopLevelFPSForCatSubCat

return function(p1, p2, Nav, SubNav)
	-- upvalues: ArgCheckModule (copy), ConstantsModule (copy), IntervalPerformanceTracker (copy), TopLevelFPSForCatSubCat (copy), FIntAXFPSDurationForCatSubCatModule (copy)
	ArgCheckModule.isType(p2, "string", "clickNavigationTab event expects eventContext")
	ArgCheckModule.isType(Nav, "string", "clickNavigationTab event expects categoryName")
	ArgCheckModule.isType(SubNav, "string", "clickNavigationTab event expects subCategoryName")
	local config = {
		feature = ConstantsModule.AnalyticsTag,
		nav = Nav,
		subNav = SubNav
	}
	IntervalPerformanceTracker:startTracking(TopLevelFPSForCatSubCat.Catalog, FIntAXFPSDurationForCatSubCatModule, nil, true, true)
	p1:sendTelemetryEvent(p2, "catalogNavButtonClick", config)
end
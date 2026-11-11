local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local GetFFlagLooksIXPLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagLooksIXPLogging)
local GetFFlagAXDisableSortsLayerExposureModule = require(Modules.AvatarExperience.Flags.GetFFlagAXDisableSortsLayerExposure)

local function dummyTest(Layer)
	-- upvalues: IxpUtilsModule (copy)
	return IxpUtilsModule.defineIXPTest({
		recordExposure = false,
		name = Layer .. "DummyTest",
		layer = Layer,
		getDependentFlagsEnabled = function(): boolean
			return true
		end,
		getEnabledFlag = function(): boolean
			return true
		end,
		getEnabledForAllFlag = function(): boolean
			return false
		end,
		variables = {}
	})
end

return {
	Editor = dummyTest(AppUserLayers.AvatarMarketplaceEditor),
	RelevanceRecommendations = dummyTest("AvatarMarketplace.RelevanceRecommendations"),
	RecommendationsAndSearch = dummyTest(AppUserLayers.AvatarMarketplaceDefaultRecSearchLayer),
	ItemDetailsPage = dummyTest(AppUserLayers.AvatarMarketplaceItemDetailsPage),
	Widgets = dummyTest((game:DefineFastString("WidgetLayer", "AvatarMarketplace.WidgetPlatform"))),
	SearchWidgets = if GetFFlagLooksIXPLoggingModule() then dummyTest("AvatarMarketplace.SearchPageWidgetPlatform") else nil,
	Sorts = if GetFFlagLooksIXPLoggingModule() or not GetFFlagAXDisableSortsLayerExposureModule() then dummyTest("AvatarMarketplace.Sorts") else nil
}
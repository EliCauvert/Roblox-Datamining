local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local CompositionTags = require(CorePackages.Workspace.Packages.AppComposition).CompositionTags
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local PersonalizationTopBarModule = require(Modules.Personalization.PersonalizationTopBar)
local UseChartsTitleTextModule = require(Modules.Personalization.Games.useChartsTitleText)
local UseLogSduiChartsExposureModule = require(Modules.Personalization.Games.useLogSduiChartsExposure)
local ChartsSortDetailPage = require(CorePackages.Workspace.Packages.Charts).ChartsSortDetailPage
local _ = require(CorePackages.Workspace.Packages.SduiSharedUtilities)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagLuaAppLogChartsAppPageExposure = SharedFlagsModule.FFlagLuaAppLogChartsAppPageExposure
local FFlagLuaAppCompositionCharts = SharedFlagsModule.FFlagLuaAppCompositionCharts
local FFlagLuaAppCompositionAlways = SharedFlagsModule.FFlagLuaAppCompositionAlways
local FFlagLuaAppCompositionHome = SharedFlagsModule.FFlagLuaAppCompositionHome or (FFlagLuaAppCompositionCharts or FFlagLuaAppCompositionAlways)

return function(p1)
	-- upvalues: FFlagLuaAppLogChartsAppPageExposure (copy), UseLogSduiChartsExposureModule (copy), UseUiModeInfoFunction (copy), UiMode (copy), UseChartsTitleTextModule (copy), UseSelectorFunction (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), ReactModule (copy), PersonalizationTopBarModule (copy), FFlagLuaAppCompositionHome (copy), CompositionTags (copy), ChartsSortDetailPage (copy)
	if FFlagLuaAppLogChartsAppPageExposure then
		UseLogSduiChartsExposureModule()
	end
	local IsNotUiModeMatch = UseUiModeInfoFunction().uiMode ~= UiMode.TenFoot
	local UseChartsTitleTextModuleResult = UseChartsTitleTextModule()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.TopBar.topBarHeight
	end)
	local ScrollAwayEnabled = FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		TopBar = if IsNotUiModeMatch then ReactModule.createElement(PersonalizationTopBarModule, {
			titleText = UseChartsTitleTextModuleResult,
			tag = if FFlagLuaAppCompositionHome then CompositionTags.ContentRegion.Header else nil,
			sideMarginOverride = if FFlagLuaAppCompositionHome then 0 else nil
		}) else nil,
		Content = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			Position = if ScrollAwayEnabled then UDim2.fromOffset(0, 0) else UDim2.fromOffset(0, UseSelectorResult),
			Size = if ScrollAwayEnabled then UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, 1, -UseSelectorResult)
		}, {
			ChartsSortDetailPage = ReactModule.createElement(ChartsSortDetailPage, {
				sortId = p1.sortId,
				pageContext = p1.pageContext,
				pageTimer = p1.pageTimer,
				pageTopPadding = if ScrollAwayEnabled then UseSelectorResult else nil
			})
		})
	})
end
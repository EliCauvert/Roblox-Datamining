local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local GetTestIdFunction = require(CorePackages.Workspace.Packages.RoactUtils).getTestId
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local AppNotificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local VisibilityControl = AppNavBarModule.VisibilityControl
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local OmniFeedPageSection = require(CorePackages.Workspace.Packages.DiscoveryTypes).OmniFeedConstants.OmniFeedPageSection
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Divider = FoundationModule.Divider
local Orientation = FoundationModule.Enums.Orientation
local ServerDrivenUiModule = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local UseCollectionLayoutConfigFunction = require(CorePackages.Workspace.Packages.CollectionViews).useCollectionLayoutConfig
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local PersonalizationTopBarModule = require(Modules.Personalization.PersonalizationTopBar)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local GamesOmniFeedModule = require(Modules.Personalization.Games.GamesOmniFeed)
local UseLogSduiChartsExposureModule = require(Modules.Personalization.Games.useLogSduiChartsExposure)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local OmniFeedViewModule = require(Modules.Personalization.OmniFeed.FeedViews.OmniFeedView)
local FlyoutSidePanelIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP
local Sources = require(CorePackages.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources
local CompositionTags = require(CorePackages.Workspace.Packages.AppComposition).CompositionTags
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagAppIaHomeSubTab = SharedFlagsModule.FFlagAppIaHomeSubTab
local FFlagLuaAppEnableChartsPageProfileLink = SharedFlagsModule.FFlagLuaAppEnableChartsPageProfileLink
local FFlagLuaAppAddTestIdsForArrow = SharedFlagsModule.FFlagLuaAppAddTestIdsForArrow
local FFlagLuaAppChartsStickyHeader = SharedFlagsModule.FFlagLuaAppChartsStickyHeader
local FFlagLuaAppCompositionCharts = SharedFlagsModule.FFlagLuaAppCompositionCharts
local FFlagLuaAppLayoutParamsInContext = SharedFlagsModule.FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppChartsResetFetchingStatusOnFilterChange = SharedFlagsModule.FFlagLuaAppChartsResetFetchingStatusOnFilterChange
local FFlagLuaAppLogChartsAppPageExposure = SharedFlagsModule.FFlagLuaAppLogChartsAppPageExposure
local Games = if FFlagLuaAppChartsStickyHeader then AppPage.Games else nil
local HEADERGAMESFEEDITEMIMPRESSIONS = if FFlagLuaAppChartsStickyHeader then "HEADER_GAMESFEEDITEM_IMPRESSIONS" else nil
local T = if FFlagLuaAppChartsStickyHeader then {} else nil
local UseTTINavigationTrackingFunction = require(CorePackages.Workspace.Packages.TTINavigationTracking).useTTINavigationTracking

local function v37(p1)
	-- upvalues: FFlagLuaAppLogChartsAppPageExposure (copy), UseLogSduiChartsExposureModule (copy), SharedFlagsModule (copy), UseTTINavigationTrackingFunction (copy), UseAppPolicyModule (copy), FFlagLuaAppEnableChartsPageProfileLink (copy), UseLocalizationModule (copy), UseRoactServiceModule (copy), AppNotificationService (copy), UseSelectorFunction (copy), UseStyleFunction (copy), FFlagLuaAppChartsStickyHeader (copy), UseTokensFunction (copy), FFlagAppIaScrollAway (copy), ReactModule (copy), FFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), RetrievalStatusModule (copy), Games (copy), T (copy), OmniFeedPageSection (copy), FFlagLuaAppLayoutParamsInContext (copy), UseCollectionLayoutConfigFunction (copy), ServerDrivenUiModule (copy), FFlagAppIaHomeSubTab (copy), FlyoutSidePanelIXP (copy), AppNavBarModule (copy), VisibilityControl (copy), GamesOmniFeedModule (copy), PersonalizationTopBarModule (copy), FFlagLuaAppCompositionCharts (copy), CompositionTags (copy), Sources (copy), Divider (copy), Orientation (copy), OmniFeedViewModule (copy), HEADERGAMESFEEDITEMIMPRESSIONS (copy), TopBarModule (copy), FFlagLuaAppAddTestIdsForArrow (copy), GetTestIdFunction (copy)
	if FFlagLuaAppLogChartsAppPageExposure then
		UseLogSduiChartsExposureModule()
	end
	if SharedFlagsModule.FFlagLuaAppNavigationTTITracking then
		UseTTINavigationTrackingFunction("NavigateTo_Games")
	end
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		return p2.getGamesPageCreationCenterTitle()
	end)
	local UseAppPolicyModuleResult1 = if FFlagLuaAppEnableChartsPageProfileLink then UseAppPolicyModule(function(p2)
		return p2.useGridPageLayout()
	end) else nil
	local UseLocalizationModuleResult = UseLocalizationModule({
		creationCenter = "CommonUI.Features.Label.CreationCenter",
		chartsTitle = "CommonUI.Features.Label.Charts"
	})
	local CreationCenter = UseLocalizationModuleResult.creationCenter
	local UseRoactServiceModuleResult = UseRoactServiceModule(AppNotificationService)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.Startup.GamesPageDataStatus
	end)
	local Theme = UseStyleFunction().Theme
	local Color = Theme.BackgroundDefault.Color
	local Transparency = Theme.BackgroundDefault.Transparency
	local UseTokensResult = if FFlagLuaAppChartsStickyHeader then UseTokensFunction() else nil
	local UseSelectorResult1 = if FFlagLuaAppChartsStickyHeader or FFlagAppIaScrollAway then UseSelectorFunction(function(p2)
		return p2.TopBar.topBarHeight
	end) else nil
	ReactModule.useEffect(function()
		-- upvalues: FFlagLuaAppChartsResetFetchingStatusOnFilterChange (upval), UseSelectorResult (copy), RetrievalStatusModule (upval), UseRoactServiceModuleResult (copy)
		if (if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then UseSelectorResult.status else UseSelectorResult) == RetrievalStatusModule.Done then
			UseRoactServiceModuleResult:ActionEnabled(Enum.AppShellActionType.GamePageLoaded)
		end
	end, {
		if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then UseSelectorResult.status else UseSelectorResult,
		UseRoactServiceModuleResult
	})
	local CreationCenter1 = if UseAppPolicyModuleResult then CreationCenter else UseLocalizationModuleResult.chartsTitle
	local Entry = nil
	local IsPageSectionMatch: boolean? = nil
	local UseStateResult = nil
	local Ref = nil
	local v1 = nil
	local UseStateResult2 = nil
	local UseSduiContextFromRoduxAndProcessConfigsResult = nil
	
	if FFlagLuaAppChartsStickyHeader then
		local UseSelectorResult2 = UseSelectorFunction(function(p2)
			-- upvalues: Games (upval)
			return p2.Personalization.OrderedOmniItems[Games]
		end)
		Entry = UseSelectorResult2 and UseSelectorResult2.allItems or T
		IsPageSectionMatch = Entry and (#Entry > 0 and Entry[1].pageSection == OmniFeedPageSection.Header)
		UseStateResult, Ref = ReactModule.useState(nil)
		v1, UseStateResult2 = ReactModule.useState(0)
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult (ref), UseStateResult2 (ref)
			if not UseStateResult then return end
			UseStateResult2(UseStateResult.AbsoluteSize.Y)
			local Connection = UseStateResult:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: UseStateResult2 (upval), UseStateResult (upval)
				UseStateResult2(UseStateResult.AbsoluteSize.Y)
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end, { UseStateResult })
		local UseCollectionLayoutConfigResult = if FFlagLuaAppLayoutParamsInContext then UseCollectionLayoutConfigFunction(UseStateResult) else nil
		UseSduiContextFromRoduxAndProcessConfigsResult = ServerDrivenUiModule.useSduiContextFromRoduxAndProcessConfigs(Games, if FFlagLuaAppLayoutParamsInContext then UseCollectionLayoutConfigResult else nil, `{Games}_Header`)
	end
	local HeaderHeight = if FFlagAppIaHomeSubTab and FlyoutSidePanelIXP.isHomeSubTabEnabled() and FFlagAppIaScrollAway then if p1.screenProps then p1.screenProps.headerHeight else nil elseif AppNavBarModule.getScrollAwayEnabled() then UseSelectorResult1 else nil
	local UseMemoResult = if FFlagLuaAppChartsStickyHeader then ReactModule.useMemo(function()
		-- upvalues: p1 (copy), FFlagAppIaScrollAway (upval), AppNavBarModule (upval), VisibilityControl (upval), UseSelectorResult1 (copy)
		return if p1.screenProps and p1.screenProps.headerHeightBinding then p1.screenProps.headerHeightBinding:map(function(YOffset): UDim2
			return UDim2.fromOffset(0, YOffset)
		end) elseif FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then VisibilityControl.getHeaderBinding():map(function(p2): UDim2
			-- upvalues: UseSelectorResult1 (upval)
			return UDim2.fromOffset(0, p2 * UseSelectorResult1)
		end) else UDim2.fromOffset(0, UseSelectorResult1)
	end, {
		p1.screenProps and p1.screenProps.headerHeightBinding,
		UseSelectorResult1
	}) else nil
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color,
		BackgroundTransparency = Transparency,
		BorderSizePixel = 0,
		[ReactModule.Tag] = if FFlagLuaAppAddTestIdsForArrow then GetTestIdFunction("page-discover") else nil
	}, {
		TopBar = if FFlagAppIaHomeSubTab and FlyoutSidePanelIXP.isHomeSubTabEnabled() then nil else ReactModule.createElement(PersonalizationTopBarModule, {
			tag = if FFlagLuaAppCompositionCharts then CompositionTags.ContentRegion.Header else nil,
			titleText = CreationCenter1,
			useGridPageLayout = if FFlagLuaAppEnableChartsPageProfileLink then UseAppPolicyModuleResult1 else nil,
			profileSource = if FFlagLuaAppEnableChartsPageProfileLink then Sources.ChartsPageSelfWidget else nil,
			sideMarginOverride = if FFlagLuaAppCompositionCharts then 0 else nil,
			zIndexOverride = if FFlagLuaAppChartsStickyHeader then 3 else nil
		}),
		HeaderContent = if FFlagLuaAppChartsStickyHeader and IsPageSectionMatch then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			ref = Ref,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UseMemoResult
		}, {
			Divider = if FFlagLuaAppCompositionCharts then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.fromScale(0.5, 1),
				AnchorPoint = Vector2.new(0.5, 1),
				ZIndex = 2,
				[ReactModule.Tag] = CompositionTags.ContentRegion.Header
			}, {
				Line = ReactModule.createElement(Divider, { orientation = Orientation.Horizontal })
			}) else ReactModule.createElement(Divider, {
				ZIndex = 2,
				orientation = Orientation.Horizontal,
				Position = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 1)
			}),
			OmniFeedView = ReactModule.createElement(OmniFeedViewModule, {
				analyticsContext = "GamesOmniFeed",
				pageContext = Games,
				omniFeedPageSection = OmniFeedPageSection.Header,
				omniFeedItems = Entry,
				impressionsTag = HEADERGAMESFEEDITEMIMPRESSIONS,
				sduiContext = UseSduiContextFromRoduxAndProcessConfigsResult,
				topPadding = UseTokensResult.Gap.Medium,
				bottomPadding = UseTokensResult.Gap.Medium,
				appCompositionEnabled = if FFlagLuaAppCompositionCharts then true else nil,
				contentTag = if FFlagLuaAppCompositionCharts then CompositionTags.ContentRegion.Header else nil
			})
		}) else nil,
		Content = ReactModule.createElement(if FFlagAppIaHomeSubTab and FlyoutSidePanelIXP.isHomeSubTabEnabled() then TopBarModule.PageWrapper else TopBarModule.PageContent, {
			BackgroundColor3 = Color,
			BackgroundTransparency = Transparency,
			ZIndex = if FFlagLuaAppChartsStickyHeader then 1 else nil
		}, {
			GamesOmniFeed = if FFlagAppIaScrollAway then ReactModule.createElement(GamesOmniFeedModule, {
				canvasTopPadding = if FFlagLuaAppChartsStickyHeader then (HeaderHeight or 0) + v1 else HeaderHeight,
				topPadding = if FFlagLuaAppChartsStickyHeader and IsPageSectionMatch then UseTokensResult.Gap.Medium else nil
			}) else ReactModule.createElement(GamesOmniFeedModule, if FFlagLuaAppChartsStickyHeader then {
				topPadding = if IsPageSectionMatch then UseTokensResult.Gap.Medium else nil
			} else nil)
		})
	})
end

return function(p2)
	-- upvalues: ReactModule (copy), v37 (copy)
	return ReactModule.createElement(v37, p2)
end
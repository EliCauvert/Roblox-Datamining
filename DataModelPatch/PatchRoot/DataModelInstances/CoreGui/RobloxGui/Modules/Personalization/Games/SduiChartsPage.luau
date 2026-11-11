local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = require(CorePackages.Packages.Signals)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local CompositionTags = require(CorePackages.Workspace.Packages.AppComposition).CompositionTags
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local AppSessionService = RoactServiceTagsModule.AppSessionService
local AppNotificationService = RoactServiceTagsModule.AppNotificationService
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local GetTestIdFunction = require(CorePackages.Workspace.Packages.RoactUtils).getTestId
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local PersonalizationTopBarModule = require(Modules.Personalization.PersonalizationTopBar)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local UseChartsTitleTextModule = require(Modules.Personalization.Games.useChartsTitleText)
local UseLogSduiChartsExposureModule = require(Modules.Personalization.Games.useLogSduiChartsExposure)
local FlyoutSidePanelIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP
local Sources = require(CorePackages.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources
local ChartsModule = require(CorePackages.Workspace.Packages.Charts)
local ChartsContentEntryPoint = ChartsModule.ChartsContentEntryPoint
local ChartsConstants = ChartsModule.ChartsConstants
local ChartsPageSession = ChartsModule.ChartsPageSession
local SduiSharedUtilitiesModule = require(CorePackages.Workspace.Packages.SduiSharedUtilities)
local UseUiStatusFunction = SduiSharedUtilitiesModule.useUiStatus
local UiStatus = SduiSharedUtilitiesModule.UiStatus
local ServerTriggeredModalsModule = require(CorePackages.Workspace.Packages.ServerTriggeredModals)
local PromptsHandler = ServerTriggeredModalsModule.PromptsHandler
local PromptsEntryPoint = ServerTriggeredModalsModule.PromptsEntryPoint
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaHomeSubTab = SharedFlagsModule.FFlagAppIaHomeSubTab
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagLuaAppEnableChartsPageProfileLink = SharedFlagsModule.FFlagLuaAppEnableChartsPageProfileLink
local FFlagLuaAppAddTestIdsForArrow = SharedFlagsModule.FFlagLuaAppAddTestIdsForArrow
local FFlagLuaAppLogChartsAppPageExposure = SharedFlagsModule.FFlagLuaAppLogChartsAppPageExposure
local FFlagSduiChartsResetSessionOnRefresh = SharedFlagsModule.FFlagSduiChartsResetSessionOnRefresh
local FFlagPromptsHandlerEnabled = game:DefineFastFlag("SduiChartsPagePromptsHandlerEnabled", false) and SharedFlagsModule.FFlagPromptsHandlerEnabled

return function(p1)
	-- upvalues: FFlagLuaAppLogChartsAppPageExposure (copy), UseLogSduiChartsExposureModule (copy), UseRoactServiceFunction (copy), AppSessionService (copy), AppNotificationService (copy), ReactModule (copy), FFlagSduiChartsResetSessionOnRefresh (copy), SessionType (copy), ChartsPageSession (copy), SignalsModule (copy), UseUiStatusFunction (copy), ChartsConstants (copy), UiStatus (copy), FFlagLuaAppEnableChartsPageProfileLink (copy), UseAppPolicyModule (copy), UseTokensFunction (copy), FFlagAppIaHomeSubTab (copy), FlyoutSidePanelIXP (copy), UseChartsTitleTextModule (copy), UseSelectorFunction (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), FFlagLuaAppAddTestIdsForArrow (copy), GetTestIdFunction (copy), PersonalizationTopBarModule (copy), CompositionTags (copy), Sources (copy), TopBarModule (copy), ChartsContentEntryPoint (copy), FFlagPromptsHandlerEnabled (copy), PromptsHandler (copy), PromptsEntryPoint (copy)
	if FFlagLuaAppLogChartsAppPageExposure then
		UseLogSduiChartsExposureModule()
	end
	local UseRoactServiceResult = UseRoactServiceFunction(AppSessionService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppNotificationService)
	ReactModule.useEffect(function()
		-- upvalues: UseRoactServiceResult (copy), FFlagSduiChartsResetSessionOnRefresh (upval), SessionType (upval), ChartsPageSession (upval), SignalsModule (upval)
		if UseRoactServiceResult == nil then
			return nil
		end
		if not FFlagSduiChartsResetSessionOnRefresh then
			UseRoactServiceResult:SetSession(SessionType.StructuralIdentifier.Level1, SessionType.StructuralIdentifier.DiscoverPageSessionInfo, SessionType.StructuralIdentifier.DiscoverPageSessionInfo)
		end
		local Signal = ChartsPageSession:GetSignal()
		
		return SignalsModule.createEffect(function(p2)
			-- upvalues: Signal (copy), FFlagSduiChartsResetSessionOnRefresh (upval), UseRoactServiceResult (upval), SessionType (upval)
			local SignalResult = Signal(p2)
			
			if SignalResult == "" then return end
			if FFlagSduiChartsResetSessionOnRefresh then
				UseRoactServiceResult:SetSession(SessionType.StructuralIdentifier.Level1, SessionType.StructuralIdentifier.DiscoverPageSessionInfo, SessionType.StructuralIdentifier.DiscoverPageSessionInfo)
			end
			UseRoactServiceResult:SetMetadata(SessionType.StructuralIdentifier.DiscoverPageSessionInfo, SessionType.Metadata.DiscoverPage.DiscoverSessionId, SignalResult)
		end)
	end, { UseRoactServiceResult })
	local UseUiStatusResult = UseUiStatusFunction(ChartsConstants.ConfigKey)
	ReactModule.useEffect(function()
		-- upvalues: UseRoactServiceResult1 (copy), UseUiStatusResult (copy), UiStatus (upval)
		if UseRoactServiceResult1 and UseUiStatusResult == UiStatus.Resolved then
			UseRoactServiceResult1:ActionEnabled(Enum.AppShellActionType.GamePageLoaded)
		end
	end, { UseRoactServiceResult1, UseUiStatusResult })
	local UseAppPolicyModuleResult = if FFlagLuaAppEnableChartsPageProfileLink then UseAppPolicyModule(function(p2)
		return p2.useGridPageLayout()
	end) else nil
	local UseTokensResult = UseTokensFunction()
	local SurfaceColor3 = UseTokensResult.Color.Surface.Surface_0.Color3
	local Transparency = UseTokensResult.Color.Surface.Surface_0.Transparency
	local IsHomeSubTabEnabled = FFlagAppIaHomeSubTab and FlyoutSidePanelIXP.isHomeSubTabEnabled()
	local UseChartsTitleTextModuleResult = UseChartsTitleTextModule()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.TopBar.topBarHeight
	end)
	local ScrollAwayEnabled = FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled()
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = SurfaceColor3,
		BackgroundTransparency = Transparency,
		BorderSizePixel = 0,
		[ReactModule.Tag] = if FFlagLuaAppAddTestIdsForArrow then GetTestIdFunction("page-discover") else nil
	}, {
		TopBar = if IsHomeSubTabEnabled then nil else ReactModule.createElement(PersonalizationTopBarModule, {
			sideMarginOverride = 0,
			zIndexOverride = 3,
			tag = CompositionTags.ContentRegion.Header,
			titleText = UseChartsTitleTextModuleResult,
			useGridPageLayout = if FFlagLuaAppEnableChartsPageProfileLink then UseAppPolicyModuleResult else nil,
			profileSource = if FFlagLuaAppEnableChartsPageProfileLink then Sources.ChartsPageSelfWidget else nil
		}),
		Content = ReactModule.createElement(if IsHomeSubTabEnabled then TopBarModule.PageWrapper else TopBarModule.PageContent, {
			ZIndex = 1,
			BackgroundColor3 = SurfaceColor3,
			BackgroundTransparency = Transparency
		}, {
			ChartsContent = ReactModule.createElement(ChartsContentEntryPoint, {
				navigation = p1.navigation,
				pageTopPadding = if IsHomeSubTabEnabled and p1.screenProps then p1.screenProps.headerHeight elseif ScrollAwayEnabled then UseSelectorResult else nil
			})
		}),
		Prompts = if FFlagPromptsHandlerEnabled then ReactModule.createElement(PromptsHandler, { entryPoint = PromptsEntryPoint.ChartsLaunch }) else nil
	})
end
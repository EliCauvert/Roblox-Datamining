local Modules = script:FindFirstAncestor("Modules")
local CorePackages = game:GetService("CorePackages")
local SocialTabUniversalAppWrapperModule = require(script.Parent.SocialTabUniversalAppWrapper)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseEarlyIsFocusedFunction = require(CorePackages.Workspace.Packages.Navigation).useEarlyIsFocused
local UseNavigationPropsFunction = require(CorePackages.Workspace.Packages.RobloxAppNavigation).useNavigationProps
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local UseTTINavigationTrackingFunction = require(CorePackages.Workspace.Packages.TTINavigationTracking).useTTINavigationTracking

return (require(CorePackages.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).RoduxTools.compose(require(CorePackages.Packages.RoactRodux).connect(require(script.Parent.mapStateToProps), (require(script.Parent.mapDispatchToProps))), require(CorePackages.Workspace.Packages.RoactServices).RoactServices.connect({
	analytics = require(Modules.LuaApp.Services.RoactAnalyticsAppStageLoaded),
	guiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService,
	notificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService,
	userInputService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppUserInputService,
	roactAnalytics = require(Modules.LuaApp.Services.RoactAnalytics),
	eventIngestService = require(Modules.LuaApp.Services.AppEventIngestService)
}))(function(p1)
	-- upvalues: SharedFlagsModule (copy), UseTTINavigationTrackingFunction (copy), UseNavigationFunction (copy), UseEarlyIsFocusedFunction (copy), UseNavigationPropsFunction (copy), UseDesignTokensFunction (copy), UseUiModeInfoFunction (copy), UiMode (copy), FFlagSignalsNavP3hMisc (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), RoactModule (copy), SocialTabUniversalAppWrapperModule (copy), CryoModule (copy)
	if SharedFlagsModule.FFlagLuaAppNavigationTTITracking then
		UseTTINavigationTrackingFunction("NavigateTo_Chat")
	end
	local UseDesignTokensResult = UseDesignTokensFunction()
	local config = {
		isVisible = UseEarlyIsFocusedFunction(),
		parameters = UseNavigationPropsFunction(function(ConversationId)
			return if ConversationId then { conversationId = ConversationId } else nil
		end),
		pageType = UseNavigationFunction().state.routeName,
		BackgroundColor = UseDesignTokensResult.LuaApps.App.Page.BackgroundColor,
		BackgroundTransparency = UseDesignTokensResult.LuaApps.App.Page.BackgroundTransparency,
		useFullScalePage = UseUiModeInfoFunction().uiMode == UiMode.TenFoot
	}
	
	if FFlagSignalsNavP3hMisc then
		local UseSignalStateResult = UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
		config.currentAppPage = UseSignalStateResult and (UseSignalStateResult[#UseSignalStateResult] and UseSignalStateResult[#UseSignalStateResult].name)
		config.canGoBack = UseSignalStateResult and #UseSignalStateResult > 1
	end
	return RoactModule.createElement(SocialTabUniversalAppWrapperModule, CryoModule.Dictionary.join(p1, config))
end))
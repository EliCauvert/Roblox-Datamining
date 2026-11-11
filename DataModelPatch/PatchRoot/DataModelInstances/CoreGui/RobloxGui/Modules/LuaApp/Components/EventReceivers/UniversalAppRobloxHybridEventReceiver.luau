local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppBrowserService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppBrowserService
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local AppGame = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGame
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local ExternalEventConnectionModule = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local LocalStorageKey = require(CorePackages.Workspace.Packages.LocalStorage).Enums.LocalStorageKey
local LaunchGameFunction = require(CorePackages.Workspace.Packages.GameLaunch).LaunchGame
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local AppPageModule = require(Modules.LuaApp.AppPage)
local ChatEntryPointNames = require(CorePackages.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames
local EnteredChatFromEntryPointModule = require(CorePackages.Workspace.Packages.AppChat.EnteredChatFromEntryPoint)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local NavigateFromWebViewModule = require(Modules.LuaApp.Thunks.NavigateFromWebView)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local AuthSessionRefreshFunction = require(CorePackages.Workspace.Packages.AuthCommon).Http.Requests.AuthSessionRefresh
local FFlagRefreshAuthSessionAfterLanguageChange = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRefreshAuthSessionAfterLanguageChange
local PushPermissionTriggerEnabled = game:DefineFastFlag("PushPermissionTriggerEnabled", false)
local GetFFlagEnableUnifiedWebViewsFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableUnifiedWebViews
local PurchasingPerformanceModule = require(CorePackages.Workspace.Packages.PurchasingPerformance)
local BuyRobuxPageTTIManager = PurchasingPerformanceModule.BuyRobuxPageTTIManager
local Bridge = PurchasingPerformanceModule.Bridge
local FFlagEnableBuyRobuxPageTTI = PurchasingPerformanceModule.Flags.FFlagEnableBuyRobuxPageTTI
local UniversalAppRobloxHybridEventReceiver = RoactModule.Component:extend("UniversalAppRobloxHybridEventReceiver")
UniversalAppRobloxHybridEventReceiver.defaultProps = {
	webViewService = if GetFFlagEnableUnifiedWebViewsFunction() then game:GetService("WebViewService") else nil
}

function UniversalAppRobloxHybridEventReceiver.init(p1)
	-- upvalues: HttpService (copy), GetFFlagEnableUnifiedWebViewsFunction (copy), ChatEntryPointNames (copy), NotificationTypeModule (copy), AppPageModule (copy), UrlBuilderModule (copy), FFlagEnableBuyRobuxPageTTI (copy), Bridge (copy), BuyRobuxPageTTIManager (copy), LaunchGameFunction (copy), AppStorageService (copy), LocalStorageKey (copy), FFlagRefreshAuthSessionAfterLanguageChange (copy), AuthSessionRefreshFunction (copy), PushPermissionTriggerEnabled (copy)
	function p1.onJavascriptCallback(Input)
		-- upvalues: HttpService (upval), GetFFlagEnableUnifiedWebViewsFunction (upval), p1 (copy), ChatEntryPointNames (upval), NotificationTypeModule (upval), AppPageModule (upval), UrlBuilderModule (upval), FFlagEnableBuyRobuxPageTTI (upval), Bridge (upval), BuyRobuxPageTTIManager (upval), LaunchGameFunction (upval), AppStorageService (upval), LocalStorageKey (upval), FFlagRefreshAuthSessionAfterLanguageChange (upval), AuthSessionRefreshFunction (upval), PushPermissionTriggerEnabled (upval)
		local Data = HttpService:JSONDecode(Input)
		
		if Data.moduleID == "Navigation" and Data.functionName == "startWebChatConversation" and Data.params.userId then
			if not GetFFlagEnableUnifiedWebViewsFunction() then
				p1.props.browserService:CloseBrowserWindow()
			end
			p1.props.enteredChatFromEntryPoint(ChatEntryPointNames.AppShellWebView)
			p1.props.guiService:BroadcastNotification(tostring(Data.params.userId), NotificationTypeModule.LAUNCH_CONVERSATION)
			
			return
		elseif Data.moduleID ~= "Navigation" or Data.functionName ~= "openUserProfile" or not Data.params.userId then
			if Data.moduleID ~= "Navigation" or Data.functionName ~= "navigateToFeature" or not Data.params.params.urlPath then
				if FFlagEnableBuyRobuxPageTTI and Data.moduleID == Bridge.MODULE_ID and Data.functionName == Bridge.FUNCTION_NAME and Data.params.params and Data.params.params.feature == Bridge.FEATURE then
					BuyRobuxPageTTIManager.handleBridgePayload(Data.params.params)
					
					return
				end
				if Data.moduleID == "Navigation" and Data.functionName == "navigateToFeature" and Data.params.params.deepLinkUrlPath then
					p1.props.linking:detectURL(Data.params.params.deepLinkUrlPath)
					
					return
				end
				if Data.moduleID == "Game" and Data.functionName == "launchGame" and Data.params.request.placeId then
					p1.props.navigateBack()
					
					if GetFFlagEnableUnifiedWebViewsFunction() then
						p1.props.webViewService:CloseWindow()
					else
						p1.props.browserService:CloseBrowserWindow()
					end
					LaunchGameFunction(Data.params.request.placeId, "GameDetailPageJSHybridEvent", {
						accessCode = Data.params.request.accessCode,
						gameInstanceId = Data.params.request.instanceId,
						linkCode = Data.params.request.linkCode,
						joinAttemptId = Data.params.request.joinAttemptId,
						joinAttemptOrigin = Data.params.request.joinAttemptOrigin
					}, p1.props.game, Data.params.request.joinAttemptOrigin, nil)
					
					return
				elseif Data.moduleID == "Game" and Data.functionName == "launchGame" and Data.params.request.requestType == "RequestFollowUser" then
					p1.props.navigateBack()
					
					if GetFFlagEnableUnifiedWebViewsFunction() then
						p1.props.webViewService:CloseWindow()
					else
						p1.props.browserService:CloseBrowserWindow()
					end
					LaunchGameFunction(nil, "FollowUserJSHybridEvent", {
						userId = Data.params.request.userId,
						joinAttemptId = Data.params.request.joinAttemptId,
						joinAttemptOrigin = Data.params.request.joinAttemptOrigin
					}, p1.props.game, Data.params.request.joinAttemptOrigin, nil)
					
					return
				elseif Data.moduleID == "Localization" and Data.functionName == "languageChangeTrigger" then
					p1.props.navigateBack()
					
					if GetFFlagEnableUnifiedWebViewsFunction() then
						p1.props.webViewService:CloseWindow()
					else
						p1.props.browserService:CloseBrowserWindow()
					end
					local NewRobloxLanguageValue = Data.params.newRobloxLanguageValue
					
					if typeof(NewRobloxLanguageValue) == "table" then
						NewRobloxLanguageValue = NewRobloxLanguageValue.locale
					end
					AppStorageService:SetItem(LocalStorageKey.RobloxLocaleId, (string.gsub(NewRobloxLanguageValue, "_", "-")))
					
					if FFlagRefreshAuthSessionAfterLanguageChange then
						AuthSessionRefreshFunction(p1.props.networkImpl):finally(function()
							-- upvalues: p1 (upval), NotificationTypeModule (upval)
							p1.props.guiService:BroadcastNotification("", NotificationTypeModule.RESTART_LUA_APP)
						end)
						
						return
					else
						p1.props.guiService:BroadcastNotification("", NotificationTypeModule.RESTART_LUA_APP)
						
						return
					end
				elseif PushPermissionTriggerEnabled and Data.moduleID == "Push" and Data.functionName == "pushPermissionTrigger" then
					p1.props.guiService:BroadcastNotification(Data.moduleID, NotificationTypeModule.APP_READY)
					
					return
				else
					if Data.moduleID == "Overlay" and Data.functionName == "close" then
						p1.props.navigateBack()
						
						if GetFFlagEnableUnifiedWebViewsFunction() then
							p1.props.webViewService:CloseWindow()
							
							return
						end
						p1.props.browserService:CloseBrowserWindow()
					end
					return
				end
			elseif GetFFlagEnableUnifiedWebViewsFunction() then
				p1.props.navigateFromWebView({
					name = AppPageModule.GenericWebPage,
					detail = UrlBuilderModule.fromString("www:" .. Data.params.params.urlPath)(),
					extraProps = { title = Data.params.params.feature or "" }
				})
				
				return
			else
				local FromStringResult = UrlBuilderModule.fromString("www:" .. Data.params.params.urlPath)
				p1.props.browserService:CloseBrowserWindow()
				p1.props.navigateDown({
					name = AppPageModule.GenericWebPage,
					detail = FromStringResult(),
					extraProps = { title = Data.params.params.feature or "" }
				})
				
				return
			end
		elseif GetFFlagEnableUnifiedWebViewsFunction() then
			p1.props.navigateFromWebView({
				name = AppPageModule.ViewUserProfile,
				detail = Data.params.userId
			})
			
			return
		else
			p1.props.browserService:CloseBrowserWindow()
			p1.props.navigateDown({
				name = AppPageModule.ViewUserProfile,
				detail = Data.params.userId
			})
		end
	end
end

function UniversalAppRobloxHybridEventReceiver.render(p1)
	-- upvalues: RoactModule (copy), ExternalEventConnectionModule (copy), GetFFlagEnableUnifiedWebViewsFunction (copy)
	return RoactModule.createElement(ExternalEventConnectionModule, {
		event = if GetFFlagEnableUnifiedWebViewsFunction() then p1.props.webViewService.OnJavaScriptCall else p1.props.browserService.JavaScriptCallback,
		callback = p1.onJavascriptCallback
	})
end

return (RoactServices.connect({
	browserService = if GetFFlagEnableUnifiedWebViewsFunction() then nil else AppBrowserService,
	guiService = AppGuiService,
	networkImpl = if FFlagRefreshAuthSessionAfterLanguageChange then RoactNetworking else nil,
	game = AppGame,
	linking = AppLinking
})((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), NavigateBackModule (copy), NavigateFromWebViewModule (copy), EnteredChatFromEntryPointModule (copy)
	return {
		navigateDown = if GetFFlagEnableUnifiedWebViewsFunction() then nil else function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateDownModule(p1))
		end,
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else Callback(NavigateBackModule())
		end,
		navigateFromWebView = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateFromWebViewModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.fromWebView(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateFromWebViewModule(p1))
		end,
		enteredChatFromEntryPoint = function(p1)
			-- upvalues: Callback (copy), EnteredChatFromEntryPointModule (upval)
			return Callback(EnteredChatFromEntryPointModule(p1))
		end
	}
end)(UniversalAppRobloxHybridEventReceiver))))
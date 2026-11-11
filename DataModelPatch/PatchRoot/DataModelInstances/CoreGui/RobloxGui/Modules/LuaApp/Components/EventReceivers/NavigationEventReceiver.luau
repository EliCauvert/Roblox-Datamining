local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local AppNotificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService
local _ = require(CorePackages.Workspace.Packages.Navigation)
local AndroidTVExitButtonManager = require(CorePackages.Workspace.Packages.RobloxAppNavigationCore).AndroidTVExitButtonManager
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local SelectCurrentRoactNavigationRoute = Selectors.selectCurrentRoactNavigationRoute
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local ExperienceEventReceiverModule = require(Modules.LuaApp.ExperienceEventReceiver)
local LuaPageLoadModule = require(Modules.LuaApp.Analytics.Events.luaPageLoad)
local LuaPageUnloadModule = require(Modules.LuaApp.Analytics.Events.luaPageUnload)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AppPageModule = require(Modules.LuaApp.AppPage)
local AppPagePropertiesModule = require(Modules.LuaApp.AppPageProperties)
local NavigateToRouteModule = require(Modules.LuaApp.Thunks.NavigateToRoute)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local NavigateIntoChatThunkModule = require(CorePackages.Workspace.Packages.AppChat.NavigateIntoChatThunk)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local SetPreloadingModule = require(Modules.LuaApp.Actions.SetPreloading)
local UniversalAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy
local GetFStringLuaAppUnloadEventEnabledPageNamesModule = require(Modules.LuaApp.Flags.GetFStringLuaAppUnloadEventEnabledPageNames)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagShareTargetGameCleanup = SharedFlagsModule.FFlagShareTargetGameCleanup
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagAndroidTVExitWithB = SharedFlagsModule.FFlagAndroidTVExitWithB
local FFlagSignalsNavP3cEvents = SharedFlagsModule.FFlagSignalsNavP3cEvents
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStoreFunction = require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

local function _(NotificationService, p1)
	-- upvalues: AppPagePropertiesModule (copy)
	local AppPagePropertiesModuleEntry = AppPagePropertiesModule[p1]
	NotificationService:SwitchedToAppShellFeature((if AppPagePropertiesModuleEntry then AppPagePropertiesModuleEntry.appShellReporterFeature else AppPagePropertiesModuleEntry) or Enum.AppShellFeature.None)
end

local _ = function(p1)
	return if p1 == nil then nil else p1.routeName
end

local _ = function(p1)
	return if p1 == nil or p1.params == nil then nil else p1.params.detail
end

local _ = function(): boolean
	-- upvalues: GetFStringLuaAppUnloadEventEnabledPageNamesModule (copy)
	return #GetFStringLuaAppUnloadEventEnabledPageNamesModule() > 0
end

local function usePageLoadEvents()
	-- upvalues: UseRoactServiceFunction (copy), AppEventIngestServiceModule (copy), AppNotificationService (copy), FFlagSignalsNavP3cEvents (copy), UseSignalStateFunction (copy), GetLegacyNavigationStoreFunction (copy), UseSelectorFunction (copy), SelectCurrentRoactNavigationRoute (copy), ReactModule (copy), GetFStringLuaAppUnloadEventEnabledPageNamesModule (copy), ExperienceEventReceiverModule (copy), LuaPageUnloadModule (copy), LuaPageLoadModule (copy), AppPagePropertiesModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestServiceModule)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppNotificationService)
	local UseSignalStateResult = nil
	UseSignalStateResult = if FFlagSignalsNavP3cEvents then UseSignalStateFunction(GetLegacyNavigationStoreFunction(false).getCurrentRoute) else UseSelectorFunction(SelectCurrentRoactNavigationRoute)
	local Current = UseSignalStateResult
	local RouteName = if Current == nil then nil else Current.routeName
	local Current1 = UseSignalStateResult
	local Detail = if Current1 == nil or Current1.params == nil then nil else Current1.params.detail
	local UseStateResult, UseStateResult2 = ReactModule.useState(os.clock())
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetFStringLuaAppUnloadEventEnabledPageNamesModule (upval), ExperienceEventReceiverModule (upval)
		return if #GetFStringLuaAppUnloadEventEnabledPageNamesModule() > 0 then ExperienceEventReceiverModule.new() else nil
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), LuaPageUnloadModule (upval), UseRoactServiceResult (copy), RouteName (copy), Detail (copy), UseStateResult (copy), UseStateResult2 (copy), LuaPageLoadModule (upval)
		if UseMemoResult == nil then return end
		local OnLaunchedResult = UseMemoResult:onLaunched(function(p1)
			-- upvalues: LuaPageUnloadModule (upval), UseRoactServiceResult (upval), RouteName (upval), Detail (upval), UseStateResult (upval), UseStateResult2 (upval)
			local ClockTime = os.clock()
			LuaPageUnloadModule(UseRoactServiceResult, "AppRouter", RouteName, Detail, {
				nextPage = "Experience",
				nextDetail = p1.placeId,
				timeOnPage = ClockTime - UseStateResult
			})
			UseStateResult2(ClockTime)
		end)
		local OnLeftResult = UseMemoResult:onLeft(function(p1)
			-- upvalues: LuaPageLoadModule (upval), UseRoactServiceResult (upval), RouteName (upval), Detail (upval), UseStateResult2 (upval)
			LuaPageLoadModule(UseRoactServiceResult, "AppRouter", RouteName, Detail, { previousPage = "Experience", previousDetail = p1.placeId })
			UseStateResult2(os.clock())
		end)
		
		return function()
			-- upvalues: OnLaunchedResult (copy), OnLeftResult (copy)
			OnLaunchedResult:disconnect()
			OnLeftResult:disconnect()
		end
	end, { UseMemoResult, UseRoactServiceResult, RouteName, Detail })
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), LuaPageLoadModule (upval), UseRoactServiceResult (copy), RouteName (copy), Detail (copy), LuaPageUnloadModule (upval), UseStateResult (copy), UseSignalStateResult (ref), UseRoactServiceResult1 (copy), AppPagePropertiesModule (upval), UseStateResult2 (copy)
		local Current = UseRefResult.current
		local RouteName1 = if Current == nil then nil else Current.routeName
		local Current1 = UseRefResult.current
		local Detail1 = if Current1 == nil or Current1.params == nil then nil else Current1.params.detail
		LuaPageLoadModule(UseRoactServiceResult, "AppRouter", RouteName, Detail, { previousPage = RouteName1, previousDetail = Detail1 })
		local ClockTime = os.clock()
		
		if UseRefResult.current ~= nil then
			LuaPageUnloadModule(UseRoactServiceResult, "AppRouter", RouteName1, Detail1, {
				nextPage = RouteName,
				nextDetail = Detail,
				timeOnPage = ClockTime - UseStateResult
			})
		end
		UseRefResult.current = UseSignalStateResult
		local AppPagePropertiesModuleEntry = AppPagePropertiesModule[RouteName]
		UseRoactServiceResult1:SwitchedToAppShellFeature((if AppPagePropertiesModuleEntry then AppPagePropertiesModuleEntry.appShellReporterFeature else AppPagePropertiesModuleEntry) or Enum.AppShellFeature.None)
		UseStateResult2(ClockTime)
	end, { RouteName, Detail })
end

local NavigationEventReceiver = ReactModule.Component:extend("NavigationEventReceiver")

function NavigationEventReceiver.handleBackButtonPressed(p1)
	-- upvalues: AppPageModule (copy), FFlagShareTargetGameCleanup (copy), AppPagePropertiesModule (copy), GuiService (copy), NotificationTypeModule (copy)
	local CountCurrentRoute = #p1.props.currentRoute
	local Name = p1.props.currentRoute[CountCurrentRoute].name
	
	if p1.props.currentRoute[1].name == AppPageModule.Chat and Name ~= AppPageModule.GameDetail and (if FFlagShareTargetGameCleanup then true else Name ~= AppPageModule.ShareGameToChat) then return end
	if AppPagePropertiesModule[Name] and AppPagePropertiesModule[Name].disableBackButton then return end
	if p1.props.centralOverlayType then
		if not p1.props.centralOverlayDisableBackButtonClose then
			p1.props.closeCentralOverlay()
		end
		return
	elseif CountCurrentRoute > 1 then
		p1.props.navigateBack()
		
		return
	else
		GuiService:BroadcastNotification("", NotificationTypeModule.BACK_BUTTON_NOT_CONSUMED)
	end
end

function NavigationEventReceiver.init(p1)
	-- upvalues: FFlagAndroidTVExitWithB (copy), AndroidTVExitButtonManager (copy), AppPageModule (copy), AvatarScreen (copy), GuiService (copy), ToastTypeModule (copy)
	local RobloxEventReceiver = p1.props.RobloxEventReceiver
	
	function p1.getShouldBlockDeeplink(): boolean
		-- upvalues: p1 (copy)
		return not (p1.props.getCanSeeChatTab and p1.props.getCanSeeChatTab())
	end
	
	if FFlagAndroidTVExitWithB then
		p1.tvExitDisconnect = AndroidTVExitButtonManager.register(function()
			-- upvalues: p1 (copy)
			p1:handleBackButtonPressed()
		end)
	end
	p1.tokens = {
		RobloxEventReceiver:observeEvent("Navigations", function(p2, p3)
			-- upvalues: AppPageModule (upval), p1 (copy), AvatarScreen (upval)
			if p3 == "Destination" or p3 == "Reload" then
				if p2.appName == AppPageModule.ShareGameToChat then
					p1.props.navigateDown({
						name = AppPageModule.ShareGameToChat,
						detail = p2.parameters.placeId
					})
					
					return
				end
				if p2.appName == AppPageModule.Chat then
					if not p1.getShouldBlockDeeplink() then
						p1.props.setPage({
							name = AppPageModule.Chat,
							detail = p2.parameters and p2.parameters.conversationId
						})
						
						return
					end
					return
				elseif p2.appName == AvatarScreen.AvatarEditor then
					p1.props.resetNavigationHistory({
						{ { name = AvatarScreen.AvatarExperienceLandingPage } },
						{
							{ name = AvatarScreen.AvatarExperienceLandingPage },
							{ name = AvatarScreen.AvatarEditor }
						}
					})
					
					return
				else
					p1.props.setPage({ name = AppPageModule[p2.appName] or AppPageModule.None })
				end
			end
		end),
		GuiService.ShowLeaveConfirmation:Connect(function()
			-- upvalues: p1 (copy)
			p1:handleBackButtonPressed()
		end),
		RobloxEventReceiver:observeEvent("AppShellNotifications", function(ConversationId, p2)
			-- upvalues: p1 (copy)
			if p2 == "StartConversationWithUserId" then
				if not p1.getShouldBlockDeeplink() then
					p1.props.navigateIntoChat({ userId = ConversationId })
					
					return
				end
				return
			elseif p2 == "StartConversationWithId" then
				if not p1.getShouldBlockDeeplink() then
					p1.props.navigateIntoChat({ conversationId = ConversationId })
					
					return
				end
				return
			elseif p2 == "Preloading" then
				p1.props.setPreloading(ConversationId == "true")
			end
		end),
		RobloxEventReceiver:observeEvent("QrCodeScanResult", function(_, p2)
			-- upvalues: p1 (copy), ToastTypeModule (upval)
			if p2 == "Cancelled" then
				p1.props.navigateBack()
				
				return
			else
				p1.props.navigateBack()
				p1.props.setCurrentToast({
					toastMessage = "Feature.Toast.ScanQrCodeError.UnrecognizableQrCode",
					toastType = ToastTypeModule.NetworkingError
				})
			end
		end)
	}
end

function NavigationEventReceiver:render() end

function NavigationEventReceiver.willUnmount(p1)
	-- upvalues: FFlagAndroidTVExitWithB (copy)
	for _, token in pairs(p1.tokens) do
		token:disconnect()
	end
	if FFlagAndroidTVExitWithB and p1.tvExitDisconnect then
		p1.tvExitDisconnect()
		p1.tvExitDisconnect = nil
	end
end

local v1: (any) -> any = RoactRoduxModule.connect(function(p2, _)
	-- upvalues: FFlagSignalsNavP3cEvents (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	return {
		currentRoute = if FFlagSignalsNavP3cEvents then nil elseif FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p2) else p2.Navigation.history[#p2.Navigation.history],
		centralOverlayType = p2.CentralOverlay.OverlayType,
		centralOverlayDisableBackButtonClose = p2.CentralOverlay.Configs.DisableBackButtonClose
	}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateToRouteModule (copy), NavigateDownModule (copy), NavigateBackModule (copy), CloseCentralOverlayModule (copy), ResetNavigationHistoryModule (copy), SetCurrentToastMessageModule (copy), NavigateIntoChatThunkModule (copy), SetPreloadingModule (copy)
	return {
		setPage = function(p2)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateToRouteModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.to(NavigationCommands.fromLegacyPage(p2), true) else Callback(NavigateToRouteModule({ p2 }, true))
		end,
		navigateDown = function(p2)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p2), true) else Callback(NavigateDownModule(p2, true))
		end,
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back(true) else Callback(NavigateBackModule(true))
		end,
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end,
		resetNavigationHistory = function(p2)
			-- upvalues: Callback (copy), ResetNavigationHistoryModule (upval)
			return Callback(ResetNavigationHistoryModule(nil, p2))
		end,
		setCurrentToast = function(p2)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval)
			Callback(SetCurrentToastMessageModule(p2))
		end,
		navigateIntoChat = function(p2)
			-- upvalues: Callback (copy), NavigateIntoChatThunkModule (upval)
			return Callback(NavigateIntoChatThunkModule(p2, false))
		end,
		setPreloading = function(p2)
			-- upvalues: Callback (copy), SetPreloadingModule (upval)
			Callback(SetPreloadingModule(p2))
		end
	}
end)(NavigationEventReceiver)

if FFlagSignalsNavP3cEvents then
	local CryoModule = require(CorePackages.Packages.Cryo)
	local v2 = v1
	
	v1 = function(p2)
		-- upvalues: GetLegacyNavigationStoreFunction (copy), UseSignalStateFunction (copy), ReactModule (copy), v2 (copy), CryoModule (copy)
		return ReactModule.createElement(v2, CryoModule.Dictionary.union(p2, {
			currentRoute = UseSignalStateFunction(GetLegacyNavigationStoreFunction(false).getCurrentLegacyRoute)
		}))
	end
end
local v3 = UniversalAppPolicy.connect(function(p2)
	return { getCanSeeChatTab = p2.getCanSeeChatTab }
end)(v1)

return function(p2)
	-- upvalues: usePageLoadEvents (copy), ReactModule (copy), v3 (ref)
	usePageLoadEvents()
	
	return ReactModule.createElement(v3, p2)
end
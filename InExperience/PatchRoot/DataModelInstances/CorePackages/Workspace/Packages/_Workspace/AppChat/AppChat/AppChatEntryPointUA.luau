local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appBloxModule = require(parent.AppBlox)
local appCommonLibModule = require(parent.AppCommonLib)
local appTabBarRoduxModule = require(parent.AppTabBarRodux)
local cryoModule = require(parent.Cryo)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local sharedFlagsModule = require(parent.SharedFlags)
local socialCommonModule = require(parent.SocialCommon)
local UIBloxModule = require(parent.UIBlox)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local appNotificationService = roactServiceTagsModule.AppNotificationService
local fullscreenPageWithSafeArea = appBloxModule.FullscreenPageWithSafeArea
local setTabBarVisibleFromChat = appTabBarRoduxModule.Thunks.SetTabBarVisibleFromChat
local signal = appCommonLibModule.Signal
local squadAppChatEventReceiver = require(parent.SquadsCore.Components).SquadAppChatEventReceiver
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local useCallback = reactModule.useCallback
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEarlyIsFocused = navigationModule.useEarlyIsFocused
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useNavigation = navigationModule.useNavigation
local useRoactService = robloxAppHooksModule.useRoactService
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useState = reactModule.useState
local useStyle = UIBloxModule.Core.Style.useStyle
local useIsWideMode = socialCommonModule.Hooks.useIsWideMode
local appChatEntryPointModule = require(appChat.AppChatEntryPoint)
local chatEventReceiverModule = require(appChat.Components.EventReceivers.ChatEventReceiver)
local containerModule = require(appChat.Components.ExternalNavigationHandler.Container)
local toggleChatPausedModule = require(appChat.Actions.ToggleChatPaused)
local useExternalNavigationByScreenModule = require(appChat.Hooks.useExternalNavigationByScreen)
local useAppChatIsWideModeModule = require(appChat.Hooks.useAppChatIsWideMode)
local fFlagAppChatRemoveToggleChatPaused = sharedFlagsModule.FFlagAppChatRemoveToggleChatPaused
local fFlagSquadAppChatRTNFix = sharedFlagsModule.FFlagSquadAppChatRTNFix
local fFlagAppChatInExpSelectChatMembersMobileHeightModule = require(appChat.Flags.FFlagAppChatInExpSelectChatMembersMobileHeight)
local t = {}

function AppChatEntryPointUA(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useDispatch (ref), useEarlyIsFocused (ref), fFlagAppChatInExpSelectChatMembersMobileHeightModule (ref), useAppChatIsWideModeModule (ref), useIsWideMode (ref), useNavigation (ref), useAppPolicy (ref), useState (ref), useExternalNavigationByScreenModule (ref), useRoactService (ref), appNotificationService (ref), useMemo (ref), signal (ref), useCallback (ref), setTabBarVisibleFromChat (ref), useSelector (ref), fFlagAppChatRemoveToggleChatPaused (ref), useEffect (ref), toggleChatPausedModule (ref), reactModule (ref), fullscreenPageWithSafeArea (ref), appChatEntryPointModule (ref), containerModule (ref), chatEventReceiverModule (ref), fFlagSquadAppChatRTNFix (ref), squadAppChatEventReceiver (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useStyle()
	local var3 = useDispatch()
	local var4 = useEarlyIsFocused()
	local var5 = if fFlagAppChatInExpSelectChatMembersMobileHeightModule then useAppChatIsWideModeModule(false) else useIsWideMode()
	local var6 = useNavigation()
	local var7 = useAppPolicy(function(p2)
		return {
			shouldSystemBarUsuallyBePresent = p2.getShouldSystemBarUsuallyBePresent()
		}
	end)
	local var8, var9 = useState(0)
	local var10, var11 = useExternalNavigationByScreenModule()
	local var12 = useRoactService(appNotificationService)
	local var13 = useMemo(function()
		-- upvalues: signal (copy)
		return signal.new()
	end)
	local var14 = useMemo(function()
		-- upvalues: var1 (ref), var12 (ref)
		return var1.RobloxEventReceiver.new(var12)
	end)
	local var15 = useCallback(function(p2)
		-- upvalues: var3 (ref), setTabBarVisibleFromChat (copy), var7 (ref)
		var3(setTabBarVisibleFromChat(p2 or var7.shouldSystemBarUsuallyBePresent))
	end, { var3, var7.shouldSystemBarUsuallyBePresent })
	local var16 = useMemo(function()
		return {}
	end)
	local var17 = useSelector(function(p2)
		return p2.NotificationBadgeCounts.TopBarNotificationIcon
	end)
	
	if not fFlagAppChatRemoveToggleChatPaused then
		useEffect(function()
			-- upvalues: var3 (ref), toggleChatPausedModule (copy), var4 (ref)
			var3(toggleChatPausedModule(not var4))
		end, { var4, var3 })
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		FullscreenPageWithSafeArea = reactModule.createElement(fullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = var2.Theme.BackgroundDefault.Color,
			BackgroundTransparency = var2.Theme.BackgroundDefault.Transparency
		}, {
			AppChatEntryPoint = reactModule.createElement(appChatEntryPointModule, {
				setActiveConversationId = var9,
				updateExternalNavigationForScreen = var11,
				navigateToLuaAppPages = var16,
				rnBypassActionSignal = var13,
				notificationCount = var17,
				setTabBarVisible = var15,
				isVisible = var4,
				wideMode = var5,
				navigation = var6
			})
		}),
		ExternalNavigationHandler = reactModule.createElement(containerModule, { navigationByScreen = var10 }),
		ChatEventReceiver = reactModule.createElement(chatEventReceiverModule, {
			robloxEventReceiver = var14,
			rnBypassActionSignal = var13,
			activeConversationId = tostring(var8)
		}),
		SquadAppChatEventReceiver = if fFlagSquadAppChatRTNFix then reactModule.createElement(squadAppChatEventReceiver) else nil
	})
end

return AppChatEntryPointUA
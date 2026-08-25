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

function AppChatEntryPointUA(p0)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useDispatch (ref), useEarlyIsFocused (ref), fFlagAppChatInExpSelectChatMembersMobileHeightModule (ref), useAppChatIsWideModeModule (ref), useIsWideMode (ref), useNavigation (ref), useAppPolicy (ref), useState (ref), useExternalNavigationByScreenModule (ref), useRoactService (ref), appNotificationService (ref), useMemo (ref), signal (ref), useCallback (ref), setTabBarVisibleFromChat (ref), useSelector (ref), fFlagAppChatRemoveToggleChatPaused (ref), useEffect (ref), toggleChatPausedModule (ref), reactModule (ref), fullscreenPageWithSafeArea (ref), appChatEntryPointModule (ref), containerModule (ref), chatEventReceiverModule (ref), fFlagSquadAppChatRTNFix (ref), squadAppChatEventReceiver (ref)
	local var22 = cryoModule.Dictionary.join(t, p0)
	local var23 = useStyle()
	local var24 = useDispatch()
	local var25 = useEarlyIsFocused()
	local var26 = if fFlagAppChatInExpSelectChatMembersMobileHeightModule then useAppChatIsWideModeModule(false) else useIsWideMode()
	local var27 = useNavigation()
	local var28 = useAppPolicy(function(p1)
		return {
			shouldSystemBarUsuallyBePresent = p1.getShouldSystemBarUsuallyBePresent()
		}
	end)
	local var29, var30 = useState(0)
	local var31, var32 = useExternalNavigationByScreenModule()
	local var33 = useRoactService(appNotificationService)
	local var34 = useMemo(function()
		-- upvalues: signal (copy)
		return signal.new()
	end)
	local var35 = useMemo(function()
		-- upvalues: var22 (ref), var33 (ref)
		return var22.RobloxEventReceiver.new(var33)
	end)
	local var36 = useCallback(function(p2)
		-- upvalues: var24 (ref), setTabBarVisibleFromChat (copy), var28 (ref)
		var24(setTabBarVisibleFromChat(p2 or var28.shouldSystemBarUsuallyBePresent))
	end, { var24, var28.shouldSystemBarUsuallyBePresent })
	local var37 = useMemo(function()
		return {}
	end)
	local var38 = useSelector(function(p3)
		return p3.NotificationBadgeCounts.TopBarNotificationIcon
	end)
	
	if not fFlagAppChatRemoveToggleChatPaused then
		useEffect(function()
			-- upvalues: var24 (ref), toggleChatPausedModule (copy), var25 (ref)
			var24(toggleChatPausedModule(not var25))
		end, { var25, var24 })
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		FullscreenPageWithSafeArea = reactModule.createElement(fullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = var23.Theme.BackgroundDefault.Color,
			BackgroundTransparency = var23.Theme.BackgroundDefault.Transparency
		}, {
			AppChatEntryPoint = reactModule.createElement(appChatEntryPointModule, {
				setActiveConversationId = var30,
				updateExternalNavigationForScreen = var32,
				navigateToLuaAppPages = var37,
				rnBypassActionSignal = var34,
				notificationCount = var38,
				setTabBarVisible = var36,
				isVisible = var25,
				wideMode = var26,
				navigation = var27
			})
		}),
		ExternalNavigationHandler = reactModule.createElement(containerModule, { navigationByScreen = var31 }),
		ChatEventReceiver = reactModule.createElement(chatEventReceiverModule, {
			robloxEventReceiver = var35,
			rnBypassActionSignal = var34,
			activeConversationId = tostring(var29)
		}),
		SquadAppChatEventReceiver = if fFlagSquadAppChatRTNFix then reactModule.createElement(squadAppChatEventReceiver) else nil
	})
end

return AppChatEntryPointUA
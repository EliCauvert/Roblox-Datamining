local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local NavigationModule = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local AppNotificationService = require(Parent.RoactServiceTags).AppNotificationService
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local SetTabBarVisibleFromChatFunction = require(Parent.AppTabBarRodux).Thunks.SetTabBarVisibleFromChat
local Signal = require(Parent.AppCommonLib).Signal
local SquadAppChatEventReceiver = require(Parent.SquadsCore.Components).SquadAppChatEventReceiver
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEarlyIsFocusedFunction = NavigationModule.useEarlyIsFocused
local UseMemoFunction = ReactModule.useMemo
local UseNavigationFunction = NavigationModule.useNavigation
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseStateFunction = ReactModule.useState
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseIsWideModeFunction = require(Parent.SocialCommon).Hooks.useIsWideMode
local AppChatEntryPointModule = require(AppChat.AppChatEntryPoint)
local ChatEventReceiverModule = require(AppChat.Components.EventReceivers.ChatEventReceiver)
local ContainerModule = require(AppChat.Components.ExternalNavigationHandler.Container)
local UseExternalNavigationByScreenModule = require(AppChat.Hooks.useExternalNavigationByScreen)
local UseAppChatIsWideModeModule = require(AppChat.Hooks.useAppChatIsWideMode)
local FFlagSquadAppChatRTNFix = require(Parent.SharedFlags).FFlagSquadAppChatRTNFix
local FFlagAppChatInExpSelectChatMembersMobileHeightModule = require(AppChat.Flags.FFlagAppChatInExpSelectChatMembersMobileHeight)
local t = {}

function AppChatEntryPointUA(p1)
	-- upvalues: CryoModule (copy), t (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseEarlyIsFocusedFunction (copy), FFlagAppChatInExpSelectChatMembersMobileHeightModule (copy), UseAppChatIsWideModeModule (copy), UseIsWideModeFunction (copy), UseNavigationFunction (copy), UseAppPolicyFunction (copy), UseStateFunction (copy), UseExternalNavigationByScreenModule (copy), UseRoactServiceFunction (copy), AppNotificationService (copy), UseMemoFunction (copy), Signal (copy), UseCallbackFunction (copy), SetTabBarVisibleFromChatFunction (copy), UseSelectorFunction (copy), ReactModule (copy), FullscreenPageWithSafeArea (copy), AppChatEntryPointModule (copy), ContainerModule (copy), ChatEventReceiverModule (copy), FFlagSquadAppChatRTNFix (copy), SquadAppChatEventReceiver (copy)
	local JoinResult = CryoModule.Dictionary.join(t, p1)
	local UseStyleResult = UseStyleFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseEarlyIsFocusedResult = UseEarlyIsFocusedFunction()
	local UseAppChatIsWideModeModuleResult = if FFlagAppChatInExpSelectChatMembersMobileHeightModule then UseAppChatIsWideModeModule(false) else UseIsWideModeFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return {
			shouldSystemBarUsuallyBePresent = p2.getShouldSystemBarUsuallyBePresent()
		}
	end)
	local UseStateResult, UseStateResult2 = UseStateFunction(0)
	local UseExternalNavigationByScreenModuleResult, UseExternalNavigationByScreenModuleResult2 = UseExternalNavigationByScreenModule()
	local UseRoactServiceResult = UseRoactServiceFunction(AppNotificationService)
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end)
	
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		FullscreenPageWithSafeArea = ReactModule.createElement(FullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
			BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency
		}, {
			AppChatEntryPoint = ReactModule.createElement(AppChatEntryPointModule, {
				setActiveConversationId = UseStateResult2,
				updateExternalNavigationForScreen = UseExternalNavigationByScreenModuleResult2,
				navigateToLuaAppPages = UseMemoFunction(function()
					return {}
				end),
				rnBypassActionSignal = UseMemoResult,
				notificationCount = UseSelectorFunction(function(p2)
					return p2.NotificationBadgeCounts.TopBarNotificationIcon
				end),
				setTabBarVisible = UseCallbackFunction(function(p2)
					-- upvalues: UseDispatchResult (copy), SetTabBarVisibleFromChatFunction (upval), UseAppPolicyResult (copy)
					UseDispatchResult(SetTabBarVisibleFromChatFunction(p2 or UseAppPolicyResult.shouldSystemBarUsuallyBePresent))
				end, {
					UseDispatchResult,
					UseAppPolicyResult.shouldSystemBarUsuallyBePresent
				}),
				isVisible = UseEarlyIsFocusedResult,
				wideMode = UseAppChatIsWideModeModuleResult,
				navigation = UseNavigationResult
			})
		}),
		ExternalNavigationHandler = ReactModule.createElement(ContainerModule, {
			navigationByScreen = UseExternalNavigationByScreenModuleResult
		}),
		ChatEventReceiver = ReactModule.createElement(ChatEventReceiverModule, {
			robloxEventReceiver = UseMemoFunction(function()
				-- upvalues: JoinResult (copy), UseRoactServiceResult (copy)
				return JoinResult.RobloxEventReceiver.new(UseRoactServiceResult)
			end),
			rnBypassActionSignal = UseMemoResult,
			activeConversationId = tostring(UseStateResult)
		}),
		SquadAppChatEventReceiver = if FFlagSquadAppChatRTNFix then ReactModule.createElement(SquadAppChatEventReceiver) else nil
	})
end

return AppChatEntryPointUA
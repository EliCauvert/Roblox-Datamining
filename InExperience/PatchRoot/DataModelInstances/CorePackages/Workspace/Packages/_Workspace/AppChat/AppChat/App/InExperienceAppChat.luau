local SessionService = game:GetService("SessionService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local ResponsiveModule = require(Parent.Responsive)
local UIBloxModule = require(Parent.UIBlox)
local SocialCommonModule = require(Parent.SocialCommon)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local Constants = UIBloxModule.App.Style.Constants
local AppSessionService = require(Parent.RoactServiceTags).AppSessionService
local RoactServices = require(Parent.RoactServices).RoactServices
local SetAppLoadedModule = require(AppChat.Actions.SetAppLoaded)
local EnteredChatFromEntryPointModule = require(AppChat.Actions.EnteredChatFromEntryPoint)
local InExperienceAppChatContainerModule = require(AppChat.App.InExperienceAppChatContainer)
local GetAllFriendsAsyncModule = require(AppChat.Conversations.Thunks.getAllFriendsAsync)
local GetLocalUserFriendsCountModule = require(AppChat.Conversations.Thunks.getLocalUserFriendsCount)
local GetLocalUserFunction = require(Parent.UserLib).Thunks.GetLocalUser
local LayerCollectorProvider = UIBloxModule.Core.Layout.LayerCollector.LayerCollectorProvider
local AppChatToastManagerInExpModule = require(AppChat.App.AppChatToastManagerInExp)
local AppChatPersistentEventReceiversModule = require(AppChat.Components.EventReceivers.AppChatPersistentEventReceivers)
local UseIsAppChatVisibleModule = require(AppChat.App.Hooks.useIsAppChatVisible)
local UsePreventExperienceControlsModule = require(AppChat.App.Hooks.usePreventExperienceControls)
local UseAppChatUpdateSessionModule = require(AppChat.Hooks.useAppChatUpdateSession)
local UsePartyChatReactiveFeatureRestrictionModule = require(AppChat.Hooks.usePartyChatReactiveFeatureRestriction)
local StyleModule = require(Parent.Style)
local UiModeStyleProvider = StyleModule.UiModeStyleProvider
local DesignTokenProvider = StyleModule.DesignTokenProvider
local SquadEventReceiverModule = require(Parent.SquadsCore.SquadEventReceiver)
local SquadOverlayModule = require(Parent.SquadsCore.SquadOverlay)
local UseParentContainerVisibilitySignalModule = require(AppChat.App.Hooks.useParentContainerVisibilitySignal)
local ParentContainerContextModule = require(AppChat.Contexts.ParentContainer.ParentContainerContext)
local FoundationModule = require(Parent.Foundation)
local ColorMode = FoundationModule.Enums.ColorMode
local OverlayHostModule = require(AppChat.Components.OSA.OverlayHost)
local DebugAppChatDisplayOnJoin = game:DefineFastFlag("DebugAppChatDisplayOnJoin", false)
local AppChatInExperienceDisplayOrder = game:DefineFastInt("AppChatInExperienceDisplayOrder", 5)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction = require(Parent.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local PartyPageCarouselExperimentation = require(Parent.SocialExperiments).PartyPageCarouselExperimentation
local FFlagEnableAppChatSnoozeMenuFocus = require(Parent.SharedFlags).FFlagEnableAppChatSnoozeMenuFocus
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local GetFFlagAppChatRequestedRouteModule = require(AppChat.Flags.getFFlagAppChatRequestedRoute)
local IsSideSheetEnabledModule = require(Parent.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagSideSheetFocusNav = require(Parent.SharedFlags).FFlagSideSheetFocusNav
local FFlagEnableDrawerAnimatingHook = require(Parent.SharedFlags).FFlagEnableDrawerAnimatingHook
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local InputHandlersModule = require(Parent.InputHandlers)
local NotificationSnoozeMenuVisibleSignal = require(Parent.ToastNotification).Signals.NotificationSnoozeMenuVisibleSignal
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local DrawerModule = require(Parent.Drawer)
local UseDrawerVisibleFunction = DrawerModule.Hooks.useDrawerVisible
local UseDrawerAnimatingFunction = DrawerModule.Hooks.useDrawerAnimating
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

function wrapWithFocusRoot(p1, EventHandlers, p2)
	-- upvalues: ReactModule (copy), FocusRoot (copy), EventMap (copy), FFlagEnableAppChatSnoozeMenuFocus (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	return ReactModule.createElement(FocusRoot, {
		isIsolated = true,
		eventHandlers = EventHandlers,
		eventMap = EventMap,
		isAutoFocusRoot = not FFlagEnableAppChatSnoozeMenuFocus or p2,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
	}, p1)
end

function InExperienceAppChat()
	-- upvalues: ReactModule (copy), UseDispatchFunction (copy), UseIsAppChatVisibleModule (copy), DebugAppChatDisplayOnJoin (copy), ParentContainerContextModule (copy), GetFFlagAppChatRequestedRouteModule (copy), IsSideSheetEnabledModule (copy), FFlagSideSheetFocusNav (copy), FFlagEnableDrawerAnimatingHook (copy), UseDrawerVisibleFunction (copy), UseDrawerAnimatingFunction (copy), UseParentContainerVisibilitySignalModule (copy), UseAppChatUpdateSessionModule (copy), UsePreventExperienceControlsModule (copy), FFlagAppChatReactiveFeatureRestrictions (copy), UsePartyChatReactiveFeatureRestrictionModule (copy), SetAppLoadedModule (copy), GetAllFriendsAsyncModule (copy), PartyPageCarouselExperimentation (copy), GetLocalUserFriendsCountModule (copy), GetLocalUserFunction (copy), GetFFlagIsSquadEnabledFunction (copy), UseSelectorFunction (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseAppPolicyFunction (copy), FFlagEnableAppChatSnoozeMenuFocus (copy), NotificationSnoozeMenuVisibleSignal (copy), EnteredChatFromEntryPointModule (copy), SocialCommonModule (copy), FFlagExpChatEnableFriendsTab (copy), SquadEventReceiverModule (copy), AppChatPersistentEventReceiversModule (copy), AppChatToastManagerInExpModule (copy), GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction (copy), UiModeStyleProvider (copy), ColorMode (copy), Constants (copy), DesignTokenProvider (copy), AppChatInExperienceDisplayOrder (copy), SquadOverlayModule (copy), LayerCollectorProvider (copy), ResponsiveModule (copy), RoactServices (copy), AppSessionService (copy), SessionService (copy), InExperienceAppChatContainerModule (copy), OverlayHostModule (copy), FoundationModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseDispatchResult = UseDispatchFunction()
	local UseIsAppChatVisibleModuleResult, UseIsAppChatVisibleModuleResult2 = UseIsAppChatVisibleModule(DebugAppChatDisplayOnJoin)
	local UseContextResult = ReactModule.useContext(ParentContainerContextModule)
	local ShowParentContainerFunction = UseContextResult.showParentContainer
	local HideParentContainerFunction = UseContextResult.hideParentContainer
	local UpdateCurrentSquadIdFunction = UseContextResult.updateCurrentSquadId
	local VisibilitySignal = UseContextResult.visibilitySignal
	local RequestedRouteSignal = UseContextResult.requestedRouteSignal
	local GetRequestedRouteFunction = UseContextResult.getRequestedRoute
	local ClearRequestedRoute = UseContextResult.clearRequestedRoute
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local FFlagAppChatRequestedRouteModule = GetFFlagAppChatRequestedRouteModule()
	local v1 = nil
	local Callback = nil
	
	if FFlagAppChatRequestedRouteModule then
		v1, Callback = ReactModule.useState(GetRequestedRouteFunction())
	end
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local v2 = nil
	local v3 = nil
	
	if IsSideSheetEnabledModule and FFlagSideSheetFocusNav and FFlagEnableDrawerAnimatingHook then
		v2 = UseDrawerVisibleFunction()
		v3 = UseDrawerAnimatingFunction()
	end
	UseParentContainerVisibilitySignalModule()
	UseAppChatUpdateSessionModule(UseIsAppChatVisibleModuleResult)
	UsePreventExperienceControlsModule(UseIsAppChatVisibleModuleResult)
	
	if FFlagAppChatReactiveFeatureRestrictions then
		UsePartyChatReactiveFeatureRestrictionModule(UseIsAppChatVisibleModuleResult)
	end
	ReactModule.useEffect(function()
		-- upvalues: UseIsAppChatVisibleModuleResult (copy), UseDispatchResult (copy), SetAppLoadedModule (upval), GetAllFriendsAsyncModule (upval), PartyPageCarouselExperimentation (upval), GetLocalUserFriendsCountModule (upval)
		if UseIsAppChatVisibleModuleResult then
			UseDispatchResult(SetAppLoadedModule(true))
			UseDispatchResult(GetAllFriendsAsyncModule(true))
			
			if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
				UseDispatchResult(GetLocalUserFriendsCountModule())
			end
		end
	end, { UseDispatchResult, UseIsAppChatVisibleModuleResult })
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), GetLocalUserFunction (upval)
		UseDispatchResult(GetLocalUserFunction())
	end, { UseDispatchResult })
	ReactModule.useEffect(function()
		-- upvalues: VisibilitySignal (copy), UseRefResult (copy)
		local Connection = VisibilitySignal:connect(function(p1)
			-- upvalues: UseRefResult (upval)
			if not p1 and UseRefResult.current then
				UseRefResult.current.Enabled = false
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, { VisibilitySignal })
	
	if FFlagAppChatRequestedRouteModule then
		ReactModule.useEffect(function()
			-- upvalues: RequestedRouteSignal (copy), Callback (ref)
			local Connection = RequestedRouteSignal:connect(function(p1)
				-- upvalues: Callback (upval)
				Callback(p1)
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:disconnect()
			end
		end, { RequestedRouteSignal })
	end
	if GetFFlagIsSquadEnabledFunction() then
		local UseSelectorResult = UseSelectorFunction(function(p1)
			local CurrentSquad = p1.Squad and (p1.Squad.Squad and p1.Squad.Squad.currentSquad)
			
			return if CurrentSquad and CurrentSquad.squadId then CurrentSquad.squadId else ""
		end)
		ReactModule.useEffect(function()
			-- upvalues: UpdateCurrentSquadIdFunction (copy), UseSelectorResult (copy)
			UpdateCurrentSquadIdFunction(UseSelectorResult)
		end, { UseSelectorResult, UpdateCurrentSquadIdFunction })
	end
	local UseSelectorResult1 = if GetFFlagIsSquadEnabledFunction() then UseSelectorFunction(function(p1)
		return p1.Squad.SquadPrompt.arguments
	end) else nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), HideParentContainerFunction (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p1)
					-- upvalues: HideParentContainerFunction (upval)
					HideParentContainerFunction()
					p1:cancel()
				end)
			}
		}
	end, { HideParentContainerFunction })
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getCanAccessParty()
	end)
	local PromptType = GetFFlagIsSquadEnabledFunction() and (UseSelectorResult1 and UseSelectorResult1.promptType)
	
	if FFlagEnableAppChatSnoozeMenuFocus then
		ReactModule.useEffect(function()
			-- upvalues: NotificationSnoozeMenuVisibleSignal (upval), UseStateResult2_1 (copy)
			local Connection = NotificationSnoozeMenuVisibleSignal:connect(function(p1)
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(not p1.visible)
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:disconnect()
			end
		end, {})
	end
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: ShowParentContainerFunction (copy), UseStateResult2 (copy), UseDispatchResult (copy), EnteredChatFromEntryPointModule (upval), SocialCommonModule (upval), FFlagExpChatEnableFriendsTab (upval), UseContextResult (copy)
		local function _()
			-- upvalues: ShowParentContainerFunction (upval), UseStateResult2 (upval), p1 (copy), UseDispatchResult (upval), EnteredChatFromEntryPointModule (upval), SocialCommonModule (upval)
			ShowParentContainerFunction()
			UseStateResult2(p1)
			UseDispatchResult(EnteredChatFromEntryPointModule(SocialCommonModule.Enums.ChatEntryPointNames.ToastInExp))
		end
		
		if FFlagExpChatEnableFriendsTab then
			return UseContextResult.openFriendsChatConversation(p1):andThen(function(Result)
				-- upvalues: ShowParentContainerFunction (upval), UseStateResult2 (upval), p1 (copy), UseDispatchResult (upval), EnteredChatFromEntryPointModule (upval), SocialCommonModule (upval)
				if not Result then
					ShowParentContainerFunction()
					UseStateResult2(p1)
					UseDispatchResult(EnteredChatFromEntryPointModule(SocialCommonModule.Enums.ChatEntryPointNames.ToastInExp))
				end
				return Result
			end)
		else
			ShowParentContainerFunction()
			UseStateResult2(p1)
			UseDispatchResult(EnteredChatFromEntryPointModule(SocialCommonModule.Enums.ChatEntryPointNames.ToastInExp))
			
			return nil
		end
	end, {
		UseDispatchResult,
		UseContextResult.openFriendsChatConversation,
		ShowParentContainerFunction
	})
	
	if IsSideSheetEnabledModule and FFlagSideSheetFocusNav and FFlagEnableDrawerAnimatingHook then
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult2_1 (copy), v2 (ref), v3 (ref)
			UseStateResult2_1(not v2 and not v3)
		end, { v2, v3 })
	end
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		SquadEventReceiver = if UseAppPolicyResult then ReactModule.createElement(SquadEventReceiverModule) else nil,
		AppChatPersistentEventReceivers = ReactModule.createElement(AppChatPersistentEventReceiversModule, { isInExperience = true }),
		AppChatToastManagerInExp = ReactModule.createElement(AppChatToastManagerInExpModule, {
			hideAllChatToasts = if GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction() then nil else UseIsAppChatVisibleModuleResult,
			isAppChatVisible = if GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction() then UseIsAppChatVisibleModuleResult else nil,
			navigateToChat = UseResult
		}),
		AppChatContainer = ReactModule.createElement(UiModeStyleProvider, {
			style = {
				themeName = ColorMode.Dark,
				fontName = Constants.FontName.Gotham
			}
		}, {
			ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, {
				AppChatScreenGui = if UseIsAppChatVisibleModuleResult or PromptType then ReactModule.createElement("ScreenGui", {
					ResetOnSpawn = false,
					ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
					ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
					DisplayOrder = AppChatInExperienceDisplayOrder,
					ref = UseRefResult
				}, wrapWithFocusRoot({
					SquadOverlay = if PromptType then ReactModule.createElement(SquadOverlayModule) else nil,
					AppChat = if UseIsAppChatVisibleModuleResult then ReactModule.createElement(LayerCollectorProvider, {}, {
						containerRef = ReactModule.createElement(ResponsiveModule.ContainerRef.Provider, { value = UseRefResult }, {
							ReactModule.createElement(RoactServices.ServiceProvider, { services = { [AppSessionService] = SessionService } }, {
								InExperienceAppChatContainer = ReactModule.createElement(InExperienceAppChatContainerModule, {
									hideAppChat = UseIsAppChatVisibleModuleResult2,
									initialConversationId = UseStateResult,
									setInitialConversationId = UseStateResult2,
									requestedRoute = if FFlagAppChatRequestedRouteModule then v1 else nil,
									clearRequestedRoute = if FFlagAppChatRequestedRouteModule then ClearRequestedRoute else nil
								})
							})
						})
					}) else nil
				}, UseMemoResult, UseStateResult1)) else nil
			})
		}),
		OverlayHost = ReactModule.createElement(OverlayHostModule, {
			providers = {
				{
					class = FoundationModule.FoundationProvider,
					props = { colorMode = ColorMode.Dark }
				}
			}
		})
	})
end

return InExperienceAppChat
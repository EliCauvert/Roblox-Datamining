local sessionService = game:GetService("SessionService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local _ = require(parent.ReactFocusNavigation)
local responsiveModule = require(parent.Responsive)
local UIBloxModule = require(parent.UIBlox)
local userLibModule = require(parent.UserLib)
local socialCommonModule = require(parent.SocialCommon)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local constants = UIBloxModule.App.Style.Constants
local appSessionService = require(parent.RoactServiceTags).AppSessionService
local roactServices = require(parent.RoactServices).RoactServices
local setAppLoadedModule = require(appChat.Actions.SetAppLoaded)
local enteredChatFromEntryPointModule = require(appChat.Actions.EnteredChatFromEntryPoint)
local inExperienceAppChatContainerModule = require(appChat.App.InExperienceAppChatContainer)
local getAllFriendsAsyncModule = require(appChat.Conversations.Thunks.getAllFriendsAsync)
local getLocalUserFriendsCountModule = require(appChat.Conversations.Thunks.getLocalUserFriendsCount)
local getLocalUser = userLibModule.Thunks.GetLocalUser
local layerCollectorProvider = UIBloxModule.Core.Layout.LayerCollector.LayerCollectorProvider
local appChatToastManagerInExpModule = require(appChat.App.AppChatToastManagerInExp)
local appChatPersistentEventReceiversModule = require(appChat.Components.EventReceivers.AppChatPersistentEventReceivers)
local useIsAppChatVisibleModule = require(appChat.App.Hooks.useIsAppChatVisible)
local usePreventExperienceControlsModule = require(appChat.App.Hooks.usePreventExperienceControls)
local useAppChatUpdateSessionModule = require(appChat.Hooks.useAppChatUpdateSession)
local usePartyChatReactiveFeatureRestrictionModule = require(appChat.Hooks.usePartyChatReactiveFeatureRestriction)
local styleModule = require(parent.Style)
local uiModeStyleProvider = styleModule.UiModeStyleProvider
local designTokenProvider = styleModule.DesignTokenProvider
local squadEventReceiverModule = require(parent.SquadsCore.SquadEventReceiver)
local squadOverlayModule = require(parent.SquadsCore.SquadOverlay)
local useParentContainerVisibilitySignalModule = require(appChat.App.Hooks.useParentContainerVisibilitySignal)
local parentContainerContextModule = require(appChat.Contexts.ParentContainer.ParentContainerContext)
local foundationModule = require(parent.Foundation)
local colorMode = foundationModule.Enums.ColorMode
local overlayHostModule = require(appChat.Components.OSA.OverlayHost)
local debugAppChatDisplayOnJoin = game:DefineFastFlag("DebugAppChatDisplayOnJoin", false)
local appChatInExperienceDisplayOrder = game:DefineFastInt("AppChatInExperienceDisplayOrder", 5)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local getFFlagAppChatInExpToastSnoozeMenuDismissFix = require(parent.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local partyPageCarouselExperimentation = require(parent.SocialExperiments).PartyPageCarouselExperimentation
local fFlagEnableAppChatSnoozeMenuFocus = require(parent.SharedFlags).FFlagEnableAppChatSnoozeMenuFocus
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local getFFlagAppChatRequestedRouteModule = require(appChat.Flags.getFFlagAppChatRequestedRoute)
local isSideSheetEnabledModule = require(parent.InExperienceSideSheetUtils.isSideSheetEnabled)
local fFlagSideSheetFocusNav = require(parent.SharedFlags).FFlagSideSheetFocusNav
local fFlagEnableDrawerAnimatingHook = require(parent.SharedFlags).FFlagEnableDrawerAnimatingHook
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local focusRoot = focusNavigationUtilsModule.FocusRoot
local inputHandlersModule = require(parent.InputHandlers)
local notificationSnoozeMenuVisibleSignal = require(parent.ToastNotification).Signals.NotificationSnoozeMenuVisibleSignal
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local drawerModule = require(parent.Drawer)
local useDrawerVisible = drawerModule.Hooks.useDrawerVisible
local useDrawerAnimating = drawerModule.Hooks.useDrawerAnimating
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

function wrapWithFocusRoot(p1, p2, p3)
	-- upvalues: reactModule (ref), focusRoot (ref), t (ref), fFlagEnableAppChatSnoozeMenuFocus (ref), focusNavigableSurfaceIdentifierEnum (ref)
	return reactModule.createElement(focusRoot, {
		isIsolated = true,
		eventHandlers = p2,
		eventMap = t,
		isAutoFocusRoot = if fFlagEnableAppChatSnoozeMenuFocus then p3 else true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, p1)
end

function InExperienceAppChat()
	-- upvalues: reactModule (ref), useDispatch (ref), useIsAppChatVisibleModule (ref), debugAppChatDisplayOnJoin (ref), parentContainerContextModule (ref), getFFlagAppChatRequestedRouteModule (ref), isSideSheetEnabledModule (ref), fFlagSideSheetFocusNav (ref), fFlagEnableDrawerAnimatingHook (ref), useDrawerVisible (ref), useDrawerAnimating (ref), useParentContainerVisibilitySignalModule (ref), useAppChatUpdateSessionModule (ref), usePreventExperienceControlsModule (ref), fFlagAppChatReactiveFeatureRestrictions (ref), usePartyChatReactiveFeatureRestrictionModule (ref), setAppLoadedModule (ref), getAllFriendsAsyncModule (ref), partyPageCarouselExperimentation (ref), getLocalUserFriendsCountModule (ref), getLocalUser (ref), getFFlagIsSquadEnabled (ref), useSelector (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useAppPolicy (ref), fFlagEnableAppChatSnoozeMenuFocus (ref), notificationSnoozeMenuVisibleSignal (ref), enteredChatFromEntryPointModule (ref), socialCommonModule (ref), fFlagExpChatEnableFriendsTab (ref), squadEventReceiverModule (ref), appChatPersistentEventReceiversModule (ref), appChatToastManagerInExpModule (ref), getFFlagAppChatInExpToastSnoozeMenuDismissFix (ref), uiModeStyleProvider (ref), colorMode (ref), constants (ref), designTokenProvider (ref), appChatInExperienceDisplayOrder (ref), squadOverlayModule (ref), layerCollectorProvider (ref), responsiveModule (ref), roactServices (ref), appSessionService (ref), sessionService (ref), inExperienceAppChatContainerModule (ref), overlayHostModule (ref), foundationModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = useDispatch()
	local var3, var4 = useIsAppChatVisibleModule(debugAppChatDisplayOnJoin)
	local var5 = reactModule.useContext(parentContainerContextModule)
	local showParentContainer = var5.showParentContainer
	local hideParentContainer = var5.hideParentContainer
	local updateCurrentSquadId = var5.updateCurrentSquadId
	local visibilitySignal = var5.visibilitySignal
	local requestedRouteSignal = var5.requestedRouteSignal
	local getRequestedRoute = var5.getRequestedRoute
	local clearRequestedRoute = var5.clearRequestedRoute
	local var6, var7 = reactModule.useState("")
	local var8 = getFFlagAppChatRequestedRouteModule()
	local var9 = nil
	local var10 = nil
	
	if var8 then
		local var11, var12 = reactModule.useState(getRequestedRoute())
		var9 = var11
		var10 = var12
	end
	local var13, var14 = reactModule.useState(true)
	local var15 = nil
	local var16 = nil
	
	if isSideSheetEnabledModule and fFlagSideSheetFocusNav and fFlagEnableDrawerAnimatingHook then
		var15 = useDrawerVisible()
		var16 = useDrawerAnimating()
	end
	useParentContainerVisibilitySignalModule()
	useAppChatUpdateSessionModule(var3)
	usePreventExperienceControlsModule(var3)
	
	if fFlagAppChatReactiveFeatureRestrictions then
		usePartyChatReactiveFeatureRestrictionModule(var3)
	end
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var2 (ref), setAppLoadedModule (copy), getAllFriendsAsyncModule (copy), partyPageCarouselExperimentation (copy), getLocalUserFriendsCountModule (copy)
		if var3 then
			var2(setAppLoadedModule(true))
			var2(getAllFriendsAsyncModule(true))
			
			if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
				var2(getLocalUserFriendsCountModule())
			end
		end
	end, { var2, var3 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), getLocalUser (copy)
		var2(getLocalUser())
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: visibilitySignal (ref), var1 (ref)
		local var17 = visibilitySignal:connect(function(p1)
			-- upvalues: var1 (copy)
			if not p1 and var1.current then
				var1.current.Enabled = false
			end
		end)
		
		return function()
			-- upvalues: var17 (ref)
			var17:disconnect()
		end
	end, { visibilitySignal })
	
	if var8 then
		reactModule.useEffect(function()
			-- upvalues: requestedRouteSignal (ref), var10 (write)
			local var17 = requestedRouteSignal:connect(function(p1)
				-- upvalues: var10 (copy)
				var10(p1)
			end)
			
			return function()
				-- upvalues: var17 (ref)
				var17:disconnect()
			end
		end, { requestedRouteSignal })
	end
	if getFFlagIsSquadEnabled() then
		local var17 = useSelector(function(p1)
			local currentSquad = p1.Squad and (p1.Squad.Squad and p1.Squad.Squad.currentSquad)
			
			return if currentSquad and currentSquad.squadId then currentSquad.squadId else ""
		end)
		reactModule.useEffect(function()
			-- upvalues: updateCurrentSquadId (ref), var17 (ref)
			updateCurrentSquadId(var17)
		end, { var17, updateCurrentSquadId })
	end
	local var18 = if getFFlagIsSquadEnabled() then useSelector(function(p1)
		return p1.Squad.SquadPrompt.arguments
	end) else nil
	local var19 = reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), hideParentContainer (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p1)
					-- upvalues: hideParentContainer (copy)
					hideParentContainer()
					p1:cancel()
				end)
			}
		}
	end, { hideParentContainer })
	local var20 = useAppPolicy(function(p1)
		return p1.getCanAccessParty()
	end)
	local promptType = getFFlagIsSquadEnabled() and (var18 and var18.promptType)
	
	if fFlagEnableAppChatSnoozeMenuFocus then
		reactModule.useEffect(function()
			-- upvalues: notificationSnoozeMenuVisibleSignal (copy), var14 (ref)
			local var21 = notificationSnoozeMenuVisibleSignal:connect(function(p1)
				-- upvalues: var14 (copy)
				var14(not p1.visible)
			end)
			
			return function()
				-- upvalues: var21 (ref)
				var21:disconnect()
			end
		end, {})
	end
	local var21 = reactModule.useCallback(function(p1)
		-- upvalues: showParentContainer (ref), var7 (ref), var2 (ref), enteredChatFromEntryPointModule (copy), socialCommonModule (copy), fFlagExpChatEnableFriendsTab (copy), var5 (ref)
		local function _()
			-- upvalues: showParentContainer (copy), var7 (copy), p1 (ref), var2 (copy), enteredChatFromEntryPointModule (copy), socialCommonModule (copy)
			showParentContainer()
			var7(p1)
			var2(enteredChatFromEntryPointModule(socialCommonModule.Enums.ChatEntryPointNames.ToastInExp))
		end
		
		if fFlagExpChatEnableFriendsTab then
			return var5.openFriendsChatConversation(p1):andThen(function(p2)
				-- upvalues: showParentContainer (copy), var7 (copy), p1 (ref), var2 (copy), enteredChatFromEntryPointModule (copy), socialCommonModule (copy)
				if not p2 then
					showParentContainer()
					var7(p1)
					var2(enteredChatFromEntryPointModule(socialCommonModule.Enums.ChatEntryPointNames.ToastInExp))
				end
				return p2
			end)
		end
		showParentContainer()
		var7(p1)
		var2(enteredChatFromEntryPointModule(socialCommonModule.Enums.ChatEntryPointNames.ToastInExp))
		
		return nil
	end, {
		var2,
		var5.openFriendsChatConversation,
		showParentContainer
	})
	
	if isSideSheetEnabledModule and fFlagSideSheetFocusNav and fFlagEnableDrawerAnimatingHook then
		reactModule.useEffect(function()
			-- upvalues: var14 (ref), var15 (write), var16 (write)
			var14(not var15 and not var16)
		end, { var15, var16 })
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		SquadEventReceiver = if var20 then reactModule.createElement(squadEventReceiverModule) else nil,
		AppChatPersistentEventReceivers = reactModule.createElement(appChatPersistentEventReceiversModule, { isInExperience = true }),
		AppChatToastManagerInExp = reactModule.createElement(appChatToastManagerInExpModule, {
			hideAllChatToasts = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then nil else var3,
			isAppChatVisible = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then var3 else nil,
			navigateToChat = var21
		}),
		AppChatContainer = reactModule.createElement(uiModeStyleProvider, {
			style = {
				themeName = colorMode.Dark,
				fontName = constants.FontName.Gotham
			}
		}, {
			reactModule.createElement(designTokenProvider, { tokenMappers = {} }, {
				AppChatScreenGui = if var3 or promptType then reactModule.createElement("ScreenGui", {
					ResetOnSpawn = false,
					ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
					ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
					DisplayOrder = appChatInExperienceDisplayOrder,
					ref = var1
				}, wrapWithFocusRoot({
					SquadOverlay = if promptType then reactModule.createElement(squadOverlayModule) else nil,
					AppChat = if var3 then reactModule.createElement(layerCollectorProvider, {}, {
						containerRef = reactModule.createElement(responsiveModule.ContainerRef.Provider, { value = var1 }, {
							reactModule.createElement(roactServices.ServiceProvider, { services = { [appSessionService] = sessionService } }, {
								InExperienceAppChatContainer = reactModule.createElement(inExperienceAppChatContainerModule, {
									hideAppChat = var4,
									initialConversationId = var6,
									setInitialConversationId = var7,
									requestedRoute = if var8 then var9 else nil,
									clearRequestedRoute = if var8 then clearRequestedRoute else nil
								})
							})
						})
					}) else nil
				}, var19, var13)) else nil
			})
		}),
		OverlayHost = reactModule.createElement(overlayHostModule, {
			providers = {
				{
					class = foundationModule.FoundationProvider,
					props = { colorMode = colorMode.Dark }
				}
			}
		})
	})
end

return InExperienceAppChat
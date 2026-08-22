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
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local getFFlagAppChatInExpToastSnoozeMenuDismissFix = require(parent.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local partyPageCarouselExperimentation = require(parent.SocialExperiments).PartyPageCarouselExperimentation
local fFlagEnableAppChatSnoozeMenuFocus = require(parent.SharedFlags).FFlagEnableAppChatSnoozeMenuFocus
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local getFFlagAppChatRequestedRouteModule = require(appChat.Flags.getFFlagAppChatRequestedRoute)
local fFlagEnableSideSheet = require(parent.SharedFlags).FFlagEnableSideSheet
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

function wrapWithFocusRoot(p0, p1, p2) --[[ line: 82 ]]
	-- upvalues: reactModule (ref), focusRoot (ref), t (ref), fFlagEnableAppChatSnoozeMenuFocus (ref), focusNavigableSurfaceIdentifierEnum (ref)
	return reactModule.createElement(focusRoot, {
		isIsolated = true,
		eventHandlers = p1,
		eventMap = t,
		isAutoFocusRoot = if fFlagEnableAppChatSnoozeMenuFocus then p2 else true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, p0)
end

function InExperienceAppChat() --[[ line: 92 ]]
	-- upvalues: reactModule (ref), useDispatch (ref), useIsAppChatVisibleModule (ref), debugAppChatDisplayOnJoin (ref), parentContainerContextModule (ref), getFFlagAppChatRequestedRouteModule (ref), fFlagEnableSideSheet (ref), fFlagSideSheetFocusNav (ref), fFlagEnableDrawerAnimatingHook (ref), useDrawerVisible (ref), useDrawerAnimating (ref), useParentContainerVisibilitySignalModule (ref), useAppChatUpdateSessionModule (ref), usePreventExperienceControlsModule (ref), setAppLoadedModule (ref), getAllFriendsAsyncModule (ref), partyPageCarouselExperimentation (ref), getLocalUserFriendsCountModule (ref), getLocalUser (ref), getFFlagIsSquadEnabled (ref), useSelector (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useAppPolicy (ref), fFlagEnableAppChatSnoozeMenuFocus (ref), notificationSnoozeMenuVisibleSignal (ref), enteredChatFromEntryPointModule (ref), socialCommonModule (ref), fFlagExpChatEnableFriendsTab (ref), squadEventReceiverModule (ref), appChatPersistentEventReceiversModule (ref), appChatToastManagerInExpModule (ref), getFFlagAppChatInExpToastSnoozeMenuDismissFix (ref), uiModeStyleProvider (ref), colorMode (ref), constants (ref), designTokenProvider (ref), appChatInExperienceDisplayOrder (ref), squadOverlayModule (ref), layerCollectorProvider (ref), responsiveModule (ref), roactServices (ref), appSessionService (ref), sessionService (ref), inExperienceAppChatContainerModule (ref), overlayHostModule (ref), foundationModule (ref)
	local var31 = reactModule.useRef(nil)
	local var32 = useDispatch()
	local var33, var34 = useIsAppChatVisibleModule(debugAppChatDisplayOnJoin)
	local var35 = reactModule.useContext(parentContainerContextModule)
	local showParentContainer = var35.showParentContainer
	local hideParentContainer = var35.hideParentContainer
	local updateCurrentSquadId = var35.updateCurrentSquadId
	local visibilitySignal = var35.visibilitySignal
	local requestedRouteSignal = var35.requestedRouteSignal
	local getRequestedRoute = var35.getRequestedRoute
	local clearRequestedRoute = var35.clearRequestedRoute
	local var36, var37 = reactModule.useState("")
	local var38 = getFFlagAppChatRequestedRouteModule()
	local var39 = nil
	local var40 = nil
	
	if var38 then
		local var41, var42 = reactModule.useState(getRequestedRoute())
		var39 = var41
		var40 = var42
	end
	local var43, var44 = reactModule.useState(true)
	local var45 = nil
	local var46 = nil
	
	if fFlagEnableSideSheet and fFlagSideSheetFocusNav and fFlagEnableDrawerAnimatingHook then
		var45 = useDrawerVisible()
		var46 = useDrawerAnimating()
	end
	useParentContainerVisibilitySignalModule()
	useAppChatUpdateSessionModule(var33)
	usePreventExperienceControlsModule(var33)
	reactModule.useEffect(function() --[[ line: 121 ]]
		-- upvalues: var33 (ref), var32 (ref), setAppLoadedModule (copy), getAllFriendsAsyncModule (copy), partyPageCarouselExperimentation (copy), getLocalUserFriendsCountModule (copy)
		if var33 then
			var32(setAppLoadedModule(true))
			var32(getAllFriendsAsyncModule(true))
			
			if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
				var32(getLocalUserFriendsCountModule())
			end
		end
	end, { var32, var33 })
	reactModule.useEffect(function() --[[ line: 132 ]]
		-- upvalues: var32 (ref), getLocalUser (copy)
		var32(getLocalUser())
	end, { var32 })
	reactModule.useEffect(function() --[[ line: 137 ]]
		-- upvalues: visibilitySignal (ref), var31 (ref)
		local var53 = visibilitySignal:connect(function(p3) --[[ line: 138 ]]
			-- upvalues: var31 (copy)
			if not p3 and var31.current then
				var31.current.Enabled = false
			end
		end)
		
		return function() --[[ line: 144 ]]
			-- upvalues: var53 (ref)
			var53:disconnect()
		end
	end, { visibilitySignal })
	
	if var38 then
		reactModule.useEffect(function() --[[ line: 151 ]]
			-- upvalues: requestedRouteSignal (ref), var40 (write)
			local var54 = requestedRouteSignal:connect(function(p4) --[[ line: 152 ]]
				-- upvalues: var40 (copy)
				var40(p4)
			end)
			
			return function() --[[ line: 156 ]]
				-- upvalues: var54 (ref)
				var54:disconnect()
			end
		end, { requestedRouteSignal })
	end
	if getFFlagIsSquadEnabled() then
		local var47 = useSelector(function(p5) --[[ line: 163 ]]
			local currentSquad = p5.Squad and (p5.Squad.Squad and p5.Squad.Squad.currentSquad)
			
			return if currentSquad and currentSquad.squadId then currentSquad.squadId else ""
		end)
		reactModule.useEffect(function() --[[ line: 168 ]]
			-- upvalues: updateCurrentSquadId (ref), var47 (ref)
			updateCurrentSquadId(var47)
		end, { var47, updateCurrentSquadId })
	end
	local var48 = if getFFlagIsSquadEnabled() then useSelector(function(p6) --[[ line: 174 ]]
		return p6.Squad.SquadPrompt.arguments
	end) else nil
	local var49 = reactModule.useMemo(function() --[[ line: 179 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), hideParentContainer (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p7) --[[ line: 182 ]]
					-- upvalues: hideParentContainer (copy)
					hideParentContainer()
					p7:cancel()
				end)
			}
		}
	end, { hideParentContainer })
	local var50 = useAppPolicy(function(p8) --[[ line: 190 ]]
		return p8.getCanAccessParty()
	end)
	local promptType = getFFlagIsSquadEnabled() and (var48 and var48.promptType)
	
	if fFlagEnableAppChatSnoozeMenuFocus then
		reactModule.useEffect(function() --[[ line: 197 ]]
			-- upvalues: notificationSnoozeMenuVisibleSignal (copy), var44 (ref)
			local var56 = notificationSnoozeMenuVisibleSignal:connect(function(p9) --[[ line: 198 ]]
				-- upvalues: var44 (copy)
				var44(not p9.visible)
			end)
			
			return function() --[[ line: 202 ]]
				-- upvalues: var56 (ref)
				var56:disconnect()
			end
		end, {})
	end
	local var52 = reactModule.useCallback(function(p10) --[[ line: 208 ]]
		-- upvalues: showParentContainer (ref), var37 (ref), var32 (ref), enteredChatFromEntryPointModule (copy), socialCommonModule (copy), fFlagExpChatEnableFriendsTab (copy), var35 (ref)
		local function _() --[[ line: 209 | named "openLegacyAppChat" ]]
			-- upvalues: showParentContainer (copy), var37 (copy), p10 (ref), var32 (copy), enteredChatFromEntryPointModule (copy), socialCommonModule (copy)
			showParentContainer()
			var37(p10)
			var32(enteredChatFromEntryPointModule(socialCommonModule.Enums.ChatEntryPointNames.ToastInExp))
		end
		
		if fFlagExpChatEnableFriendsTab then
			return var35.openFriendsChatConversation(p10):andThen(function(p11) --[[ line: 216 ]]
				-- upvalues: showParentContainer (copy), var37 (copy), p10 (ref), var32 (copy), enteredChatFromEntryPointModule (copy), socialCommonModule (copy)
				if not p11 then
					showParentContainer()
					var37(p10)
					var32(enteredChatFromEntryPointModule(socialCommonModule.Enums.ChatEntryPointNames.ToastInExp))
				end
				return p11
			end)
		end
		showParentContainer()
		var37(p10)
		var32(enteredChatFromEntryPointModule(socialCommonModule.Enums.ChatEntryPointNames.ToastInExp))
		
		return nil
	end, {
		var32,
		var35.openFriendsChatConversation,
		showParentContainer
	})
	
	if fFlagEnableSideSheet and fFlagSideSheetFocusNav and fFlagEnableDrawerAnimatingHook then
		reactModule.useEffect(function() --[[ line: 234 ]]
			-- upvalues: var44 (ref), var45 (write), var46 (write)
			var44(not var45 and not var46)
		end, { var45, var46 })
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		SquadEventReceiver = if var50 then reactModule.createElement(squadEventReceiverModule) else nil,
		AppChatPersistentEventReceivers = reactModule.createElement(appChatPersistentEventReceiversModule, { isInExperience = true }),
		AppChatToastManagerInExp = reactModule.createElement(appChatToastManagerInExpModule, {
			hideAllChatToasts = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then nil else var33,
			isAppChatVisible = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then var33 else nil,
			navigateToChat = var52
		}),
		AppChatContainer = reactModule.createElement(uiModeStyleProvider, {
			style = {
				themeName = colorMode.Dark,
				fontName = constants.FontName.Gotham
			}
		}, {
			reactModule.createElement(designTokenProvider, { tokenMappers = {} }, {
				AppChatScreenGui = if var33 or promptType then reactModule.createElement("ScreenGui", {
					ResetOnSpawn = false,
					ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
					ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
					DisplayOrder = appChatInExperienceDisplayOrder,
					ref = var31
				}, wrapWithFocusRoot({
					SquadOverlay = if promptType then reactModule.createElement(squadOverlayModule) else nil,
					AppChat = if var33 then reactModule.createElement(layerCollectorProvider, {}, {
						containerRef = reactModule.createElement(responsiveModule.ContainerRef.Provider, { value = var31 }, {
							reactModule.createElement(roactServices.ServiceProvider, { services = { [appSessionService] = sessionService } }, {
								InExperienceAppChatContainer = reactModule.createElement(inExperienceAppChatContainerModule, {
									hideAppChat = var34,
									initialConversationId = var36,
									setInitialConversationId = var37,
									requestedRoute = if var38 then var39 else nil,
									clearRequestedRoute = if var38 then clearRequestedRoute else nil
								})
							})
						})
					}) else nil
				}, var49, var43)) else nil
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
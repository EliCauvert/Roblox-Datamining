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
local overlayHostModule = require(appChat.Components.OSA.OverlayHost)
local debugAppChatDisplayOnJoin = game:DefineFastFlag("DebugAppChatDisplayOnJoin", false)
local appChatInExperienceDisplayOrder = game:DefineFastInt("AppChatInExperienceDisplayOrder", 5)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local getFFlagAppChatInExpToastSnoozeMenuDismissFix = require(parent.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local partyPageCarouselExperimentation = require(parent.SocialExperiments).PartyPageCarouselExperimentation
local fFlagEnableAppChatSnoozeMenuFocus = require(parent.SharedFlags).FFlagEnableAppChatSnoozeMenuFocus
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local getFFlagAppChatRequestedRouteModule = require(appChat.Flags.getFFlagAppChatRequestedRoute)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local focusRoot = focusNavigationUtilsModule.FocusRoot
local inputHandlersModule = require(parent.InputHandlers)
local notificationSnoozeMenuVisibleSignal = require(parent.ToastNotification).Signals.NotificationSnoozeMenuVisibleSignal
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

function wrapWithFocusRoot(p0, p1, p2) --[[ line: 74 ]]
	-- upvalues: reactModule (ref), focusRoot (ref), t (ref), fFlagEnableAppChatSnoozeMenuFocus (ref), focusNavigableSurfaceIdentifierEnum (ref)
	return reactModule.createElement(focusRoot, {
		isIsolated = true,
		eventHandlers = p1,
		eventMap = t,
		isAutoFocusRoot = if fFlagEnableAppChatSnoozeMenuFocus then p2 else true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, p0)
end

function InExperienceAppChat() --[[ line: 84 ]]
	-- upvalues: reactModule (ref), useDispatch (ref), useIsAppChatVisibleModule (ref), debugAppChatDisplayOnJoin (ref), parentContainerContextModule (ref), getFFlagAppChatRequestedRouteModule (ref), useParentContainerVisibilitySignalModule (ref), useAppChatUpdateSessionModule (ref), usePreventExperienceControlsModule (ref), setAppLoadedModule (ref), getAllFriendsAsyncModule (ref), partyPageCarouselExperimentation (ref), getLocalUserFriendsCountModule (ref), getLocalUser (ref), getFFlagIsSquadEnabled (ref), useSelector (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useAppPolicy (ref), fFlagEnableAppChatSnoozeMenuFocus (ref), notificationSnoozeMenuVisibleSignal (ref), enteredChatFromEntryPointModule (ref), socialCommonModule (ref), fFlagExpChatEnableFriendsTab (ref), squadEventReceiverModule (ref), appChatPersistentEventReceiversModule (ref), appChatToastManagerInExpModule (ref), getFFlagAppChatInExpToastSnoozeMenuDismissFix (ref), uiModeStyleProvider (ref), constants (ref), designTokenProvider (ref), appChatInExperienceDisplayOrder (ref), squadOverlayModule (ref), layerCollectorProvider (ref), responsiveModule (ref), roactServices (ref), appSessionService (ref), sessionService (ref), inExperienceAppChatContainerModule (ref), overlayHostModule (ref), foundationModule (ref)
	local var30 = reactModule.useRef(nil)
	local var31 = useDispatch()
	local var32, var33 = useIsAppChatVisibleModule(debugAppChatDisplayOnJoin)
	local var34 = reactModule.useContext(parentContainerContextModule)
	local showParentContainer = var34.showParentContainer
	local hideParentContainer = var34.hideParentContainer
	local updateCurrentSquadId = var34.updateCurrentSquadId
	local visibilitySignal = var34.visibilitySignal
	local requestedRouteSignal = var34.requestedRouteSignal
	local getRequestedRoute = var34.getRequestedRoute
	local clearRequestedRoute = var34.clearRequestedRoute
	local var35, var36 = reactModule.useState("")
	local var37 = getFFlagAppChatRequestedRouteModule()
	local var38 = nil
	local var39 = nil
	
	if var37 then
		local var40, var41 = reactModule.useState(getRequestedRoute())
		var38 = var40
		var39 = var41
	end
	local var42, var43 = reactModule.useState(true)
	useParentContainerVisibilitySignalModule()
	useAppChatUpdateSessionModule(var32)
	usePreventExperienceControlsModule(var32)
	reactModule.useEffect(function() --[[ line: 110 ]]
		-- upvalues: var32 (ref), var31 (ref), setAppLoadedModule (copy), getAllFriendsAsyncModule (copy), partyPageCarouselExperimentation (copy), getLocalUserFriendsCountModule (copy)
		if var32 then
			var31(setAppLoadedModule(true))
			var31(getAllFriendsAsyncModule(true))
			
			if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
				var31(getLocalUserFriendsCountModule())
			end
		end
	end, { var31, var32 })
	reactModule.useEffect(function() --[[ line: 121 ]]
		-- upvalues: var31 (ref), getLocalUser (copy)
		var31(getLocalUser())
	end, { var31 })
	reactModule.useEffect(function() --[[ line: 126 ]]
		-- upvalues: visibilitySignal (ref), var30 (ref)
		local var49 = visibilitySignal:connect(function(p3) --[[ line: 127 ]]
			-- upvalues: var30 (copy)
			if not p3 and var30.current then
				var30.current.Enabled = false
			end
		end)
		
		return function() --[[ line: 133 ]]
			-- upvalues: var49 (ref)
			var49:disconnect()
		end
	end, { visibilitySignal })
	
	if var37 then
		reactModule.useEffect(function() --[[ line: 140 ]]
			-- upvalues: requestedRouteSignal (ref), var39 (write)
			local var50 = requestedRouteSignal:connect(function(p4) --[[ line: 141 ]]
				-- upvalues: var39 (copy)
				var39(p4)
			end)
			
			return function() --[[ line: 145 ]]
				-- upvalues: var50 (ref)
				var50:disconnect()
			end
		end, { requestedRouteSignal })
	end
	if getFFlagIsSquadEnabled() then
		local var44 = useSelector(function(p5) --[[ line: 152 ]]
			local currentSquad = p5.Squad and (p5.Squad.Squad and p5.Squad.Squad.currentSquad)
			
			return if currentSquad and currentSquad.squadId then currentSquad.squadId else ""
		end)
		reactModule.useEffect(function() --[[ line: 157 ]]
			-- upvalues: updateCurrentSquadId (ref), var44 (ref)
			updateCurrentSquadId(var44)
		end, { var44, updateCurrentSquadId })
	end
	local var45 = if getFFlagIsSquadEnabled() then useSelector(function(p6) --[[ line: 163 ]]
		return p6.Squad.SquadPrompt.arguments
	end) else nil
	local var46 = reactModule.useMemo(function() --[[ line: 168 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), hideParentContainer (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p7) --[[ line: 171 ]]
					-- upvalues: hideParentContainer (copy)
					hideParentContainer()
					p7:cancel()
				end)
			}
		}
	end, { hideParentContainer })
	local var47 = useAppPolicy(function(p8) --[[ line: 179 ]]
		return p8.getCanAccessParty()
	end)
	local promptType = getFFlagIsSquadEnabled() and (var45 and var45.promptType)
	
	if fFlagEnableAppChatSnoozeMenuFocus then
		reactModule.useEffect(function() --[[ line: 186 ]]
			-- upvalues: notificationSnoozeMenuVisibleSignal (copy), var43 (ref)
			local var52 = notificationSnoozeMenuVisibleSignal:connect(function(p9) --[[ line: 187 ]]
				-- upvalues: var43 (copy)
				var43(not p9.visible)
			end)
			
			return function() --[[ line: 191 ]]
				-- upvalues: var52 (ref)
				var52:disconnect()
			end
		end, {})
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		SquadEventReceiver = if var47 then reactModule.createElement(squadEventReceiverModule) else nil,
		AppChatPersistentEventReceivers = reactModule.createElement(appChatPersistentEventReceiversModule, { isInExperience = true }),
		AppChatToastManagerInExp = reactModule.createElement(appChatToastManagerInExpModule, {
			hideAllChatToasts = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then nil else var32,
			isAppChatVisible = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then var32 else nil,
			navigateToChat = reactModule.useCallback(function(p10) --[[ line: 197 ]]
				-- upvalues: showParentContainer (ref), var36 (ref), var31 (ref), enteredChatFromEntryPointModule (copy), socialCommonModule (copy), fFlagExpChatEnableFriendsTab (copy), var34 (ref)
				local function _() --[[ line: 198 | named "openLegacyAppChat" ]]
					-- upvalues: showParentContainer (copy), var36 (copy), p10 (ref), var31 (copy), enteredChatFromEntryPointModule (copy), socialCommonModule (copy)
					showParentContainer()
					var36(p10)
					var31(enteredChatFromEntryPointModule(socialCommonModule.Enums.ChatEntryPointNames.ToastInExp))
				end
				
				if fFlagExpChatEnableFriendsTab then
					return var34.openFriendsChatConversation(p10):andThen(function(p11) --[[ line: 205 ]]
						-- upvalues: showParentContainer (copy), var36 (copy), p10 (ref), var31 (copy), enteredChatFromEntryPointModule (copy), socialCommonModule (copy)
						if not p11 then
							showParentContainer()
							var36(p10)
							var31(enteredChatFromEntryPointModule(socialCommonModule.Enums.ChatEntryPointNames.ToastInExp))
						end
						return p11
					end)
				end
				showParentContainer()
				var36(p10)
				var31(enteredChatFromEntryPointModule(socialCommonModule.Enums.ChatEntryPointNames.ToastInExp))
				
				return nil
			end, {
				var31,
				var34.openFriendsChatConversation,
				showParentContainer
			})
		}),
		AppChatContainer = reactModule.createElement(uiModeStyleProvider, {
			style = {
				themeName = constants.ThemeName.Dark,
				fontName = constants.FontName.Gotham
			}
		}, {
			reactModule.createElement(designTokenProvider, { tokenMappers = {} }, {
				AppChatScreenGui = if var32 or promptType then reactModule.createElement("ScreenGui", {
					ResetOnSpawn = false,
					ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
					ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
					DisplayOrder = appChatInExperienceDisplayOrder,
					ref = var30
				}, wrapWithFocusRoot({
					SquadOverlay = if promptType then reactModule.createElement(squadOverlayModule) else nil,
					AppChat = if var32 then reactModule.createElement(layerCollectorProvider, {}, {
						containerRef = reactModule.createElement(responsiveModule.ContainerRef.Provider, { value = var30 }, {
							reactModule.createElement(roactServices.ServiceProvider, { services = { [appSessionService] = sessionService } }, {
								InExperienceAppChatContainer = reactModule.createElement(inExperienceAppChatContainerModule, {
									hideAppChat = var33,
									initialConversationId = var35,
									setInitialConversationId = var36,
									requestedRoute = if var37 then var38 else nil,
									clearRequestedRoute = if var37 then clearRequestedRoute else nil
								})
							})
						})
					}) else nil
				}, var46, var42)) else nil
			})
		}),
		OverlayHost = reactModule.createElement(overlayHostModule, {
			providers = {
				{
					class = foundationModule.FoundationProvider,
					props = { colorMode = foundationModule.Enums.ColorMode.Dark }
				}
			}
		})
	})
end

return InExperienceAppChat
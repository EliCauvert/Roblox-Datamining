local sessionService = game:GetService("SessionService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local _ = require(parent.ReactFocusNavigation)
local responsiveModule = require(parent.Responsive)
local UIBloxModule = require(parent.UIBlox)
local userLibModule = require(parent.UserLib)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local constants = UIBloxModule.App.Style.Constants
local appSessionService = require(parent.RoactServiceTags).AppSessionService
local roactServices = require(parent.RoactServices).RoactServices
local setAppLoadedModule = require(appChat.Actions.SetAppLoaded)
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
local getFFlagAppChatRequestedRouteModule = require(appChat.Flags.getFFlagAppChatRequestedRoute)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local focusRoot = focusNavigationUtilsModule.FocusRoot
local inputHandlersModule = require(parent.InputHandlers)
local notificationSnoozeMenuVisibleSignal = require(parent.ToastNotification).Signals.NotificationSnoozeMenuVisibleSignal
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local appChatFixCloseVisibilityLinger = game:DefineFastFlag("AppChatFixCloseVisibilityLinger", false)
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

function wrapWithFocusRoot(p0, p1, p2) --[[ line: 72 ]]
	-- upvalues: reactModule (ref), focusRoot (ref), t (ref), fFlagEnableAppChatSnoozeMenuFocus (ref), focusNavigableSurfaceIdentifierEnum (ref)
	return reactModule.createElement(focusRoot, {
		isIsolated = true,
		eventHandlers = p1,
		eventMap = t,
		isAutoFocusRoot = if fFlagEnableAppChatSnoozeMenuFocus then p2 else true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, p0)
end

function InExperienceAppChat() --[[ line: 82 ]]
	-- upvalues: reactModule (ref), useDispatch (ref), useIsAppChatVisibleModule (ref), debugAppChatDisplayOnJoin (ref), parentContainerContextModule (ref), getFFlagAppChatRequestedRouteModule (ref), useParentContainerVisibilitySignalModule (ref), useAppChatUpdateSessionModule (ref), usePreventExperienceControlsModule (ref), setAppLoadedModule (ref), getAllFriendsAsyncModule (ref), partyPageCarouselExperimentation (ref), getLocalUserFriendsCountModule (ref), getLocalUser (ref), appChatFixCloseVisibilityLinger (ref), getFFlagIsSquadEnabled (ref), useSelector (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useAppPolicy (ref), fFlagEnableAppChatSnoozeMenuFocus (ref), notificationSnoozeMenuVisibleSignal (ref), squadEventReceiverModule (ref), appChatPersistentEventReceiversModule (ref), appChatToastManagerInExpModule (ref), getFFlagAppChatInExpToastSnoozeMenuDismissFix (ref), uiModeStyleProvider (ref), constants (ref), designTokenProvider (ref), appChatInExperienceDisplayOrder (ref), squadOverlayModule (ref), layerCollectorProvider (ref), responsiveModule (ref), roactServices (ref), appSessionService (ref), sessionService (ref), inExperienceAppChatContainerModule (ref), overlayHostModule (ref), foundationModule (ref)
	local var29 = reactModule.useRef(nil)
	local var30 = useDispatch()
	local var31, var32 = useIsAppChatVisibleModule(debugAppChatDisplayOnJoin)
	local var33 = reactModule.useContext(parentContainerContextModule)
	local showParentContainer = var33.showParentContainer
	local hideParentContainer = var33.hideParentContainer
	local updateCurrentSquadId = var33.updateCurrentSquadId
	local visibilitySignal = var33.visibilitySignal
	local requestedRouteSignal = var33.requestedRouteSignal
	local getRequestedRoute = var33.getRequestedRoute
	local clearRequestedRoute = var33.clearRequestedRoute
	local var34, var35 = reactModule.useState("")
	local var36 = getFFlagAppChatRequestedRouteModule()
	local var37 = nil
	local var38 = nil
	
	if var36 then
		local var39, var40 = reactModule.useState(getRequestedRoute())
		var37 = var39
		var38 = var40
	end
	local var41, var42 = reactModule.useState(true)
	useParentContainerVisibilitySignalModule()
	useAppChatUpdateSessionModule(var31)
	usePreventExperienceControlsModule(var31)
	reactModule.useEffect(function() --[[ line: 108 ]]
		-- upvalues: var31 (ref), var30 (ref), setAppLoadedModule (copy), getAllFriendsAsyncModule (copy), partyPageCarouselExperimentation (copy), getLocalUserFriendsCountModule (copy)
		if var31 then
			var30(setAppLoadedModule(true))
			var30(getAllFriendsAsyncModule(true))
			
			if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
				var30(getLocalUserFriendsCountModule())
			end
		end
	end, { var30, var31 })
	reactModule.useEffect(function() --[[ line: 119 ]]
		-- upvalues: var30 (ref), getLocalUser (copy)
		var30(getLocalUser())
	end, { var30 })
	
	if appChatFixCloseVisibilityLinger then
		reactModule.useEffect(function() --[[ line: 126 ]]
			-- upvalues: visibilitySignal (ref), var29 (ref)
			local var48 = visibilitySignal:connect(function(p3) --[[ line: 127 ]]
				-- upvalues: var29 (copy)
				if not p3 and var29.current then
					var29.current.Enabled = false
				end
			end)
			
			return function() --[[ line: 133 ]]
				-- upvalues: var48 (ref)
				var48:disconnect()
			end
		end, { visibilitySignal })
	end
	if var36 then
		reactModule.useEffect(function() --[[ line: 141 ]]
			-- upvalues: requestedRouteSignal (ref), var38 (write)
			local var49 = requestedRouteSignal:connect(function(p4) --[[ line: 142 ]]
				-- upvalues: var38 (copy)
				var38(p4)
			end)
			
			return function() --[[ line: 146 ]]
				-- upvalues: var49 (ref)
				var49:disconnect()
			end
		end, { requestedRouteSignal })
	end
	if getFFlagIsSquadEnabled() then
		local var43 = useSelector(function(p5) --[[ line: 153 ]]
			local currentSquad = p5.Squad and (p5.Squad.Squad and p5.Squad.Squad.currentSquad)
			
			return if currentSquad and currentSquad.squadId then currentSquad.squadId else ""
		end)
		reactModule.useEffect(function() --[[ line: 158 ]]
			-- upvalues: updateCurrentSquadId (ref), var43 (ref)
			updateCurrentSquadId(var43)
		end, { var43, updateCurrentSquadId })
	end
	local var44 = if getFFlagIsSquadEnabled() then useSelector(function(p6) --[[ line: 164 ]]
		return p6.Squad.SquadPrompt.arguments
	end) else nil
	local var45 = reactModule.useMemo(function() --[[ line: 169 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), hideParentContainer (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p7) --[[ line: 172 ]]
					-- upvalues: hideParentContainer (copy)
					hideParentContainer()
					p7:cancel()
				end)
			}
		}
	end, { hideParentContainer })
	local var46 = useAppPolicy(function(p8) --[[ line: 180 ]]
		return p8.getCanAccessParty()
	end)
	local promptType = getFFlagIsSquadEnabled() and (var44 and var44.promptType)
	
	if fFlagEnableAppChatSnoozeMenuFocus then
		reactModule.useEffect(function() --[[ line: 187 ]]
			-- upvalues: notificationSnoozeMenuVisibleSignal (copy), var42 (ref)
			local var51 = notificationSnoozeMenuVisibleSignal:connect(function(p9) --[[ line: 188 ]]
				-- upvalues: var42 (copy)
				var42(not p9.visible)
			end)
			
			return function() --[[ line: 192 ]]
				-- upvalues: var51 (ref)
				var51:disconnect()
			end
		end, {})
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		SquadEventReceiver = if var46 then reactModule.createElement(squadEventReceiverModule) else nil,
		AppChatPersistentEventReceivers = reactModule.createElement(appChatPersistentEventReceiversModule, { isInExperience = true }),
		AppChatToastManagerInExp = reactModule.createElement(appChatToastManagerInExpModule, {
			hideAllChatToasts = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then nil else var31,
			isAppChatVisible = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then var31 else nil,
			navigateToChat = function(p10) --[[ line: 206 ]]
				-- upvalues: showParentContainer (ref), var35 (ref)
				showParentContainer()
				var35(p10)
			end
		}),
		AppChatContainer = reactModule.createElement(uiModeStyleProvider, {
			style = {
				themeName = constants.ThemeName.Dark,
				fontName = constants.FontName.Gotham
			}
		}, {
			reactModule.createElement(designTokenProvider, { tokenMappers = {} }, {
				AppChatScreenGui = if var31 or promptType then reactModule.createElement("ScreenGui", {
					ResetOnSpawn = false,
					ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
					ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
					DisplayOrder = appChatInExperienceDisplayOrder,
					ref = var29
				}, wrapWithFocusRoot({
					SquadOverlay = if promptType then reactModule.createElement(squadOverlayModule) else nil,
					AppChat = if var31 then reactModule.createElement(layerCollectorProvider, {}, {
						containerRef = reactModule.createElement(responsiveModule.ContainerRef.Provider, { value = var29 }, {
							reactModule.createElement(roactServices.ServiceProvider, { services = { [appSessionService] = sessionService } }, {
								InExperienceAppChatContainer = reactModule.createElement(inExperienceAppChatContainerModule, {
									hideAppChat = var32,
									initialConversationId = var34,
									setInitialConversationId = var35,
									requestedRoute = if var36 then var37 else nil,
									clearRequestedRoute = if var36 then clearRequestedRoute else nil
								})
							})
						})
					}) else nil
				}, var45, var41)) else nil
			})
		}),
		OverlayHost = reactModule.createElement(overlayHostModule, {
			providers = {
				{
					class = foundationModule.FoundationProvider,
					props = { theme = foundationModule.Enums.Theme.Dark }
				}
			}
		})
	})
end

return InExperienceAppChat
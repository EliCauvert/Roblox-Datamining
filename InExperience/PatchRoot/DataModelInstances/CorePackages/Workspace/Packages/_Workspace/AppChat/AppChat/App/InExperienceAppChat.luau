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

function wrapWithFocusRoot(p0, p1, p2) --[[ line: 71 ]]
	-- upvalues: reactModule (ref), focusRoot (ref), t (ref), fFlagEnableAppChatSnoozeMenuFocus (ref), focusNavigableSurfaceIdentifierEnum (ref)
	return reactModule.createElement(focusRoot, {
		isIsolated = true,
		eventHandlers = p1,
		eventMap = t,
		isAutoFocusRoot = if fFlagEnableAppChatSnoozeMenuFocus then p2 else true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, p0)
end

function InExperienceAppChat() --[[ line: 81 ]]
	-- upvalues: reactModule (ref), useDispatch (ref), useIsAppChatVisibleModule (ref), debugAppChatDisplayOnJoin (ref), parentContainerContextModule (ref), useParentContainerVisibilitySignalModule (ref), useAppChatUpdateSessionModule (ref), usePreventExperienceControlsModule (ref), setAppLoadedModule (ref), getAllFriendsAsyncModule (ref), partyPageCarouselExperimentation (ref), getLocalUserFriendsCountModule (ref), getLocalUser (ref), appChatFixCloseVisibilityLinger (ref), getFFlagIsSquadEnabled (ref), useSelector (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useAppPolicy (ref), fFlagEnableAppChatSnoozeMenuFocus (ref), notificationSnoozeMenuVisibleSignal (ref), squadEventReceiverModule (ref), appChatPersistentEventReceiversModule (ref), appChatToastManagerInExpModule (ref), getFFlagAppChatInExpToastSnoozeMenuDismissFix (ref), uiModeStyleProvider (ref), constants (ref), designTokenProvider (ref), appChatInExperienceDisplayOrder (ref), squadOverlayModule (ref), layerCollectorProvider (ref), responsiveModule (ref), roactServices (ref), appSessionService (ref), sessionService (ref), inExperienceAppChatContainerModule (ref), overlayHostModule (ref), foundationModule (ref)
	local var28 = reactModule.useRef(nil)
	local var29 = useDispatch()
	local var30, var31 = useIsAppChatVisibleModule(debugAppChatDisplayOnJoin)
	local var32 = reactModule.useContext(parentContainerContextModule)
	local showParentContainer = var32.showParentContainer
	local hideParentContainer = var32.hideParentContainer
	local updateCurrentSquadId = var32.updateCurrentSquadId
	local visibilitySignal = var32.visibilitySignal
	local var33, var34 = reactModule.useState("")
	local var35, var36 = reactModule.useState(true)
	useParentContainerVisibilitySignalModule()
	useAppChatUpdateSessionModule(var30)
	usePreventExperienceControlsModule(var30)
	reactModule.useEffect(function() --[[ line: 97 ]]
		-- upvalues: var30 (ref), var29 (ref), setAppLoadedModule (copy), getAllFriendsAsyncModule (copy), partyPageCarouselExperimentation (copy), getLocalUserFriendsCountModule (copy)
		if var30 then
			var29(setAppLoadedModule(true))
			var29(getAllFriendsAsyncModule(true))
			
			if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
				var29(getLocalUserFriendsCountModule())
			end
		end
	end, { var29, var30 })
	reactModule.useEffect(function() --[[ line: 108 ]]
		-- upvalues: var29 (ref), getLocalUser (copy)
		var29(getLocalUser())
	end, { var29 })
	
	if appChatFixCloseVisibilityLinger then
		reactModule.useEffect(function() --[[ line: 115 ]]
			-- upvalues: visibilitySignal (ref), var28 (ref)
			local var42 = visibilitySignal:connect(function(p3) --[[ line: 116 ]]
				-- upvalues: var28 (copy)
				if not p3 and var28.current then
					var28.current.Enabled = false
				end
			end)
			
			return function() --[[ line: 122 ]]
				-- upvalues: var42 (ref)
				var42:disconnect()
			end
		end, { visibilitySignal })
	end
	if getFFlagIsSquadEnabled() then
		local var37 = useSelector(function(p4) --[[ line: 129 ]]
			local currentSquad = p4.Squad and (p4.Squad.Squad and p4.Squad.Squad.currentSquad)
			
			return if currentSquad and currentSquad.squadId then currentSquad.squadId else ""
		end)
		reactModule.useEffect(function() --[[ line: 134 ]]
			-- upvalues: updateCurrentSquadId (ref), var37 (ref)
			updateCurrentSquadId(var37)
		end, { var37, updateCurrentSquadId })
	end
	local var38 = if getFFlagIsSquadEnabled() then useSelector(function(p5) --[[ line: 140 ]]
		return p5.Squad.SquadPrompt.arguments
	end) else nil
	local var39 = reactModule.useMemo(function() --[[ line: 145 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), hideParentContainer (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p6) --[[ line: 148 ]]
					-- upvalues: hideParentContainer (copy)
					hideParentContainer()
					p6:cancel()
				end)
			}
		}
	end, { hideParentContainer })
	local var40 = useAppPolicy(function(p7) --[[ line: 156 ]]
		return p7.getCanAccessParty()
	end)
	local promptType = getFFlagIsSquadEnabled() and (var38 and var38.promptType)
	
	if fFlagEnableAppChatSnoozeMenuFocus then
		reactModule.useEffect(function() --[[ line: 163 ]]
			-- upvalues: notificationSnoozeMenuVisibleSignal (copy), var36 (ref)
			local var44 = notificationSnoozeMenuVisibleSignal:connect(function(p8) --[[ line: 164 ]]
				-- upvalues: var36 (copy)
				var36(not p8.visible)
			end)
			
			return function() --[[ line: 168 ]]
				-- upvalues: var44 (ref)
				var44:disconnect()
			end
		end, {})
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		SquadEventReceiver = if var40 then reactModule.createElement(squadEventReceiverModule) else nil,
		AppChatPersistentEventReceivers = reactModule.createElement(appChatPersistentEventReceiversModule, { isInExperience = true }),
		AppChatToastManagerInExp = reactModule.createElement(appChatToastManagerInExpModule, {
			hideAllChatToasts = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then nil else var30,
			isAppChatVisible = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then var30 else nil,
			navigateToChat = function(p9) --[[ line: 182 ]]
				-- upvalues: showParentContainer (ref), var34 (ref)
				showParentContainer()
				var34(p9)
			end
		}),
		AppChatContainer = reactModule.createElement(uiModeStyleProvider, {
			style = {
				themeName = constants.ThemeName.Dark,
				fontName = constants.FontName.Gotham
			}
		}, {
			reactModule.createElement(designTokenProvider, { tokenMappers = {} }, {
				AppChatScreenGui = if var30 or promptType then reactModule.createElement("ScreenGui", {
					ResetOnSpawn = false,
					ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
					ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
					DisplayOrder = appChatInExperienceDisplayOrder,
					ref = var28
				}, wrapWithFocusRoot({
					SquadOverlay = if promptType then reactModule.createElement(squadOverlayModule) else nil,
					AppChat = if var30 then reactModule.createElement(layerCollectorProvider, {}, {
						containerRef = reactModule.createElement(responsiveModule.ContainerRef.Provider, { value = var28 }, {
							reactModule.createElement(roactServices.ServiceProvider, { services = { [appSessionService] = sessionService } }, {
								InExperienceAppChatContainer = reactModule.createElement(inExperienceAppChatContainerModule, {
									hideAppChat = var31,
									initialConversationId = var33,
									setInitialConversationId = var34
								})
							})
						})
					}) else nil
				}, var39, var35)) else nil
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
local appChat = script:FindFirstAncestor("AppChat")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local parent = appChat.Parent
local argCheckModule = require(parent.ArgCheck)
local cryoModule = require(parent.Cryo)
local _ = require(appChat.types)
local sharedFlagsModule = require(parent.SharedFlags)
local logger = require(parent.Loggers).Logger
local loggerModule = require(appChat.Logger)
local getRoactChatStackNavigatorModule = require(appChat.getRoactChatStackNavigator)
local useTokens = require(parent.Foundation).Hooks.useTokens
local rootNavigatorModule = nil
local rootNavigatorModule_1 = nil
local var9 = not require(appChat.Flags.getFFlagAppChatRemoveDynamicRequires)()
local usePageSideMargin = require(parent.CollectionViews).usePageSideMargin

if not var9 then
	rootNavigatorModule = require(appChat.Navigators.Compact.rootNavigator)
	rootNavigatorModule_1 = require(appChat.Navigators.Wide.rootNavigator)
end
local analyticsProviderModule = require(appChat.LegacyAnalytics.AnalyticsProvider)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local topBarContextModule = require(appChat.TopBarContext)
local chatPlacementContextModule = require(appChat.Contexts.ChatPlacementContext)
local fFlagAppChatTopBarSignalsStoreModule = require(appChat.Flags.FFlagAppChatTopBarSignalsStore)
local luaAppNavigationContextProviderModule = require(appChat.LuaAppNavigationContextProvider)
local setTabBarVisible = require(parent.AppTabBarRodux).Actions.SetTabBarVisible
local roactChatAnalyticsProviderModule = require(appChat.Analytics.RoactChatAnalyticsProvider)
local appTelemetryLayerModule = require(appChat.Telemetry.Layers.AppTelemetryLayer)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local userInputService = game:GetService("UserInputService")
local memo = reactModule.memo
local useAppPolicyModule = require(appChat.Hooks.useAppPolicy)
local useCallback = reactModule.useCallback
local useChatIsVisibleModule = require(appChat.Hooks.useChatIsVisible)
local useCurrentSquadParentChannelId = require(parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useIsVoiceConnected = require(parent.CrossExperienceVoice).Hooks.useIsVoiceConnected
local useRef = reactModule.useRef
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useState = reactModule.useState
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local useRobloxLocaleModule = require(appChat.Hooks.useRobloxLocale)
local replyingToMessageProviderModule = require(appChat.Components.ChatConversation.MessageInteraction.ReplyingContext.ReplyingToMessageProvider)
local fFlagAppChatSignalsReplyStoreModule = require(appChat.Flags.FFlagAppChatSignalsReplyStore)
local layerCollectorProvider = require(parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local useIsChatEnabledModule = require(appChat.Hooks.useIsChatEnabled)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local interactionFeedbackModule = require(parent.InteractionFeedback)
local hapticFeedbackConfig = require(appChat.Utils.HapticFeedback).HapticFeedbackConfig
local createConversationModule = require(appChat.Conversations.Thunks.createConversation)
local fetchLatestConversationDetailsModule = require(appChat.Conversations.Thunks.fetchLatestConversationDetails)
local rootedChatDetailsNavigationModule = require(appChat.Navigators.rootedChatDetailsNavigation)
local enumScreensModule = require(script.Parent.EnumScreens)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local getFFlagEnableCrossExpVoice = require(parent.SharedFlags).GetFFlagEnableCrossExpVoice
local fFlagAppChatRemoveNotifications = require(parent.SharedFlags).FFlagAppChatRemoveNotifications
local enteredChatFromEntryPointModule = require(appChat.Actions.EnteredChatFromEntryPoint)
local navigateIntoChatModule = require(appChat.Actions.NavigateIntoChat)
local getFFlagHideNotificationIconForVRModule = require(appChat.Flags.getFFlagHideNotificationIconForVR)
local getFFlagFixChatsBottomInsetBackgroundColorModule = require(appChat.Flags.getFFlagFixChatsBottomInsetBackgroundColor)
local getFFlagEnableAppChatInExperience = sharedFlagsModule.GetFFlagEnableAppChatInExperience
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local getFFlagAppChatRequestedRouteModule = require(appChat.Flags.getFFlagAppChatRequestedRoute)
local fFlagSupportViewingUserProfileOnOSAModule = require(appChat.Flags.FFlagSupportViewingUserProfileOnOSA)
local getOverlayStoreModule = require(appChat.Stores.GetOverlayStore)
local navigateWithOsaGateModule = require(appChat.Utils.navigateWithOsaGate)
local fFlagAppChatShowOSAOnPageEntry = sharedFlagsModule.FFlagAppChatShowOSAOnPageEntry
local fFlagEnableHeaderBarButtonsUpdate = sharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate
local fFlagLuaAppCompositionAppChat = sharedFlagsModule.FFlagLuaAppCompositionAppChat
local NAV_BAR_WITH_FACEPILE_SIZE = require(appChat.Constants).NAV_BAR_WITH_FACEPILE_SIZE
local t = {
	navigateToLuaAppPages = nil,
	parameters = nil,
	rnBypassActionSignal = nil,
	setActiveConversationId = nil,
	setBackButtonEnabled = nil,
	wideMode = false,
	notificationCount = 0,
	navigateToRootStack = nil,
	androidBackButtonSignal = nil,
	initialConversationId = "",
	requestedRoute = nil,
	logger = logger,
	setTabBarVisible = function() --[[ line: 130 ]] end,
	setInitialConversationId = function(_) --[[ line: 131 ]] end,
	chatPlacement = chatPlacementContextModule.Enum.Unknown
}

function AppChatEntryPoint(p0) --[[ line: 145 ]]
	-- upvalues: cryoModule (ref), t (ref), chatPlacementContextModule (ref), useTokens (ref), var9 (ref), rootNavigatorModule (write), appChat (ref), rootNavigatorModule_1 (write), useSelector (ref), useCallback (ref), useDispatch (ref), useEffect (ref), appChatNetworkingModule (ref), loggerModule (ref), useChatIsVisibleModule (ref), useState (ref), reactModule (ref), roactNavigationModule (ref), getRoactChatStackNavigatorModule (ref), useRef (ref), fFlagSupportViewingUserProfileOnOSAModule (ref), getOverlayStoreModule (ref), enumScreensModule (ref), createConversationModule (ref), fetchLatestConversationDetailsModule (ref), getFFlagIsSquadEnabled (ref), fFlagAppChatShowOSAOnPageEntry (ref), navigateWithOsaGateModule (ref), getFFlagAppChatRequestedRouteModule (ref), rootedChatDetailsNavigationModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), getTopBarStoreModule (ref), argCheckModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), enteredChatFromEntryPointModule (ref), navigateIntoChatModule (ref), useCurrentSquadParentChannelId (ref), getFFlagEnableCrossExpVoice (ref), useIsVoiceConnected (ref), useAppPolicyModule (ref), getFFlagHideNotificationIconForVRModule (ref), usePageSideMargin (ref), fFlagLuaAppCompositionAppChat (ref), useIsChatEnabledModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatRemoveNotifications (ref), getFFlagEnableAppChatInExperience (ref), useStyle (ref), setTabBarVisible (ref), userInputService (ref), NAV_BAR_WITH_FACEPILE_SIZE (ref), fFlagEnableHeaderBarButtonsUpdate (ref), luaAppNavigationContextProviderModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), replyingToMessageProviderModule (ref), interactionFeedbackModule (ref), hapticFeedbackConfig (ref), layerCollectorProvider (ref), useRobloxLocaleModule (ref), rbxAnalyticsService (ref), analyticsProviderModule (ref), appTelemetryLayerModule (ref), topBarContextModule (ref), getFFlagFixChatsBottomInsetBackgroundColorModule (ref), roactChatAnalyticsProviderModule (ref)
	local var45 = cryoModule.Dictionary.join(t, p0)
	local var46 = chatPlacementContextModule.isPlacementInExperience(var45.chatPlacement)
	local var47 = useTokens()
	
	if var9 then
		rootNavigatorModule = require(appChat.Navigators.Compact.rootNavigator)
		rootNavigatorModule_1 = require(appChat.Navigators.Wide.rootNavigator)
	end
	local var48 = useSelector(useCallback(function(p1) --[[ line: 156 ]]
		return p1.LocalUserId
	end, {})) or var45.localUserId
	local var49 = useSelector(useCallback(function(p2) --[[ line: 159 ]]
		return p2.GlobalGuiInset
	end, {})) or { bottom = 0 }
	local var50 = useSelector(useCallback(function(p3) --[[ line: 162 ]]
		return p3.ChatAppReducer.LastEntryPoint
	end, {}))
	local var51 = useDispatch()
	useEffect(function() --[[ line: 169 ]]
		-- upvalues: var51 (ref), appChatNetworkingModule (copy), var46 (ref), loggerModule (copy)
		var51(appChatNetworkingModule.rodux.GetChatLandingModal.API(var46)):catch(function(p4) --[[ line: 170 ]]
			-- upvalues: loggerModule (copy)
			loggerModule:warning("Error in GetChatLandingModal request. Error: {}", tostring(p4))
		end)
	end, { var51, var48, var46 })
	local var52 = useChatIsVisibleModule()
	local var53, var54 = useState({})
	local var55 = reactModule.useMemo(function() --[[ line: 179 ]]
		-- upvalues: roactNavigationModule (copy), getRoactChatStackNavigatorModule (copy), var45 (ref), rootNavigatorModule_1 (copy), rootNavigatorModule (copy)
		return roactNavigationModule.createAppContainer(getRoactChatStackNavigatorModule(if var45.wideMode then rootNavigatorModule_1 else rootNavigatorModule, var45.navigateToRootStack, var45.androidBackButtonSignal, var45.androidBackButtonConnection))
	end, {
		var45.wideMode, rootNavigatorModule_1, rootNavigatorModule,
		var45.navigateToRootStack, var45.androidBackButtonSignal,
		var45.androidBackButtonConnection
	})
	local var56 = useRef(nil)
	
	if not var46 and var56.current == nil then
		var56.current = roactNavigationModule.createAppContainer(getRoactChatStackNavigatorModule(if var45.wideMode then rootNavigatorModule_1 else rootNavigatorModule, var45.navigateToRootStack, var45.androidBackButtonSignal, var45.androidBackButtonConnection))
	end
	local var57 = if var46 then var55 else var56.current
	local var58 = useRef(false)
	local var59 = useRef(nil)
	local var60 = useRef(function(...) --[[ line: 212 ]] end)
	useEffect(function() --[[ line: 214 ]]
		-- upvalues: var45 (ref), loggerModule (copy)
		if var45.logger then
			loggerModule:setParent(var45.logger)
		end
	end, { var45.logger })
	local var61 = useCallback(function(p5) --[[ line: 220 ]]
		-- upvalues: var58 (ref), var60 (ref)
		if not var58.current then return end
		if var60.current then
			var60.current(p5)
		end
	end, { var58, var60 })
	
	if fFlagSupportViewingUserProfileOnOSAModule then
		local navigateToLuaAppPages = var45.navigateToLuaAppPages
		useEffect(function() --[[ line: 232 ]]
			-- upvalues: getOverlayStoreModule (copy), navigateToLuaAppPages (ref), enumScreensModule (copy)
			getOverlayStoreModule(false).setOverlayDefaultProps({
				onViewUserProfile = if navigateToLuaAppPages then navigateToLuaAppPages[enumScreensModule.ViewUserProfile] else nil
			})
		end, { navigateToLuaAppPages })
	end
	local var62 = useCallback(function(p6) --[[ line: 242 ]]
		-- upvalues: roactNavigationModule (copy), enumScreensModule (copy)
		return roactNavigationModule.Actions.navigate({
			routeName = enumScreensModule.ChatConversation,
			params = { conversationId = p6 }
		})
	end, {})
	local var63 = useCallback(function(p7, p8) --[[ line: 250 ]]
		-- upvalues: roactNavigationModule (copy), enumScreensModule (copy), var45 (ref)
		local list = {
			roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.ChatConversation,
				params = { conversationId = p7 }
			}),
			roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.SquadLobby,
				params = { conversationId = p7, extraParams = p8 }
			})
		}
		
		if var45.wideMode then
			return roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.ChatLanding,
				params = { conversationId = p7 },
				action = roactNavigationModule.StackActions.reset({ index = 2, actions = list })
			})
		end
		table.insert(list, 1, roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.ChatLanding }))
		
		return roactNavigationModule.Actions.navigate({
			routeName = enumScreensModule.ChatLandingStack,
			params = { conversationId = p7 },
			action = roactNavigationModule.StackActions.reset({ index = 3, actions = list })
		})
	end, { var45.wideMode })
	local var64 = useCallback(function(p9) --[[ line: 299 ]]
		-- upvalues: var51 (ref), createConversationModule (copy)
		return var51(createConversationModule("one_to_one", { p9 }))
	end, { var51 })
	local var65 = useCallback(function(p10) --[[ line: 303 ]]
		-- upvalues: var51 (ref), fetchLatestConversationDetailsModule (copy)
		return var51(fetchLatestConversationDetailsModule(p10))
	end, { var51 })
	local var66 = useCallback(function(p11) --[[ line: 308 ]]
		-- upvalues: var60 (ref), var45 (ref), getFFlagIsSquadEnabled (copy), cryoModule (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var51 (ref), var63 (ref), enumScreensModule (copy), getFFlagAppChatRequestedRouteModule (copy), rootedChatDetailsNavigationModule (copy), var65 (ref), roactNavigationModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), loggerModule (copy), var62 (ref), var64 (ref)
		var60.current = p11
		
		if not var45.updateExternalNavigationForScreen then
			return function() --[[ line: 311 ]]
				-- upvalues: var60 (copy)
				var60.current = nil
			end
		end
		local updateExternalNavigationForScreen = var45.updateExternalNavigationForScreen
		
		if getFFlagIsSquadEnabled() then
			updateExternalNavigationForScreen(function(p12) --[[ line: 318 ]]
				-- upvalues: cryoModule (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var51 (copy), p11 (ref), var63 (copy)
				local conversationId = p12.conversationId
				local conversationId_1 = cryoModule.Dictionary.omit(p12, "conversationId")
				
				if fFlagAppChatShowOSAOnPageEntry then
					navigateWithOsaGateModule({
						requireMultiUserForU13 = true,
						conversationId = conversationId,
						dispatch = var51,
						onAccepted = function() --[[ line: 325 ]]
							-- upvalues: p11 (copy), var63 (copy), conversationId (ref), conversationId_1 (ref)
							p11(var63(conversationId, conversationId_1))
						end
					})
					
					return
				end
				p11(var63(conversationId, conversationId_1))
			end, enumScreensModule.SquadLobby)
		end
		if getFFlagAppChatRequestedRouteModule() then
			updateExternalNavigationForScreen(function(p13) --[[ line: 337 ]]
				-- upvalues: rootedChatDetailsNavigationModule (copy), p11 (ref), var51 (copy), var65 (copy), roactNavigationModule (copy), enumScreensModule (copy)
				if not p13 or not p13.conversationId then return end
				if rootedChatDetailsNavigationModule.tryNavigateToRootedChatDetails({
					callback = p11,
					dispatch = var51,
					fetchLatestConversationDetails = var65
				}, p13) then
					return
				end
				p11(roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.ChatDetails, params = p13 }))
			end, enumScreensModule.ChatDetails)
		end
		updateExternalNavigationForScreen(function(p14) --[[ line: 360 ]]
			-- upvalues: fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var51 (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), var65 (copy), loggerModule (copy), p11 (ref), var62 (copy), var64 (copy)
			local conversationId = p14 and p14.conversationId
			
			if conversationId then
				if fFlagAppChatShowOSAOnPageEntry then
					navigateWithOsaGateModule({
						conversationId = conversationId,
						dispatch = var51,
						onAccepted = function() --[[ line: 368 ]]
							-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), conversationId (ref), var65 (copy), loggerModule (copy), p11 (copy), var62 (copy)
							if fFlagAppChatPerfTrackingModule then
								appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = conversationId })
							end
							var65(conversationId):andThen(function() --[[ line: 375 ]]
								-- upvalues: loggerModule (copy), conversationId (copy), p11 (copy), var62 (copy)
								loggerModule:info("Successfully fetched conversation details for conversationId {} for external navigation", conversationId)
								p11(var62(conversationId))
							end):catch(function(p15) --[[ line: 382 ]]
								-- upvalues: loggerModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), conversationId (copy)
								loggerModule:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", tostring(p15))
								
								if fFlagAppChatPerfTrackingModule then
									appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = conversationId })
								end
							end)
						end
					})
				elseif fFlagAppChatPerfTrackingModule then
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = conversationId })
				end
				var65(conversationId):andThen(function() --[[ line: 402 ]]
					-- upvalues: loggerModule (copy), conversationId (ref), p11 (copy), var62 (copy)
					loggerModule:info("Successfully fetched conversation details for conversationId {} for external navigation", conversationId)
					p11(var62(conversationId))
				end):catch(function(p16) --[[ line: 409 ]]
					-- upvalues: loggerModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), conversationId (ref)
					loggerModule:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", tostring(p16))
					
					if fFlagAppChatPerfTrackingModule then
						appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = conversationId })
					end
				end)
				
				return
			end
			local userId = p14 and p14.userId
			
			if userId then
				spawn(function() --[[ line: 430 ]]
					-- upvalues: var64 (copy), userId (ref), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), loggerModule (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var51 (copy), p11 (copy), var62 (copy)
					var64(userId):andThen(function(p18) --[[ line: 432 ]]
						-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), loggerModule (copy), userId (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var51 (copy), p11 (copy), var62 (copy)
						if fFlagAppChatPerfTrackingModule then
							appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = p18.id })
						end
						loggerModule:info("Successfully fetched conversation details for userId {} for external navigation", userId)
						
						if fFlagAppChatShowOSAOnPageEntry then
							navigateWithOsaGateModule({
								conversationId = p18.id,
								dispatch = var51,
								onAccepted = function() --[[ line: 446 ]]
									-- upvalues: p11 (copy), var62 (copy), p18 (ref)
									p11(var62(p18.id))
								end
							})
							
							return
						end
						p11(var62(p18.id))
					end):catch(function(p17) --[[ line: 454 ]]
						-- upvalues: loggerModule (copy)
						loggerModule:warning("Error in CreateConversation request before navigate to conversation. error: {}", tostring(p17))
					end)
				end)
				
				return
			end
		end, enumScreensModule.ChatConversation)
		updateExternalNavigationForScreen(function(p19) --[[ line: 464 ]]
			-- upvalues: p11 (ref), roactNavigationModule (copy), enumScreensModule (copy), var45 (copy)
			p11(roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.ChatLanding, params = p19 }))
			
			if var45.wideMode then
				p11(roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.EmptyConversation }))
			end
		end, enumScreensModule.ChatLanding)
		
		return function() --[[ line: 476 ]]
			-- upvalues: updateExternalNavigationForScreen (ref), enumScreensModule (copy), getFFlagAppChatRequestedRouteModule (copy), getFFlagIsSquadEnabled (copy), var60 (copy)
			updateExternalNavigationForScreen(nil, enumScreensModule.ChatLanding)
			
			if getFFlagAppChatRequestedRouteModule() then
				updateExternalNavigationForScreen(nil, enumScreensModule.ChatDetails)
			end
			updateExternalNavigationForScreen(nil, enumScreensModule.ChatConversation)
			
			if getFFlagIsSquadEnabled() then
				updateExternalNavigationForScreen(nil, enumScreensModule.SquadLobby)
			end
			var60.current = nil
		end
	end, {
		var60, var64, var51, var65, var62, var63,
		var45.updateExternalNavigationForScreen, var45.wideMode
	})
	local var67 = if fFlagAppChatTopBarSignalsStoreModule then useCallback(function(p21) --[[ line: 501 ]]
		-- upvalues: getTopBarStoreModule (copy)
		return getTopBarStoreModule(false).getScreenTopBar(p21)(false)
	end, {}) else useCallback(function(p20) --[[ line: 510 ]]
		-- upvalues: argCheckModule (copy), var53 (ref)
		argCheckModule.isType(p20, "string", "screen")
		
		return var53[p20] or {}
	end, { var53 })
	local var68 = if fFlagAppChatTopBarSignalsStoreModule then useCallback(function(p25, p26) --[[ line: 506 ]]
		-- upvalues: getTopBarStoreModule (copy)
		getTopBarStoreModule(false).setScreenTopBar(p25, p26)
	end, {}) else useCallback(function(p22, p23) --[[ line: 515 ]]
		-- upvalues: argCheckModule (copy), var54 (ref), cryoModule (copy)
		argCheckModule.isType(p22, "string", "screen")
		argCheckModule.isType(p23, "table", "state")
		var54(function(p24) --[[ line: 518 ]]
			-- upvalues: cryoModule (copy), p22 (ref), p23 (ref)
			return cryoModule.Dictionary.join(p24, { [p22] = cryoModule.Dictionary.join(p24[p22] or {}, p23) })
		end)
	end, {})
	local var69 = useCallback(function(p27) --[[ line: 533 ]]
		-- upvalues: var59 (ref), var61 (ref)
		if var59.current then
			var59.current:disconnect()
			var59.current = nil
		end
		if p27 then
			var59.current = p27:connect(var61)
		end
	end, { var59, var61 })
	useEffect(function() --[[ line: 545 ]]
		-- upvalues: var58 (ref), var69 (ref), var45 (ref), var51 (ref), enteredChatFromEntryPointModule (copy)
		var58.current = true
		var69(var45.rnBypassActionSignal)
		
		return function() --[[ line: 549 ]]
			-- upvalues: var58 (copy), var69 (copy), var51 (copy), enteredChatFromEntryPointModule (copy)
			var58.current = false
			var69(nil)
			var51(enteredChatFromEntryPointModule())
		end
	end, {})
	useEffect(function() --[[ line: 558 ]]
		-- upvalues: var45 (ref), var46 (ref), var51 (ref), navigateIntoChatModule (copy), enumScreensModule (copy), var48 (ref)
		if var45.initialConversationId and var45.initialConversationId ~= "" and var46 then
			var51(navigateIntoChatModule({
				screen = enumScreensModule.ChatConversation,
				params = {
					userId = var48,
					conversationId = var45.initialConversationId
				}
			}))
			var45.setInitialConversationId("")
		end
		return function() --[[ line: 567 ]] end
	end, {
		var51,
		var48,
		var45.initialConversationId,
		var45.setInitialConversationId
	})
	
	if getFFlagAppChatRequestedRouteModule() then
		useEffect(function() --[[ line: 572 ]]
			-- upvalues: var45 (ref), var46 (ref), var51 (ref), navigateIntoChatModule (copy)
			if var45.requestedRoute and var46 then
				var51(navigateIntoChatModule(var45.requestedRoute))
				
				if var45.clearRequestedRoute then
					var45.clearRequestedRoute()
				end
			end
			return function() --[[ line: 580 ]] end
		end, {
			var51,
			var46,
			var45.requestedRoute,
			var45.clearRequestedRoute
		})
	end
	local var70 = nil
	local var71 = nil
	
	if getFFlagIsSquadEnabled() then
		var70 = useCurrentSquadParentChannelId()
		
		if getFFlagEnableCrossExpVoice() then
			var71 = useIsVoiceConnected()
		end
	end
	useEffect(function() --[[ line: 599 ]]
		-- upvalues: getFFlagIsSquadEnabled (copy), var46 (ref), var45 (ref), var70 (write), getFFlagEnableCrossExpVoice (copy), var71 (write), var51 (ref), navigateIntoChatModule (copy), enumScreensModule (copy), var48 (ref)
		if getFFlagIsSquadEnabled() and var46 and (var45.initialConversationId == "" and var45.requestedRoute == nil) and var70 then
			if getFFlagEnableCrossExpVoice() and var71 then
				var51(navigateIntoChatModule({
					screen = enumScreensModule.SquadLobby,
					params = { userId = var48, conversationId = var70 }
				}))
				
				return
			end
			var51(navigateIntoChatModule({
				screen = enumScreensModule.ChatConversation,
				params = { userId = var48, conversationId = var70 }
			}))
		end
	end, {})
	useEffect(function() --[[ line: 621 ]]
		-- upvalues: var69 (ref), var45 (ref)
		var69(var45.rnBypassActionSignal)
	end, { var45.rnBypassActionSignal, var69 })
	useEffect(function() --[[ line: 625 ]]
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), cryoModule (copy), var53 (ref), var54 (ref)
		if not fFlagAppChatTopBarSignalsStoreModule and not cryoModule.isEmpty(var53) then
			var54({})
		end
	end, {
		var45.wideMode,
		fFlagAppChatTopBarSignalsStoreModule,
		var53
	})
	local var72 = useAppPolicyModule(function(p28) --[[ line: 631 ]]
		return p28.getChatHeaderSearch()
	end)
	local var73 = useAppPolicyModule(function(p29) --[[ line: 634 ]]
		return p29.getChatHeaderCreateChatGroup()
	end)
	local var74 = useAppPolicyModule(function(p30) --[[ line: 637 ]]
		-- upvalues: getFFlagHideNotificationIconForVRModule (copy)
		return p30.getChatHeaderNotifications() and (not getFFlagHideNotificationIconForVRModule() or p30.getWebViewSupport())
	end)
	local var75 = usePageSideMargin(var57.current, fFlagLuaAppCompositionAppChat)
	local var76 = reactModule.useMemo(function() --[[ line: 643 ]]
		-- upvalues: var46 (ref), var75 (ref)
		return {
			default = 12,
			outer = if var46 then 12 else var75,
			inner = if var46 then 12 else var75
		}
	end, { var75, var46 })
	local var77 = useIsChatEnabledModule()
	local var78 = useStyle()
	local var79 = reactModule.createElement(chatPlacementContextModule.Provider, { value = { chatPlacement = var45.chatPlacement } }, {
		navigation = reactModule.createElement(luaAppNavigationContextProviderModule, {
			navigateToLuaAppPages = var45.navigateToLuaAppPages,
			dispatch = var51
		}, {
			navigation = reactModule.createElement(var57, {
				externalDispatchConnector = var66,
				parameters = var45.parameters,
				setActiveConversationId = var45.setActiveConversationId,
				setBackButtonEnabled = var45.setBackButtonEnabled,
				setTabBarVisible = useCallback(function(p31) --[[ line: 669 ]]
					-- upvalues: var51 (ref), setTabBarVisible (copy)
					var51(setTabBarVisible(p31))
				end, { var51 }),
				chatIsVisible = var52,
				screenProps = {
					navigateToLuaAppPages = var45.navigateToLuaAppPages,
					topBarHeight = math.max(userInputService.NavBarSize.Y, if var47 then var47.Size.Size_1400 else NAV_BAR_WITH_FACEPILE_SIZE),
					wideMode = var45.wideMode,
					isInExperience = var46,
					isVisible = var45.isVisible,
					notificationCount = var45.notificationCount,
					appChatOuterPadding = var76.outer,
					appChatInnerPadding = var76.inner,
					appChatDefaultPadding = var76.default,
					topBarShowSearch = if fFlagAppChatTopBarConfigDrivenModule() then nil else var72 and (not var46 and var77),
					topBarShowCreateChatGroup = if fFlagAppChatTopBarConfigDrivenModule() then nil else var73 and var77,
					topBarShowNotifications = if fFlagAppChatTopBarConfigDrivenModule() then nil else not var46 and (var74 and not fFlagAppChatRemoveNotifications),
					topBarShowSnoozeNotifications = if fFlagAppChatTopBarConfigDrivenModule() then nil else var46 and getFFlagEnableAppChatInExperience(),
					topBarUtilityIconSideMargin = if fFlagEnableHeaderBarButtonsUpdate then var47.Size.Size_100 else nil,
					showSearchRow = var46,
					navigateToRootStack = var45.navigateToRootStack,
					navigateToAddFriends = var45.navigateToAddFriends,
					getScreenTopBar = if fFlagAppChatTopBarSignalsStoreModule then nil else var67,
					setScreenTopBar = if fFlagAppChatTopBarSignalsStoreModule then nil else var68
				}
			})
		})
	})
	
	if not fFlagAppChatSignalsReplyStoreModule then
		var79 = reactModule.createElement(replyingToMessageProviderModule, {}, { navigation = var79 })
	end
	var79 = reactModule.createElement(interactionFeedbackModule.InteractionFeedbackContext.Provider, { value = hapticFeedbackConfig }, { navigation = var79 })
	
	if not var46 then
		var79 = reactModule.createElement(layerCollectorProvider, {}, { navigation = var79 })
	end
	local var80 = if getFFlagIsSquadEnabled() then useSelector(function(p32) --[[ line: 742 ]]
		local currentSquad = p32.Squad and (p32.Squad.Squad and p32.Squad.Squad.currentSquad)
		
		return if currentSquad and currentSquad.squadId then currentSquad.squadId else nil
	end) else nil
	local var81 = reactModule.createElement(analyticsProviderModule, { localUserId = var48, entryPoint = var50 }, {
		telemetry = reactModule.createElement(appTelemetryLayerModule.Provider, {
			value = {
				context = "platformChat",
				locale = useRobloxLocaleModule(),
				entryPoint = var50 or "unknown",
				userId = var48,
				playSessionId = rbxAnalyticsService:GetPlaySessionId(),
				currentSquadId = var80,
				placement = var45.chatPlacement
			}
		}, {
			reactModule.createElement(if fFlagAppChatTopBarSignalsStoreModule then reactModule.Fragment else topBarContextModule.Provider, if fFlagAppChatTopBarSignalsStoreModule then nil else {
				value = cryoModule.Dictionary.join(var53, { getScreenTopBar = var67, setScreenTopBar = var68 })
			}, {
				navigation = var79,
				BottomInsetBackground = if var49.bottom > 0 then reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 3,
					BackgroundColor3 = if getFFlagFixChatsBottomInsetBackgroundColorModule() then var78.Theme.BackgroundDefault.Color else var78.Theme.NavigationBar.Color,
					BackgroundTransparency = if getFFlagFixChatsBottomInsetBackgroundColorModule() then var78.Theme.BackgroundDefault.Transparency else var78.Theme.NavigationBar.Transparency,
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.new(1, 0, 0, var49.bottom)
				}) else nil
			})
		})
	})
	
	if fFlagAppChatPerfTrackingModule then
		useEffect(function() --[[ line: 795 ]]
			-- upvalues: appChatPerfTrackerModule (copy), var45 (ref), var50 (ref), var80 (ref)
			appChatPerfTrackerModule.setSharedContext({
				placement = var45.chatPlacement,
				entryPoint = var50,
				hasActiveParty = var80 ~= nil
			})
		end, { var45.chatPlacement, var50, var80 })
	end
	return reactModule.createElement(roactChatAnalyticsProviderModule, { entryPoint = var50 }, { var81 })
end

return memo(AppChatEntryPoint)
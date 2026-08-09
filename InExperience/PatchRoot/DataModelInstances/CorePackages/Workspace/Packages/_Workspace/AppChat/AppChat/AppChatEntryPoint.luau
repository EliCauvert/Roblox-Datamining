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
local enumScreensModule = require(script.Parent.EnumScreens)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local getFFlagEnableCrossExpVoice = require(parent.SharedFlags).GetFFlagEnableCrossExpVoice
local enteredChatFromEntryPointModule = require(appChat.Actions.EnteredChatFromEntryPoint)
local navigateIntoChatModule = require(appChat.Actions.NavigateIntoChat)
local getFFlagHideNotificationIconForVRModule = require(appChat.Flags.getFFlagHideNotificationIconForVR)
local getFFlagFixChatsBottomInsetBackgroundColorModule = require(appChat.Flags.getFFlagFixChatsBottomInsetBackgroundColor)
local getFFlagEnableAppChatInExperience = sharedFlagsModule.GetFFlagEnableAppChatInExperience
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local fFlagSupportViewingUserProfileOnOSAModule = require(appChat.Flags.FFlagSupportViewingUserProfileOnOSA)
local getOverlayStoreModule = require(appChat.Stores.GetOverlayStore)
local navigateWithOsaGateModule = require(appChat.Utils.navigateWithOsaGate)
local fFlagAppChatShowOSAOnPageEntry = sharedFlagsModule.FFlagAppChatShowOSAOnPageEntry
local fFlagEnableHeaderBarButtonsUpdate = sharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate
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
	logger = logger,
	setTabBarVisible = function() --[[ line: 124 ]] end,
	setInitialConversationId = function(_) --[[ line: 125 ]] end,
	chatPlacement = chatPlacementContextModule.Enum.Unknown
}

function AppChatEntryPoint(p0) --[[ line: 138 ]]
	-- upvalues: cryoModule (ref), t (ref), chatPlacementContextModule (ref), useTokens (ref), var9 (ref), rootNavigatorModule (write), appChat (ref), rootNavigatorModule_1 (write), useSelector (ref), useCallback (ref), useDispatch (ref), useEffect (ref), appChatNetworkingModule (ref), loggerModule (ref), useChatIsVisibleModule (ref), useState (ref), reactModule (ref), roactNavigationModule (ref), getRoactChatStackNavigatorModule (ref), useRef (ref), fFlagSupportViewingUserProfileOnOSAModule (ref), getOverlayStoreModule (ref), enumScreensModule (ref), createConversationModule (ref), fetchLatestConversationDetailsModule (ref), getFFlagIsSquadEnabled (ref), fFlagAppChatShowOSAOnPageEntry (ref), navigateWithOsaGateModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), getTopBarStoreModule (ref), argCheckModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), enteredChatFromEntryPointModule (ref), navigateIntoChatModule (ref), useCurrentSquadParentChannelId (ref), getFFlagEnableCrossExpVoice (ref), useIsVoiceConnected (ref), useAppPolicyModule (ref), getFFlagHideNotificationIconForVRModule (ref), usePageSideMargin (ref), useIsChatEnabledModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getFFlagEnableAppChatInExperience (ref), useStyle (ref), setTabBarVisible (ref), userInputService (ref), NAV_BAR_WITH_FACEPILE_SIZE (ref), fFlagEnableHeaderBarButtonsUpdate (ref), luaAppNavigationContextProviderModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), replyingToMessageProviderModule (ref), interactionFeedbackModule (ref), hapticFeedbackConfig (ref), layerCollectorProvider (ref), useRobloxLocaleModule (ref), rbxAnalyticsService (ref), analyticsProviderModule (ref), appTelemetryLayerModule (ref), topBarContextModule (ref), getFFlagFixChatsBottomInsetBackgroundColorModule (ref), roactChatAnalyticsProviderModule (ref)
	local var43 = cryoModule.Dictionary.join(t, p0)
	local var44 = chatPlacementContextModule.isPlacementInExperience(var43.chatPlacement)
	local var45 = useTokens()
	
	if var9 then
		rootNavigatorModule = require(appChat.Navigators.Compact.rootNavigator)
		rootNavigatorModule_1 = require(appChat.Navigators.Wide.rootNavigator)
	end
	local var46 = useSelector(useCallback(function(p1) --[[ line: 149 ]]
		return p1.LocalUserId
	end, {})) or var43.localUserId
	local var47 = useSelector(useCallback(function(p2) --[[ line: 152 ]]
		return p2.GlobalGuiInset
	end, {})) or { bottom = 0 }
	local var48 = useSelector(useCallback(function(p3) --[[ line: 155 ]]
		return p3.ChatAppReducer.LastEntryPoint
	end, {}))
	local var49 = useDispatch()
	useEffect(function() --[[ line: 161 ]]
		-- upvalues: var49 (ref), appChatNetworkingModule (copy), var44 (ref), loggerModule (copy)
		var49(appChatNetworkingModule.rodux.GetChatLandingModal.API(var44)):catch(function(p4) --[[ line: 162 ]]
			-- upvalues: loggerModule (copy)
			loggerModule:warning("Error in GetChatLandingModal request. Error: {}", tostring(p4))
		end)
	end, { var49, var46, var44 })
	local var50 = useChatIsVisibleModule()
	local var51, var52 = useState({})
	local var53 = if var44 then reactModule.useMemo(function() --[[ line: 171 ]]
		-- upvalues: roactNavigationModule (copy), getRoactChatStackNavigatorModule (copy), var43 (ref), rootNavigatorModule_1 (copy), rootNavigatorModule (copy)
		return roactNavigationModule.createAppContainer(getRoactChatStackNavigatorModule(if var43.wideMode then rootNavigatorModule_1 else rootNavigatorModule, var43.navigateToRootStack, var43.androidBackButtonSignal, var43.androidBackButtonConnection))
	end, {
		var43.wideMode, rootNavigatorModule_1, rootNavigatorModule,
		var43.navigateToRootStack, var43.androidBackButtonSignal,
		var43.androidBackButtonConnection
	}) else useRef(roactNavigationModule.createAppContainer(getRoactChatStackNavigatorModule(if var43.wideMode then rootNavigatorModule_1 else rootNavigatorModule, var43.navigateToRootStack, var43.androidBackButtonSignal, var43.androidBackButtonConnection)))
	
	if not var44 then
		var53 = var53.current
	end
	local var54 = useRef(false)
	local var55 = useRef(nil)
	local var56 = useRef(function(...) --[[ line: 208 ]] end)
	useEffect(function() --[[ line: 210 ]]
		-- upvalues: var43 (ref), loggerModule (copy)
		if var43.logger then
			loggerModule:setParent(var43.logger)
		end
	end, { var43.logger })
	local var57 = useCallback(function(p5) --[[ line: 216 ]]
		-- upvalues: var54 (ref), var56 (ref)
		if not var54.current then return end
		if var56.current then
			var56.current(p5)
		end
	end, { var54, var56 })
	
	if fFlagSupportViewingUserProfileOnOSAModule then
		local navigateToLuaAppPages = var43.navigateToLuaAppPages
		useEffect(function() --[[ line: 228 ]]
			-- upvalues: getOverlayStoreModule (copy), navigateToLuaAppPages (ref), enumScreensModule (copy)
			getOverlayStoreModule(false).setOverlayDefaultProps({
				onViewUserProfile = if navigateToLuaAppPages then navigateToLuaAppPages[enumScreensModule.ViewUserProfile] else nil
			})
		end, { navigateToLuaAppPages })
	end
	local var58 = useCallback(function(p6) --[[ line: 238 ]]
		-- upvalues: roactNavigationModule (copy), enumScreensModule (copy)
		return roactNavigationModule.Actions.navigate({
			routeName = enumScreensModule.ChatConversation,
			params = { conversationId = p6 }
		})
	end, {})
	local var59 = useCallback(function(p7, p8) --[[ line: 246 ]]
		-- upvalues: roactNavigationModule (copy), enumScreensModule (copy), var43 (ref)
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
		
		if var43.wideMode then
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
	end, { var43.wideMode })
	local var60 = useCallback(function(p9) --[[ line: 295 ]]
		-- upvalues: var49 (ref), createConversationModule (copy)
		return var49(createConversationModule("one_to_one", { p9 }))
	end, { var49 })
	local var61 = useCallback(function(p10) --[[ line: 299 ]]
		-- upvalues: var49 (ref), fetchLatestConversationDetailsModule (copy)
		return var49(fetchLatestConversationDetailsModule(p10))
	end, { var49 })
	local var62 = useCallback(function(p11) --[[ line: 303 ]]
		-- upvalues: var56 (ref), var43 (ref), getFFlagIsSquadEnabled (copy), cryoModule (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var49 (ref), var59 (ref), enumScreensModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), var61 (ref), loggerModule (copy), var58 (ref), var60 (ref), roactNavigationModule (copy)
		var56.current = p11
		
		if not var43.updateExternalNavigationForScreen then
			return function() --[[ line: 306 ]]
				-- upvalues: var56 (copy)
				var56.current = nil
			end
		end
		local updateExternalNavigationForScreen = var43.updateExternalNavigationForScreen
		
		if getFFlagIsSquadEnabled() then
			updateExternalNavigationForScreen(function(p12) --[[ line: 313 ]]
				-- upvalues: cryoModule (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var49 (copy), p11 (ref), var59 (copy)
				local conversationId = p12.conversationId
				local conversationId_1 = cryoModule.Dictionary.omit(p12, "conversationId")
				
				if fFlagAppChatShowOSAOnPageEntry then
					navigateWithOsaGateModule({
						requireMultiUserForU13 = true,
						conversationId = conversationId,
						dispatch = var49,
						onAccepted = function() --[[ line: 320 ]]
							-- upvalues: p11 (copy), var59 (copy), conversationId (ref), conversationId_1 (ref)
							p11(var59(conversationId, conversationId_1))
						end
					})
					
					return
				end
				p11(var59(conversationId, conversationId_1))
			end, enumScreensModule.SquadLobby)
		end
		updateExternalNavigationForScreen(function(p13) --[[ line: 331 ]]
			-- upvalues: fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var49 (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), var61 (copy), loggerModule (copy), p11 (ref), var58 (copy), var60 (copy)
			local conversationId = p13 and p13.conversationId
			
			if conversationId then
				if fFlagAppChatShowOSAOnPageEntry then
					navigateWithOsaGateModule({
						conversationId = conversationId,
						dispatch = var49,
						onAccepted = function() --[[ line: 339 ]]
							-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), conversationId (ref), var61 (copy), loggerModule (copy), p11 (copy), var58 (copy)
							if fFlagAppChatPerfTrackingModule then
								appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = conversationId })
							end
							var61(conversationId):andThen(function() --[[ line: 346 ]]
								-- upvalues: loggerModule (copy), conversationId (copy), p11 (copy), var58 (copy)
								loggerModule:info("Successfully fetched conversation details for conversationId {} for external navigation", conversationId)
								p11(var58(conversationId))
							end):catch(function(p14) --[[ line: 353 ]]
								-- upvalues: loggerModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), conversationId (copy)
								loggerModule:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", tostring(p14))
								
								if fFlagAppChatPerfTrackingModule then
									appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = conversationId })
								end
							end)
						end
					})
				elseif fFlagAppChatPerfTrackingModule then
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = conversationId })
				end
				var61(conversationId):andThen(function() --[[ line: 373 ]]
					-- upvalues: loggerModule (copy), conversationId (ref), p11 (copy), var58 (copy)
					loggerModule:info("Successfully fetched conversation details for conversationId {} for external navigation", conversationId)
					p11(var58(conversationId))
				end):catch(function(p15) --[[ line: 380 ]]
					-- upvalues: loggerModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), conversationId (ref)
					loggerModule:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", tostring(p15))
					
					if fFlagAppChatPerfTrackingModule then
						appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = conversationId })
					end
				end)
				
				return
			end
			local userId = p13 and p13.userId
			
			if userId then
				spawn(function() --[[ line: 401 ]]
					-- upvalues: var60 (copy), userId (ref), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), loggerModule (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var49 (copy), p11 (copy), var58 (copy)
					var60(userId):andThen(function(p17) --[[ line: 403 ]]
						-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), loggerModule (copy), userId (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var49 (copy), p11 (copy), var58 (copy)
						if fFlagAppChatPerfTrackingModule then
							appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = p17.id })
						end
						loggerModule:info("Successfully fetched conversation details for userId {} for external navigation", userId)
						
						if fFlagAppChatShowOSAOnPageEntry then
							navigateWithOsaGateModule({
								conversationId = p17.id,
								dispatch = var49,
								onAccepted = function() --[[ line: 417 ]]
									-- upvalues: p11 (copy), var58 (copy), p17 (ref)
									p11(var58(p17.id))
								end
							})
							
							return
						end
						p11(var58(p17.id))
					end):catch(function(p16) --[[ line: 425 ]]
						-- upvalues: loggerModule (copy)
						loggerModule:warning("Error in CreateConversation request before navigate to conversation. error: {}", tostring(p16))
					end)
				end)
				
				return
			end
		end, enumScreensModule.ChatConversation)
		updateExternalNavigationForScreen(function(p18) --[[ line: 435 ]]
			-- upvalues: p11 (ref), roactNavigationModule (copy), enumScreensModule (copy), var43 (copy)
			p11(roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.ChatLanding, params = p18 }))
			
			if var43.wideMode then
				p11(roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.EmptyConversation }))
			end
		end, enumScreensModule.ChatLanding)
		
		return function() --[[ line: 447 ]]
			-- upvalues: updateExternalNavigationForScreen (ref), enumScreensModule (copy), getFFlagIsSquadEnabled (copy), var56 (copy)
			updateExternalNavigationForScreen(nil, enumScreensModule.ChatLanding)
			updateExternalNavigationForScreen(nil, enumScreensModule.ChatConversation)
			
			if getFFlagIsSquadEnabled() then
				updateExternalNavigationForScreen(nil, enumScreensModule.SquadLobby)
			end
			var56.current = nil
		end
	end, { var56 })
	local var63 = if fFlagAppChatTopBarSignalsStoreModule then useCallback(function(p20) --[[ line: 458 ]]
		-- upvalues: getTopBarStoreModule (copy)
		return getTopBarStoreModule(false).getScreenTopBar(p20)(false)
	end, {}) else useCallback(function(p19) --[[ line: 467 ]]
		-- upvalues: argCheckModule (copy), var51 (ref)
		argCheckModule.isType(p19, "string", "screen")
		
		return var51[p19] or {}
	end, { var51 })
	local var64 = if fFlagAppChatTopBarSignalsStoreModule then useCallback(function(p24, p25) --[[ line: 463 ]]
		-- upvalues: getTopBarStoreModule (copy)
		getTopBarStoreModule(false).setScreenTopBar(p24, p25)
	end, {}) else useCallback(function(p21, p22) --[[ line: 472 ]]
		-- upvalues: argCheckModule (copy), var52 (ref), cryoModule (copy)
		argCheckModule.isType(p21, "string", "screen")
		argCheckModule.isType(p22, "table", "state")
		var52(function(p23) --[[ line: 475 ]]
			-- upvalues: cryoModule (copy), p21 (ref), p22 (ref)
			return cryoModule.Dictionary.join(p23, { [p21] = cryoModule.Dictionary.join(p23[p21] or {}, p22) })
		end)
	end, {})
	local var65 = useCallback(function(p26) --[[ line: 490 ]]
		-- upvalues: var55 (ref), var57 (ref)
		if var55.current then
			var55.current:disconnect()
			var55.current = nil
		end
		if p26 then
			var55.current = p26:connect(var57)
		end
	end, { var55 })
	useEffect(function() --[[ line: 501 ]]
		-- upvalues: var54 (ref), var65 (ref), var43 (ref), var49 (ref), enteredChatFromEntryPointModule (copy)
		var54.current = true
		var65(var43.rnBypassActionSignal)
		
		return function() --[[ line: 505 ]]
			-- upvalues: var54 (copy), var65 (copy), var49 (copy), enteredChatFromEntryPointModule (copy)
			var54.current = false
			var65(nil)
			var49(enteredChatFromEntryPointModule())
		end
	end, {})
	useEffect(function() --[[ line: 513 ]]
		-- upvalues: var43 (ref), var44 (ref), var49 (ref), navigateIntoChatModule (copy), enumScreensModule (copy), var46 (ref)
		if var43.initialConversationId and var43.initialConversationId ~= "" and var44 then
			var49(navigateIntoChatModule({
				screen = enumScreensModule.ChatConversation,
				params = {
					userId = var46,
					conversationId = var43.initialConversationId
				}
			}))
			var43.setInitialConversationId("")
		end
		return function() --[[ line: 522 ]] end
	end, {
		var49,
		var46,
		var43.initialConversationId,
		var43.setInitialConversationId
	})
	local var66 = nil
	local var67 = nil
	
	if getFFlagIsSquadEnabled() then
		var66 = useCurrentSquadParentChannelId()
		
		if getFFlagEnableCrossExpVoice() then
			var67 = useIsVoiceConnected()
		end
	end
	useEffect(function() --[[ line: 534 ]]
		-- upvalues: getFFlagIsSquadEnabled (copy), var44 (ref), var43 (ref), var66 (write), getFFlagEnableCrossExpVoice (copy), var67 (write), var49 (ref), navigateIntoChatModule (copy), enumScreensModule (copy), var46 (ref)
		if getFFlagIsSquadEnabled() and var44 and (var43.initialConversationId == "" and var66) then
			if getFFlagEnableCrossExpVoice() and var67 then
				var49(navigateIntoChatModule({
					screen = enumScreensModule.SquadLobby,
					params = { userId = var46, conversationId = var66 }
				}))
				
				return
			end
			var49(navigateIntoChatModule({
				screen = enumScreensModule.ChatConversation,
				params = { userId = var46, conversationId = var66 }
			}))
		end
	end, {})
	useEffect(function() --[[ line: 555 ]]
		-- upvalues: var65 (ref), var43 (ref)
		var65(var43.rnBypassActionSignal)
	end, { var43.rnBypassActionSignal })
	useEffect(function() --[[ line: 559 ]]
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), cryoModule (copy), var51 (ref), var52 (ref)
		if not fFlagAppChatTopBarSignalsStoreModule and not cryoModule.isEmpty(var51) then
			var52({})
		end
	end, { var43.wideMode, fFlagAppChatTopBarSignalsStoreModule })
	local var68 = useAppPolicyModule(function(p27) --[[ line: 565 ]]
		return p27.getChatHeaderSearch()
	end)
	local var69 = useAppPolicyModule(function(p28) --[[ line: 568 ]]
		return p28.getChatHeaderCreateChatGroup()
	end)
	local var70 = useAppPolicyModule(function(p29) --[[ line: 571 ]]
		-- upvalues: getFFlagHideNotificationIconForVRModule (copy)
		return p29.getChatHeaderNotifications() and (not getFFlagHideNotificationIconForVRModule() or p29.getWebViewSupport())
	end)
	local var71 = usePageSideMargin(var53.current)
	local var72 = reactModule.useMemo(function() --[[ line: 577 ]]
		-- upvalues: var44 (ref), var71 (ref)
		return {
			default = 12,
			outer = if var44 then 12 else var71,
			inner = if var44 then 12 else var71
		}
	end, { var71, var44 })
	local var73 = useIsChatEnabledModule()
	local var74 = useStyle()
	local var75 = reactModule.createElement(chatPlacementContextModule.Provider, { value = { chatPlacement = var43.chatPlacement } }, {
		navigation = reactModule.createElement(luaAppNavigationContextProviderModule, {
			navigateToLuaAppPages = var43.navigateToLuaAppPages,
			dispatch = var49
		}, {
			navigation = reactModule.createElement(var53, {
				externalDispatchConnector = var62,
				parameters = var43.parameters,
				setActiveConversationId = var43.setActiveConversationId,
				setBackButtonEnabled = var43.setBackButtonEnabled,
				setTabBarVisible = useCallback(function(p30) --[[ line: 603 ]]
					-- upvalues: var49 (ref), setTabBarVisible (copy)
					var49(setTabBarVisible(p30))
				end, { var49 }),
				chatIsVisible = var50,
				screenProps = {
					navigateToLuaAppPages = var43.navigateToLuaAppPages,
					topBarHeight = math.max(userInputService.NavBarSize.Y, if var45 then var45.Size.Size_1400 else NAV_BAR_WITH_FACEPILE_SIZE),
					wideMode = var43.wideMode,
					isInExperience = var44,
					isVisible = var43.isVisible,
					notificationCount = var43.notificationCount,
					appChatOuterPadding = var72.outer,
					appChatInnerPadding = var72.inner,
					appChatDefaultPadding = var72.default,
					topBarShowSearch = if fFlagAppChatTopBarConfigDrivenModule() then nil else var68 and (not var44 and var73),
					topBarShowCreateChatGroup = if fFlagAppChatTopBarConfigDrivenModule() then nil else var69 and var73,
					topBarShowNotifications = if fFlagAppChatTopBarConfigDrivenModule() then nil else not var44 and var70,
					topBarShowSnoozeNotifications = if fFlagAppChatTopBarConfigDrivenModule() then nil else var44 and getFFlagEnableAppChatInExperience(),
					topBarUtilityIconSideMargin = if fFlagEnableHeaderBarButtonsUpdate then var45.Size.Size_100 else nil,
					showSearchRow = var44,
					navigateToRootStack = var43.navigateToRootStack,
					navigateToAddFriends = var43.navigateToAddFriends,
					getScreenTopBar = if fFlagAppChatTopBarSignalsStoreModule then nil else var63,
					setScreenTopBar = if fFlagAppChatTopBarSignalsStoreModule then nil else var64
				}
			})
		})
	})
	
	if not fFlagAppChatSignalsReplyStoreModule then
		var75 = reactModule.createElement(replyingToMessageProviderModule, {}, { navigation = var75 })
	end
	var75 = reactModule.createElement(interactionFeedbackModule.InteractionFeedbackContext.Provider, { value = hapticFeedbackConfig }, { navigation = var75 })
	
	if not var44 then
		var75 = reactModule.createElement(layerCollectorProvider, {}, { navigation = var75 })
	end
	local var76 = if getFFlagIsSquadEnabled() then useSelector(function(p31) --[[ line: 676 ]]
		local currentSquad = p31.Squad and (p31.Squad.Squad and p31.Squad.Squad.currentSquad)
		
		return if currentSquad and currentSquad.squadId then currentSquad.squadId else nil
	end) else nil
	local var77 = reactModule.createElement(analyticsProviderModule, { localUserId = var46, entryPoint = var48 }, {
		telemetry = reactModule.createElement(appTelemetryLayerModule.Provider, {
			value = {
				context = "platformChat",
				locale = useRobloxLocaleModule(),
				entryPoint = var48 or "unknown",
				userId = var46,
				playSessionId = rbxAnalyticsService:GetPlaySessionId(),
				currentSquadId = var76,
				placement = var43.chatPlacement
			}
		}, {
			reactModule.createElement(if fFlagAppChatTopBarSignalsStoreModule then reactModule.Fragment else topBarContextModule.Provider, if fFlagAppChatTopBarSignalsStoreModule then nil else {
				value = cryoModule.Dictionary.join(var51, { getScreenTopBar = var63, setScreenTopBar = var64 })
			}, {
				navigation = var75,
				BottomInsetBackground = if var47.bottom > 0 then reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 3,
					BackgroundColor3 = if getFFlagFixChatsBottomInsetBackgroundColorModule() then var74.Theme.BackgroundDefault.Color else var74.Theme.NavigationBar.Color,
					BackgroundTransparency = if getFFlagFixChatsBottomInsetBackgroundColorModule() then var74.Theme.BackgroundDefault.Transparency else var74.Theme.NavigationBar.Transparency,
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.new(1, 0, 0, var47.bottom)
				}) else nil
			})
		})
	})
	
	if fFlagAppChatPerfTrackingModule then
		useEffect(function() --[[ line: 729 ]]
			-- upvalues: appChatPerfTrackerModule (copy), var43 (ref), var48 (ref), var76 (ref)
			appChatPerfTrackerModule.setSharedContext({
				placement = var43.chatPlacement,
				entryPoint = var48,
				hasActiveParty = var76 ~= nil
			})
		end, { var43.chatPlacement, var48, var76 })
	end
	return reactModule.createElement(roactChatAnalyticsProviderModule, { entryPoint = var48 }, { var77 })
end

return memo(AppChatEntryPoint)
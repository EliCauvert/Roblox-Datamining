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
local var1 = not require(appChat.Flags.getFFlagAppChatRemoveDynamicRequires)()
local usePageSideMargin = require(parent.CollectionViews).usePageSideMargin

if not var1 then
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
	setTabBarVisible = function() end,
	setInitialConversationId = function(_) end,
	chatPlacement = chatPlacementContextModule.Enum.Unknown
}

function AppChatEntryPoint(p1)
	-- upvalues: cryoModule (ref), t (ref), chatPlacementContextModule (ref), useTokens (ref), var1 (ref), rootNavigatorModule (write), appChat (ref), rootNavigatorModule_1 (write), useSelector (ref), useCallback (ref), useDispatch (ref), useEffect (ref), appChatNetworkingModule (ref), loggerModule (ref), useChatIsVisibleModule (ref), useState (ref), reactModule (ref), roactNavigationModule (ref), getRoactChatStackNavigatorModule (ref), useRef (ref), fFlagSupportViewingUserProfileOnOSAModule (ref), getOverlayStoreModule (ref), enumScreensModule (ref), createConversationModule (ref), fetchLatestConversationDetailsModule (ref), getFFlagIsSquadEnabled (ref), fFlagAppChatShowOSAOnPageEntry (ref), navigateWithOsaGateModule (ref), getFFlagAppChatRequestedRouteModule (ref), rootedChatDetailsNavigationModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), getTopBarStoreModule (ref), argCheckModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), enteredChatFromEntryPointModule (ref), navigateIntoChatModule (ref), useCurrentSquadParentChannelId (ref), getFFlagEnableCrossExpVoice (ref), useIsVoiceConnected (ref), useAppPolicyModule (ref), getFFlagHideNotificationIconForVRModule (ref), usePageSideMargin (ref), fFlagLuaAppCompositionAppChat (ref), useIsChatEnabledModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatRemoveNotifications (ref), getFFlagEnableAppChatInExperience (ref), useStyle (ref), setTabBarVisible (ref), userInputService (ref), NAV_BAR_WITH_FACEPILE_SIZE (ref), fFlagEnableHeaderBarButtonsUpdate (ref), luaAppNavigationContextProviderModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), replyingToMessageProviderModule (ref), interactionFeedbackModule (ref), hapticFeedbackConfig (ref), layerCollectorProvider (ref), useRobloxLocaleModule (ref), rbxAnalyticsService (ref), analyticsProviderModule (ref), appTelemetryLayerModule (ref), topBarContextModule (ref), getFFlagFixChatsBottomInsetBackgroundColorModule (ref), roactChatAnalyticsProviderModule (ref)
	local var2 = cryoModule.Dictionary.join(t, p1)
	local var3 = chatPlacementContextModule.isPlacementInExperience(var2.chatPlacement)
	local var4 = useTokens()
	
	if var1 then
		rootNavigatorModule = require(appChat.Navigators.Compact.rootNavigator)
		rootNavigatorModule_1 = require(appChat.Navigators.Wide.rootNavigator)
	end
	local var5 = useSelector(useCallback(function(p2)
		return p2.LocalUserId
	end, {})) or var2.localUserId
	local var6 = useSelector(useCallback(function(p2)
		return p2.GlobalGuiInset
	end, {})) or { bottom = 0 }
	local var7 = useSelector(useCallback(function(p2)
		return p2.ChatAppReducer.LastEntryPoint
	end, {}))
	local var8 = useDispatch()
	useEffect(function()
		-- upvalues: var8 (ref), appChatNetworkingModule (copy), var3 (ref), loggerModule (copy)
		var8(appChatNetworkingModule.rodux.GetChatLandingModal.API(var3)):catch(function(p2)
			-- upvalues: loggerModule (copy)
			loggerModule:warning("Error in GetChatLandingModal request. Error: {}", tostring(p2))
		end)
	end, { var8, var5, var3 })
	local var9 = useChatIsVisibleModule()
	local var10, var11 = useState({})
	local var12 = reactModule.useMemo(function()
		-- upvalues: roactNavigationModule (copy), getRoactChatStackNavigatorModule (copy), var2 (ref), rootNavigatorModule_1 (copy), rootNavigatorModule (copy)
		return roactNavigationModule.createAppContainer(getRoactChatStackNavigatorModule(if var2.wideMode then rootNavigatorModule_1 else rootNavigatorModule, var2.navigateToRootStack, var2.androidBackButtonSignal, var2.androidBackButtonConnection))
	end, {
		var2.wideMode, rootNavigatorModule_1, rootNavigatorModule,
		var2.navigateToRootStack, var2.androidBackButtonSignal,
		var2.androidBackButtonConnection
	})
	local var13 = useRef(nil)
	
	if not var3 and var13.current == nil then
		var13.current = roactNavigationModule.createAppContainer(getRoactChatStackNavigatorModule(if var2.wideMode then rootNavigatorModule_1 else rootNavigatorModule, var2.navigateToRootStack, var2.androidBackButtonSignal, var2.androidBackButtonConnection))
	end
	local var14 = if var3 then var12 else var13.current
	local var15 = useRef(false)
	local var16 = useRef(nil)
	local var17 = useRef(function(...) end)
	useEffect(function()
		-- upvalues: var2 (ref), loggerModule (copy)
		if var2.logger then
			loggerModule:setParent(var2.logger)
		end
	end, { var2.logger })
	local var18 = useCallback(function(p2)
		-- upvalues: var15 (ref), var17 (ref)
		if not var15.current then return end
		if var17.current then
			var17.current(p2)
		end
	end, { var15, var17 })
	
	if fFlagSupportViewingUserProfileOnOSAModule then
		local navigateToLuaAppPages = var2.navigateToLuaAppPages
		useEffect(function()
			-- upvalues: getOverlayStoreModule (copy), navigateToLuaAppPages (ref), enumScreensModule (copy)
			getOverlayStoreModule(false).setOverlayDefaultProps({
				onViewUserProfile = if navigateToLuaAppPages then navigateToLuaAppPages[enumScreensModule.ViewUserProfile] else nil
			})
		end, { navigateToLuaAppPages })
	end
	local var19 = useCallback(function(p2)
		-- upvalues: roactNavigationModule (copy), enumScreensModule (copy)
		return roactNavigationModule.Actions.navigate({
			routeName = enumScreensModule.ChatConversation,
			params = { conversationId = p2 }
		})
	end, {})
	local var20 = useCallback(function(p2, p3)
		-- upvalues: roactNavigationModule (copy), enumScreensModule (copy), var2 (ref)
		local list = {
			roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.ChatConversation,
				params = { conversationId = p2 }
			}),
			roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.SquadLobby,
				params = { conversationId = p2, extraParams = p3 }
			})
		}
		
		if var2.wideMode then
			return roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.ChatLanding,
				params = { conversationId = p2 },
				action = roactNavigationModule.StackActions.reset({ index = 2, actions = list })
			})
		end
		table.insert(list, 1, roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.ChatLanding }))
		
		return roactNavigationModule.Actions.navigate({
			routeName = enumScreensModule.ChatLandingStack,
			params = { conversationId = p2 },
			action = roactNavigationModule.StackActions.reset({ index = 3, actions = list })
		})
	end, { var2.wideMode })
	local var21 = useCallback(function(p2)
		-- upvalues: var8 (ref), createConversationModule (copy)
		return var8(createConversationModule("one_to_one", { p2 }))
	end, { var8 })
	local var22 = useCallback(function(p2)
		-- upvalues: var8 (ref), fetchLatestConversationDetailsModule (copy)
		return var8(fetchLatestConversationDetailsModule(p2))
	end, { var8 })
	local var23 = useCallback(function(p2)
		-- upvalues: var17 (ref), var2 (ref), getFFlagIsSquadEnabled (copy), cryoModule (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var8 (ref), var20 (ref), enumScreensModule (copy), getFFlagAppChatRequestedRouteModule (copy), rootedChatDetailsNavigationModule (copy), var22 (ref), roactNavigationModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), loggerModule (copy), var19 (ref), var21 (ref)
		var17.current = p2
		
		if not var2.updateExternalNavigationForScreen then
			return function()
				-- upvalues: var17 (copy)
				var17.current = nil
			end
		end
		local updateExternalNavigationForScreen = var2.updateExternalNavigationForScreen
		
		if getFFlagIsSquadEnabled() then
			updateExternalNavigationForScreen(function(p3)
				-- upvalues: cryoModule (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var8 (copy), p2 (ref), var20 (copy)
				local conversationId = p3.conversationId
				local conversationId_1 = cryoModule.Dictionary.omit(p3, "conversationId")
				
				if fFlagAppChatShowOSAOnPageEntry then
					navigateWithOsaGateModule({
						requireMultiUserForU13 = true,
						conversationId = conversationId,
						dispatch = var8,
						onAccepted = function()
							-- upvalues: p2 (copy), var20 (copy), conversationId (ref), conversationId_1 (ref)
							p2(var20(conversationId, conversationId_1))
						end
					})
					
					return
				end
				p2(var20(conversationId, conversationId_1))
			end, enumScreensModule.SquadLobby)
		end
		if getFFlagAppChatRequestedRouteModule() then
			updateExternalNavigationForScreen(function(p3)
				-- upvalues: rootedChatDetailsNavigationModule (copy), p2 (ref), var8 (copy), var22 (copy), roactNavigationModule (copy), enumScreensModule (copy)
				if not p3 or not p3.conversationId then return end
				if rootedChatDetailsNavigationModule.tryNavigateToRootedChatDetails({
					callback = p2,
					dispatch = var8,
					fetchLatestConversationDetails = var22
				}, p3) then
					return
				end
				p2(roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.ChatDetails, params = p3 }))
			end, enumScreensModule.ChatDetails)
		end
		updateExternalNavigationForScreen(function(p3)
			-- upvalues: fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var8 (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), var22 (copy), loggerModule (copy), p2 (ref), var19 (copy), var21 (copy)
			local conversationId = p3 and p3.conversationId
			
			if conversationId then
				if fFlagAppChatShowOSAOnPageEntry then
					navigateWithOsaGateModule({
						conversationId = conversationId,
						dispatch = var8,
						onAccepted = function()
							-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), conversationId (ref), var22 (copy), loggerModule (copy), p2 (copy), var19 (copy)
							if fFlagAppChatPerfTrackingModule then
								appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = conversationId })
							end
							var22(conversationId):andThen(function()
								-- upvalues: loggerModule (copy), conversationId (copy), p2 (copy), var19 (copy)
								loggerModule:info("Successfully fetched conversation details for conversationId {} for external navigation", conversationId)
								p2(var19(conversationId))
							end):catch(function(p4)
								-- upvalues: loggerModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), conversationId (copy)
								loggerModule:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", tostring(p4))
								
								if fFlagAppChatPerfTrackingModule then
									appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = conversationId })
								end
							end)
						end
					})
				elseif fFlagAppChatPerfTrackingModule then
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = conversationId })
				end
				var22(conversationId):andThen(function()
					-- upvalues: loggerModule (copy), conversationId (ref), p2 (copy), var19 (copy)
					loggerModule:info("Successfully fetched conversation details for conversationId {} for external navigation", conversationId)
					p2(var19(conversationId))
				end):catch(function(p4)
					-- upvalues: loggerModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), conversationId (ref)
					loggerModule:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", tostring(p4))
					
					if fFlagAppChatPerfTrackingModule then
						appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = conversationId })
					end
				end)
				
				return
			end
			local userId = p3 and p3.userId
			
			if userId then
				spawn(function()
					-- upvalues: var21 (copy), userId (ref), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), loggerModule (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var8 (copy), p2 (copy), var19 (copy)
					var21(userId):andThen(function(p4)
						-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), loggerModule (copy), userId (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var8 (copy), p2 (copy), var19 (copy)
						if fFlagAppChatPerfTrackingModule then
							appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = p4.id })
						end
						loggerModule:info("Successfully fetched conversation details for userId {} for external navigation", userId)
						
						if fFlagAppChatShowOSAOnPageEntry then
							navigateWithOsaGateModule({
								conversationId = p4.id,
								dispatch = var8,
								onAccepted = function()
									-- upvalues: p2 (copy), var19 (copy), p4 (ref)
									p2(var19(p4.id))
								end
							})
							
							return
						end
						p2(var19(p4.id))
					end):catch(function(p4)
						-- upvalues: loggerModule (copy)
						loggerModule:warning("Error in CreateConversation request before navigate to conversation. error: {}", tostring(p4))
					end)
				end)
				
				return
			end
		end, enumScreensModule.ChatConversation)
		updateExternalNavigationForScreen(function(p3)
			-- upvalues: p2 (ref), roactNavigationModule (copy), enumScreensModule (copy), var2 (copy)
			p2(roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.ChatLanding, params = p3 }))
			
			if var2.wideMode then
				p2(roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.EmptyConversation }))
			end
		end, enumScreensModule.ChatLanding)
		
		return function()
			-- upvalues: updateExternalNavigationForScreen (ref), enumScreensModule (copy), getFFlagAppChatRequestedRouteModule (copy), getFFlagIsSquadEnabled (copy), var17 (copy)
			updateExternalNavigationForScreen(nil, enumScreensModule.ChatLanding)
			
			if getFFlagAppChatRequestedRouteModule() then
				updateExternalNavigationForScreen(nil, enumScreensModule.ChatDetails)
			end
			updateExternalNavigationForScreen(nil, enumScreensModule.ChatConversation)
			
			if getFFlagIsSquadEnabled() then
				updateExternalNavigationForScreen(nil, enumScreensModule.SquadLobby)
			end
			var17.current = nil
		end
	end, {
		var17, var21, var8, var22, var19, var20,
		var2.updateExternalNavigationForScreen, var2.wideMode
	})
	local var24 = if fFlagAppChatTopBarSignalsStoreModule then useCallback(function(p2)
		-- upvalues: getTopBarStoreModule (copy)
		return getTopBarStoreModule(false).getScreenTopBar(p2)(false)
	end, {}) else useCallback(function(p2)
		-- upvalues: argCheckModule (copy), var10 (ref)
		argCheckModule.isType(p2, "string", "screen")
		
		return var10[p2] or {}
	end, { var10 })
	local var25 = if fFlagAppChatTopBarSignalsStoreModule then useCallback(function(p2, p3)
		-- upvalues: getTopBarStoreModule (copy)
		getTopBarStoreModule(false).setScreenTopBar(p2, p3)
	end, {}) else useCallback(function(p2, p3)
		-- upvalues: argCheckModule (copy), var11 (ref), cryoModule (copy)
		argCheckModule.isType(p2, "string", "screen")
		argCheckModule.isType(p3, "table", "state")
		var11(function(p4)
			-- upvalues: cryoModule (copy), p2 (ref), p3 (ref)
			return cryoModule.Dictionary.join(p4, { [p2] = cryoModule.Dictionary.join(p4[p2] or {}, p3) })
		end)
	end, {})
	local var26 = useCallback(function(p2)
		-- upvalues: var16 (ref), var18 (ref)
		if var16.current then
			var16.current:disconnect()
			var16.current = nil
		end
		if p2 then
			var16.current = p2:connect(var18)
		end
	end, { var16, var18 })
	useEffect(function()
		-- upvalues: var15 (ref), var26 (ref), var2 (ref), var8 (ref), enteredChatFromEntryPointModule (copy)
		var15.current = true
		var26(var2.rnBypassActionSignal)
		
		return function()
			-- upvalues: var15 (copy), var26 (copy), var8 (copy), enteredChatFromEntryPointModule (copy)
			var15.current = false
			var26(nil)
			var8(enteredChatFromEntryPointModule())
		end
	end, {})
	useEffect(function()
		-- upvalues: var2 (ref), var3 (ref), var8 (ref), navigateIntoChatModule (copy), enumScreensModule (copy), var5 (ref)
		if var2.initialConversationId and var2.initialConversationId ~= "" and var3 then
			var8(navigateIntoChatModule({
				screen = enumScreensModule.ChatConversation,
				params = {
					userId = var5,
					conversationId = var2.initialConversationId
				}
			}))
			var2.setInitialConversationId("")
		end
		return function() end
	end, {
		var8,
		var5,
		var2.initialConversationId,
		var2.setInitialConversationId
	})
	
	if getFFlagAppChatRequestedRouteModule() then
		useEffect(function()
			-- upvalues: var2 (ref), var3 (ref), var8 (ref), navigateIntoChatModule (copy)
			if var2.requestedRoute and var3 then
				var8(navigateIntoChatModule(var2.requestedRoute))
				
				if var2.clearRequestedRoute then
					var2.clearRequestedRoute()
				end
			end
			return function() end
		end, {
			var8,
			var3,
			var2.requestedRoute,
			var2.clearRequestedRoute
		})
	end
	local var27 = nil
	local var28 = nil
	
	if getFFlagIsSquadEnabled() then
		var27 = useCurrentSquadParentChannelId()
		
		if getFFlagEnableCrossExpVoice() then
			var28 = useIsVoiceConnected()
		end
	end
	useEffect(function()
		-- upvalues: getFFlagIsSquadEnabled (copy), var3 (ref), var2 (ref), var27 (write), getFFlagEnableCrossExpVoice (copy), var28 (write), var8 (ref), navigateIntoChatModule (copy), enumScreensModule (copy), var5 (ref)
		if getFFlagIsSquadEnabled() and var3 and (var2.initialConversationId == "" and var2.requestedRoute == nil) and var27 then
			if getFFlagEnableCrossExpVoice() and var28 then
				var8(navigateIntoChatModule({
					screen = enumScreensModule.SquadLobby,
					params = { userId = var5, conversationId = var27 }
				}))
				
				return
			end
			var8(navigateIntoChatModule({
				screen = enumScreensModule.ChatConversation,
				params = { userId = var5, conversationId = var27 }
			}))
		end
	end, {})
	useEffect(function()
		-- upvalues: var26 (ref), var2 (ref)
		var26(var2.rnBypassActionSignal)
	end, { var2.rnBypassActionSignal, var26 })
	useEffect(function()
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), cryoModule (copy), var10 (ref), var11 (ref)
		if not fFlagAppChatTopBarSignalsStoreModule and not cryoModule.isEmpty(var10) then
			var11({})
		end
	end, {
		var2.wideMode,
		fFlagAppChatTopBarSignalsStoreModule,
		var10
	})
	local var29 = useAppPolicyModule(function(p2)
		return p2.getChatHeaderSearch()
	end)
	local var30 = useAppPolicyModule(function(p2)
		return p2.getChatHeaderCreateChatGroup()
	end)
	local var31 = useAppPolicyModule(function(p2)
		-- upvalues: getFFlagHideNotificationIconForVRModule (copy)
		return p2.getChatHeaderNotifications() and (not getFFlagHideNotificationIconForVRModule() or p2.getWebViewSupport())
	end)
	local var32 = usePageSideMargin(var14.current, fFlagLuaAppCompositionAppChat)
	local var33 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var32 (ref)
		return {
			default = 12,
			outer = if var3 then 12 else var32,
			inner = if var3 then 12 else var32
		}
	end, { var32, var3 })
	local var34 = useIsChatEnabledModule()
	local var35 = useStyle()
	local var36 = reactModule.createElement(chatPlacementContextModule.Provider, { value = { chatPlacement = var2.chatPlacement } }, {
		navigation = reactModule.createElement(luaAppNavigationContextProviderModule, {
			navigateToLuaAppPages = var2.navigateToLuaAppPages,
			dispatch = var8
		}, {
			navigation = reactModule.createElement(var14, {
				externalDispatchConnector = var23,
				parameters = var2.parameters,
				setActiveConversationId = var2.setActiveConversationId,
				setBackButtonEnabled = var2.setBackButtonEnabled,
				setTabBarVisible = useCallback(function(p2)
					-- upvalues: var8 (ref), setTabBarVisible (copy)
					var8(setTabBarVisible(p2))
				end, { var8 }),
				chatIsVisible = var9,
				screenProps = {
					navigateToLuaAppPages = var2.navigateToLuaAppPages,
					topBarHeight = math.max(userInputService.NavBarSize.Y, if var4 then var4.Size.Size_1400 else NAV_BAR_WITH_FACEPILE_SIZE),
					wideMode = var2.wideMode,
					isInExperience = var3,
					isVisible = var2.isVisible,
					notificationCount = var2.notificationCount,
					appChatOuterPadding = var33.outer,
					appChatInnerPadding = var33.inner,
					appChatDefaultPadding = var33.default,
					topBarShowSearch = if fFlagAppChatTopBarConfigDrivenModule() then nil else var29 and (not var3 and var34),
					topBarShowCreateChatGroup = if fFlagAppChatTopBarConfigDrivenModule() then nil else var30 and var34,
					topBarShowNotifications = if fFlagAppChatTopBarConfigDrivenModule() then nil else not var3 and (var31 and not fFlagAppChatRemoveNotifications),
					topBarShowSnoozeNotifications = if fFlagAppChatTopBarConfigDrivenModule() then nil else var3 and getFFlagEnableAppChatInExperience(),
					topBarUtilityIconSideMargin = if fFlagEnableHeaderBarButtonsUpdate then var4.Size.Size_100 else nil,
					showSearchRow = var3,
					navigateToRootStack = var2.navigateToRootStack,
					navigateToAddFriends = var2.navigateToAddFriends,
					getScreenTopBar = if fFlagAppChatTopBarSignalsStoreModule then nil else var24,
					setScreenTopBar = if fFlagAppChatTopBarSignalsStoreModule then nil else var25
				}
			})
		})
	})
	
	if not fFlagAppChatSignalsReplyStoreModule then
		var36 = reactModule.createElement(replyingToMessageProviderModule, {}, { navigation = var36 })
	end
	var36 = reactModule.createElement(interactionFeedbackModule.InteractionFeedbackContext.Provider, { value = hapticFeedbackConfig }, { navigation = var36 })
	
	if not var3 then
		var36 = reactModule.createElement(layerCollectorProvider, {}, { navigation = var36 })
	end
	local var37 = if getFFlagIsSquadEnabled() then useSelector(function(p2)
		local currentSquad = p2.Squad and (p2.Squad.Squad and p2.Squad.Squad.currentSquad)
		
		return if currentSquad and currentSquad.squadId then currentSquad.squadId else nil
	end) else nil
	local var38 = reactModule.createElement(analyticsProviderModule, { localUserId = var5, entryPoint = var7 }, {
		telemetry = reactModule.createElement(appTelemetryLayerModule.Provider, {
			value = {
				context = "platformChat",
				locale = useRobloxLocaleModule(),
				entryPoint = var7 or "unknown",
				userId = var5,
				playSessionId = rbxAnalyticsService:GetPlaySessionId(),
				currentSquadId = var37,
				placement = var2.chatPlacement
			}
		}, {
			reactModule.createElement(if fFlagAppChatTopBarSignalsStoreModule then reactModule.Fragment else topBarContextModule.Provider, if fFlagAppChatTopBarSignalsStoreModule then nil else {
				value = cryoModule.Dictionary.join(var10, { getScreenTopBar = var24, setScreenTopBar = var25 })
			}, {
				navigation = var36,
				BottomInsetBackground = if var6.bottom > 0 then reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 3,
					BackgroundColor3 = if getFFlagFixChatsBottomInsetBackgroundColorModule() then var35.Theme.BackgroundDefault.Color else var35.Theme.NavigationBar.Color,
					BackgroundTransparency = if getFFlagFixChatsBottomInsetBackgroundColorModule() then var35.Theme.BackgroundDefault.Transparency else var35.Theme.NavigationBar.Transparency,
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.new(1, 0, 0, var6.bottom)
				}) else nil
			})
		})
	})
	
	if fFlagAppChatPerfTrackingModule then
		useEffect(function()
			-- upvalues: appChatPerfTrackerModule (copy), var2 (ref), var7 (ref), var37 (ref)
			appChatPerfTrackerModule.setSharedContext({
				placement = var2.chatPlacement,
				entryPoint = var7,
				hasActiveParty = var37 ~= nil
			})
		end, { var2.chatPlacement, var7, var37 })
	end
	return reactModule.createElement(roactChatAnalyticsProviderModule, { entryPoint = var7 }, { var38 })
end

return memo(AppChatEntryPoint)
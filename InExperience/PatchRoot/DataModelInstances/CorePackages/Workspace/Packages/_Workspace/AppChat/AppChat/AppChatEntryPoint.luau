local appChat = script:FindFirstAncestor("AppChat")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local parent = appChat.Parent
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
local chatPlacementContextModule = require(appChat.Contexts.ChatPlacementContext)
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
local useCallback = reactModule.useCallback
local useChatIsVisibleModule = require(appChat.Hooks.useChatIsVisible)
local useCurrentSquadParentChannelId = require(parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useIsVoiceConnected = require(parent.CrossExperienceVoice).Hooks.useIsVoiceConnected
local usePartyChatReactiveFeatureRestrictionModule = require(appChat.Hooks.usePartyChatReactiveFeatureRestriction)
local useRef = reactModule.useRef
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local useRobloxLocaleModule = require(appChat.Hooks.useRobloxLocale)
local replyingToMessageProviderModule = require(appChat.Components.ChatConversation.MessageInteraction.ReplyingContext.ReplyingToMessageProvider)
local fFlagAppChatSignalsReplyStoreModule = require(appChat.Flags.FFlagAppChatSignalsReplyStore)
local layerCollectorProvider = require(parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local appChatNetworkingModule = require(parent.AppChatNetworking)
local interactionFeedbackModule = require(parent.InteractionFeedback)
local hapticFeedbackConfig = require(appChat.Utils.HapticFeedback).HapticFeedbackConfig
local createConversationModule = require(appChat.Conversations.Thunks.createConversation)
local fetchLatestConversationDetailsModule = require(appChat.Conversations.Thunks.fetchLatestConversationDetails)
local rootedChatDetailsNavigationModule = require(appChat.Navigators.rootedChatDetailsNavigation)
local enumScreensModule = require(script.Parent.EnumScreens)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local getFFlagEnableCrossExpVoice = require(parent.SharedFlags).GetFFlagEnableCrossExpVoice
local fFlagAppChatReactiveFeatureRestrictions = sharedFlagsModule.FFlagAppChatReactiveFeatureRestrictions
local enteredChatFromEntryPointModule = require(appChat.Actions.EnteredChatFromEntryPoint)
local navigateIntoChatModule = require(appChat.Actions.NavigateIntoChat)
local getFFlagFixChatsBottomInsetBackgroundColorModule = require(appChat.Flags.getFFlagFixChatsBottomInsetBackgroundColor)
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
	-- upvalues: cryoModule (ref), t (ref), chatPlacementContextModule (ref), fFlagAppChatReactiveFeatureRestrictions (ref), usePartyChatReactiveFeatureRestrictionModule (ref), useTokens (ref), var1 (ref), rootNavigatorModule (write), appChat (ref), rootNavigatorModule_1 (write), useSelector (ref), useCallback (ref), useDispatch (ref), useEffect (ref), appChatNetworkingModule (ref), loggerModule (ref), useChatIsVisibleModule (ref), reactModule (ref), roactNavigationModule (ref), getRoactChatStackNavigatorModule (ref), useRef (ref), fFlagSupportViewingUserProfileOnOSAModule (ref), getOverlayStoreModule (ref), enumScreensModule (ref), createConversationModule (ref), fetchLatestConversationDetailsModule (ref), getFFlagIsSquadEnabled (ref), fFlagAppChatShowOSAOnPageEntry (ref), navigateWithOsaGateModule (ref), getFFlagAppChatRequestedRouteModule (ref), rootedChatDetailsNavigationModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), enteredChatFromEntryPointModule (ref), navigateIntoChatModule (ref), useCurrentSquadParentChannelId (ref), getFFlagEnableCrossExpVoice (ref), useIsVoiceConnected (ref), usePageSideMargin (ref), fFlagLuaAppCompositionAppChat (ref), useStyle (ref), setTabBarVisible (ref), userInputService (ref), NAV_BAR_WITH_FACEPILE_SIZE (ref), fFlagEnableHeaderBarButtonsUpdate (ref), luaAppNavigationContextProviderModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), replyingToMessageProviderModule (ref), interactionFeedbackModule (ref), hapticFeedbackConfig (ref), layerCollectorProvider (ref), useRobloxLocaleModule (ref), rbxAnalyticsService (ref), analyticsProviderModule (ref), appTelemetryLayerModule (ref), getFFlagFixChatsBottomInsetBackgroundColorModule (ref), roactChatAnalyticsProviderModule (ref)
	local var2 = cryoModule.Dictionary.join(t, p1)
	local var3 = chatPlacementContextModule.isPlacementInExperience(var2.chatPlacement)
	
	if fFlagAppChatReactiveFeatureRestrictions then
		usePartyChatReactiveFeatureRestrictionModule(var2.isVisible and not var3)
	end
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
	local var10 = reactModule.useMemo(function()
		-- upvalues: roactNavigationModule (copy), getRoactChatStackNavigatorModule (copy), var2 (ref), rootNavigatorModule_1 (copy), rootNavigatorModule (copy)
		return roactNavigationModule.createAppContainer(getRoactChatStackNavigatorModule(if var2.wideMode then rootNavigatorModule_1 else rootNavigatorModule, var2.navigateToRootStack, var2.androidBackButtonSignal, var2.androidBackButtonConnection))
	end, {
		var2.wideMode, rootNavigatorModule_1, rootNavigatorModule,
		var2.navigateToRootStack, var2.androidBackButtonSignal,
		var2.androidBackButtonConnection
	})
	local var11 = useRef(nil)
	
	if not var3 and var11.current == nil then
		var11.current = roactNavigationModule.createAppContainer(getRoactChatStackNavigatorModule(if var2.wideMode then rootNavigatorModule_1 else rootNavigatorModule, var2.navigateToRootStack, var2.androidBackButtonSignal, var2.androidBackButtonConnection))
	end
	local var12 = if var3 then var10 else var11.current
	local var13 = useRef(false)
	local var14 = useRef(nil)
	local var15 = useRef(function(...) end)
	useEffect(function()
		-- upvalues: var2 (ref), loggerModule (copy)
		if var2.logger then
			loggerModule:setParent(var2.logger)
		end
	end, { var2.logger })
	local var16 = useCallback(function(p2)
		-- upvalues: var13 (ref), var15 (ref)
		if not var13.current then return end
		if var15.current then
			var15.current(p2)
		end
	end, { var13, var15 })
	
	if fFlagSupportViewingUserProfileOnOSAModule then
		local navigateToLuaAppPages = var2.navigateToLuaAppPages
		useEffect(function()
			-- upvalues: getOverlayStoreModule (copy), navigateToLuaAppPages (ref), enumScreensModule (copy)
			getOverlayStoreModule(false).setOverlayDefaultProps({
				onViewUserProfile = if navigateToLuaAppPages then navigateToLuaAppPages[enumScreensModule.ViewUserProfile] else nil
			})
		end, { navigateToLuaAppPages })
	end
	local var17 = useCallback(function(p2)
		-- upvalues: roactNavigationModule (copy), enumScreensModule (copy)
		return roactNavigationModule.Actions.navigate({
			routeName = enumScreensModule.ChatConversation,
			params = { conversationId = p2 }
		})
	end, {})
	local var18 = useCallback(function(p2, p3)
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
	local var19 = useCallback(function(p2)
		-- upvalues: var8 (ref), createConversationModule (copy)
		return var8(createConversationModule("one_to_one", { p2 }))
	end, { var8 })
	local var20 = useCallback(function(p2)
		-- upvalues: var8 (ref), fetchLatestConversationDetailsModule (copy)
		return var8(fetchLatestConversationDetailsModule(p2))
	end, { var8 })
	local var21 = useCallback(function(p2)
		-- upvalues: var15 (ref), var2 (ref), getFFlagIsSquadEnabled (copy), cryoModule (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var8 (ref), var18 (ref), enumScreensModule (copy), getFFlagAppChatRequestedRouteModule (copy), rootedChatDetailsNavigationModule (copy), var20 (ref), roactNavigationModule (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), loggerModule (copy), var17 (ref), var19 (ref)
		var15.current = p2
		
		if not var2.updateExternalNavigationForScreen then
			return function()
				-- upvalues: var15 (copy)
				var15.current = nil
			end
		end
		local updateExternalNavigationForScreen = var2.updateExternalNavigationForScreen
		
		if getFFlagIsSquadEnabled() then
			updateExternalNavigationForScreen(function(p3)
				-- upvalues: cryoModule (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var8 (copy), p2 (ref), var18 (copy)
				local conversationId = p3.conversationId
				local conversationId_1 = cryoModule.Dictionary.omit(p3, "conversationId")
				
				if fFlagAppChatShowOSAOnPageEntry then
					navigateWithOsaGateModule({
						requireMultiUserForU13 = true,
						conversationId = conversationId,
						dispatch = var8,
						onAccepted = function()
							-- upvalues: p2 (copy), var18 (copy), conversationId (ref), conversationId_1 (ref)
							p2(var18(conversationId, conversationId_1))
						end
					})
					
					return
				end
				p2(var18(conversationId, conversationId_1))
			end, enumScreensModule.SquadLobby)
		end
		if getFFlagAppChatRequestedRouteModule() then
			updateExternalNavigationForScreen(function(p3)
				-- upvalues: rootedChatDetailsNavigationModule (copy), p2 (ref), var8 (copy), var20 (copy), roactNavigationModule (copy), enumScreensModule (copy)
				if not p3 or not p3.conversationId then return end
				if rootedChatDetailsNavigationModule.tryNavigateToRootedChatDetails({
					callback = p2,
					dispatch = var8,
					fetchLatestConversationDetails = var20
				}, p3) then
					return
				end
				p2(roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.ChatDetails, params = p3 }))
			end, enumScreensModule.ChatDetails)
		end
		updateExternalNavigationForScreen(function(p3)
			-- upvalues: fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var8 (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), var20 (copy), loggerModule (copy), p2 (ref), var17 (copy), var19 (copy)
			local conversationId = p3 and p3.conversationId
			
			if conversationId then
				if fFlagAppChatShowOSAOnPageEntry then
					navigateWithOsaGateModule({
						conversationId = conversationId,
						dispatch = var8,
						onAccepted = function()
							-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), conversationId (ref), var20 (copy), loggerModule (copy), p2 (copy), var17 (copy)
							if fFlagAppChatPerfTrackingModule then
								appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = conversationId })
							end
							var20(conversationId):andThen(function()
								-- upvalues: loggerModule (copy), conversationId (copy), p2 (copy), var17 (copy)
								loggerModule:info("Successfully fetched conversation details for conversationId {} for external navigation", conversationId)
								p2(var17(conversationId))
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
				var20(conversationId):andThen(function()
					-- upvalues: loggerModule (copy), conversationId (ref), p2 (copy), var17 (copy)
					loggerModule:info("Successfully fetched conversation details for conversationId {} for external navigation", conversationId)
					p2(var17(conversationId))
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
					-- upvalues: var19 (copy), userId (ref), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), loggerModule (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var8 (copy), p2 (copy), var17 (copy)
					var19(userId):andThen(function(p4)
						-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), loggerModule (copy), userId (copy), fFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGateModule (copy), var8 (copy), p2 (copy), var17 (copy)
						if fFlagAppChatPerfTrackingModule then
							appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = p4.id })
						end
						loggerModule:info("Successfully fetched conversation details for userId {} for external navigation", userId)
						
						if fFlagAppChatShowOSAOnPageEntry then
							navigateWithOsaGateModule({
								conversationId = p4.id,
								dispatch = var8,
								onAccepted = function()
									-- upvalues: p2 (copy), var17 (copy), p4 (ref)
									p2(var17(p4.id))
								end
							})
							
							return
						end
						p2(var17(p4.id))
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
			-- upvalues: updateExternalNavigationForScreen (ref), enumScreensModule (copy), getFFlagAppChatRequestedRouteModule (copy), getFFlagIsSquadEnabled (copy), var15 (copy)
			updateExternalNavigationForScreen(nil, enumScreensModule.ChatLanding)
			
			if getFFlagAppChatRequestedRouteModule() then
				updateExternalNavigationForScreen(nil, enumScreensModule.ChatDetails)
			end
			updateExternalNavigationForScreen(nil, enumScreensModule.ChatConversation)
			
			if getFFlagIsSquadEnabled() then
				updateExternalNavigationForScreen(nil, enumScreensModule.SquadLobby)
			end
			var15.current = nil
		end
	end, {
		var15, var19, var8, var20, var17, var18,
		var2.updateExternalNavigationForScreen, var2.wideMode
	})
	local var22 = useCallback(function(p2)
		-- upvalues: var14 (ref), var16 (ref)
		if var14.current then
			var14.current:disconnect()
			var14.current = nil
		end
		if p2 then
			var14.current = p2:connect(var16)
		end
	end, { var14, var16 })
	useEffect(function()
		-- upvalues: var13 (ref), var22 (ref), var2 (ref), var8 (ref), enteredChatFromEntryPointModule (copy)
		var13.current = true
		var22(var2.rnBypassActionSignal)
		
		return function()
			-- upvalues: var13 (copy), var22 (copy), var8 (copy), enteredChatFromEntryPointModule (copy)
			var13.current = false
			var22(nil)
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
	local var23 = nil
	local var24 = nil
	
	if getFFlagIsSquadEnabled() then
		var23 = useCurrentSquadParentChannelId()
		
		if getFFlagEnableCrossExpVoice() then
			var24 = useIsVoiceConnected()
		end
	end
	useEffect(function()
		-- upvalues: getFFlagIsSquadEnabled (copy), var3 (ref), var2 (ref), var23 (write), getFFlagEnableCrossExpVoice (copy), var24 (write), var8 (ref), navigateIntoChatModule (copy), enumScreensModule (copy), var5 (ref)
		if getFFlagIsSquadEnabled() and var3 and (var2.initialConversationId == "" and var2.requestedRoute == nil) and var23 then
			if getFFlagEnableCrossExpVoice() and var24 then
				var8(navigateIntoChatModule({
					screen = enumScreensModule.SquadLobby,
					params = { userId = var5, conversationId = var23 }
				}))
				
				return
			end
			var8(navigateIntoChatModule({
				screen = enumScreensModule.ChatConversation,
				params = { userId = var5, conversationId = var23 }
			}))
		end
	end, {})
	useEffect(function()
		-- upvalues: var22 (ref), var2 (ref)
		var22(var2.rnBypassActionSignal)
	end, { var2.rnBypassActionSignal, var22 })
	local var25 = usePageSideMargin(var12.current, fFlagLuaAppCompositionAppChat)
	local var26 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var25 (ref)
		return {
			default = 12,
			outer = if var3 then 12 else var25,
			inner = if var3 then 12 else var25
		}
	end, { var25, var3 })
	local var27 = useStyle()
	local var28 = reactModule.createElement(chatPlacementContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var2 (ref)
			return { chatPlacement = var2.chatPlacement }
		end, { var2.chatPlacement })
	}, {
		navigation = reactModule.createElement(luaAppNavigationContextProviderModule, {
			navigateToLuaAppPages = var2.navigateToLuaAppPages,
			dispatch = var8
		}, {
			navigation = reactModule.createElement(var12, {
				externalDispatchConnector = var21,
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
					appChatOuterPadding = var26.outer,
					appChatInnerPadding = var26.inner,
					appChatDefaultPadding = var26.default,
					topBarUtilityIconSideMargin = if fFlagEnableHeaderBarButtonsUpdate then var4.Size.Size_100 else nil,
					showSearchRow = var3,
					navigateToRootStack = var2.navigateToRootStack,
					navigateToAddFriends = var2.navigateToAddFriends
				}
			})
		})
	})
	
	if not fFlagAppChatSignalsReplyStoreModule then
		var28 = reactModule.createElement(replyingToMessageProviderModule, {}, { navigation = var28 })
	end
	var28 = reactModule.createElement(interactionFeedbackModule.InteractionFeedbackContext.Provider, { value = hapticFeedbackConfig }, { navigation = var28 })
	
	if not var3 then
		var28 = reactModule.createElement(layerCollectorProvider, {}, { navigation = var28 })
	end
	local var29 = useRobloxLocaleModule()
	local playSessionId = rbxAnalyticsService:GetPlaySessionId()
	local var30 = if getFFlagIsSquadEnabled() then useSelector(function(p2)
		local currentSquad = p2.Squad and (p2.Squad.Squad and p2.Squad.Squad.currentSquad)
		
		return if currentSquad and currentSquad.squadId then currentSquad.squadId else nil
	end) else nil
	local var31 = reactModule.createElement(analyticsProviderModule, { localUserId = var5, entryPoint = var7 }, {
		telemetry = reactModule.createElement(appTelemetryLayerModule.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: var29 (ref), var7 (ref), var5 (ref), playSessionId (ref), var30 (ref), var2 (ref)
				return {
					context = "platformChat",
					locale = var29,
					entryPoint = var7 or "unknown",
					userId = var5,
					playSessionId = playSessionId,
					currentSquadId = var30,
					placement = var2.chatPlacement
				}
			end, {
				var29, var7, var5, playSessionId, var30, var2.chatPlacement
			})
		}, {
			navigation = var28,
			BottomInsetBackground = if var6.bottom > 0 then reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 3,
				BackgroundColor3 = if getFFlagFixChatsBottomInsetBackgroundColorModule() then var27.Theme.BackgroundDefault.Color else var27.Theme.NavigationBar.Color,
				BackgroundTransparency = if getFFlagFixChatsBottomInsetBackgroundColorModule() then var27.Theme.BackgroundDefault.Transparency else var27.Theme.NavigationBar.Transparency,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, var6.bottom)
			}) else nil
		})
	})
	
	if fFlagAppChatPerfTrackingModule then
		useEffect(function()
			-- upvalues: appChatPerfTrackerModule (copy), var2 (ref), var7 (ref), var30 (ref)
			appChatPerfTrackerModule.setSharedContext({
				placement = var2.chatPlacement,
				entryPoint = var7,
				hasActiveParty = var30 ~= nil
			})
		end, { var2.chatPlacement, var7, var30 })
	end
	return reactModule.createElement(roactChatAnalyticsProviderModule, { entryPoint = var7 }, { var31 })
end

return memo(AppChatEntryPoint)
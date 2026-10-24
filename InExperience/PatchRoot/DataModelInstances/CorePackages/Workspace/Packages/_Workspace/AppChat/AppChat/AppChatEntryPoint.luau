local AppChat = script:FindFirstAncestor("AppChat")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(AppChat.types)
local SharedFlagsModule = require(Parent.SharedFlags)
local Logger = require(Parent.Loggers).Logger
local LoggerModule = require(AppChat.Logger)
local GetRoactChatStackNavigatorModule = require(AppChat.getRoactChatStackNavigator)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local RootNavigatorModule = nil
local RootNavigatorModule1 = nil
local Inverted = not require(AppChat.Flags.getFFlagAppChatRemoveDynamicRequires)()
local UsePageSideMarginFunction = require(Parent.CollectionViews).usePageSideMargin

if not Inverted then
	RootNavigatorModule = require(AppChat.Navigators.Compact.rootNavigator)
	RootNavigatorModule1 = require(AppChat.Navigators.Wide.rootNavigator)
end
local AnalyticsProviderModule = require(AppChat.LegacyAnalytics.AnalyticsProvider)
local ChatPlacementContextModule = require(AppChat.Contexts.ChatPlacementContext)
local LuaAppNavigationContextProviderModule = require(AppChat.LuaAppNavigationContextProvider)
local SetTabBarVisibleFunction = require(Parent.AppTabBarRodux).Actions.SetTabBarVisible
local RoactChatAnalyticsProviderModule = require(AppChat.Analytics.RoactChatAnalyticsProvider)
local AppTelemetryLayerModule = require(AppChat.Telemetry.Layers.AppTelemetryLayer)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UserInputService = game:GetService("UserInputService")
local MemoFunction = ReactModule.memo
local UseCallbackFunction = ReactModule.useCallback
local UseChatIsVisibleModule = require(AppChat.Hooks.useChatIsVisible)
local UseCurrentSquadParentChannelIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseIsVoiceConnectedFunction = require(Parent.CrossExperienceVoice).Hooks.useIsVoiceConnected
local UsePartyChatReactiveFeatureRestrictionModule = require(AppChat.Hooks.usePartyChatReactiveFeatureRestriction)
local UseRefFunction = ReactModule.useRef
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseRobloxLocaleModule = require(AppChat.Hooks.useRobloxLocale)
local ReplyingToMessageProviderModule = require(AppChat.Components.ChatConversation.MessageInteraction.ReplyingContext.ReplyingToMessageProvider)
local FFlagAppChatSignalsReplyStoreModule = require(AppChat.Flags.FFlagAppChatSignalsReplyStore)
local FFlagAppChatReactivePaneLayoutOnRotation = SharedFlagsModule.FFlagAppChatReactivePaneLayoutOnRotation
local LayerCollectorProvider = require(Parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local InteractionFeedbackModule = require(Parent.InteractionFeedback)
local HapticFeedbackConfig = require(AppChat.Utils.HapticFeedback).HapticFeedbackConfig
local CreateConversationModule = require(AppChat.Conversations.Thunks.createConversation)
local FetchLatestConversationDetailsModule = require(AppChat.Conversations.Thunks.fetchLatestConversationDetails)
local RootedChatDetailsNavigationModule = require(AppChat.Navigators.rootedChatDetailsNavigation)
local EnumScreensModule = require(script.Parent.EnumScreens)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local GetFFlagEnableCrossExpVoiceFunction = require(Parent.SharedFlags).GetFFlagEnableCrossExpVoice
local FFlagAppChatReactiveFeatureRestrictions = SharedFlagsModule.FFlagAppChatReactiveFeatureRestrictions
local EnteredChatFromEntryPointModule = require(AppChat.Actions.EnteredChatFromEntryPoint)
local NavigateIntoChatModule = require(AppChat.Actions.NavigateIntoChat)
local GetFFlagFixChatsBottomInsetBackgroundColorModule = require(AppChat.Flags.getFFlagFixChatsBottomInsetBackgroundColor)
local GetFFlagAppChatRequestedRouteModule = require(AppChat.Flags.getFFlagAppChatRequestedRoute)
local FFlagSupportViewingUserProfileOnOSAModule = require(AppChat.Flags.FFlagSupportViewingUserProfileOnOSA)
local GetOverlayStoreModule = require(AppChat.Stores.GetOverlayStore)
local NavigateWithOsaGateModule = require(AppChat.Utils.navigateWithOsaGate)
local FFlagAppChatShowOSAOnPageEntry = SharedFlagsModule.FFlagAppChatShowOSAOnPageEntry
local FFlagEnableHeaderBarButtonsUpdate = SharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate
local FFlagLuaAppCompositionAppChat = SharedFlagsModule.FFlagLuaAppCompositionAppChat
local FFlagAppChatUseSignalsForLastEntryPointModule = require(AppChat.Flags.FFlagAppChatUseSignalsForLastEntryPoint)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetLastEntryPointStoreModule = if FFlagAppChatUseSignalsForLastEntryPointModule then require(AppChat.Stores.GetLastEntryPointStore) else nil
local NAVBARWITHFACEPILESIZE = require(AppChat.Constants).NAV_BAR_WITH_FACEPILE_SIZE
local config = {
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
	logger = Logger,
	setTabBarVisible = function() end,
	setInitialConversationId = function(_) end,
	chatPlacement = ChatPlacementContextModule.Enum.Unknown
}

local function useReactivePaneRestore(JoinResult)
	-- upvalues: UseRefFunction (copy), UseCallbackFunction (copy)
	local UseRefResult = UseRefFunction(if JoinResult.parameters then JoinResult.parameters.conversationId else nil)
	local UseCallbackResult = UseCallbackFunction(function(Current)
		-- upvalues: UseRefResult (copy), JoinResult (copy)
		UseRefResult.current = Current
		local SetActiveConversationIdFunction: (any) -> () = JoinResult.setActiveConversationId
		
		if SetActiveConversationIdFunction then
			SetActiveConversationIdFunction(Current)
		end
	end, { JoinResult.setActiveConversationId })
	local UseRefResult1 = UseRefFunction(JoinResult.navigateToRootStack)
	UseRefResult1.current = JoinResult.navigateToRootStack
	local UseCallbackResult1 = UseCallbackFunction(function(...)
		-- upvalues: UseRefResult1 (copy)
		local CurrentFunction: (any) -> () = UseRefResult1.current
		
		if CurrentFunction then
			CurrentFunction(...)
		end
	end, {})
	
	return UseRefResult, UseCallbackResult, if JoinResult.navigateToRootStack then UseCallbackResult1 else JoinResult.navigateToRootStack
end

function AppChatEntryPoint(p1)
	-- upvalues: CryoModule (copy), config (copy), ChatPlacementContextModule (copy), FFlagAppChatReactiveFeatureRestrictions (copy), UsePartyChatReactiveFeatureRestrictionModule (copy), UseTokensFunction (copy), Inverted (copy), RootNavigatorModule (ref), AppChat (copy), RootNavigatorModule1 (ref), UseSelectorFunction (copy), UseCallbackFunction (copy), FFlagAppChatUseSignalsForLastEntryPointModule (copy), UseSignalStateFunction (copy), GetLastEntryPointStoreModule (copy), UseDispatchFunction (copy), UseEffectFunction (copy), AppChatNetworkingModule (copy), LoggerModule (copy), UseChatIsVisibleModule (copy), FFlagAppChatReactivePaneLayoutOnRotation (copy), useReactivePaneRestore (copy), ReactModule (copy), RoactNavigationModule (copy), GetRoactChatStackNavigatorModule (copy), UseRefFunction (copy), FFlagSupportViewingUserProfileOnOSAModule (copy), GetOverlayStoreModule (copy), EnumScreensModule (copy), CreateConversationModule (copy), FetchLatestConversationDetailsModule (copy), GetFFlagIsSquadEnabledFunction (copy), FFlagAppChatShowOSAOnPageEntry (copy), NavigateWithOsaGateModule (copy), GetFFlagAppChatRequestedRouteModule (copy), RootedChatDetailsNavigationModule (copy), FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), EnteredChatFromEntryPointModule (copy), NavigateIntoChatModule (copy), UseCurrentSquadParentChannelIdFunction (copy), GetFFlagEnableCrossExpVoiceFunction (copy), UseIsVoiceConnectedFunction (copy), UsePageSideMarginFunction (copy), FFlagLuaAppCompositionAppChat (copy), UseStyleFunction (copy), SetTabBarVisibleFunction (copy), UserInputService (copy), NAVBARWITHFACEPILESIZE (copy), FFlagEnableHeaderBarButtonsUpdate (copy), LuaAppNavigationContextProviderModule (copy), FFlagAppChatSignalsReplyStoreModule (copy), ReplyingToMessageProviderModule (copy), InteractionFeedbackModule (copy), HapticFeedbackConfig (copy), LayerCollectorProvider (copy), UseRobloxLocaleModule (copy), RbxAnalyticsService (copy), AnalyticsProviderModule (copy), AppTelemetryLayerModule (copy), GetFFlagFixChatsBottomInsetBackgroundColorModule (copy), RoactChatAnalyticsProviderModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local IsPlacementInExperience = ChatPlacementContextModule.isPlacementInExperience(JoinResult.chatPlacement)
	
	if FFlagAppChatReactiveFeatureRestrictions then
		UsePartyChatReactiveFeatureRestrictionModule(JoinResult.isVisible and not IsPlacementInExperience)
	end
	local UseTokensResult = UseTokensFunction()
	
	if Inverted then
		RootNavigatorModule = require(AppChat.Navigators.Compact.rootNavigator)
		RootNavigatorModule1 = require(AppChat.Navigators.Wide.rootNavigator)
	end
	local UseSelectorResult = UseSelectorFunction(UseCallbackFunction(function(p2)
		return p2.LocalUserId
	end, {})) or JoinResult.localUserId
	local UseSelectorResult1 = UseSelectorFunction(UseCallbackFunction(function(p2)
		return p2.GlobalGuiInset
	end, {})) or { bottom = 0 }
	local UseCallbackResult = UseCallbackFunction(function(p2)
		return p2.ChatAppReducer.LastEntryPoint
	end, {})
	local UseSignalStateResult = if FFlagAppChatUseSignalsForLastEntryPointModule then UseSignalStateFunction(GetLastEntryPointStoreModule(false).getLastEntryPoint) else UseSelectorFunction(UseCallbackResult)
	local UseDispatchResult = UseDispatchFunction()
	UseEffectFunction(function()
		-- upvalues: UseDispatchResult (copy), AppChatNetworkingModule (upval), IsPlacementInExperience (copy), LoggerModule (upval)
		UseDispatchResult(AppChatNetworkingModule.rodux.GetChatLandingModal.API(IsPlacementInExperience)):catch(function(Err)
			-- upvalues: LoggerModule (upval)
			LoggerModule:warning("Error in GetChatLandingModal request. Error: {}", (tostring(Err)))
		end)
	end, {
		UseDispatchResult,
		UseSelectorResult,
		IsPlacementInExperience
	})
	local UseChatIsVisibleModuleResult = UseChatIsVisibleModule()
	local v1 = nil
	local UseReactivePaneRestoreResult3 = nil
	local UseReactivePaneRestoreResult2 = nil
	
	if FFlagAppChatReactivePaneLayoutOnRotation then
		v1, UseReactivePaneRestoreResult2, UseReactivePaneRestoreResult3 = useReactivePaneRestore(JoinResult)
	else
		UseReactivePaneRestoreResult2 = JoinResult.setActiveConversationId
		UseReactivePaneRestoreResult3 = JoinResult.navigateToRootStack
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: RoactNavigationModule (upval), GetRoactChatStackNavigatorModule (upval), JoinResult (copy), RootNavigatorModule1 (upval), RootNavigatorModule (upval), UseReactivePaneRestoreResult3 (ref), v1 (ref)
		return {
			container = RoactNavigationModule.createAppContainer(GetRoactChatStackNavigatorModule(JoinResult.wideMode and RootNavigatorModule1 or RootNavigatorModule, UseReactivePaneRestoreResult3, JoinResult.androidBackButtonSignal, JoinResult.androidBackButtonConnection)),
			restoreParameters = if v1 and v1.current then { conversationId = v1.current } else nil
		}
	end, {
		JoinResult.wideMode, RootNavigatorModule1, RootNavigatorModule,
		UseReactivePaneRestoreResult3, JoinResult.androidBackButtonSignal,
		JoinResult.androidBackButtonConnection, v1
	})
	local UseRefResult = UseRefFunction(nil)
	
	if not FFlagAppChatReactivePaneLayoutOnRotation and not IsPlacementInExperience and UseRefResult.current == nil then
		UseRefResult.current = RoactNavigationModule.createAppContainer(GetRoactChatStackNavigatorModule(JoinResult.wideMode and RootNavigatorModule1 or RootNavigatorModule, JoinResult.navigateToRootStack, JoinResult.androidBackButtonSignal, JoinResult.androidBackButtonConnection))
	end
	local Container = if IsPlacementInExperience or FFlagAppChatReactivePaneLayoutOnRotation then UseMemoResult.container else UseRefResult.current
	local UseRefResult1 = UseRefFunction(false)
	local UseRefResult2 = UseRefFunction(nil)
	local UseRefResult3 = UseRefFunction(function(...) end)
	UseEffectFunction(function()
		-- upvalues: JoinResult (copy), LoggerModule (upval)
		if JoinResult.logger then
			LoggerModule:setParent(JoinResult.logger)
		end
	end, { JoinResult.logger })
	local UseCallbackResult1 = UseCallbackFunction(function(p2)
		-- upvalues: UseRefResult1 (copy), UseRefResult3 (copy)
		if not UseRefResult1.current then return end
		if UseRefResult3.current then
			UseRefResult3.current(p2)
		end
	end, { UseRefResult1, UseRefResult3 })
	
	if FFlagSupportViewingUserProfileOnOSAModule then
		local NavigateToLuaAppPages = JoinResult.navigateToLuaAppPages
		UseEffectFunction(function()
			-- upvalues: GetOverlayStoreModule (upval), NavigateToLuaAppPages (copy), EnumScreensModule (upval)
			GetOverlayStoreModule(false).setOverlayDefaultProps({
				onViewUserProfile = if NavigateToLuaAppPages then NavigateToLuaAppPages[EnumScreensModule.ViewUserProfile] else nil
			})
		end, { NavigateToLuaAppPages })
	end
	local UseCallbackResult11 = UseCallbackFunction(function(ConversationId)
		-- upvalues: RoactNavigationModule (upval), EnumScreensModule (upval)
		return RoactNavigationModule.Actions.navigate({
			routeName = EnumScreensModule.ChatConversation,
			params = { conversationId = ConversationId }
		})
	end, {})
	local UseCallbackResult2 = UseCallbackFunction(function(ConversationId, ExtraParams)
		-- upvalues: RoactNavigationModule (upval), EnumScreensModule (upval), JoinResult (copy)
		local Actions = {
			RoactNavigationModule.Actions.navigate({
				routeName = EnumScreensModule.ChatConversation,
				params = { conversationId = ConversationId }
			}),
			RoactNavigationModule.Actions.navigate({
				routeName = EnumScreensModule.SquadLobby,
				params = {
					conversationId = ConversationId,
					extraParams = ExtraParams
				}
			})
		}
		
		if JoinResult.wideMode then
			return RoactNavigationModule.Actions.navigate({
				routeName = EnumScreensModule.ChatLanding,
				params = { conversationId = ConversationId },
				action = RoactNavigationModule.StackActions.reset({ index = 2, actions = Actions })
			})
		else
			table.insert(Actions, 1, RoactNavigationModule.Actions.navigate({ routeName = EnumScreensModule.ChatLanding }))
			
			return RoactNavigationModule.Actions.navigate({
				routeName = EnumScreensModule.ChatLandingStack,
				params = { conversationId = ConversationId },
				action = RoactNavigationModule.StackActions.reset({ index = 3, actions = Actions })
			})
		end
	end, { JoinResult.wideMode })
	local UseCallbackResult3 = UseCallbackFunction(function(p2)
		-- upvalues: UseDispatchResult (copy), CreateConversationModule (upval)
		return UseDispatchResult(CreateConversationModule("one_to_one", { p2 }))
	end, { UseDispatchResult })
	local UseCallbackResult4 = UseCallbackFunction(function(p2)
		-- upvalues: UseDispatchResult (copy), FetchLatestConversationDetailsModule (upval)
		return UseDispatchResult(FetchLatestConversationDetailsModule(p2))
	end, { UseDispatchResult })
	local UseCallbackResult5 = UseCallbackFunction(function(Callback)
		-- upvalues: UseRefResult3 (copy), JoinResult (copy), GetFFlagIsSquadEnabledFunction (upval), CryoModule (upval), FFlagAppChatShowOSAOnPageEntry (upval), NavigateWithOsaGateModule (upval), UseDispatchResult (copy), UseCallbackResult2 (copy), EnumScreensModule (upval), GetFFlagAppChatRequestedRouteModule (upval), RootedChatDetailsNavigationModule (upval), UseCallbackResult4 (copy), RoactNavigationModule (upval), FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), LoggerModule (upval), UseCallbackResult11 (copy), UseCallbackResult3 (copy)
		UseRefResult3.current = Callback
		
		if not JoinResult.updateExternalNavigationForScreen then
			return function()
				-- upvalues: UseRefResult3 (upval)
				UseRefResult3.current = nil
			end
		end
		local UpdateExternalNavigationForScreenFunction: (any, any) -> () = JoinResult.updateExternalNavigationForScreen
		
		if GetFFlagIsSquadEnabledFunction() then
			UpdateExternalNavigationForScreenFunction(function(p2)
				-- upvalues: CryoModule (upval), FFlagAppChatShowOSAOnPageEntry (upval), NavigateWithOsaGateModule (upval), UseDispatchResult (upval), Callback (copy), UseCallbackResult2 (upval)
				local ConversationId = p2.conversationId
				local ConversationId1 = CryoModule.Dictionary.omit(p2, "conversationId")
				
				if FFlagAppChatShowOSAOnPageEntry then
					NavigateWithOsaGateModule({
						requireMultiUserForU13 = true,
						conversationId = ConversationId,
						dispatch = UseDispatchResult,
						onAccepted = function()
							-- upvalues: Callback (upval), UseCallbackResult2 (upval), ConversationId (copy), ConversationId1 (copy)
							Callback(UseCallbackResult2(ConversationId, ConversationId1))
						end
					})
					
					return
				else
					Callback(UseCallbackResult2(ConversationId, ConversationId1))
				end
			end, EnumScreensModule.SquadLobby)
		end
		if GetFFlagAppChatRequestedRouteModule() then
			UpdateExternalNavigationForScreenFunction(function(Params)
				-- upvalues: RootedChatDetailsNavigationModule (upval), Callback (copy), UseDispatchResult (upval), UseCallbackResult4 (upval), RoactNavigationModule (upval), EnumScreensModule (upval)
				if not Params or not Params.conversationId then return end
				if not RootedChatDetailsNavigationModule.tryNavigateToRootedChatDetails({
					callback = Callback,
					dispatch = UseDispatchResult,
					fetchLatestConversationDetails = UseCallbackResult4
				}, Params) then
					Callback(RoactNavigationModule.Actions.navigate({
						routeName = EnumScreensModule.ChatDetails,
						params = Params
					}))
					
					return
				end
			end, EnumScreensModule.ChatDetails)
		end
		UpdateExternalNavigationForScreenFunction(function(p2)
			-- upvalues: FFlagAppChatShowOSAOnPageEntry (upval), NavigateWithOsaGateModule (upval), UseDispatchResult (upval), FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), UseCallbackResult4 (upval), LoggerModule (upval), Callback (copy), UseCallbackResult11 (upval), UseCallbackResult3 (upval)
			local ConversationId = p2 and p2.conversationId
			
			if ConversationId then
				if FFlagAppChatShowOSAOnPageEntry then
					NavigateWithOsaGateModule({
						conversationId = ConversationId,
						dispatch = UseDispatchResult,
						onAccepted = function()
							-- upvalues: FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), ConversationId (copy), UseCallbackResult4 (upval), LoggerModule (upval), Callback (upval), UseCallbackResult11 (upval)
							if FFlagAppChatPerfTrackingModule then
								AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = ConversationId })
							end
							UseCallbackResult4(ConversationId):andThen(function()
								-- upvalues: LoggerModule (upval), ConversationId (upval), Callback (upval), UseCallbackResult11 (upval)
								LoggerModule:info("Successfully fetched conversation details for conversationId {} for external navigation", ConversationId)
								Callback(UseCallbackResult11(ConversationId))
							end):catch(function(Err)
								-- upvalues: LoggerModule (upval), FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), ConversationId (upval)
								LoggerModule:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", (tostring(Err)))
								
								if FFlagAppChatPerfTrackingModule then
									AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = ConversationId })
								end
							end)
						end
					})
				else
					if FFlagAppChatPerfTrackingModule then
						AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = ConversationId })
					end
					UseCallbackResult4(ConversationId):andThen(function()
						-- upvalues: LoggerModule (upval), ConversationId (copy), Callback (upval), UseCallbackResult11 (upval)
						LoggerModule:info("Successfully fetched conversation details for conversationId {} for external navigation", ConversationId)
						Callback(UseCallbackResult11(ConversationId))
					end):catch(function(Err)
						-- upvalues: LoggerModule (upval), FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), ConversationId (copy)
						LoggerModule:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", (tostring(Err)))
						
						if FFlagAppChatPerfTrackingModule then
							AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = ConversationId })
						end
					end)
					
					return
				end
			end
			local UserId = p2 and p2.userId
			
			if UserId then
				spawn(function()
					-- upvalues: UseCallbackResult3 (upval), UserId (copy), FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), LoggerModule (upval), FFlagAppChatShowOSAOnPageEntry (upval), NavigateWithOsaGateModule (upval), UseDispatchResult (upval), Callback (upval), UseCallbackResult11 (upval)
					UseCallbackResult3(UserId):andThen(function(Result)
						-- upvalues: FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), LoggerModule (upval), UserId (upval), FFlagAppChatShowOSAOnPageEntry (upval), NavigateWithOsaGateModule (upval), UseDispatchResult (upval), Callback (upval), UseCallbackResult11 (upval)
						if FFlagAppChatPerfTrackingModule then
							AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = Result.id })
						end
						LoggerModule:info("Successfully fetched conversation details for userId {} for external navigation", UserId)
						
						if FFlagAppChatShowOSAOnPageEntry then
							NavigateWithOsaGateModule({
								conversationId = Result.id,
								dispatch = UseDispatchResult,
								onAccepted = function()
									-- upvalues: Callback (upval), UseCallbackResult11 (upval), Result (copy)
									Callback(UseCallbackResult11(Result.id))
								end
							})
							
							return
						else
							Callback(UseCallbackResult11(Result.id))
						end
					end):catch(function(Err)
						-- upvalues: LoggerModule (upval)
						LoggerModule:warning("Error in CreateConversation request before navigate to conversation. error: {}", (tostring(Err)))
					end)
				end)
				
				return
			end
		end, EnumScreensModule.ChatConversation)
		UpdateExternalNavigationForScreenFunction(function(Params)
			-- upvalues: Callback (copy), RoactNavigationModule (upval), EnumScreensModule (upval), JoinResult (upval)
			Callback(RoactNavigationModule.Actions.navigate({
				routeName = EnumScreensModule.ChatLanding,
				params = Params
			}))
			
			if JoinResult.wideMode then
				Callback(RoactNavigationModule.Actions.navigate({ routeName = EnumScreensModule.EmptyConversation }))
			end
		end, EnumScreensModule.ChatLanding)
		
		return function()
			-- upvalues: UpdateExternalNavigationForScreenFunction (copy), EnumScreensModule (upval), GetFFlagAppChatRequestedRouteModule (upval), GetFFlagIsSquadEnabledFunction (upval), UseRefResult3 (upval)
			UpdateExternalNavigationForScreenFunction(nil, EnumScreensModule.ChatLanding)
			
			if GetFFlagAppChatRequestedRouteModule() then
				UpdateExternalNavigationForScreenFunction(nil, EnumScreensModule.ChatDetails)
			end
			UpdateExternalNavigationForScreenFunction(nil, EnumScreensModule.ChatConversation)
			
			if GetFFlagIsSquadEnabledFunction() then
				UpdateExternalNavigationForScreenFunction(nil, EnumScreensModule.SquadLobby)
			end
			UseRefResult3.current = nil
		end
	end, {
		UseRefResult3, UseCallbackResult3, UseDispatchResult, UseCallbackResult4,
		UseCallbackResult11, UseCallbackResult2,
		JoinResult.updateExternalNavigationForScreen, JoinResult.wideMode
	})
	local UseCallbackResult6 = UseCallbackFunction(function(p2)
		-- upvalues: UseRefResult2 (copy), UseCallbackResult1 (copy)
		if UseRefResult2.current then
			UseRefResult2.current:disconnect()
			UseRefResult2.current = nil
		end
		if p2 then
			UseRefResult2.current = p2:connect(UseCallbackResult1)
		end
	end, { UseRefResult2, UseCallbackResult1 })
	UseEffectFunction(function()
		-- upvalues: UseRefResult1 (copy), UseCallbackResult6 (copy), JoinResult (copy), UseDispatchResult (copy), EnteredChatFromEntryPointModule (upval)
		UseRefResult1.current = true
		UseCallbackResult6(JoinResult.rnBypassActionSignal)
		
		return function()
			-- upvalues: UseRefResult1 (upval), UseCallbackResult6 (upval), UseDispatchResult (upval), EnteredChatFromEntryPointModule (upval)
			UseRefResult1.current = false
			UseCallbackResult6(nil)
			UseDispatchResult(EnteredChatFromEntryPointModule())
		end
	end, {})
	UseEffectFunction(function()
		-- upvalues: JoinResult (copy), IsPlacementInExperience (copy), UseDispatchResult (copy), NavigateIntoChatModule (upval), EnumScreensModule (upval), UseSelectorResult (copy)
		if JoinResult.initialConversationId and JoinResult.initialConversationId ~= "" and IsPlacementInExperience then
			UseDispatchResult(NavigateIntoChatModule({
				screen = EnumScreensModule.ChatConversation,
				params = {
					userId = UseSelectorResult,
					conversationId = JoinResult.initialConversationId
				}
			}))
			JoinResult.setInitialConversationId("")
		end
		return function() end
	end, {
		UseDispatchResult,
		UseSelectorResult,
		JoinResult.initialConversationId,
		JoinResult.setInitialConversationId
	})
	
	if GetFFlagAppChatRequestedRouteModule() then
		UseEffectFunction(function()
			-- upvalues: JoinResult (copy), IsPlacementInExperience (copy), UseDispatchResult (copy), NavigateIntoChatModule (upval)
			if JoinResult.requestedRoute and IsPlacementInExperience then
				UseDispatchResult(NavigateIntoChatModule(JoinResult.requestedRoute))
				
				if JoinResult.clearRequestedRoute then
					JoinResult.clearRequestedRoute()
				end
			end
			return function() end
		end, {
			UseDispatchResult,
			IsPlacementInExperience,
			JoinResult.requestedRoute,
			JoinResult.clearRequestedRoute
		})
	end
	local ConversationId = nil
	local v2 = nil
	
	if GetFFlagIsSquadEnabledFunction() then
		ConversationId = UseCurrentSquadParentChannelIdFunction()
		
		if GetFFlagEnableCrossExpVoiceFunction() then
			v2 = UseIsVoiceConnectedFunction()
		end
	end
	UseEffectFunction(function()
		-- upvalues: GetFFlagIsSquadEnabledFunction (upval), IsPlacementInExperience (copy), JoinResult (copy), ConversationId (ref), GetFFlagEnableCrossExpVoiceFunction (upval), v2 (ref), UseDispatchResult (copy), NavigateIntoChatModule (upval), EnumScreensModule (upval), UseSelectorResult (copy)
		if GetFFlagIsSquadEnabledFunction() and IsPlacementInExperience and JoinResult.initialConversationId == "" and JoinResult.requestedRoute == nil and ConversationId then
			if GetFFlagEnableCrossExpVoiceFunction() and v2 then
				UseDispatchResult(NavigateIntoChatModule({
					screen = EnumScreensModule.SquadLobby,
					params = {
						userId = UseSelectorResult,
						conversationId = ConversationId
					}
				}))
				
				return
			end
			UseDispatchResult(NavigateIntoChatModule({
				screen = EnumScreensModule.ChatConversation,
				params = {
					userId = UseSelectorResult,
					conversationId = ConversationId
				}
			}))
		end
	end, {})
	UseEffectFunction(function()
		-- upvalues: UseCallbackResult6 (copy), JoinResult (copy)
		UseCallbackResult6(JoinResult.rnBypassActionSignal)
	end, { JoinResult.rnBypassActionSignal, UseCallbackResult6 })
	local UsePageSideMarginResult = UsePageSideMarginFunction(Container.current, FFlagLuaAppCompositionAppChat)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: IsPlacementInExperience (copy), UsePageSideMarginResult (copy)
		return {
			default = 12,
			outer = if IsPlacementInExperience then 12 else UsePageSideMarginResult,
			inner = if IsPlacementInExperience then 12 else UsePageSideMarginResult
		}
	end, { UsePageSideMarginResult, IsPlacementInExperience })
	local UseStyleResult = UseStyleFunction()
	local Element = ReactModule.createElement(ChatPlacementContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: JoinResult (copy)
			return { chatPlacement = JoinResult.chatPlacement }
		end, { JoinResult.chatPlacement })
	}, {
		navigation = ReactModule.createElement(LuaAppNavigationContextProviderModule, {
			navigateToLuaAppPages = JoinResult.navigateToLuaAppPages,
			dispatch = UseDispatchResult
		}, {
			navigation = ReactModule.createElement(Container, {
				externalDispatchConnector = UseCallbackResult5,
				parameters = if FFlagAppChatReactivePaneLayoutOnRotation then UseMemoResult.restoreParameters else JoinResult.parameters,
				setActiveConversationId = UseReactivePaneRestoreResult2,
				setBackButtonEnabled = JoinResult.setBackButtonEnabled,
				setTabBarVisible = UseCallbackFunction(function(p2)
					-- upvalues: UseDispatchResult (copy), SetTabBarVisibleFunction (upval)
					UseDispatchResult(SetTabBarVisibleFunction(p2))
				end, { UseDispatchResult }),
				chatIsVisible = UseChatIsVisibleModuleResult,
				screenProps = {
					navigateToLuaAppPages = JoinResult.navigateToLuaAppPages,
					topBarHeight = math.max(UserInputService.NavBarSize.Y, if UseTokensResult then UseTokensResult.Size.Size_1400 else NAVBARWITHFACEPILESIZE),
					wideMode = JoinResult.wideMode,
					isInExperience = IsPlacementInExperience,
					isVisible = JoinResult.isVisible,
					notificationCount = JoinResult.notificationCount,
					appChatOuterPadding = UseMemoResult1.outer,
					appChatInnerPadding = UseMemoResult1.inner,
					appChatDefaultPadding = UseMemoResult1.default,
					topBarUtilityIconSideMargin = if FFlagEnableHeaderBarButtonsUpdate then UseTokensResult.Size.Size_100 else nil,
					showSearchRow = IsPlacementInExperience,
					navigateToRootStack = JoinResult.navigateToRootStack,
					navigateToAddFriends = JoinResult.navigateToAddFriends
				}
			})
		})
	})
	
	if not FFlagAppChatSignalsReplyStoreModule then
		Element = ReactModule.createElement(ReplyingToMessageProviderModule, {}, { navigation = Element })
	end
	local Element1 = ReactModule.createElement(InteractionFeedbackModule.InteractionFeedbackContext.Provider, { value = HapticFeedbackConfig }, { navigation = Element })
	
	if not IsPlacementInExperience then
		Element1 = ReactModule.createElement(LayerCollectorProvider, {}, { navigation = Element1 })
	end
	local UseRobloxLocaleModuleResult = UseRobloxLocaleModule()
	local PlaySessionId = RbxAnalyticsService:GetPlaySessionId()
	local UseSelectorResult2 = if GetFFlagIsSquadEnabledFunction() then UseSelectorFunction(function(p2)
		local CurrentSquad = p2.Squad and (p2.Squad.Squad and p2.Squad.Squad.currentSquad)
		
		return if CurrentSquad and CurrentSquad.squadId then CurrentSquad.squadId else nil
	end) else nil
	local Element2 = ReactModule.createElement(AnalyticsProviderModule, {
		localUserId = UseSelectorResult,
		entryPoint = UseSignalStateResult
	}, {
		telemetry = ReactModule.createElement(AppTelemetryLayerModule.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: UseRobloxLocaleModuleResult (copy), UseSignalStateResult (copy), UseSelectorResult (copy), PlaySessionId (copy), UseSelectorResult2 (copy), JoinResult (copy)
				return {
					context = "platformChat",
					locale = UseRobloxLocaleModuleResult,
					entryPoint = UseSignalStateResult or "unknown",
					userId = UseSelectorResult,
					playSessionId = PlaySessionId,
					currentSquadId = UseSelectorResult2,
					placement = JoinResult.chatPlacement
				}
			end, {
				UseRobloxLocaleModuleResult, UseSignalStateResult, UseSelectorResult,
				PlaySessionId, UseSelectorResult2, JoinResult.chatPlacement
			})
		}, {
			navigation = Element1,
			BottomInsetBackground = if UseSelectorResult1.bottom > 0 then ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 3,
				BackgroundColor3 = if GetFFlagFixChatsBottomInsetBackgroundColorModule() then UseStyleResult.Theme.BackgroundDefault.Color else UseStyleResult.Theme.NavigationBar.Color,
				BackgroundTransparency = if GetFFlagFixChatsBottomInsetBackgroundColorModule() then UseStyleResult.Theme.BackgroundDefault.Transparency else UseStyleResult.Theme.NavigationBar.Transparency,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, UseSelectorResult1.bottom)
			}) else nil
		})
	})
	
	if FFlagAppChatPerfTrackingModule then
		UseEffectFunction(function()
			-- upvalues: AppChatPerfTrackerModule (upval), JoinResult (copy), UseSignalStateResult (copy), UseSelectorResult2 (copy)
			AppChatPerfTrackerModule.setSharedContext({
				placement = JoinResult.chatPlacement,
				entryPoint = UseSignalStateResult,
				hasActiveParty = UseSelectorResult2 ~= nil
			})
		end, {
			JoinResult.chatPlacement,
			UseSignalStateResult,
			UseSelectorResult2
		})
	end
	return ReactModule.createElement(RoactChatAnalyticsProviderModule, { entryPoint = UseSignalStateResult }, { Element2 })
end

return MemoFunction(AppChatEntryPoint)
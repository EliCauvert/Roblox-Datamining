local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local RoactNavigationModule = require(Parent.RoactNavigation)
local RoactUtilsModule = require(Parent.RoactUtils)
local CryoModule = require(Parent.Cryo)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local DependencyArrayFunction = RoactUtilsModule.Hooks.dependencyArray
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseMemoFunction = ReactModule.useMemo
local UseRefFunction = ReactModule.useRef
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local AppChatRealtimeChatEventReceiver2 = require(AppChat.Logger):new("AppChat.Realtime.ChatEventReceiver2")
local ConversationModule = require(AppChat.Models.Conversation)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local ChangedParticipantsModule = require(AppChat.Conversations.Actions.ChangedParticipants)
local RoduxAliasesModule = require(AppChat.Http.RoduxAliases)
local ReceivedUserTypingModule = require(AppChat.Conversations.Actions.ReceivedUserTyping)
local RemovedConversationModule = require(AppChat.Conversations.Actions.RemovedConversation)
local RenamedGroupConversationModule = require(AppChat.Conversations.Actions.RenamedGroupConversation)
local FriendConversationCreatedModule = require(AppChat.Conversations.Actions.FriendConversationCreated)
local FriendshipDestroyedModule = require(AppChat.Actions.FriendshipDestroyed)
local UseIsChatEnabledModule = require(AppChat.Hooks.useIsChatEnabled)
local UseIsGroupChatEnabledModule = require(AppChat.Hooks.useIsGroupChatEnabled)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local EnumScreensModule = require(AppChat.EnumScreens)
local GetNewMessagesFunction = require(AppChat.Components.ChatConversation.Messages).Thunks.getNewMessages
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatMessageTTIMilestonesModule = require(AppChat.Flags.FFlagAppChatMessageTTIMilestones)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local PaginateAndRefreshConversationsModule = require(AppChat.Conversations.Thunks.paginateAndRefreshConversations)
local FetchChatMetadataModule = require(AppChat.Conversations.Thunks.fetchChatMetadata)
local GetAllUserPresencesModule = require(AppChat.Conversations.Thunks.getAllUserPresences)
local FetchLatestConversationDetailsModule = require(AppChat.Conversations.Thunks.fetchLatestConversationDetails)
local GetAllFriendsAsyncModule = require(AppChat.Conversations.Thunks.getAllFriendsAsync)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local MultiGetConversationDetailsModule = require(AppChat.Conversations.Thunks.multiGetConversationDetails)
local RefreshConversationUnfilteredThreadsDetailsModule = require(AppChat.Conversations.Thunks.refreshConversationUnfilteredThreadsDetails)
local CommunicationChannelsTypesModule = require(script.Parent.CommunicationChannelsTypes)
local _ = require(script.Parent.UnfilteredThreadsTypes)
local UseChatTrustedConnectionsEventsModule = require(AppChat.Components.EventReceivers.useChatTrustedConnectionsEvents)
local GetFFlagDebugUnfilteredThreadsFunction = require(Parent.SharedFlags).getFFlagDebugUnfilteredThreads
local FFlagAppChatEnableDoubleOptIn = require(Parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)

local function chunkAndLogString(Message: string)
	-- upvalues: AppChatRealtimeChatEventReceiver2 (copy)
	local List = {}
	
	for i = 1, #Message, 800 do
		table.insert(List, Message:sub(i, i + 800 - 1))
	end
	for _, value in List do
		AppChatRealtimeChatEventReceiver2:debug(value)
	end
end

local config = { handlesAppShellNotifications = true }

function ChatEventReceiver2(p1)
	-- upvalues: UseEffectFunction (copy), AppChatRealtimeChatEventReceiver2 (copy), UseSelectorFunction (copy), CryoModule (copy), UseLocalUserIdFunction (copy), UseIsChatEnabledModule (copy), UseIsGroupChatEnabledModule (copy), UseIsInExperienceModule (copy), UseDispatchFunction (copy), ChangedParticipantsModule (copy), FetchChatMetadataModule (copy), FetchLatestConversationDetailsModule (copy), GetAllFriendsAsyncModule (copy), FFlagAppChatPresenceStoreMigrationModule (copy), GetAllUserPresencesModule (copy), GetNewMessagesFunction (copy), FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), RoduxAliasesModule (copy), ReceivedUserTypingModule (copy), PaginateAndRefreshConversationsModule (copy), RemovedConversationModule (copy), RenamedGroupConversationModule (copy), config (copy), UseRefFunction (copy), UseLocalizationFunction (copy), UseCallbackFunction (copy), RoactNavigationModule (copy), EnumScreensModule (copy), FormFactor (copy), RealtimeDeliveryModule (copy), DependencyArrayFunction (copy), FriendshipDestroyedModule (copy), ConversationModule (copy), CommunicationChannelsTypesModule (copy), ConversationChannelsModule (copy), FriendConversationCreatedModule (copy), UseMemoFunction (copy), GetFFlagDebugUnfilteredThreadsFunction (copy), chunkAndLogString (copy), MultiGetConversationDetailsModule (copy), AppChatNetworkingModule (copy), FFlagAppChatEnableDoubleOptIn (copy), RefreshConversationUnfilteredThreadsDetailsModule (copy), UseChatTrustedConnectionsEventsModule (copy)
	UseEffectFunction(function()
		-- upvalues: AppChatRealtimeChatEventReceiver2 (upval)
		AppChatRealtimeChatEventReceiver2:info("ChatEventReceiver2 mounted")
		
		return function()
			-- upvalues: AppChatRealtimeChatEventReceiver2 (upval)
			AppChatRealtimeChatEventReceiver2:info("ChatEventReceiver2 unmounted")
		end
	end, {})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ChatAppReducer.AppLoaded
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.ChatAppReducer.Conversations
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		return p2.FormFactor
	end)
	local IsEmpty = CryoModule.isEmpty(UseSelectorResult1)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseIsChatEnabledModuleResult = UseIsChatEnabledModule()
	local UseIsGroupChatEnabledModuleResult = UseIsGroupChatEnabledModule()
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local UseDispatchResult = UseDispatchFunction()
	
	local function v50(p2, p3, p4, p5)
		-- upvalues: UseDispatchResult (copy), ChangedParticipantsModule (upval)
		UseDispatchResult(ChangedParticipantsModule(p2, p3, p4, p5))
	end
	
	local function v51()
		-- upvalues: UseDispatchResult (copy), FetchChatMetadataModule (upval)
		return UseDispatchResult(FetchChatMetadataModule())
	end
	
	local function v52(p2)
		-- upvalues: UseDispatchResult (copy), FetchLatestConversationDetailsModule (upval)
		return UseDispatchResult(FetchLatestConversationDetailsModule(p2))
	end
	
	local function v53()
		-- upvalues: UseDispatchResult (copy), GetAllFriendsAsyncModule (upval)
		UseDispatchResult(GetAllFriendsAsyncModule())
	end
	
	local Callback = if FFlagAppChatPresenceStoreMigrationModule then nil else function()
		-- upvalues: UseDispatchResult (copy), GetAllUserPresencesModule (upval)
		spawn(function()
			-- upvalues: UseDispatchResult (upval), GetAllUserPresencesModule (upval)
			UseDispatchResult(GetAllUserPresencesModule())
		end)
	end
	
	local function v54(p2, p3, p4)
		-- upvalues: UseDispatchResult (copy), GetNewMessagesFunction (upval)
		return UseDispatchResult(GetNewMessagesFunction(p2, p3, p4))
	end
	
	local function restartMessageReceiveTracking(ChannelId)
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), AppChatPerfTrackerModule (upval)
		if not FFlagAppChatPerfTrackingModule then return end
		local config = { conversationId = tostring(ChannelId) }
		
		if FFlagAppChatMessageTTIMilestonesModule then
			AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.MessageReceiveTTI, config)
			AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.MessageReceiveTTI, config)
			
			return
		else
			AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.MessageReceiveToRender, config)
			AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.MessageReceiveToRender, config)
		end
	end
	
	local function v56(p2, p3)
		-- upvalues: UseDispatchResult (copy), RoduxAliasesModule (upval)
		UseDispatchResult(RoduxAliasesModule.Actions.AliasUpdated(p2, p3))
	end
	
	local function v57(p2, p3)
		-- upvalues: UseDispatchResult (copy), ReceivedUserTypingModule (upval)
		UseDispatchResult(ReceivedUserTypingModule(p2, p3))
	end
	
	local function v58()
		-- upvalues: UseDispatchResult (copy), PaginateAndRefreshConversationsModule (upval)
		UseDispatchResult(PaginateAndRefreshConversationsModule())
	end
	
	local function v59(p2)
		-- upvalues: UseDispatchResult (copy), RemovedConversationModule (upval)
		UseDispatchResult(RemovedConversationModule(p2))
	end
	
	local function v60(p2, p3, p4, p5)
		-- upvalues: UseDispatchResult (copy), RenamedGroupConversationModule (upval)
		UseDispatchResult(RenamedGroupConversationModule(p2, p3, p4, p5))
	end
	
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseRefResult = UseRefFunction({})
	local UseLocalizationResult = UseLocalizationFunction({
		networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		removedFromConversationToastTitle = "Feature.Chat.Message.RemovedFromConversation"
	})
	local NetworkErrorText = UseLocalizationResult.networkErrorText
	local RemovedFromConversationToastTitle = UseLocalizationResult.removedFromConversationToastTitle
	local UseCallbackResult = UseCallbackFunction(function(p2, p3)
		-- upvalues: UseRefResult (copy)
		assert(UseRefResult.current, "table")
		UseRefResult.current[p2] = p3
	end, { UseRefResult.current })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: JoinResult (copy), RoactNavigationModule (upval), EnumScreensModule (upval), NetworkErrorText (copy)
		if JoinResult.rnBypassActionSignal then
			JoinResult.rnBypassActionSignal:fire(RoactNavigationModule.Actions.navigate({
				routeName = EnumScreensModule.RoactChatToast,
				params = {
					toastProps = { toastContent = { toastTitle = NetworkErrorText } }
				}
			}))
		end
	end, { JoinResult.rnBypassActionSignal, NetworkErrorText })
	UseEffectFunction(function()
		-- upvalues: UseIsChatEnabledModuleResult (copy), JoinResult (copy), AppChatRealtimeChatEventReceiver2 (upval), RoactNavigationModule (upval), UseSelectorResult2 (copy), FormFactor (upval), EnumScreensModule (upval)
		if not UseIsChatEnabledModuleResult and JoinResult.activeConversationId and JoinResult.rnBypassActionSignal then
			AppChatRealtimeChatEventReceiver2:debug("Chat is disabled for our user, navigating away from active conversation")
			JoinResult.rnBypassActionSignal:fire(RoactNavigationModule.Actions.navigate({
				routeName = UseSelectorResult2 == FormFactor.WIDE and EnumScreensModule.EmptyConversation or EnumScreensModule.ChatLanding
			}))
		end
	end, {
		UseIsChatEnabledModuleResult,
		UseSelectorResult2,
		JoinResult.activeConversationId,
		JoinResult.rnBypassActionSignal
	})
	local UseSelectorResultEntry = if JoinResult.activeConversationId then UseSelectorResult1[JoinResult.activeConversationId] else nil
	UseEffectFunction(function()
		-- upvalues: UseIsGroupChatEnabledModuleResult (copy), UseSelectorResultEntry (copy), JoinResult (copy), AppChatRealtimeChatEventReceiver2 (upval), RoactNavigationModule (upval), UseSelectorResult2 (copy), FormFactor (upval), EnumScreensModule (upval)
		if not UseIsGroupChatEnabledModuleResult and UseSelectorResultEntry and JoinResult.rnBypassActionSignal and UseSelectorResultEntry.type == "group" then
			AppChatRealtimeChatEventReceiver2:debug("Group chats are disabled and we are navigated to a group chat. Navigating to ChatLanding")
			JoinResult.rnBypassActionSignal:fire(RoactNavigationModule.Actions.navigate({
				routeName = UseSelectorResult2 == FormFactor.WIDE and EnumScreensModule.EmptyConversation or EnumScreensModule.ChatLanding
			}))
		end
	end, {
		UseIsGroupChatEnabledModuleResult,
		UseSelectorResultEntry,
		UseSelectorResult2,
		JoinResult.rnBypassActionSignal
	})
	RealtimeDeliveryModule.useRealtimeNamespace("UserTagChangeNotification", function(Player)
		-- upvalues: AppChatRealtimeChatEventReceiver2 (upval), UseDispatchResult (copy), RoduxAliasesModule (upval)
		AppChatRealtimeChatEventReceiver2:info("Received UserTagChangeNotification: {}", Player.Type)
		
		if Player.Type == "UserTagUpdate" then
			UseDispatchResult(RoduxAliasesModule.Actions.AliasUpdated(tostring(Player.UserId), Player.NewAlias))
		end
	end, DependencyArrayFunction(v56))
	RealtimeDeliveryModule.useRealtimeNamespace("FriendshipNotifications", function(p2)
		-- upvalues: AppChatRealtimeChatEventReceiver2 (upval), UseDispatchResult (copy), PaginateAndRefreshConversationsModule (upval), UseLocalUserIdResult (copy), FriendshipDestroyedModule (upval), UseSelectorResultEntry (copy), ConversationModule (upval), CryoModule (upval), UseSelectorResult2 (copy), FormFactor (upval), EnumScreensModule (upval), JoinResult (copy), RoactNavigationModule (upval)
		local Type = p2.Type
		AppChatRealtimeChatEventReceiver2:info("Received FriendshipNotifications notification: {}", Type)
		
		if Type == "FriendshipCreated" then
			UseDispatchResult(PaginateAndRefreshConversationsModule())
			
			return
		end
		if Type == "FriendshipDestroyed" then
			local v1: string? = nil
			
			if p2.EventArgs then
				local Text = tostring(p2.EventArgs.UserId1)
				local Text1 = tostring(p2.EventArgs.UserId2)
				
				if Text == UseLocalUserIdResult then
					Text = "localUserId"
					v1 = Text1
				end
				if Text1 == UseLocalUserIdResult then
					Text1 = "localUserId"
					v1 = Text
				end
				UseDispatchResult(FriendshipDestroyedModule({ userId1 = Text, userId2 = Text1 }))
			end
			if UseSelectorResultEntry and UseSelectorResultEntry.source == "friends" and UseSelectorResultEntry.conversationType == ConversationModule.Type.ONE_TO_ONE_CONVERSATION and CryoModule.List.findWhere(UseSelectorResultEntry.participants, function(p3): boolean
				-- upvalues: v1 (ref)
				return p3 == v1
			end) then
				JoinResult.rnBypassActionSignal:fire(RoactNavigationModule.Actions.navigate({
					routeName = if UseSelectorResult2 == FormFactor.WIDE then EnumScreensModule.EmptyConversation else EnumScreensModule.ChatLanding
				}))
			end
		end
	end, DependencyArrayFunction(UseDispatchResult, v58, UseLocalUserIdResult, UseSelectorResult2, UseSelectorResultEntry, JoinResult.rnBypassActionSignal))
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseSelectorResult (copy), UseDispatchResult (copy), FetchChatMetadataModule (upval), AppChatRealtimeChatEventReceiver2 (upval), PaginateAndRefreshConversationsModule (upval), GetAllFriendsAsyncModule (upval), FFlagAppChatPresenceStoreMigrationModule (upval), Callback (copy)
		if UseSelectorResult then
			UseDispatchResult(FetchChatMetadataModule()):andThen(function(Result)
				-- upvalues: AppChatRealtimeChatEventReceiver2 (upval), UseDispatchResult (upval), PaginateAndRefreshConversationsModule (upval), GetAllFriendsAsyncModule (upval), FFlagAppChatPresenceStoreMigrationModule (upval), Callback (upval)
				if Result then
					AppChatRealtimeChatEventReceiver2:trace("Chat is enabled for our user, refreshing conversations")
					UseDispatchResult(PaginateAndRefreshConversationsModule())
					task.spawn(function()
						-- upvalues: UseDispatchResult (upval), GetAllFriendsAsyncModule (upval)
						UseDispatchResult(GetAllFriendsAsyncModule())
					end)
					
					if not FFlagAppChatPresenceStoreMigrationModule then
						Callback()
						
						return
					end
				else
					AppChatRealtimeChatEventReceiver2:trace("Chat is disabled for our user, no need to refresh conversations")
				end
			end)
		end
	end, {
		UseSelectorResult,
		v58,
		v53,
		Callback,
		v51
	})
	RealtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(ConnectionState, p2)
		-- upvalues: AppChatRealtimeChatEventReceiver2 (upval), UseCallbackResult1 (copy), UseSelectorResult (copy), UseCallbackResult2 (copy)
		AppChatRealtimeChatEventReceiver2:info("CommunicationChannels connection state transitioned to {}", (tostring(ConnectionState)))
		
		if ConnectionState == Enum.ConnectionState.Disconnected then
			AppChatRealtimeChatEventReceiver2:info("CommunicationChannels disconnected, show network error toast.")
			UseCallbackResult1()
			
			return
		end
		if ConnectionState == Enum.ConnectionState.Connected and p2 then
			AppChatRealtimeChatEventReceiver2:trace("We missed some messages while we were disconnected. The chat app was previously {}", if UseSelectorResult then "loaded" else "unloaded")
			UseCallbackResult2()
		end
	end, DependencyArrayFunction(UseCallbackResult2, UseSelectorResult, UseCallbackResult1))
	RealtimeDeliveryModule.useRealtimeNamespace("CommunicationChannels", function(p2)
		-- upvalues: CommunicationChannelsTypesModule (upval), AppChatRealtimeChatEventReceiver2 (upval), UseCallbackResult (copy), UseDispatchResult (copy), RemovedConversationModule (upval), JoinResult (copy), UseSelectorResult2 (copy), FormFactor (upval), EnumScreensModule (upval), RoactNavigationModule (upval), UseLocalUserIdResult (copy), RemovedFromConversationToastTitle (copy), FetchLatestConversationDetailsModule (upval), RenamedGroupConversationModule (upval), ChangedParticipantsModule (upval), IsEmpty (copy), ConversationChannelsModule (upval), FriendConversationCreatedModule (upval), FFlagAppChatPerfTrackingModule (upval), restartMessageReceiveTracking (copy), GetNewMessagesFunction (upval), ReceivedUserTypingModule (upval)
		if p2.ChannelVertical ~= "PlatformChat" then return end
		if not table.find(CommunicationChannelsTypesModule.ChannelTypeAllowlist, p2.ChannelType) then return end
		AppChatRealtimeChatEventReceiver2:info("Received CommunicationChannels notification: {}", p2.Type)
		UseCallbackResult("CommunicationChannels", p2.SequenceNumber)
		local ChannelId = p2.ChannelId
		
		if p2.Type == "ChannelDeleted" or p2.Type == "RemovedFromChannel" or p2.Type == "ChannelArchived" then
			UseDispatchResult(RemovedConversationModule(ChannelId))
			local ActiveConversationId = JoinResult.activeConversationId
			
			if ActiveConversationId ~= nil and tostring(ActiveConversationId) == p2.ChannelId and JoinResult.rnBypassActionSignal then
				JoinResult.rnBypassActionSignal:fire(RoactNavigationModule.Actions.navigate({
					routeName = if UseSelectorResult2 == FormFactor.WIDE then EnumScreensModule.EmptyConversation else EnumScreensModule.ChatLanding
				}))
			end
			if p2.Actor.Id ~= tostring(UseLocalUserIdResult) then
				JoinResult.rnBypassActionSignal:fire(RoactNavigationModule.Actions.navigate({
					routeName = EnumScreensModule.RoactChatToast,
					params = {
						toastProps = {
							toastContent = { toastTitle = RemovedFromConversationToastTitle }
						}
					}
				}))
				
				return
			end
		else
			if p2.Type == "ChannelUpdated" or p2.Type == "ParticipantsAdded" or p2.Type == "ParticipantsRemoved" then
				task.spawn(function()
					-- upvalues: ChannelId (copy), UseDispatchResult (upval), FetchLatestConversationDetailsModule (upval), p2 (copy), RenamedGroupConversationModule (upval), ChangedParticipantsModule (upval), AppChatRealtimeChatEventReceiver2 (upval)
					UseDispatchResult(FetchLatestConversationDetailsModule(ChannelId)):andThen(function(Result)
						-- upvalues: p2 (upval), ChannelId (upval), UseDispatchResult (upval), RenamedGroupConversationModule (upval), ChangedParticipantsModule (upval)
						local Title = Result.title
						local LastUpdated = Result.lastUpdated
						
						if p2.Type == "ChannelUpdated" then
							UseDispatchResult(RenamedGroupConversationModule(ChannelId, Title, Result.isDefaultTitle, LastUpdated))
							
							return
						else
							UseDispatchResult(ChangedParticipantsModule(ChannelId, Result.participants, Title, LastUpdated))
						end
					end):catch(function(Err)
						-- upvalues: AppChatRealtimeChatEventReceiver2 (upval), p2 (upval)
						AppChatRealtimeChatEventReceiver2:warning(`Failure in RobloxEventReceiver->{p2.Type}, Status: {tostring(Err)}`)
					end)
				end)
				
				return
			end
			if p2.Type ~= "AddedToChannel" and p2.Type ~= "ChannelCreated" and p2.Type ~= "ChannelMarkedRead" and (p2.Type ~= "ChannelMetadataUpdated" or ChannelId == nil) and p2.Type ~= "ChannelUnarchived" then
				if p2.Type == "MessageCreated" or p2.Type == "SystemMessageCreated" then
					if not FFlagAppChatPerfTrackingModule then
						local _ = UseDispatchResult(GetNewMessagesFunction(ChannelId, p2.Actor.Id == tostring(UseLocalUserIdResult), (tick())))
						
						return
					end
					local IsIdMatch = p2.Actor.Id == tostring(UseLocalUserIdResult)
					
					if not IsIdMatch and JoinResult.activeConversationId and tostring(JoinResult.activeConversationId) == ChannelId then
						restartMessageReceiveTracking(ChannelId)
					end
					local _ = UseDispatchResult(GetNewMessagesFunction(ChannelId, IsIdMatch, (tick())))
					
					return
				elseif p2.Type == "ParticipantTyping" and p2.IsTyping then
					UseDispatchResult(ReceivedUserTypingModule(ChannelId, p2.Actor.Id))
				end
			elseif IsEmpty then
				AppChatRealtimeChatEventReceiver2:debug("Received {} event while loading conversation data", p2.Type)
				
				return
			else
				task.spawn(function()
					-- upvalues: ChannelId (copy), UseDispatchResult (upval), FetchLatestConversationDetailsModule (upval), p2 (copy), ConversationChannelsModule (upval), FriendConversationCreatedModule (upval), JoinResult (upval), RoactNavigationModule (upval), EnumScreensModule (upval), AppChatRealtimeChatEventReceiver2 (upval)
					UseDispatchResult(FetchLatestConversationDetailsModule(ChannelId)):andThen(function(Result)
						-- upvalues: p2 (upval), ConversationChannelsModule (upval), UseDispatchResult (upval), FriendConversationCreatedModule (upval), JoinResult (upval), RoactNavigationModule (upval), EnumScreensModule (upval)
						if (p2.Type == "ChannelCreated" or p2.Type == "ChannelUnarchived") and Result.type == "one_to_one" then
							local FriendConversationId = ConversationChannelsModule.getFriendConversationId(Result.participants)
							
							if FriendConversationId then
								UseDispatchResult(FriendConversationCreatedModule({
									newConversationId = Result.id,
									oldFriendConversationId = FriendConversationId
								}))
								
								if JoinResult.activeConversationId == FriendConversationId then
									JoinResult.rnBypassActionSignal:fire(RoactNavigationModule.Actions.navigate({
										routeName = EnumScreensModule.ChatConversation,
										params = { conversationId = Result.id }
									}))
								end
							end
						end
					end):catch(function(Err)
						-- upvalues: AppChatRealtimeChatEventReceiver2 (upval), p2 (upval)
						AppChatRealtimeChatEventReceiver2:warning("Failure in RobloxEventReceiver->{}, Status: {}", p2.Type, (tostring(Err)))
					end)
				end)
				
				return
			end
		end
	end, DependencyArrayFunction(UseLocalUserIdResult, UseCallbackResult, v59, JoinResult.activeConversationId, JoinResult.rnBypassActionSignal, RemovedFromConversationToastTitle, v52, v60, v50, IsEmpty, v54, v57))
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: UseSelectorResult1 (copy), CryoModule (upval)
		return if UseSelectorResult1 then CryoModule.List.filterMap(CryoModule.Dictionary.values(UseSelectorResult1), function(p2)
			return if p2 and p2.id and p2.source ~= "friends" then p2.id else nil
		end) else {}
	end, { UseSelectorResult1 })
	RealtimeDeliveryModule.useRealtimeNamespace("ChatModerationTypeEligibility", function(p2)
		-- upvalues: AppChatRealtimeChatEventReceiver2 (upval), GetFFlagDebugUnfilteredThreadsFunction (upval), chunkAndLogString (upval), CryoModule (upval), UseMemoResult (copy), UseDispatchResult (copy), MultiGetConversationDetailsModule (upval), JoinResult (copy), AppChatNetworkingModule (upval), FFlagAppChatEnableDoubleOptIn (upval), RefreshConversationUnfilteredThreadsDetailsModule (upval), UseIsInExperienceModuleResult (copy)
		AppChatRealtimeChatEventReceiver2:debug("Received ChatModerationTypeEligibility notification")
		local ChannelsInspected = p2.channels_inspected
		
		if not ChannelsInspected or #ChannelsInspected == 0 then return end
		if GetFFlagDebugUnfilteredThreadsFunction() then
			local v1 = ""
			
			for _, value in ChannelsInspected do
				v1 = `{v1}, {value}`
			end
			chunkAndLogString(`RTN CONVERSATIONS INSPECTED{v1}`)
		end
		local FilterResult = CryoModule.List.filter(ChannelsInspected, function(Value): number
			-- upvalues: UseMemoResult (upval)
			return table.find(UseMemoResult, Value)
		end)
		
		if #FilterResult == 0 then
			AppChatRealtimeChatEventReceiver2:debug("No filtered existing conversation IDs found in ChatModerationTypeEligibility notification")
			
			return
		end
		if GetFFlagDebugUnfilteredThreadsFunction() then
			local v2 = ""
			
			for _, value1 in FilterResult do
				v2 = `{v2}, {value1}`
			end
			chunkAndLogString(`RTN FILTERED CONVERSATIONS{v2}`)
		end
		UseDispatchResult(MultiGetConversationDetailsModule(FilterResult)):catch(function(Err)
			-- upvalues: AppChatRealtimeChatEventReceiver2 (upval)
			AppChatRealtimeChatEventReceiver2:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->MultiGetConversationDetails, Status: " .. tostring(Err))
		end)
		
		if not JoinResult.activeConversationId then return end
		if table.find(ChannelsInspected, JoinResult.activeConversationId) then
			UseDispatchResult(AppChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ JoinResult.activeConversationId })):catch(function(Err)
				-- upvalues: AppChatRealtimeChatEventReceiver2 (upval)
				AppChatRealtimeChatEventReceiver2:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationsParticipantsMetadata, Status: " .. tostring(Err))
			end)
			
			if FFlagAppChatEnableDoubleOptIn then
				UseDispatchResult(RefreshConversationUnfilteredThreadsDetailsModule(JoinResult.activeConversationId, UseIsInExperienceModuleResult))
				
				return
			end
			UseDispatchResult(AppChatNetworkingModule.rodux.GetConversationTopModal.API(JoinResult.activeConversationId, UseIsInExperienceModuleResult)):catch(function(Err)
				-- upvalues: AppChatRealtimeChatEventReceiver2 (upval)
				AppChatRealtimeChatEventReceiver2:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationTopModal, Status: " .. tostring(Err))
			end)
		end
	end, DependencyArrayFunction(UseDispatchResult, JoinResult.activeConversationId, UseMemoResult))
	RealtimeDeliveryModule.useRealtimeNamespace("EligibilityStatusChanged", function(_)
		-- upvalues: AppChatRealtimeChatEventReceiver2 (upval), UseDispatchResult (copy), AppChatNetworkingModule (upval), UseIsInExperienceModuleResult (copy)
		AppChatRealtimeChatEventReceiver2:info("Received EligibilityStatusChanged notification")
		UseDispatchResult(AppChatNetworkingModule.rodux.GetChatLandingModal.API(UseIsInExperienceModuleResult)):catch(function(Err)
			-- upvalues: AppChatRealtimeChatEventReceiver2 (upval)
			AppChatRealtimeChatEventReceiver2:warning("NetworkingChat failure in ChatEventReceiver->EligibilityStatusChanged->GetChatLandingModal request. Status: {}", (tostring(Err)))
		end)
	end, DependencyArrayFunction(UseDispatchResult, UseIsInExperienceModuleResult))
	UseChatTrustedConnectionsEventsModule({ activeConversationId = JoinResult.activeConversationId })
	
	return {}
end

return ChatEventReceiver2
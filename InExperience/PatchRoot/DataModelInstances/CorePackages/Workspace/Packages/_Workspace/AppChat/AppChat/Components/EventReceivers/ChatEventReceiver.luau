local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent

if require(Parent.SharedFlags).FFlagAppChatMigrateChatEventReceiver then
	return (require(script.Parent.ChatEventReceiver2))
else
	local ReactModule = require(Parent.React)
	local RoactNavigationModule = require(Parent.RoactNavigation)
	local RoactUtilsModule = require(Parent.RoactUtils)
	local CryoModule = require(Parent.Cryo)
	local AppChatNetworkingModule = require(Parent.AppChatNetworking)
	local UseCallbackFunction = ReactModule.useCallback
	local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
	local UseEffectFunction = ReactModule.useEffect
	local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
	local UseMemoFunction = ReactModule.useMemo
	local UseRefFunction = ReactModule.useRef
	local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
	local FormFactor = require(Parent.FormFactor).Enums.FormFactor
	local AppChatRealtime = require(AppChat.Logger):new("AppChat.Realtime")
	local ConversationModule = require(AppChat.Models.Conversation)
	local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
	local ChangedParticipantsModule = require(AppChat.Conversations.Actions.ChangedParticipants)
	local RoduxAliasesModule = require(AppChat.Http.RoduxAliases)
	local ReceivedUserTypingModule = require(AppChat.Conversations.Actions.ReceivedUserTyping)
	local RemovedConversationModule = require(AppChat.Conversations.Actions.RemovedConversation)
	local RenamedGroupConversationModule = require(AppChat.Conversations.Actions.RenamedGroupConversation)
	local SetConnectionStateModule = require(AppChat.Actions.SetConnectionState)
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
	local _ = require(script.Parent.ChatMigrationTypes)
	local UseChatTrustedConnectionsEventsModule = require(AppChat.Components.EventReceivers.useChatTrustedConnectionsEvents)
	local GetFFlagDebugUnfilteredThreadsFunction = require(Parent.SharedFlags).getFFlagDebugUnfilteredThreads
	local FFlagAppChatEnableDoubleOptIn = require(Parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
	local FFlagRemoveUnusedConnectionStateRoduxSlice = require(Parent.SharedFlags).FFlagRemoveUnusedConnectionStateRoduxSlice
	local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)
	
	local function chunkAndLogString(Message: string) --[[ Line: 69 ]]
		-- upvalues: AppChatRealtime (copy)
		local List = {}
		
		for i = 1, #Message, 800 do
			table.insert(List, Message:sub(i, i + 800 - 1))
		end
		for _, value in List do
			AppChatRealtime:debug(value)
		end
	end
	
	local config = { handlesAppShellNotifications = true }
	
	function ChatEventReceiver(p1) --[[ Line: 92 ]]
		-- upvalues: UseEffectFunction (copy), AppChatRealtime (copy), UseSelectorFunction (copy), UseCallbackFunction (copy), CryoModule (copy), UseLocalUserIdFunction (copy), UseIsChatEnabledModule (copy), UseIsGroupChatEnabledModule (copy), UseIsInExperienceModule (copy), UseDispatchFunction (copy), ChangedParticipantsModule (copy), FetchChatMetadataModule (copy), FetchLatestConversationDetailsModule (copy), GetAllFriendsAsyncModule (copy), FFlagAppChatPresenceStoreMigrationModule (copy), GetAllUserPresencesModule (copy), GetNewMessagesFunction (copy), FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), RoduxAliasesModule (copy), ReceivedUserTypingModule (copy), PaginateAndRefreshConversationsModule (copy), RemovedConversationModule (copy), RenamedGroupConversationModule (copy), SetConnectionStateModule (copy), config (copy), UseRefFunction (copy), UseLocalizationFunction (copy), RoactNavigationModule (copy), EnumScreensModule (copy), FormFactor (copy), FriendshipDestroyedModule (copy), ConversationModule (copy), FFlagRemoveUnusedConnectionStateRoduxSlice (copy), CommunicationChannelsTypesModule (copy), ConversationChannelsModule (copy), FriendConversationCreatedModule (copy), UseMemoFunction (copy), GetFFlagDebugUnfilteredThreadsFunction (copy), chunkAndLogString (copy), MultiGetConversationDetailsModule (copy), AppChatNetworkingModule (copy), FFlagAppChatEnableDoubleOptIn (copy), RefreshConversationUnfilteredThreadsDetailsModule (copy), UseChatTrustedConnectionsEventsModule (copy)
		UseEffectFunction(function() --[[ Line: 93 ]]
			-- upvalues: AppChatRealtime (upval)
			AppChatRealtime:info("ChatEventReceiver mounted")
			
			return function() --[[ Line: 95 ]]
				-- upvalues: AppChatRealtime (upval)
				AppChatRealtime:info("ChatEventReceiver unmounted")
			end
		end, {})
		local UseSelectorResult = UseSelectorFunction(UseCallbackFunction(function(p2) --[[ Line: 101 ]]
			return p2.ChatAppReducer.AppLoaded
		end, {}))
		local UseSelectorResult1 = UseSelectorFunction(UseCallbackFunction(function(p2) --[[ Line: 104 ]]
			return p2.ChatAppReducer.Conversations
		end, {}))
		local UseSelectorResult2 = UseSelectorFunction(UseCallbackFunction(function(p2) --[[ Line: 107 ]]
			return p2.FormFactor
		end, {}))
		local UseSelectorResult3 = UseSelectorFunction(UseCallbackFunction(function(p2) --[[ Line: 110 ]]
			return p2.Users
		end, {}))
		local IsEmpty = CryoModule.isEmpty(UseSelectorResult1)
		local UseLocalUserIdResult = UseLocalUserIdFunction()
		local UseIsChatEnabledModuleResult = UseIsChatEnabledModule()
		local UseIsGroupChatEnabledModuleResult = UseIsGroupChatEnabledModule()
		local UseIsInExperienceModuleResult = UseIsInExperienceModule()
		local UseDispatchResult = UseDispatchFunction()
		
		local function v53(p2, p3, p4, p5) --[[ Line: 121 ]]
			-- upvalues: UseDispatchResult (copy), ChangedParticipantsModule (upval)
			UseDispatchResult(ChangedParticipantsModule(p2, p3, p4, p5))
		end
		
		local function v54() --[[ Line: 124 ]]
			-- upvalues: UseDispatchResult (copy), FetchChatMetadataModule (upval)
			return UseDispatchResult(FetchChatMetadataModule())
		end
		
		local function v55(p2) --[[ Line: 128 ]]
			-- upvalues: UseDispatchResult (copy), FetchLatestConversationDetailsModule (upval)
			return UseDispatchResult(FetchLatestConversationDetailsModule(p2))
		end
		
		local function v56() --[[ Line: 131 ]]
			-- upvalues: UseDispatchResult (copy), GetAllFriendsAsyncModule (upval)
			UseDispatchResult(GetAllFriendsAsyncModule())
		end
		
		local Callback = if FFlagAppChatPresenceStoreMigrationModule then nil else function() --[[ Line: 135 ]]
			-- upvalues: UseDispatchResult (copy), GetAllUserPresencesModule (upval)
			spawn(function() --[[ Line: 136 ]]
				-- upvalues: UseDispatchResult (upval), GetAllUserPresencesModule (upval)
				UseDispatchResult(GetAllUserPresencesModule())
			end)
		end
		
		local function v57(p2, p3, p4) --[[ Line: 141 ]]
			-- upvalues: UseDispatchResult (copy), GetNewMessagesFunction (upval)
			return UseDispatchResult(GetNewMessagesFunction(p2, p3, p4))
		end
		
		local function restartMessageReceiveTracking(ChannelId) --[[ Line: 145 ]]
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
		
		local function _(p2, p3) --[[ Line: 158 ]]
			-- upvalues: UseDispatchResult (copy), RoduxAliasesModule (upval)
			UseDispatchResult(RoduxAliasesModule.Actions.AliasUpdated(p2, p3))
		end
		
		local function v60(p2, p3) --[[ Line: 161 ]]
			-- upvalues: UseDispatchResult (copy), ReceivedUserTypingModule (upval)
			UseDispatchResult(ReceivedUserTypingModule(p2, p3))
		end
		
		local function v61() --[[ Line: 165 ]]
			-- upvalues: UseDispatchResult (copy), PaginateAndRefreshConversationsModule (upval)
			UseDispatchResult(PaginateAndRefreshConversationsModule())
		end
		
		local function v62(p2) --[[ Line: 169 ]]
			-- upvalues: UseDispatchResult (copy), RemovedConversationModule (upval)
			UseDispatchResult(RemovedConversationModule(p2))
		end
		
		local function v63(p2, p3, p4, p5) --[[ Line: 172 ]]
			-- upvalues: UseDispatchResult (copy), RenamedGroupConversationModule (upval)
			UseDispatchResult(RenamedGroupConversationModule(p2, p3, p4, p5))
		end
		
		local _ = function(p2) --[[ Line: 175 ]]
			-- upvalues: UseDispatchResult (copy), SetConnectionStateModule (upval)
			UseDispatchResult(SetConnectionStateModule(p2))
		end
		
		local JoinResult = CryoModule.Dictionary.join(config, p1)
		local RobloxEventReceiver = JoinResult.robloxEventReceiver
		local UseRefResult = UseRefFunction({})
		local UseRefResult1 = UseRefFunction(Enum.ConnectionState.Connected)
		local UseLocalizationResult = UseLocalizationFunction({
			networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
			removedFromConversationToastTitle = "Feature.Chat.Message.RemovedFromConversation"
		})
		local NetworkErrorText = UseLocalizationResult.networkErrorText
		local RemovedFromConversationToastTitle = UseLocalizationResult.removedFromConversationToastTitle
		local UseCallbackResult = UseCallbackFunction(function(p2, p3) --[[ Line: 192 ]]
			-- upvalues: UseRefResult (copy)
			assert(UseRefResult.current, "table")
			UseRefResult.current[p2] = p3
		end, { UseRefResult.current })
		local UseCallbackResult1 = UseCallbackFunction(function() --[[ Line: 197 ]]
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
		UseEffectFunction(function() --[[ Line: 212 ]]
			-- upvalues: RobloxEventReceiver (copy), UseCallbackResult (copy), AppChatRealtime (upval), UseDispatchResult (copy), RemovedConversationModule (upval), JoinResult (copy), RoactNavigationModule (upval), UseSelectorResult2 (copy), FormFactor (upval), EnumScreensModule (upval), RemovedFromConversationToastTitle (copy), FetchLatestConversationDetailsModule (upval), RenamedGroupConversationModule (upval), ChangedParticipantsModule (upval), IsEmpty (copy), FFlagAppChatPerfTrackingModule (upval), restartMessageReceiveTracking (copy), GetNewMessagesFunction (upval), ReceivedUserTypingModule (upval)
			local ChatNotifications = RobloxEventReceiver:observeEvent("ChatNotifications", function(Player, p2, _) --[[ Line: 213 ]]
				-- upvalues: UseCallbackResult (upval), AppChatRealtime (upval), UseDispatchResult (upval), RemovedConversationModule (upval), JoinResult (upval), RoactNavigationModule (upval), UseSelectorResult2 (upval), FormFactor (upval), EnumScreensModule (upval), RemovedFromConversationToastTitle (upval), FetchLatestConversationDetailsModule (upval), RenamedGroupConversationModule (upval), ChangedParticipantsModule (upval), IsEmpty (upval), FFlagAppChatPerfTrackingModule (upval), restartMessageReceiveTracking (upval), GetNewMessagesFunction (upval), ReceivedUserTypingModule (upval)
				UseCallbackResult("ChatNotifications", Player.SequenceNumber)
				local Type = Player.Type or p2
				AppChatRealtime:info("Received chat notification: {}", Type)
				local Text: string = Player.ConversationId and tostring(Player.ConversationId) or ""
				
				if Type == "RemovedFromConversation" or Type == "ConversationRemoved" then
					UseDispatchResult(RemovedConversationModule(Text))
					local ActiveConversationId = JoinResult.activeConversationId
					
					if ActiveConversationId ~= nil and tostring(ActiveConversationId) == Text and JoinResult.rnBypassActionSignal then
						JoinResult.rnBypassActionSignal:fire(RoactNavigationModule.Actions.navigate({
							routeName = UseSelectorResult2 == FormFactor.WIDE and EnumScreensModule.EmptyConversation or EnumScreensModule.ChatLanding
						}))
					end
					if Type == "RemovedFromConversation" then
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
					if Type == "ConversationTitleChanged" or Type == "ParticipantAdded" or Type == "ParticipantLeft" then
						task.spawn(function() --[[ Line: 251 ]]
							-- upvalues: Text (copy), UseDispatchResult (upval), FetchLatestConversationDetailsModule (upval), Type (copy), RenamedGroupConversationModule (upval), ChangedParticipantsModule (upval), AppChatRealtime (upval)
							UseDispatchResult(FetchLatestConversationDetailsModule(Text)):andThen(function(Result) --[[ Line: 253 ]]
								-- upvalues: Type (upval), Text (upval), UseDispatchResult (upval), RenamedGroupConversationModule (upval), ChangedParticipantsModule (upval)
								local Title = Result.title
								local LastUpdated = Result.lastUpdated
								
								if Type == "ConversationTitleChanged" then
									UseDispatchResult(RenamedGroupConversationModule(Text, Title, Result.isDefaultTitle, LastUpdated))
									
									return
								else
									UseDispatchResult(ChangedParticipantsModule(Text, Result.participants, Title, LastUpdated))
								end
							end):catch(function(Err) --[[ Line: 269 ]]
								-- upvalues: AppChatRealtime (upval), Type (upval)
								AppChatRealtime:warning(`NetworkingChat failure in RobloxEventReceiver->{Type}, Status: {tostring(Err)}`)
							end)
						end)
						
						return
					end
					if Type ~= "AddedToConversation" and Type ~= "NewConversation" then
						if Type == "NewMessage" then
							if FFlagAppChatPerfTrackingModule and JoinResult.activeConversationId and tostring(JoinResult.activeConversationId) == Text then
								restartMessageReceiveTracking(Text)
							end
							local _ = UseDispatchResult(GetNewMessagesFunction(Text, false, (tick())))
							
							return
						elseif Type == "NewMessageBySelf" then
							local _ = UseDispatchResult(GetNewMessagesFunction(Text, true, (tick())))
							
							return
						else
							if Type == "ParticipantTyping" then
								UseDispatchResult(ReceivedUserTypingModule(Text, (tostring(Player.UserId))))
							end
						end
					elseif IsEmpty then
						AppChatRealtime:debug(`Received {Type} event while loading conversation data`)
						
						return
					else
						task.spawn(function() --[[ Line: 281 ]]
							-- upvalues: Text (copy), UseDispatchResult (upval), FetchLatestConversationDetailsModule (upval), AppChatRealtime (upval), Type (copy)
							UseDispatchResult(FetchLatestConversationDetailsModule(Text)):catch(function(Err) --[[ Line: 282 ]]
								-- upvalues: AppChatRealtime (upval), Type (upval)
								AppChatRealtime:warning(`NetworkingChat failure in RobloxEventReceiver->{Type}, Status: {tostring(Err)}`)
							end)
						end)
						
						return
					end
				end
			end)
			
			return function() --[[ Line: 306 ]]
				-- upvalues: ChatNotifications (copy)
				if ChatNotifications and ChatNotifications.disconnect then
					ChatNotifications:disconnect()
				end
			end
		end, {
			UseDispatchResult, UseCallbackResult, JoinResult.activeConversationId,
			JoinResult.rnBypassActionSignal, IsEmpty, UseSelectorResult2,
			UseSelectorResult3
		})
		UseEffectFunction(function() --[[ Line: 321 ]]
			-- upvalues: UseIsChatEnabledModuleResult (copy), JoinResult (copy), AppChatRealtime (upval), RoactNavigationModule (upval), UseSelectorResult2 (copy), FormFactor (upval), EnumScreensModule (upval)
			if not UseIsChatEnabledModuleResult and JoinResult.activeConversationId and JoinResult.rnBypassActionSignal then
				AppChatRealtime:debug("Chat is disabled for our user, navigating away from active conversation")
				JoinResult.rnBypassActionSignal:fire(RoactNavigationModule.Actions.navigate({
					routeName = UseSelectorResult2 == FormFactor.WIDE and EnumScreensModule.EmptyConversation or EnumScreensModule.ChatLanding
				}))
			end
		end, { UseIsChatEnabledModuleResult })
		local UseSelectorResultEntry = if JoinResult.activeConversationId then UseSelectorResult1[JoinResult.activeConversationId] else nil
		UseEffectFunction(function() --[[ Line: 334 ]]
			-- upvalues: UseIsGroupChatEnabledModuleResult (copy), UseSelectorResultEntry (copy), JoinResult (copy), AppChatRealtime (upval), RoactNavigationModule (upval), UseSelectorResult2 (copy), FormFactor (upval), EnumScreensModule (upval)
			if not UseIsGroupChatEnabledModuleResult and UseSelectorResultEntry and JoinResult.rnBypassActionSignal and UseSelectorResultEntry.type == "group" then
				AppChatRealtime:debug("Group chats are disabled and we are navigated to a group chat. Navigating to ChatLanding")
				JoinResult.rnBypassActionSignal:fire(RoactNavigationModule.Actions.navigate({
					routeName = UseSelectorResult2 == FormFactor.WIDE and EnumScreensModule.EmptyConversation or EnumScreensModule.ChatLanding
				}))
			end
		end, {
			UseIsGroupChatEnabledModuleResult,
			UseSelectorResultEntry
		})
		UseEffectFunction(function() --[[ Line: 350 ]]
			-- upvalues: RobloxEventReceiver (copy), UseDispatchResult (copy), RoduxAliasesModule (upval)
			local UserTagChangeNotification = RobloxEventReceiver:observeEvent("UserTagChangeNotification", function(Player, _) --[[ Line: 351 ]]
				-- upvalues: UseDispatchResult (upval), RoduxAliasesModule (upval)
				if Player.Type == "UserTagUpdate" then
					UseDispatchResult(RoduxAliasesModule.Actions.AliasUpdated(tostring(Player.UserId), Player.NewAlias))
				end
			end)
			
			return function() --[[ Line: 357 ]]
				-- upvalues: UserTagChangeNotification (copy)
				if UserTagChangeNotification and UserTagChangeNotification.disconnect then
					UserTagChangeNotification:disconnect()
				end
			end
		end, { UseDispatchResult })
		UseEffectFunction(function() --[[ Line: 364 ]]
			-- upvalues: RobloxEventReceiver (copy), AppChatRealtime (upval), UseDispatchResult (copy), PaginateAndRefreshConversationsModule (upval), UseLocalUserIdResult (copy), FriendshipDestroyedModule (upval), UseSelectorResultEntry (copy), ConversationModule (upval), CryoModule (upval), UseSelectorResult2 (copy), FormFactor (upval), EnumScreensModule (upval), JoinResult (copy), RoactNavigationModule (upval)
			local FriendshipNotifications = RobloxEventReceiver:observeEvent("FriendshipNotifications", function(p2, _) --[[ Line: 365 ]]
				-- upvalues: AppChatRealtime (upval), UseDispatchResult (upval), PaginateAndRefreshConversationsModule (upval), UseLocalUserIdResult (upval), FriendshipDestroyedModule (upval), UseSelectorResultEntry (upval), ConversationModule (upval), CryoModule (upval), UseSelectorResult2 (upval), FormFactor (upval), EnumScreensModule (upval), JoinResult (upval), RoactNavigationModule (upval)
				local Type = p2.Type
				AppChatRealtime:info("Received friendship notification: {}", Type)
				
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
					if UseSelectorResultEntry and UseSelectorResultEntry.source == "friends" and UseSelectorResultEntry.conversationType == ConversationModule.Type.ONE_TO_ONE_CONVERSATION and CryoModule.List.findWhere(UseSelectorResultEntry.participants, function(p3): boolean --[[ Line: 397 ]]
						-- upvalues: v1 (ref)
						return p3 == v1
					end) then
						JoinResult.rnBypassActionSignal:fire(RoactNavigationModule.Actions.navigate({
							routeName = if UseSelectorResult2 == FormFactor.WIDE then EnumScreensModule.EmptyConversation else EnumScreensModule.ChatLanding
						}))
					end
				end
			end)
			
			return function() --[[ Line: 411 ]]
				-- upvalues: FriendshipNotifications (copy)
				if FriendshipNotifications and FriendshipNotifications.disconnect then
					FriendshipNotifications:disconnect()
				end
			end
		end, {
			UseDispatchResult, v61, UseLocalUserIdResult, UseSelectorResult2,
			UseSelectorResultEntry, JoinResult.rnBypassActionSignal
		})
		UseEffectFunction(function() --[[ Line: 425 ]]
			-- upvalues: RobloxEventReceiver (copy), AppChatRealtime (upval), UseDispatchResult (copy), RemovedConversationModule (upval), FetchLatestConversationDetailsModule (upval), JoinResult (copy), RoactNavigationModule (upval), EnumScreensModule (upval)
			local ChatMigration = RobloxEventReceiver:observeEvent("ChatMigration", function(p2, _) --[[ Line: 428 ]]
				-- upvalues: AppChatRealtime (upval), UseDispatchResult (upval), RemovedConversationModule (upval), FetchLatestConversationDetailsModule (upval), JoinResult (upval), RoactNavigationModule (upval), EnumScreensModule (upval)
				local Type = p2.Type
				AppChatRealtime:info("Received chat migration notification: {}", Type)
				local ChannelId = nil
				local ConversationId = nil
				
				if Type == "ConversationBackfilled" then
					ChannelId = p2.ConversationId
					ConversationId = p2.ChannelId
				else
					if Type ~= "ConversationReset" then
						AppChatRealtime:warning(`ChatEventReceiver: unknown notification {Type}`)
						
						return
					end
					ChannelId = p2.ChannelId
					ConversationId = p2.ConversationId
				end
				UseDispatchResult(RemovedConversationModule(ChannelId))
				UseDispatchResult(FetchLatestConversationDetailsModule(ConversationId)):catch(function(Err) --[[ Line: 446 ]]
					-- upvalues: AppChatRealtime (upval), Type (copy)
					AppChatRealtime:warning(`NetworkingChat failure in RobloxEventReceiver->{Type}, Status: {tostring(Err)}`)
				end)
				
				if JoinResult.activeConversationId and ChannelId and tostring(JoinResult.activeConversationId) == ChannelId and JoinResult.rnBypassActionSignal then
					JoinResult.rnBypassActionSignal:fire(RoactNavigationModule.Actions.navigate({
						routeName = EnumScreensModule.ChatConversation,
						params = { conversationId = ConversationId }
					}))
				end
			end)
			
			return function() --[[ Line: 468 ]]
				-- upvalues: ChatMigration (copy)
				if ChatMigration and ChatMigration.disconnect then
					ChatMigration:disconnect()
				end
			end
		end, {
			UseDispatchResult,
			JoinResult.activeConversationId,
			JoinResult.rnBypassActionSignal,
			v55
		})
		local UseCallbackResult2 = UseCallbackFunction(function() --[[ Line: 480 ]]
			-- upvalues: UseSelectorResult (copy), UseDispatchResult (copy), FetchChatMetadataModule (upval), AppChatRealtime (upval), PaginateAndRefreshConversationsModule (upval), GetAllFriendsAsyncModule (upval), FFlagAppChatPresenceStoreMigrationModule (upval), Callback (copy)
			if UseSelectorResult then
				UseDispatchResult(FetchChatMetadataModule()):andThen(function(Result) --[[ Line: 482 ]]
					-- upvalues: AppChatRealtime (upval), UseDispatchResult (upval), PaginateAndRefreshConversationsModule (upval), GetAllFriendsAsyncModule (upval), FFlagAppChatPresenceStoreMigrationModule (upval), Callback (upval)
					if Result then
						AppChatRealtime:trace("Chat is enabled for our user, refreshing conversations")
						UseDispatchResult(PaginateAndRefreshConversationsModule())
						task.spawn(function() --[[ Line: 487 ]]
							-- upvalues: UseDispatchResult (upval), GetAllFriendsAsyncModule (upval)
							UseDispatchResult(GetAllFriendsAsyncModule())
						end)
						
						if not FFlagAppChatPresenceStoreMigrationModule then
							Callback()
							
							return
						end
					else
						AppChatRealtime:trace("Chat is disabled for our user, no need to refresh conversations")
					end
				end)
			end
		end, {
			UseSelectorResult,
			v61,
			v56,
			Callback,
			v54
		})
		UseEffectFunction(function() --[[ Line: 500 ]]
			-- upvalues: RobloxEventReceiver (copy), AppChatRealtime (upval), FFlagRemoveUnusedConnectionStateRoduxSlice (upval), UseDispatchResult (copy), SetConnectionStateModule (upval), UseRefResult1 (copy), UseRefResult (copy), UseSelectorResult (copy), UseCallbackResult2 (copy)
			local SignalR = RobloxEventReceiver:observeEvent("signalR", function(Current, _, p2) --[[ Line: 503 ]]
				-- upvalues: AppChatRealtime (upval), FFlagRemoveUnusedConnectionStateRoduxSlice (upval), UseDispatchResult (upval), SetConnectionStateModule (upval), UseRefResult1 (upval), UseRefResult (upval), UseSelectorResult (upval), UseCallbackResult2 (upval)
				AppChatRealtime:info("SignalR connection state transitioned to {}", (tostring(Current)))
				
				if not FFlagRemoveUnusedConnectionStateRoduxSlice then
					UseDispatchResult(SetConnectionStateModule(Current))
				end
				UseRefResult1.current = Current
				
				if Current == Enum.ConnectionState.Connected and p2 and (UseRefResult.current == nil or UseRefResult.current.ChatNotifications ~= p2.ChatNotifications or UseRefResult.current.CommunicationChannels ~= p2.CommunicationChannels) then
					AppChatRealtime:trace("We missed some messages while we were disconnected. The chat app was previously {}", if UseSelectorResult then "loaded" else "unloaded")
					UseCallbackResult2()
				end
			end)
			
			return function() --[[ Line: 528 ]]
				-- upvalues: SignalR (copy)
				if SignalR and SignalR.disconnect then
					SignalR:disconnect()
				end
			end
		end, {
			UseDispatchResult,
			UseRefResult1,
			UseRefResult,
			UseCallbackResult1,
			UseSelectorResult
		})
		UseEffectFunction(function() --[[ Line: 535 ]]
			-- upvalues: RobloxEventReceiver (copy), CommunicationChannelsTypesModule (upval), AppChatRealtime (upval), UseCallbackResult (copy), UseDispatchResult (copy), RemovedConversationModule (upval), JoinResult (copy), UseSelectorResult2 (copy), FormFactor (upval), EnumScreensModule (upval), RoactNavigationModule (upval), UseLocalUserIdResult (copy), RemovedFromConversationToastTitle (copy), FetchLatestConversationDetailsModule (upval), RenamedGroupConversationModule (upval), ChangedParticipantsModule (upval), IsEmpty (copy), ConversationChannelsModule (upval), FriendConversationCreatedModule (upval), FFlagAppChatPerfTrackingModule (upval), restartMessageReceiveTracking (copy), GetNewMessagesFunction (upval), ReceivedUserTypingModule (upval)
			local CommunicationChannels = RobloxEventReceiver:observeEvent("CommunicationChannels", function(p2, _) --[[ Line: 538 ]]
				-- upvalues: CommunicationChannelsTypesModule (upval), AppChatRealtime (upval), UseCallbackResult (upval), UseDispatchResult (upval), RemovedConversationModule (upval), JoinResult (upval), UseSelectorResult2 (upval), FormFactor (upval), EnumScreensModule (upval), RoactNavigationModule (upval), UseLocalUserIdResult (upval), RemovedFromConversationToastTitle (upval), FetchLatestConversationDetailsModule (upval), RenamedGroupConversationModule (upval), ChangedParticipantsModule (upval), IsEmpty (upval), ConversationChannelsModule (upval), FriendConversationCreatedModule (upval), FFlagAppChatPerfTrackingModule (upval), restartMessageReceiveTracking (upval), GetNewMessagesFunction (upval), ReceivedUserTypingModule (upval)
				if p2.ChannelVertical ~= "PlatformChat" then return end
				if not table.find(CommunicationChannelsTypesModule.ChannelTypeAllowlist, p2.ChannelType) then return end
				AppChatRealtime:info("Received channels notification: {}", p2.Type)
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
						task.spawn(function() --[[ Line: 591 ]]
							-- upvalues: ChannelId (copy), UseDispatchResult (upval), FetchLatestConversationDetailsModule (upval), p2 (copy), RenamedGroupConversationModule (upval), ChangedParticipantsModule (upval), AppChatRealtime (upval)
							UseDispatchResult(FetchLatestConversationDetailsModule(ChannelId)):andThen(function(Result) --[[ Line: 593 ]]
								-- upvalues: p2 (upval), ChannelId (upval), UseDispatchResult (upval), RenamedGroupConversationModule (upval), ChangedParticipantsModule (upval)
								local Title = Result.title
								local LastUpdated = Result.lastUpdated
								
								if p2.Type == "ChannelUpdated" then
									UseDispatchResult(RenamedGroupConversationModule(ChannelId, Title, Result.isDefaultTitle, LastUpdated))
									
									return
								else
									UseDispatchResult(ChangedParticipantsModule(ChannelId, Result.participants, Title, LastUpdated))
								end
							end):catch(function(Err) --[[ Line: 604 ]]
								-- upvalues: AppChatRealtime (upval), p2 (upval)
								AppChatRealtime:warning(`Failure in RobloxEventReceiver->{p2.Type}, Status: {tostring(Err)}`)
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
						AppChatRealtime:debug("Received {} event while loading conversation data", p2.Type)
						
						return
					else
						task.spawn(function() --[[ Line: 622 ]]
							-- upvalues: ChannelId (copy), UseDispatchResult (upval), FetchLatestConversationDetailsModule (upval), p2 (copy), ConversationChannelsModule (upval), FriendConversationCreatedModule (upval), JoinResult (upval), RoactNavigationModule (upval), EnumScreensModule (upval), AppChatRealtime (upval)
							UseDispatchResult(FetchLatestConversationDetailsModule(ChannelId)):andThen(function(Result) --[[ Line: 624 ]]
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
							end):catch(function(Err) --[[ Line: 648 ]]
								-- upvalues: AppChatRealtime (upval), p2 (upval)
								AppChatRealtime:warning("Failure in RobloxEventReceiver->{}, Status: {}", p2.Type, (tostring(Err)))
							end)
						end)
						
						return
					end
				end
			end)
			
			return function() --[[ Line: 677 ]]
				-- upvalues: CommunicationChannels (copy)
				if CommunicationChannels and CommunicationChannels.disconnect then
					CommunicationChannels:disconnect()
				end
			end
		end, {
			UseLocalUserIdResult, RobloxEventReceiver, UseCallbackResult, v62,
			JoinResult.activeConversationId, JoinResult.rnBypassActionSignal,
			RemovedFromConversationToastTitle, v55, v63, v53, IsEmpty, v57, v60,
			UseCallbackResult2
		})
		local UseMemoResult = UseMemoFunction(function() --[[ Line: 699 ]]
			-- upvalues: UseSelectorResult1 (copy), CryoModule (upval)
			return if UseSelectorResult1 then CryoModule.List.filterMap(CryoModule.Dictionary.values(UseSelectorResult1), function(p2) --[[ Line: 704 ]]
				return if p2 and p2.id and p2.source ~= "friends" then p2.id else nil
			end) else {}
		end, { UseSelectorResult1 })
		UseEffectFunction(function() --[[ Line: 714 ]]
			-- upvalues: RobloxEventReceiver (copy), AppChatRealtime (upval), GetFFlagDebugUnfilteredThreadsFunction (upval), chunkAndLogString (upval), CryoModule (upval), UseMemoResult (copy), UseDispatchResult (copy), MultiGetConversationDetailsModule (upval), JoinResult (copy), AppChatNetworkingModule (upval), FFlagAppChatEnableDoubleOptIn (upval), RefreshConversationUnfilteredThreadsDetailsModule (upval), UseIsInExperienceModuleResult (copy)
			local ChatModerationTypeEligibility = RobloxEventReceiver:observeEvent("ChatModerationTypeEligibility", function(p2, _) --[[ Line: 717 ]]
				-- upvalues: AppChatRealtime (upval), GetFFlagDebugUnfilteredThreadsFunction (upval), chunkAndLogString (upval), CryoModule (upval), UseMemoResult (upval), UseDispatchResult (upval), MultiGetConversationDetailsModule (upval), JoinResult (upval), AppChatNetworkingModule (upval), FFlagAppChatEnableDoubleOptIn (upval), RefreshConversationUnfilteredThreadsDetailsModule (upval), UseIsInExperienceModuleResult (upval)
				AppChatRealtime:debug("Received ChatModerationTypeEligibility notification")
				local ChannelsInspected = p2.channels_inspected
				
				if not ChannelsInspected or #ChannelsInspected == 0 then return end
				if GetFFlagDebugUnfilteredThreadsFunction() then
					local v1 = ""
					
					for _, value in ChannelsInspected do
						v1 = `{v1}, {value}`
					end
					chunkAndLogString(`RTN CONVERSATIONS INSPECTED{v1}`)
				end
				local FilterResult = CryoModule.List.filter(ChannelsInspected, function(Value): number --[[ Line: 731 ]]
					-- upvalues: UseMemoResult (upval)
					return table.find(UseMemoResult, Value)
				end)
				
				if #FilterResult == 0 then
					AppChatRealtime:debug("No filtered existing conversation IDs found in ChatModerationTypeEligibility notification")
					
					return
				end
				if GetFFlagDebugUnfilteredThreadsFunction() then
					local v2 = ""
					
					for _, value1 in FilterResult do
						v2 = `{v2}, {value1}`
					end
					chunkAndLogString(`RTN FILTERED CONVERSATIONS{v2}`)
				end
				UseDispatchResult(MultiGetConversationDetailsModule(FilterResult)):catch(function(Err) --[[ Line: 747 ]]
					-- upvalues: AppChatRealtime (upval)
					AppChatRealtime:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->MultiGetConversationDetails, Status: " .. tostring(Err))
				end)
				
				if not JoinResult.activeConversationId then return end
				if table.find(ChannelsInspected, JoinResult.activeConversationId) then
					UseDispatchResult(AppChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ JoinResult.activeConversationId })):catch(function(Err) --[[ Line: 761 ]]
						-- upvalues: AppChatRealtime (upval)
						AppChatRealtime:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationsParticipantsMetadata, Status: " .. tostring(Err))
					end)
					
					if FFlagAppChatEnableDoubleOptIn then
						UseDispatchResult(RefreshConversationUnfilteredThreadsDetailsModule(JoinResult.activeConversationId, UseIsInExperienceModuleResult))
						
						return
					end
					UseDispatchResult(AppChatNetworkingModule.rodux.GetConversationTopModal.API(JoinResult.activeConversationId, UseIsInExperienceModuleResult)):catch(function(Err) --[[ Line: 778 ]]
						-- upvalues: AppChatRealtime (upval)
						AppChatRealtime:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationTopModal, Status: " .. tostring(Err))
					end)
				end
			end)
			
			return function() --[[ Line: 790 ]]
				-- upvalues: ChatModerationTypeEligibility (copy)
				if ChatModerationTypeEligibility and ChatModerationTypeEligibility.disconnect then
					ChatModerationTypeEligibility:disconnect()
				end
			end
		end, {
			UseDispatchResult,
			JoinResult.activeConversationId,
			UseMemoResult
		})
		UseEffectFunction(function() --[[ Line: 797 ]]
			-- upvalues: RobloxEventReceiver (copy), AppChatRealtime (upval), UseDispatchResult (copy), AppChatNetworkingModule (upval), UseIsInExperienceModuleResult (copy)
			local EligibilityStatusChanged = RobloxEventReceiver:observeEvent("EligibilityStatusChanged", function(_, _) --[[ Line: 800 ]]
				-- upvalues: AppChatRealtime (upval), UseDispatchResult (upval), AppChatNetworkingModule (upval), UseIsInExperienceModuleResult (upval)
				AppChatRealtime:info("Received EligibilityStatusChanged notification")
				UseDispatchResult(AppChatNetworkingModule.rodux.GetChatLandingModal.API(UseIsInExperienceModuleResult)):catch(function(Err) --[[ Line: 803 ]]
					-- upvalues: AppChatRealtime (upval)
					AppChatRealtime:warning("Error in GetChatLandingModal request. Error: {}", (tostring(Err)))
				end)
			end)
			
			return function() --[[ Line: 809 ]]
				-- upvalues: EligibilityStatusChanged (copy)
				if EligibilityStatusChanged and EligibilityStatusChanged.disconnect then
					EligibilityStatusChanged:disconnect()
				end
			end
		end, { UseDispatchResult })
		UseChatTrustedConnectionsEventsModule({ activeConversationId = JoinResult.activeConversationId })
		
		return {}
	end
	
	return ChatEventReceiver
end
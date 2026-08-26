local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local roactUtilsModule = require(parent.RoactUtils)
local cryoModule = require(parent.Cryo)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local useCallback = reactModule.useCallback
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useLocalization = localizationModule.Hooks.useLocalization
local useMemo = reactModule.useMemo
local useRef = reactModule.useRef
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local formFactor = require(parent.FormFactor).Enums.FormFactor
local var1 = require(appChat.Logger):new("AppChat.Realtime")
local conversationModule = require(appChat.Models.Conversation)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local changedParticipantsModule = require(appChat.Conversations.Actions.ChangedParticipants)
local roduxAliasesModule = require(appChat.Http.RoduxAliases)
local receivedUserTypingModule = require(appChat.Conversations.Actions.ReceivedUserTyping)
local removedConversationModule = require(appChat.Conversations.Actions.RemovedConversation)
local renamedGroupConversationModule = require(appChat.Conversations.Actions.RenamedGroupConversation)
local setConnectionStateModule = require(appChat.Actions.SetConnectionState)
local friendConversationCreatedModule = require(appChat.Conversations.Actions.FriendConversationCreated)
local friendshipDestroyedModule = require(appChat.Actions.FriendshipDestroyed)
local useIsChatEnabledModule = require(appChat.Hooks.useIsChatEnabled)
local useIsGroupChatEnabledModule = require(appChat.Hooks.useIsGroupChatEnabled)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local enumScreensModule = require(appChat.EnumScreens)
local getNewMessages = require(appChat.Components.ChatConversation.Messages).Thunks.getNewMessages
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fFlagAppChatMessageTTIMilestonesModule = require(appChat.Flags.FFlagAppChatMessageTTIMilestones)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local paginateAndRefreshConversationsModule = require(appChat.Conversations.Thunks.paginateAndRefreshConversations)
local fetchChatMetadataModule = require(appChat.Conversations.Thunks.fetchChatMetadata)
local getAllUserPresencesModule = require(appChat.Conversations.Thunks.getAllUserPresences)
local fetchLatestConversationDetailsModule = require(appChat.Conversations.Thunks.fetchLatestConversationDetails)
local getAllFriendsAsyncModule = require(appChat.Conversations.Thunks.getAllFriendsAsync)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local multiGetConversationDetailsModule = require(appChat.Conversations.Thunks.multiGetConversationDetails)
local refreshConversationUnfilteredThreadsDetailsModule = require(appChat.Conversations.Thunks.refreshConversationUnfilteredThreadsDetails)
local communicationChannelsTypesModule = require(script.Parent.CommunicationChannelsTypes)
local _ = require(script.Parent.UnfilteredThreadsTypes)
local _ = require(script.Parent.ChatMigrationTypes)
local useChatTrustedConnectionsEventsModule = require(appChat.Components.EventReceivers.useChatTrustedConnectionsEvents)
local getFFlagDebugUnfilteredThreads = require(parent.SharedFlags).getFFlagDebugUnfilteredThreads
local fFlagAppChatEnableDoubleOptIn = require(parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local fFlagRemoveUnusedConnectionStateRoduxSlice = require(parent.SharedFlags).FFlagRemoveUnusedConnectionStateRoduxSlice
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)

local function chunkAndLogString(p1)
	-- upvalues: var1 (ref)
	local t = {}
	
	for i = 1, #p1, 800 do
		table.insert(t, p1:sub(i, i + 800 - 1))
	end
	for i_1, v in t do
		var1:debug(v)
	end
end

local t = { handlesAppShellNotifications = true }

function ChatEventReceiver(p2)
	-- upvalues: useEffect (ref), var1 (ref), useSelector (ref), useCallback (ref), cryoModule (ref), useLocalUserId (ref), useIsChatEnabledModule (ref), useIsGroupChatEnabledModule (ref), useIsInExperienceModule (ref), useDispatch (ref), changedParticipantsModule (ref), fetchChatMetadataModule (ref), fetchLatestConversationDetailsModule (ref), getAllFriendsAsyncModule (ref), fFlagAppChatPresenceStoreMigrationModule (ref), getAllUserPresencesModule (ref), getNewMessages (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), roduxAliasesModule (ref), receivedUserTypingModule (ref), paginateAndRefreshConversationsModule (ref), removedConversationModule (ref), renamedGroupConversationModule (ref), setConnectionStateModule (ref), t (ref), useRef (ref), useLocalization (ref), roactNavigationModule (ref), enumScreensModule (ref), formFactor (ref), friendshipDestroyedModule (ref), conversationModule (ref), fFlagRemoveUnusedConnectionStateRoduxSlice (ref), communicationChannelsTypesModule (ref), conversationChannelsModule (ref), friendConversationCreatedModule (ref), useMemo (ref), getFFlagDebugUnfilteredThreads (ref), chunkAndLogString (ref), multiGetConversationDetailsModule (ref), appChatNetworkingModule (ref), fFlagAppChatEnableDoubleOptIn (ref), refreshConversationUnfilteredThreadsDetailsModule (ref), useChatTrustedConnectionsEventsModule (ref)
	useEffect(function()
		-- upvalues: var1 (copy)
		var1:info("ChatEventReceiver mounted")
		
		return function()
			-- upvalues: var1 (copy)
			var1:info("ChatEventReceiver unmounted")
		end
	end, {})
	local var2 = useSelector(useCallback(function(p3)
		return p3.ChatAppReducer.AppLoaded
	end, {}))
	local var3 = useSelector(useCallback(function(p3)
		return p3.ChatAppReducer.Conversations
	end, {}))
	local var4 = useSelector(useCallback(function(p3)
		return p3.FormFactor
	end, {}))
	local var5 = useSelector(useCallback(function(p3)
		return p3.Users
	end, {}))
	local var6 = cryoModule.isEmpty(var3)
	local var7 = useLocalUserId()
	local var8 = useIsChatEnabledModule()
	local var9 = useIsGroupChatEnabledModule()
	local var10 = useIsInExperienceModule()
	local var11 = useDispatch()
	
	local var12 = function(p3, p4, p5, p6)
		-- upvalues: var11 (ref), changedParticipantsModule (copy)
		var11(changedParticipantsModule(p3, p4, p5, p6))
	end
	
	local var13 = function()
		-- upvalues: var11 (ref), fetchChatMetadataModule (copy)
		return var11(fetchChatMetadataModule())
	end
	
	local var14 = function(p3)
		-- upvalues: var11 (ref), fetchLatestConversationDetailsModule (copy)
		return var11(fetchLatestConversationDetailsModule(p3))
	end
	
	local var15 = function()
		-- upvalues: var11 (ref), getAllFriendsAsyncModule (copy)
		var11(getAllFriendsAsyncModule())
	end
	
	local var16 = if not fFlagAppChatPresenceStoreMigrationModule then function()
		-- upvalues: var11 (ref), getAllUserPresencesModule (copy)
		spawn(function()
			-- upvalues: var11 (copy), getAllUserPresencesModule (copy)
			var11(getAllUserPresencesModule())
		end)
	end else nil
	
	local var17 = function(p3, p4, p5)
		-- upvalues: var11 (ref), getNewMessages (copy)
		return var11(getNewMessages(p3, p4, p5))
	end
	
	local function restartMessageReceiveTracking(p3)
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy)
		if not fFlagAppChatPerfTrackingModule then return end
		local t = { conversationId = tostring(p3) }
		
		if fFlagAppChatMessageTTIMilestonesModule then
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageReceiveTTI, t)
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.MessageReceiveTTI, t)
			
			return
		end
		appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageReceiveToRender, t)
		appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.MessageReceiveToRender, t)
	end
	
	local _ = function(p3, p4)
		-- upvalues: var11 (ref), roduxAliasesModule (copy)
		var11(roduxAliasesModule.Actions.AliasUpdated(p3, p4))
	end
	
	local var18 = function(p3, p4)
		-- upvalues: var11 (ref), receivedUserTypingModule (copy)
		var11(receivedUserTypingModule(p3, p4))
	end
	
	local var19 = function()
		-- upvalues: var11 (ref), paginateAndRefreshConversationsModule (copy)
		var11(paginateAndRefreshConversationsModule())
	end
	
	local var20 = function(p3)
		-- upvalues: var11 (ref), removedConversationModule (copy)
		var11(removedConversationModule(p3))
	end
	
	local var21 = function(p3, p4, p5, p6)
		-- upvalues: var11 (ref), renamedGroupConversationModule (copy)
		var11(renamedGroupConversationModule(p3, p4, p5, p6))
	end
	
	local _ = function(p3)
		-- upvalues: var11 (ref), setConnectionStateModule (copy)
		var11(setConnectionStateModule(p3))
	end
	
	local var22 = cryoModule.Dictionary.join(t, p2)
	local robloxEventReceiver = var22.robloxEventReceiver
	local var23 = useRef({})
	local var24 = useRef(Enum.ConnectionState.Connected)
	local var25 = useLocalization({
		networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		removedFromConversationToastTitle = "Feature.Chat.Message.RemovedFromConversation"
	})
	local networkErrorText = var25.networkErrorText
	local removedFromConversationToastTitle = var25.removedFromConversationToastTitle
	local var26 = useCallback(function(p3, p4)
		-- upvalues: var23 (ref)
		assert(var23.current, "table")
		var23.current[p3] = p4
	end, { var23.current })
	local var27 = useCallback(function()
		-- upvalues: var22 (ref), roactNavigationModule (copy), enumScreensModule (copy), networkErrorText (ref)
		if var22.rnBypassActionSignal then
			var22.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.RoactChatToast,
				params = {
					toastProps = { toastContent = { toastTitle = networkErrorText } }
				}
			}))
		end
	end, { var22.rnBypassActionSignal, networkErrorText })
	useEffect(function()
		-- upvalues: robloxEventReceiver (ref), var26 (ref), var1 (copy), var11 (ref), removedConversationModule (copy), var22 (ref), roactNavigationModule (copy), var4 (ref), formFactor (copy), enumScreensModule (copy), removedFromConversationToastTitle (ref), fetchLatestConversationDetailsModule (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var6 (ref), fFlagAppChatPerfTrackingModule (copy), restartMessageReceiveTracking (ref), getNewMessages (copy), receivedUserTypingModule (copy)
		local chatNotifications = robloxEventReceiver:observeEvent("ChatNotifications", function(p3, p4, _)
			-- upvalues: var26 (copy), var1 (copy), var11 (copy), removedConversationModule (copy), var22 (copy), roactNavigationModule (copy), var4 (copy), formFactor (copy), enumScreensModule (copy), removedFromConversationToastTitle (copy), fetchLatestConversationDetailsModule (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var6 (copy), fFlagAppChatPerfTrackingModule (copy), restartMessageReceiveTracking (copy), getNewMessages (copy), receivedUserTypingModule (copy)
			local var28
			var26("ChatNotifications", p3.SequenceNumber)
			local type = p3.Type or p4
			var1:info("Received chat notification: {}", type)
			local conversationId = p3.ConversationId and tostring(p3.ConversationId) or ""
			
			if type == "RemovedFromConversation" or type == "ConversationRemoved" then
				var11(removedConversationModule(conversationId))
				local activeConversationId = var22.activeConversationId
				
				if activeConversationId ~= nil and tostring(activeConversationId) == conversationId and var22.rnBypassActionSignal then
					var22.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
						routeName = if var4 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
					}))
				end
				if type == "RemovedFromConversation" then
					var22.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
						routeName = enumScreensModule.RoactChatToast,
						params = {
							toastProps = {
								toastContent = { toastTitle = removedFromConversationToastTitle }
							}
						}
					}))
					
					return
				end
			elseif type == "ConversationTitleChanged" or type == "ParticipantAdded" or type == "ParticipantLeft" then
				task.spawn(function()
					-- upvalues: conversationId (ref), var11 (copy), fetchLatestConversationDetailsModule (copy), type (ref), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var1 (copy)
					var11(fetchLatestConversationDetailsModule(conversationId)):andThen(function(p5)
						-- upvalues: type (copy), conversationId (copy), var11 (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy)
						local title = p5.title
						local lastUpdated = p5.lastUpdated
						
						if type == "ConversationTitleChanged" then
							var11(renamedGroupConversationModule(conversationId, title, p5.isDefaultTitle, lastUpdated))
							
							return
						end
						var11(changedParticipantsModule(conversationId, p5.participants, title, lastUpdated))
					end):catch(function(p5)
						-- upvalues: var1 (copy), type (copy)
						var1:warning(`NetworkingChat failure in RobloxEventReceiver->{type}, Status: {tostring(p5)}`)
					end)
				end)
				
				return
			elseif type == "AddedToConversation" or type == "NewConversation" then
				if var6 then
					var1:debug(`Received {type} event while loading conversation data`)
					
					return
				end
				task.spawn(function()
					-- upvalues: conversationId (ref), var11 (copy), fetchLatestConversationDetailsModule (copy), var1 (copy), type (ref)
					var11(fetchLatestConversationDetailsModule(conversationId)):catch(function(p5)
						-- upvalues: var1 (copy), type (copy)
						var1:warning(`NetworkingChat failure in RobloxEventReceiver->{type}, Status: {tostring(p5)}`)
					end)
				end)
				
				return
			elseif type == "NewMessage" then
				if fFlagAppChatPerfTrackingModule and var22.activeConversationId and tostring(var22.activeConversationId) == conversationId then
					restartMessageReceiveTracking(conversationId)
				end
				var28 = var11(getNewMessages(conversationId, false, tick()))
				
				return
			elseif type == "NewMessageBySelf" then
				var28 = var11(getNewMessages(conversationId, true, tick()))
				
				return
			elseif type == "ParticipantTyping" then
				var11(receivedUserTypingModule(conversationId, tostring(p3.UserId)))
			end
		end)
		
		return function()
			-- upvalues: chatNotifications (ref)
			if chatNotifications and chatNotifications.disconnect then
				chatNotifications:disconnect()
			end
		end
	end, {
		var11, var26, var22.activeConversationId, var22.rnBypassActionSignal, var6,
		var4, var5
	})
	useEffect(function()
		-- upvalues: var8 (ref), var22 (ref), var1 (copy), roactNavigationModule (copy), var4 (ref), formFactor (copy), enumScreensModule (copy)
		if not var8 and var22.activeConversationId and var22.rnBypassActionSignal then
			var1:debug("Chat is disabled for our user, navigating away from active conversation")
			var22.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
				routeName = if var4 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
			}))
		end
	end, { var8 })
	local var28 = if var22.activeConversationId then var3[var22.activeConversationId] else nil
	useEffect(function()
		-- upvalues: var9 (ref), var28 (ref), var22 (ref), var1 (copy), roactNavigationModule (copy), var4 (ref), formFactor (copy), enumScreensModule (copy)
		if not var9 and var28 and (var22.rnBypassActionSignal and var28.type == "group") then
			var1:debug("Group chats are disabled and we are navigated to a group chat. Navigating to ChatLanding")
			var22.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
				routeName = if var4 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
			}))
		end
	end, { var9, var28 })
	useEffect(function()
		-- upvalues: robloxEventReceiver (ref), var11 (ref), roduxAliasesModule (copy)
		local userTagChangeNotification = robloxEventReceiver:observeEvent("UserTagChangeNotification", function(p3, _)
			-- upvalues: var11 (copy), roduxAliasesModule (copy)
			if p3.Type == "UserTagUpdate" then
				var11(roduxAliasesModule.Actions.AliasUpdated(tostring(p3.UserId), p3.NewAlias))
			end
		end)
		
		return function()
			-- upvalues: userTagChangeNotification (ref)
			if userTagChangeNotification and userTagChangeNotification.disconnect then
				userTagChangeNotification:disconnect()
			end
		end
	end, { var11 })
	useEffect(function()
		-- upvalues: robloxEventReceiver (ref), var1 (copy), var11 (ref), paginateAndRefreshConversationsModule (copy), var7 (ref), friendshipDestroyedModule (copy), var28 (ref), conversationModule (copy), cryoModule (copy), var4 (ref), formFactor (copy), enumScreensModule (copy), var22 (ref), roactNavigationModule (copy)
		local friendshipNotifications = robloxEventReceiver:observeEvent("FriendshipNotifications", function(p3, _)
			-- upvalues: var1 (copy), var11 (copy), paginateAndRefreshConversationsModule (copy), var7 (copy), friendshipDestroyedModule (copy), var28 (copy), conversationModule (copy), cryoModule (copy), var4 (copy), formFactor (copy), enumScreensModule (copy), var22 (copy), roactNavigationModule (copy)
			local type = p3.Type
			var1:info("Received friendship notification: {}", type)
			
			if type == "FriendshipCreated" then
				var11(paginateAndRefreshConversationsModule())
				
				return
			elseif type == "FriendshipDestroyed" then
				local var29 = nil
				
				if p3.EventArgs then
					local var30 = tostring(p3.EventArgs.UserId1)
					local var31 = tostring(p3.EventArgs.UserId2)
					
					if var30 == var7 then
						var30 = "localUserId"
						var29 = var31
					end
					if var31 == var7 then
						var31 = "localUserId"
						var29 = var30
					end
					var11(friendshipDestroyedModule({ userId1 = var30, userId2 = var31 }))
				end
				if var28 and var28.source == "friends" and (var28.conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION and cryoModule.List.findWhere(var28.participants, function(p4)
					-- upvalues: var29 (write)
					return p4 == var29
				end)) then
					var22.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
						routeName = if var4 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
					}))
				end
			end
		end)
		
		return function()
			-- upvalues: friendshipNotifications (ref)
			if friendshipNotifications and friendshipNotifications.disconnect then
				friendshipNotifications:disconnect()
			end
		end
	end, {
		var11, var19, var7, var4, var28, var22.rnBypassActionSignal
	})
	useEffect(function()
		-- upvalues: robloxEventReceiver (ref), var1 (copy), var11 (ref), removedConversationModule (copy), fetchLatestConversationDetailsModule (copy), var22 (ref), roactNavigationModule (copy), enumScreensModule (copy)
		local chatMigration = robloxEventReceiver:observeEvent("ChatMigration", function(p3, _)
			-- upvalues: var1 (copy), var11 (copy), removedConversationModule (copy), fetchLatestConversationDetailsModule (copy), var22 (copy), roactNavigationModule (copy), enumScreensModule (copy)
			local type = p3.Type
			var1:info("Received chat migration notification: {}", type)
			local channelId = nil
			local conversationId = nil
			
			if type == "ConversationBackfilled" then
				channelId = p3.ConversationId
				conversationId = p3.ChannelId
			elseif type == "ConversationReset" then
				channelId = p3.ChannelId
				conversationId = p3.ConversationId
			else
				var1:warning(`ChatEventReceiver: unknown notification {type}`)
				
				return
			end
			var11(removedConversationModule(channelId))
			var11(fetchLatestConversationDetailsModule(conversationId)):catch(function(p4)
				-- upvalues: var1 (copy), type (ref)
				var1:warning(`NetworkingChat failure in RobloxEventReceiver->{type}, Status: {tostring(p4)}`)
			end)
			
			if var22.activeConversationId and channelId and (tostring(var22.activeConversationId) == channelId and var22.rnBypassActionSignal) then
				var22.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
					routeName = enumScreensModule.ChatConversation,
					params = { conversationId = conversationId }
				}))
			end
		end)
		
		return function()
			-- upvalues: chatMigration (ref)
			if chatMigration and chatMigration.disconnect then
				chatMigration:disconnect()
			end
		end
	end, {
		var11,
		var22.activeConversationId,
		var22.rnBypassActionSignal,
		var14
	})
	local var29 = useCallback(function()
		-- upvalues: var2 (ref), var11 (ref), fetchChatMetadataModule (copy), var1 (copy), paginateAndRefreshConversationsModule (copy), getAllFriendsAsyncModule (copy), fFlagAppChatPresenceStoreMigrationModule (copy), var16 (ref)
		if var2 then
			var11(fetchChatMetadataModule()):andThen(function(p3)
				-- upvalues: var1 (copy), var11 (copy), paginateAndRefreshConversationsModule (copy), getAllFriendsAsyncModule (copy), fFlagAppChatPresenceStoreMigrationModule (copy), var16 (copy)
				if p3 then
					var1:trace("Chat is enabled for our user, refreshing conversations")
					var11(paginateAndRefreshConversationsModule())
					task.spawn(function()
						-- upvalues: var11 (copy), getAllFriendsAsyncModule (copy)
						var11(getAllFriendsAsyncModule())
					end)
					
					if fFlagAppChatPresenceStoreMigrationModule then
						return
					else
						var16()
						
						return
					end
				else
					var1:trace("Chat is disabled for our user, no need to refresh conversations")
				end
			end)
		end
	end, {
		var2,
		var19,
		var15,
		var16,
		var13
	})
	useEffect(function()
		-- upvalues: robloxEventReceiver (ref), var1 (copy), fFlagRemoveUnusedConnectionStateRoduxSlice (copy), var11 (ref), setConnectionStateModule (copy), var24 (ref), var23 (ref), var2 (ref), var29 (ref)
		local signalR = robloxEventReceiver:observeEvent("signalR", function(p3, _, p4)
			-- upvalues: var1 (copy), fFlagRemoveUnusedConnectionStateRoduxSlice (copy), var11 (copy), setConnectionStateModule (copy), var24 (copy), var23 (copy), var2 (copy), var29 (copy)
			var1:info("SignalR connection state transitioned to {}", tostring(p3))
			
			if not fFlagRemoveUnusedConnectionStateRoduxSlice then
				var11(setConnectionStateModule(p3))
			end
			var24.current = p3
			
			if p3 == Enum.ConnectionState.Connected and p4 and (var23.current == nil or var23.current.ChatNotifications ~= p4.ChatNotifications or var23.current.CommunicationChannels ~= p4.CommunicationChannels) then
				var1:trace("We missed some messages while we were disconnected. The chat app was previously {}", if var2 then "loaded" else "unloaded")
				var29()
			end
		end)
		
		return function()
			-- upvalues: signalR (ref)
			if signalR and signalR.disconnect then
				signalR:disconnect()
			end
		end
	end, {
		var11,
		var24,
		var23,
		var27,
		var2
	})
	useEffect(function()
		-- upvalues: robloxEventReceiver (ref), communicationChannelsTypesModule (copy), var1 (copy), var26 (ref), var11 (ref), removedConversationModule (copy), var22 (ref), var4 (ref), formFactor (copy), enumScreensModule (copy), roactNavigationModule (copy), var7 (ref), removedFromConversationToastTitle (ref), fetchLatestConversationDetailsModule (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var6 (ref), conversationChannelsModule (copy), friendConversationCreatedModule (copy), fFlagAppChatPerfTrackingModule (copy), restartMessageReceiveTracking (ref), getNewMessages (copy), receivedUserTypingModule (copy)
		local communicationChannels = robloxEventReceiver:observeEvent("CommunicationChannels", function(p3, _)
			-- upvalues: communicationChannelsTypesModule (copy), var1 (copy), var26 (copy), var11 (copy), removedConversationModule (copy), var22 (copy), var4 (copy), formFactor (copy), enumScreensModule (copy), roactNavigationModule (copy), var7 (copy), removedFromConversationToastTitle (copy), fetchLatestConversationDetailsModule (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var6 (copy), conversationChannelsModule (copy), friendConversationCreatedModule (copy), fFlagAppChatPerfTrackingModule (copy), restartMessageReceiveTracking (copy), getNewMessages (copy), receivedUserTypingModule (copy)
			if p3.ChannelVertical ~= "PlatformChat" then return end
			if not table.find(communicationChannelsTypesModule.ChannelTypeAllowlist, p3.ChannelType) then return end
			var1:info("Received channels notification: {}", p3.Type)
			var26("CommunicationChannels", p3.SequenceNumber)
			local channelId = p3.ChannelId
			
			if p3.Type == "ChannelDeleted" or p3.Type == "RemovedFromChannel" or p3.Type == "ChannelArchived" then
				var11(removedConversationModule(channelId))
				local activeConversationId = var22.activeConversationId
				
				if activeConversationId ~= nil and tostring(activeConversationId) == p3.ChannelId and var22.rnBypassActionSignal then
					var22.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
						routeName = if var4 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
					}))
				end
				if p3.Actor.Id == tostring(var7) then
					return
				else
					var22.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
						routeName = enumScreensModule.RoactChatToast,
						params = {
							toastProps = {
								toastContent = { toastTitle = removedFromConversationToastTitle }
							}
						}
					}))
					
					return
				end
			elseif p3.Type == "ChannelUpdated" or p3.Type == "ParticipantsAdded" or p3.Type == "ParticipantsRemoved" then
				task.spawn(function()
					-- upvalues: channelId (ref), var11 (copy), fetchLatestConversationDetailsModule (copy), p3 (ref), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var1 (copy)
					var11(fetchLatestConversationDetailsModule(channelId)):andThen(function(p4)
						-- upvalues: p3 (copy), channelId (copy), var11 (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy)
						local title = p4.title
						local lastUpdated = p4.lastUpdated
						
						if p3.Type == "ChannelUpdated" then
							var11(renamedGroupConversationModule(channelId, title, p4.isDefaultTitle, lastUpdated))
							
							return
						end
						var11(changedParticipantsModule(channelId, p4.participants, title, lastUpdated))
					end):catch(function(p4)
						-- upvalues: var1 (copy), p3 (copy)
						var1:warning(`Failure in RobloxEventReceiver->{p3.Type}, Status: {tostring(p4)}`)
					end)
				end)
				
				return
			elseif p3.Type == "AddedToChannel" or p3.Type == "ChannelCreated" or p3.Type == "ChannelMarkedRead" or (p3.Type == "ChannelMetadataUpdated" and channelId ~= nil or p3.Type == "ChannelUnarchived") then
				if var6 then
					var1:debug("Received {} event while loading conversation data", p3.Type)
					
					return
				end
				task.spawn(function()
					-- upvalues: channelId (ref), var11 (copy), fetchLatestConversationDetailsModule (copy), p3 (ref), conversationChannelsModule (copy), friendConversationCreatedModule (copy), var22 (copy), roactNavigationModule (copy), enumScreensModule (copy), var1 (copy)
					var11(fetchLatestConversationDetailsModule(channelId)):andThen(function(p4)
						-- upvalues: p3 (copy), conversationChannelsModule (copy), var11 (copy), friendConversationCreatedModule (copy), var22 (copy), roactNavigationModule (copy), enumScreensModule (copy)
						if (p3.Type == "ChannelCreated" or p3.Type == "ChannelUnarchived") and p4.type == "one_to_one" then
							local friendConversationId = conversationChannelsModule.getFriendConversationId(p4.participants)
							
							if friendConversationId then
								var11(friendConversationCreatedModule({
									newConversationId = p4.id,
									oldFriendConversationId = friendConversationId
								}))
								
								if var22.activeConversationId == friendConversationId then
									var22.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
										routeName = enumScreensModule.ChatConversation,
										params = { conversationId = p4.id }
									}))
								end
							end
						end
					end):catch(function(p4)
						-- upvalues: var1 (copy), p3 (copy)
						var1:warning("Failure in RobloxEventReceiver->{}, Status: {}", p3.Type, tostring(p4))
					end)
				end)
				
				return
			elseif p3.Type == "MessageCreated" or p3.Type == "SystemMessageCreated" then
				local var30
				if not fFlagAppChatPerfTrackingModule then
					var30 = var11(getNewMessages(channelId, p3.Actor.Id == tostring(var7), tick()))
					
					return
				end
				local var31 = p3.Actor.Id == tostring(var7)
				
				if not var31 and var22.activeConversationId and tostring(var22.activeConversationId) == channelId then
					restartMessageReceiveTracking(channelId)
				end
				var30 = var11(getNewMessages(channelId, var31, tick()))
				
				return
			elseif p3.Type == "ParticipantTyping" and p3.IsTyping then
				var11(receivedUserTypingModule(channelId, p3.Actor.Id))
			end
		end)
		
		return function()
			-- upvalues: communicationChannels (ref)
			if communicationChannels and communicationChannels.disconnect then
				communicationChannels:disconnect()
			end
		end
	end, {
		var7, robloxEventReceiver, var26, var20, var22.activeConversationId,
		var22.rnBypassActionSignal, removedFromConversationToastTitle, var14, var21,
		var12, var6, var17, var18, var29
	})
	local var30 = useMemo(function()
		-- upvalues: var3 (ref), cryoModule (copy)
		return if var3 then cryoModule.List.filterMap(cryoModule.Dictionary.values(var3), function(p3)
			return if p3 and p3.id and p3.source ~= "friends" then p3.id else nil
		end) else {}
	end, { var3 })
	useEffect(function()
		-- upvalues: robloxEventReceiver (ref), var1 (copy), getFFlagDebugUnfilteredThreads (copy), chunkAndLogString (copy), cryoModule (copy), var30 (ref), var11 (ref), multiGetConversationDetailsModule (copy), var22 (ref), appChatNetworkingModule (copy), fFlagAppChatEnableDoubleOptIn (copy), refreshConversationUnfilteredThreadsDetailsModule (copy), var10 (ref)
		local chatModerationTypeEligibility = robloxEventReceiver:observeEvent("ChatModerationTypeEligibility", function(p3, _)
			-- upvalues: var1 (copy), getFFlagDebugUnfilteredThreads (copy), chunkAndLogString (copy), cryoModule (copy), var30 (copy), var11 (copy), multiGetConversationDetailsModule (copy), var22 (copy), appChatNetworkingModule (copy), fFlagAppChatEnableDoubleOptIn (copy), refreshConversationUnfilteredThreadsDetailsModule (copy), var10 (copy)
			var1:debug("Received ChatModerationTypeEligibility notification")
			local channelsInspected = p3.channels_inspected
			
			if not channelsInspected or #channelsInspected == 0 then return end
			if getFFlagDebugUnfilteredThreads() then
				local var31 = ""
				
				for i, v in channelsInspected do
					var31 = `{var31}, {v}`
				end
				chunkAndLogString(`RTN CONVERSATIONS INSPECTED{var31}`)
			end
			local var32 = cryoModule.List.filter(channelsInspected, function(p4)
				-- upvalues: var30 (copy)
				return table.find(var30, p4)
			end)
			
			if #var32 == 0 then
				var1:debug("No filtered existing conversation IDs found in ChatModerationTypeEligibility notification")
				
				return
			elseif getFFlagDebugUnfilteredThreads() then
				local var33 = ""
				
				for i, v in var32 do
					var33 = `{var33}, {v}`
				end
				chunkAndLogString(`RTN FILTERED CONVERSATIONS{var33}`)
			end
			var11(multiGetConversationDetailsModule(var32)):catch(function(p4)
				-- upvalues: var1 (copy)
				var1:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->MultiGetConversationDetails, Status: " .. tostring(p4))
			end)
			
			if not var22.activeConversationId then return end
			if table.find(channelsInspected, var22.activeConversationId) then
				var11(appChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ var22.activeConversationId })):catch(function(p4)
					-- upvalues: var1 (copy)
					var1:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationsParticipantsMetadata, Status: " .. tostring(p4))
				end)
				
				if fFlagAppChatEnableDoubleOptIn then
					var11(refreshConversationUnfilteredThreadsDetailsModule(var22.activeConversationId, var10))
					
					return
				end
				var11(appChatNetworkingModule.rodux.GetConversationTopModal.API(var22.activeConversationId, var10)):catch(function(p4)
					-- upvalues: var1 (copy)
					var1:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationTopModal, Status: " .. tostring(p4))
				end)
			end
		end)
		
		return function()
			-- upvalues: chatModerationTypeEligibility (ref)
			if chatModerationTypeEligibility and chatModerationTypeEligibility.disconnect then
				chatModerationTypeEligibility:disconnect()
			end
		end
	end, { var11, var22.activeConversationId, var30 })
	useEffect(function()
		-- upvalues: robloxEventReceiver (ref), var1 (copy), var11 (ref), appChatNetworkingModule (copy), var10 (ref)
		local eligibilityStatusChanged = robloxEventReceiver:observeEvent("EligibilityStatusChanged", function(_, _)
			-- upvalues: var1 (copy), var11 (copy), appChatNetworkingModule (copy), var10 (copy)
			var1:info("Received EligibilityStatusChanged notification")
			var11(appChatNetworkingModule.rodux.GetChatLandingModal.API(var10)):catch(function(p4)
				-- upvalues: var1 (copy)
				var1:warning("Error in GetChatLandingModal request. Error: {}", tostring(p4))
			end)
		end)
		
		return function()
			-- upvalues: eligibilityStatusChanged (ref)
			if eligibilityStatusChanged and eligibilityStatusChanged.disconnect then
				eligibilityStatusChanged:disconnect()
			end
		end
	end, { var11 })
	useChatTrustedConnectionsEventsModule({ activeConversationId = var22.activeConversationId })
	
	return {}
end

return ChatEventReceiver
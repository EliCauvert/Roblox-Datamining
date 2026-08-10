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
local var7 = require(appChat.Logger):new("AppChat.Realtime")
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

local function chunkAndLogString(p0) --[[ line: 64 ]]
	-- upvalues: var7 (ref)
	local t = {}
	
	for i = 1, #p0, 800 do
		table.insert(t, p0:sub(i, i + 800 - 1))
	end
	for i_1, v in t do
		var7:debug(v)
	end
end

local t = { handlesAppShellNotifications = true }

function ChatEventReceiver(p1) --[[ line: 87 ]]
	-- upvalues: useEffect (ref), var7 (ref), useSelector (ref), useCallback (ref), cryoModule (ref), useLocalUserId (ref), useIsChatEnabledModule (ref), useIsGroupChatEnabledModule (ref), useIsInExperienceModule (ref), useDispatch (ref), changedParticipantsModule (ref), fetchChatMetadataModule (ref), fetchLatestConversationDetailsModule (ref), getAllFriendsAsyncModule (ref), fFlagAppChatPresenceStoreMigrationModule (ref), getAllUserPresencesModule (ref), getNewMessages (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), roduxAliasesModule (ref), receivedUserTypingModule (ref), paginateAndRefreshConversationsModule (ref), removedConversationModule (ref), renamedGroupConversationModule (ref), setConnectionStateModule (ref), t (ref), useRef (ref), useLocalization (ref), roactNavigationModule (ref), enumScreensModule (ref), formFactor (ref), friendshipDestroyedModule (ref), conversationModule (ref), fFlagRemoveUnusedConnectionStateRoduxSlice (ref), communicationChannelsTypesModule (ref), conversationChannelsModule (ref), friendConversationCreatedModule (ref), useMemo (ref), getFFlagDebugUnfilteredThreads (ref), chunkAndLogString (ref), multiGetConversationDetailsModule (ref), appChatNetworkingModule (ref), fFlagAppChatEnableDoubleOptIn (ref), refreshConversationUnfilteredThreadsDetailsModule (ref), useChatTrustedConnectionsEventsModule (ref)
	useEffect(function() --[[ line: 88 ]]
		-- upvalues: var7 (copy)
		var7:info("ChatEventReceiver mounted")
		
		return function() --[[ line: 90 ]]
			-- upvalues: var7 (copy)
			var7:info("ChatEventReceiver unmounted")
		end
	end, {})
	local var38 = useSelector(useCallback(function(p2) --[[ line: 96 ]]
		return p2.ChatAppReducer.AppLoaded
	end, {}))
	local var39 = useSelector(useCallback(function(p3) --[[ line: 99 ]]
		return p3.ChatAppReducer.Conversations
	end, {}))
	local var40 = useSelector(useCallback(function(p4) --[[ line: 102 ]]
		return p4.FormFactor
	end, {}))
	local var41 = useSelector(useCallback(function(p5) --[[ line: 105 ]]
		return p5.Users
	end, {}))
	local var42 = cryoModule.isEmpty(var39)
	local var43 = useLocalUserId()
	local var44 = useIsChatEnabledModule()
	local var45 = useIsGroupChatEnabledModule()
	local var46 = useIsInExperienceModule()
	local var47 = useDispatch()
	
	local var48 = function(p6, p7, p8, p9) --[[ line: 116 ]]
		-- upvalues: var47 (ref), changedParticipantsModule (copy)
		var47(changedParticipantsModule(p6, p7, p8, p9))
	end
	
	local var49 = function() --[[ line: 119 ]]
		-- upvalues: var47 (ref), fetchChatMetadataModule (copy)
		return var47(fetchChatMetadataModule())
	end
	
	local var50 = function(p10) --[[ line: 123 ]]
		-- upvalues: var47 (ref), fetchLatestConversationDetailsModule (copy)
		return var47(fetchLatestConversationDetailsModule(p10))
	end
	
	local var51 = function() --[[ line: 126 ]]
		-- upvalues: var47 (ref), getAllFriendsAsyncModule (copy)
		var47(getAllFriendsAsyncModule())
	end
	
	local var52 = if not fFlagAppChatPresenceStoreMigrationModule then function() --[[ line: 130 ]]
		-- upvalues: var47 (ref), getAllUserPresencesModule (copy)
		spawn(function() --[[ line: 131 ]]
			-- upvalues: var47 (copy), getAllUserPresencesModule (copy)
			var47(getAllUserPresencesModule())
		end)
	end else nil
	
	local var53 = function(p11, p12, p13) --[[ line: 136 ]]
		-- upvalues: var47 (ref), getNewMessages (copy)
		return var47(getNewMessages(p11, p12, p13))
	end
	
	local function restartMessageReceiveTracking(p14) --[[ line: 140 ]]
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy)
		if not fFlagAppChatPerfTrackingModule then return end
		local t = { conversationId = tostring(p14) }
		
		if fFlagAppChatMessageTTIMilestonesModule then
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageReceiveTTI, t)
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.MessageReceiveTTI, t)
			
			return
		end
		appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageReceiveToRender, t)
		appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.MessageReceiveToRender, t)
	end
	
	local _ = function(p15, p16) --[[ line: 153 ]]
		-- upvalues: var47 (ref), roduxAliasesModule (copy)
		var47(roduxAliasesModule.Actions.AliasUpdated(p15, p16))
	end
	
	local var55 = function(p17, p18) --[[ line: 156 ]]
		-- upvalues: var47 (ref), receivedUserTypingModule (copy)
		var47(receivedUserTypingModule(p17, p18))
	end
	
	local var56 = function() --[[ line: 160 ]]
		-- upvalues: var47 (ref), paginateAndRefreshConversationsModule (copy)
		var47(paginateAndRefreshConversationsModule())
	end
	
	local var57 = function(p19) --[[ line: 164 ]]
		-- upvalues: var47 (ref), removedConversationModule (copy)
		var47(removedConversationModule(p19))
	end
	
	local var58 = function(p20, p21, p22, p23) --[[ line: 167 ]]
		-- upvalues: var47 (ref), renamedGroupConversationModule (copy)
		var47(renamedGroupConversationModule(p20, p21, p22, p23))
	end
	
	local _ = function(p24) --[[ line: 170 ]]
		-- upvalues: var47 (ref), setConnectionStateModule (copy)
		var47(setConnectionStateModule(p24))
	end
	
	local var59 = cryoModule.Dictionary.join(t, p1)
	local robloxEventReceiver = var59.robloxEventReceiver
	local var60 = useRef({})
	local var61 = useRef(Enum.ConnectionState.Connected)
	local var62 = useLocalization({
		networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		removedFromConversationToastTitle = "Feature.Chat.Message.RemovedFromConversation"
	})
	local networkErrorText = var62.networkErrorText
	local removedFromConversationToastTitle = var62.removedFromConversationToastTitle
	local var63 = useCallback(function(p25, p26) --[[ line: 187 ]]
		-- upvalues: var60 (ref)
		assert(var60.current, "table")
		var60.current[p25] = p26
	end, { var60.current })
	local var64 = useCallback(function() --[[ line: 192 ]]
		-- upvalues: var59 (ref), roactNavigationModule (copy), enumScreensModule (copy), networkErrorText (ref)
		if var59.rnBypassActionSignal then
			var59.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.RoactChatToast,
				params = {
					toastProps = { toastContent = { toastTitle = networkErrorText } }
				}
			}))
		end
	end, { var59.rnBypassActionSignal, networkErrorText })
	useEffect(function() --[[ line: 207 ]]
		-- upvalues: robloxEventReceiver (ref), var63 (ref), var7 (copy), var47 (ref), removedConversationModule (copy), var59 (ref), roactNavigationModule (copy), var40 (ref), formFactor (copy), enumScreensModule (copy), removedFromConversationToastTitle (ref), fetchLatestConversationDetailsModule (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var42 (ref), fFlagAppChatPerfTrackingModule (copy), restartMessageReceiveTracking (ref), getNewMessages (copy), receivedUserTypingModule (copy)
		local chatNotifications = robloxEventReceiver:observeEvent("ChatNotifications", function(p27, p28, _) --[[ line: 208 ]]
			-- upvalues: var63 (copy), var7 (copy), var47 (copy), removedConversationModule (copy), var59 (copy), roactNavigationModule (copy), var40 (copy), formFactor (copy), enumScreensModule (copy), removedFromConversationToastTitle (copy), fetchLatestConversationDetailsModule (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var42 (copy), fFlagAppChatPerfTrackingModule (copy), restartMessageReceiveTracking (copy), getNewMessages (copy), receivedUserTypingModule (copy)
			local var72
			var63("ChatNotifications", p27.SequenceNumber)
			local type = p27.Type or p28
			var7:info("Received chat notification: {}", type)
			local conversationId = p27.ConversationId and tostring(p27.ConversationId) or ""
			
			if type == "RemovedFromConversation" or type == "ConversationRemoved" then
				var47(removedConversationModule(conversationId))
				local activeConversationId = var59.activeConversationId
				
				if activeConversationId ~= nil and tostring(activeConversationId) == conversationId and var59.rnBypassActionSignal then
					var59.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
						routeName = if var40 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
					}))
				end
				if type == "RemovedFromConversation" then
					var59.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
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
				task.spawn(function() --[[ line: 246 ]]
					-- upvalues: conversationId (ref), var47 (copy), fetchLatestConversationDetailsModule (copy), type (ref), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var7 (copy)
					var47(fetchLatestConversationDetailsModule(conversationId)):andThen(function(p30) --[[ line: 248 ]]
						-- upvalues: type (copy), conversationId (copy), var47 (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy)
						local title = p30.title
						local lastUpdated = p30.lastUpdated
						
						if type == "ConversationTitleChanged" then
							var47(renamedGroupConversationModule(conversationId, title, p30.isDefaultTitle, lastUpdated))
							
							return
						end
						var47(changedParticipantsModule(conversationId, p30.participants, title, lastUpdated))
					end):catch(function(p29) --[[ line: 264 ]]
						-- upvalues: var7 (copy), type (copy)
						var7:warning(`NetworkingChat failure in RobloxEventReceiver->{type}, Status: {tostring(p29)}`)
					end)
				end)
				
				return
			elseif type == "AddedToConversation" or type == "NewConversation" then
				if var42 then
					var7:debug(`Received {type} event while loading conversation data`)
					
					return
				end
				task.spawn(function() --[[ line: 276 ]]
					-- upvalues: conversationId (ref), var47 (copy), fetchLatestConversationDetailsModule (copy), var7 (copy), type (ref)
					var47(fetchLatestConversationDetailsModule(conversationId)):catch(function(p31) --[[ line: 277 ]]
						-- upvalues: var7 (copy), type (copy)
						var7:warning(`NetworkingChat failure in RobloxEventReceiver->{type}, Status: {tostring(p31)}`)
					end)
				end)
				
				return
			elseif type == "NewMessage" then
				if fFlagAppChatPerfTrackingModule and var59.activeConversationId and tostring(var59.activeConversationId) == conversationId then
					restartMessageReceiveTracking(conversationId)
				end
				var72 = var47(getNewMessages(conversationId, false, tick()))
				
				return
			elseif type == "NewMessageBySelf" then
				var72 = var47(getNewMessages(conversationId, true, tick()))
				
				return
			elseif type == "ParticipantTyping" then
				var47(receivedUserTypingModule(conversationId, tostring(p27.UserId)))
			end
		end)
		
		return function() --[[ line: 301 ]]
			-- upvalues: chatNotifications (ref)
			if chatNotifications and chatNotifications.disconnect then
				chatNotifications:disconnect()
			end
		end
	end, {
		var47, var63, var59.activeConversationId, var59.rnBypassActionSignal, var42,
		var40, var41
	})
	useEffect(function() --[[ line: 316 ]]
		-- upvalues: var44 (ref), var59 (ref), var7 (copy), roactNavigationModule (copy), var40 (ref), formFactor (copy), enumScreensModule (copy)
		if not var44 and var59.activeConversationId and var59.rnBypassActionSignal then
			var7:debug("Chat is disabled for our user, navigating away from active conversation")
			var59.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
				routeName = if var40 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
			}))
		end
	end, { var44 })
	local var65 = if var59.activeConversationId then var39[var59.activeConversationId] else nil
	useEffect(function() --[[ line: 329 ]]
		-- upvalues: var45 (ref), var65 (ref), var59 (ref), var7 (copy), roactNavigationModule (copy), var40 (ref), formFactor (copy), enumScreensModule (copy)
		if not var45 and var65 and (var59.rnBypassActionSignal and var65.type == "group") then
			var7:debug("Group chats are disabled and we are navigated to a group chat. Navigating to ChatLanding")
			var59.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
				routeName = if var40 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
			}))
		end
	end, { var45, var65 })
	useEffect(function() --[[ line: 345 ]]
		-- upvalues: robloxEventReceiver (ref), var47 (ref), roduxAliasesModule (copy)
		local userTagChangeNotification = robloxEventReceiver:observeEvent("UserTagChangeNotification", function(p32, _) --[[ line: 346 ]]
			-- upvalues: var47 (copy), roduxAliasesModule (copy)
			if p32.Type == "UserTagUpdate" then
				var47(roduxAliasesModule.Actions.AliasUpdated(tostring(p32.UserId), p32.NewAlias))
			end
		end)
		
		return function() --[[ line: 352 ]]
			-- upvalues: userTagChangeNotification (ref)
			if userTagChangeNotification and userTagChangeNotification.disconnect then
				userTagChangeNotification:disconnect()
			end
		end
	end, { var47 })
	useEffect(function() --[[ line: 359 ]]
		-- upvalues: robloxEventReceiver (ref), var7 (copy), var47 (ref), paginateAndRefreshConversationsModule (copy), var43 (ref), friendshipDestroyedModule (copy), var65 (ref), conversationModule (copy), cryoModule (copy), var40 (ref), formFactor (copy), enumScreensModule (copy), var59 (ref), roactNavigationModule (copy)
		local friendshipNotifications = robloxEventReceiver:observeEvent("FriendshipNotifications", function(p33, _) --[[ line: 360 ]]
			-- upvalues: var7 (copy), var47 (copy), paginateAndRefreshConversationsModule (copy), var43 (copy), friendshipDestroyedModule (copy), var65 (copy), conversationModule (copy), cryoModule (copy), var40 (copy), formFactor (copy), enumScreensModule (copy), var59 (copy), roactNavigationModule (copy)
			local type = p33.Type
			var7:info("Received friendship notification: {}", type)
			
			if type == "FriendshipCreated" then
				var47(paginateAndRefreshConversationsModule())
				
				return
			elseif type == "FriendshipDestroyed" then
				local var75 = nil
				
				if p33.EventArgs then
					local var76 = tostring(p33.EventArgs.UserId1)
					local var77 = tostring(p33.EventArgs.UserId2)
					
					if var76 == var43 then
						var76 = "localUserId"
						var75 = var77
					end
					if var77 == var43 then
						var77 = "localUserId"
						var75 = var76
					end
					var47(friendshipDestroyedModule({ userId1 = var76, userId2 = var77 }))
				end
				if var65 and var65.source == "friends" and (var65.conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION and cryoModule.List.findWhere(var65.participants, function(p34) --[[ line: 392 ]]
					-- upvalues: var75 (write)
					return p34 == var75
				end)) then
					var59.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
						routeName = if var40 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
					}))
				end
			end
		end)
		
		return function() --[[ line: 406 ]]
			-- upvalues: friendshipNotifications (ref)
			if friendshipNotifications and friendshipNotifications.disconnect then
				friendshipNotifications:disconnect()
			end
		end
	end, {
		var47, var56, var43, var40, var65, var59.rnBypassActionSignal
	})
	useEffect(function() --[[ line: 420 ]]
		-- upvalues: robloxEventReceiver (ref), var7 (copy), var47 (ref), removedConversationModule (copy), fetchLatestConversationDetailsModule (copy), var59 (ref), roactNavigationModule (copy), enumScreensModule (copy)
		local chatMigration = robloxEventReceiver:observeEvent("ChatMigration", function(p35, _) --[[ line: 423 ]]
			-- upvalues: var7 (copy), var47 (copy), removedConversationModule (copy), fetchLatestConversationDetailsModule (copy), var59 (copy), roactNavigationModule (copy), enumScreensModule (copy)
			local type = p35.Type
			var7:info("Received chat migration notification: {}", type)
			local channelId = nil
			local conversationId = nil
			
			if type == "ConversationBackfilled" then
				channelId = p35.ConversationId
				conversationId = p35.ChannelId
			elseif type == "ConversationReset" then
				channelId = p35.ChannelId
				conversationId = p35.ConversationId
			else
				var7:warning(`ChatEventReceiver: unknown notification {type}`)
				
				return
			end
			var47(removedConversationModule(channelId))
			var47(fetchLatestConversationDetailsModule(conversationId)):catch(function(p36) --[[ line: 441 ]]
				-- upvalues: var7 (copy), type (ref)
				var7:warning(`NetworkingChat failure in RobloxEventReceiver->{type}, Status: {tostring(p36)}`)
			end)
			
			if var59.activeConversationId and channelId and (tostring(var59.activeConversationId) == channelId and var59.rnBypassActionSignal) then
				var59.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
					routeName = enumScreensModule.ChatConversation,
					params = { conversationId = conversationId }
				}))
			end
		end)
		
		return function() --[[ line: 463 ]]
			-- upvalues: chatMigration (ref)
			if chatMigration and chatMigration.disconnect then
				chatMigration:disconnect()
			end
		end
	end, {
		var47,
		var59.activeConversationId,
		var59.rnBypassActionSignal,
		var50
	})
	local var66 = useCallback(function() --[[ line: 475 ]]
		-- upvalues: var38 (ref), var47 (ref), fetchChatMetadataModule (copy), var7 (copy), paginateAndRefreshConversationsModule (copy), getAllFriendsAsyncModule (copy), fFlagAppChatPresenceStoreMigrationModule (copy), var52 (ref)
		if var38 then
			var47(fetchChatMetadataModule()):andThen(function(p37) --[[ line: 477 ]]
				-- upvalues: var7 (copy), var47 (copy), paginateAndRefreshConversationsModule (copy), getAllFriendsAsyncModule (copy), fFlagAppChatPresenceStoreMigrationModule (copy), var52 (copy)
				if p37 then
					var7:trace("Chat is enabled for our user, refreshing conversations")
					var47(paginateAndRefreshConversationsModule())
					task.spawn(function() --[[ line: 482 ]]
						-- upvalues: var47 (copy), getAllFriendsAsyncModule (copy)
						var47(getAllFriendsAsyncModule())
					end)
					
					if fFlagAppChatPresenceStoreMigrationModule then
						return
					else
						var52()
						
						return
					end
				else
					var7:trace("Chat is disabled for our user, no need to refresh conversations")
				end
			end)
		end
	end, {
		var38,
		var56,
		var51,
		var52,
		var49
	})
	useEffect(function() --[[ line: 495 ]]
		-- upvalues: robloxEventReceiver (ref), var7 (copy), fFlagRemoveUnusedConnectionStateRoduxSlice (copy), var47 (ref), setConnectionStateModule (copy), var61 (ref), var60 (ref), var38 (ref), var66 (ref)
		local signalR = robloxEventReceiver:observeEvent("signalR", function(p38, _, p39) --[[ line: 498 ]]
			-- upvalues: var7 (copy), fFlagRemoveUnusedConnectionStateRoduxSlice (copy), var47 (copy), setConnectionStateModule (copy), var61 (copy), var60 (copy), var38 (copy), var66 (copy)
			var7:info("SignalR connection state transitioned to {}", tostring(p38))
			
			if not fFlagRemoveUnusedConnectionStateRoduxSlice then
				var47(setConnectionStateModule(p38))
			end
			var61.current = p38
			
			if p38 == Enum.ConnectionState.Connected and p39 and (var60.current == nil or var60.current.ChatNotifications ~= p39.ChatNotifications or var60.current.CommunicationChannels ~= p39.CommunicationChannels) then
				var7:trace("We missed some messages while we were disconnected. The chat app was previously {}", if var38 then "loaded" else "unloaded")
				var66()
			end
		end)
		
		return function() --[[ line: 523 ]]
			-- upvalues: signalR (ref)
			if signalR and signalR.disconnect then
				signalR:disconnect()
			end
		end
	end, {
		var47,
		var61,
		var60,
		var64,
		var38
	})
	useEffect(function() --[[ line: 530 ]]
		-- upvalues: robloxEventReceiver (ref), communicationChannelsTypesModule (copy), var7 (copy), var63 (ref), var47 (ref), removedConversationModule (copy), var59 (ref), var40 (ref), formFactor (copy), enumScreensModule (copy), roactNavigationModule (copy), var43 (ref), removedFromConversationToastTitle (ref), fetchLatestConversationDetailsModule (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var42 (ref), conversationChannelsModule (copy), friendConversationCreatedModule (copy), fFlagAppChatPerfTrackingModule (copy), restartMessageReceiveTracking (ref), getNewMessages (copy), receivedUserTypingModule (copy)
		local communicationChannels = robloxEventReceiver:observeEvent("CommunicationChannels", function(p40, _) --[[ line: 533 ]]
			-- upvalues: communicationChannelsTypesModule (copy), var7 (copy), var63 (copy), var47 (copy), removedConversationModule (copy), var59 (copy), var40 (copy), formFactor (copy), enumScreensModule (copy), roactNavigationModule (copy), var43 (copy), removedFromConversationToastTitle (copy), fetchLatestConversationDetailsModule (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var42 (copy), conversationChannelsModule (copy), friendConversationCreatedModule (copy), fFlagAppChatPerfTrackingModule (copy), restartMessageReceiveTracking (copy), getNewMessages (copy), receivedUserTypingModule (copy)
			if p40.ChannelVertical ~= "PlatformChat" then return end
			if not table.find(communicationChannelsTypesModule.ChannelTypeAllowlist, p40.ChannelType) then return end
			var7:info("Received channels notification: {}", p40.Type)
			var63("CommunicationChannels", p40.SequenceNumber)
			local channelId = p40.ChannelId
			
			if p40.Type == "ChannelDeleted" or p40.Type == "RemovedFromChannel" or p40.Type == "ChannelArchived" then
				var47(removedConversationModule(channelId))
				local activeConversationId = var59.activeConversationId
				
				if activeConversationId ~= nil and tostring(activeConversationId) == p40.ChannelId and var59.rnBypassActionSignal then
					var59.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
						routeName = if var40 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
					}))
				end
				if p40.Actor.Id == tostring(var43) then
					return
				else
					var59.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
						routeName = enumScreensModule.RoactChatToast,
						params = {
							toastProps = {
								toastContent = { toastTitle = removedFromConversationToastTitle }
							}
						}
					}))
					
					return
				end
			elseif p40.Type == "ChannelUpdated" or p40.Type == "ParticipantsAdded" or p40.Type == "ParticipantsRemoved" then
				task.spawn(function() --[[ line: 586 ]]
					-- upvalues: channelId (ref), var47 (copy), fetchLatestConversationDetailsModule (copy), p40 (ref), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var7 (copy)
					var47(fetchLatestConversationDetailsModule(channelId)):andThen(function(p42) --[[ line: 588 ]]
						-- upvalues: p40 (copy), channelId (copy), var47 (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy)
						local title = p42.title
						local lastUpdated = p42.lastUpdated
						
						if p40.Type == "ChannelUpdated" then
							var47(renamedGroupConversationModule(channelId, title, p42.isDefaultTitle, lastUpdated))
							
							return
						end
						var47(changedParticipantsModule(channelId, p42.participants, title, lastUpdated))
					end):catch(function(p41) --[[ line: 599 ]]
						-- upvalues: var7 (copy), p40 (copy)
						var7:warning(`Failure in RobloxEventReceiver->{p40.Type}, Status: {tostring(p41)}`)
					end)
				end)
				
				return
			elseif p40.Type == "AddedToChannel" or p40.Type == "ChannelCreated" or p40.Type == "ChannelMarkedRead" or (p40.Type == "ChannelMetadataUpdated" and channelId ~= nil or p40.Type == "ChannelUnarchived") then
				if var42 then
					var7:debug("Received {} event while loading conversation data", p40.Type)
					
					return
				end
				task.spawn(function() --[[ line: 617 ]]
					-- upvalues: channelId (ref), var47 (copy), fetchLatestConversationDetailsModule (copy), p40 (ref), conversationChannelsModule (copy), friendConversationCreatedModule (copy), var59 (copy), roactNavigationModule (copy), enumScreensModule (copy), var7 (copy)
					var47(fetchLatestConversationDetailsModule(channelId)):andThen(function(p44) --[[ line: 619 ]]
						-- upvalues: p40 (copy), conversationChannelsModule (copy), var47 (copy), friendConversationCreatedModule (copy), var59 (copy), roactNavigationModule (copy), enumScreensModule (copy)
						if (p40.Type == "ChannelCreated" or p40.Type == "ChannelUnarchived") and p44.type == "one_to_one" then
							local friendConversationId = conversationChannelsModule.getFriendConversationId(p44.participants)
							
							if friendConversationId then
								var47(friendConversationCreatedModule({
									newConversationId = p44.id,
									oldFriendConversationId = friendConversationId
								}))
								
								if var59.activeConversationId == friendConversationId then
									var59.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
										routeName = enumScreensModule.ChatConversation,
										params = { conversationId = p44.id }
									}))
								end
							end
						end
					end):catch(function(p43) --[[ line: 643 ]]
						-- upvalues: var7 (copy), p40 (copy)
						var7:warning("Failure in RobloxEventReceiver->{}, Status: {}", p40.Type, tostring(p43))
					end)
				end)
				
				return
			elseif p40.Type == "MessageCreated" or p40.Type == "SystemMessageCreated" then
				local var82
				if not fFlagAppChatPerfTrackingModule then
					var82 = var47(getNewMessages(channelId, p40.Actor.Id == tostring(var43), tick()))
					
					return
				end
				local var81 = p40.Actor.Id == tostring(var43)
				
				if not var81 and var59.activeConversationId and tostring(var59.activeConversationId) == channelId then
					restartMessageReceiveTracking(channelId)
				end
				var82 = var47(getNewMessages(channelId, var81, tick()))
				
				return
			elseif p40.Type == "ParticipantTyping" and p40.IsTyping then
				var47(receivedUserTypingModule(channelId, p40.Actor.Id))
			end
		end)
		
		return function() --[[ line: 672 ]]
			-- upvalues: communicationChannels (ref)
			if communicationChannels and communicationChannels.disconnect then
				communicationChannels:disconnect()
			end
		end
	end, {
		var43, robloxEventReceiver, var63, var57, var59.activeConversationId,
		var59.rnBypassActionSignal, removedFromConversationToastTitle, var50, var58,
		var48, var42, var53, var55, var66
	})
	local var67 = useMemo(function() --[[ line: 694 ]]
		-- upvalues: var39 (ref), cryoModule (copy)
		return if var39 then cryoModule.List.filterMap(cryoModule.Dictionary.values(var39), function(p45) --[[ line: 699 ]]
			return if p45 and p45.id and p45.source ~= "friends" then p45.id else nil
		end) else {}
	end, { var39 })
	useEffect(function() --[[ line: 709 ]]
		-- upvalues: robloxEventReceiver (ref), var7 (copy), getFFlagDebugUnfilteredThreads (copy), chunkAndLogString (copy), cryoModule (copy), var67 (ref), var47 (ref), multiGetConversationDetailsModule (copy), var59 (ref), appChatNetworkingModule (copy), fFlagAppChatEnableDoubleOptIn (copy), refreshConversationUnfilteredThreadsDetailsModule (copy), var46 (ref)
		local chatModerationTypeEligibility = robloxEventReceiver:observeEvent("ChatModerationTypeEligibility", function(p46, _) --[[ line: 712 ]]
			-- upvalues: var7 (copy), getFFlagDebugUnfilteredThreads (copy), chunkAndLogString (copy), cryoModule (copy), var67 (copy), var47 (copy), multiGetConversationDetailsModule (copy), var59 (copy), appChatNetworkingModule (copy), fFlagAppChatEnableDoubleOptIn (copy), refreshConversationUnfilteredThreadsDetailsModule (copy), var46 (copy)
			var7:debug("Received ChatModerationTypeEligibility notification")
			local channelsInspected = p46.channels_inspected
			
			if not channelsInspected or #channelsInspected == 0 then return end
			if getFFlagDebugUnfilteredThreads() then
				local var85 = ""
				
				for i, v in channelsInspected do
					var85 = `{var85}, {v}`
				end
				chunkAndLogString(`RTN CONVERSATIONS INSPECTED{var85}`)
			end
			local var86 = cryoModule.List.filter(channelsInspected, function(p47) --[[ line: 726 ]]
				-- upvalues: var67 (copy)
				return table.find(var67, p47)
			end)
			
			if #var86 == 0 then
				var7:debug("No filtered existing conversation IDs found in ChatModerationTypeEligibility notification")
				
				return
			elseif getFFlagDebugUnfilteredThreads() then
				local var87 = ""
				
				for i, v in var86 do
					var87 = `{var87}, {v}`
				end
				chunkAndLogString(`RTN FILTERED CONVERSATIONS{var87}`)
			end
			var47(multiGetConversationDetailsModule(var86)):catch(function(p48) --[[ line: 742 ]]
				-- upvalues: var7 (copy)
				var7:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->MultiGetConversationDetails, Status: " .. tostring(p48))
			end)
			
			if not var59.activeConversationId then return end
			if table.find(channelsInspected, var59.activeConversationId) then
				var47(appChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ var59.activeConversationId })):catch(function(p49) --[[ line: 756 ]]
					-- upvalues: var7 (copy)
					var7:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationsParticipantsMetadata, Status: " .. tostring(p49))
				end)
				
				if fFlagAppChatEnableDoubleOptIn then
					var47(refreshConversationUnfilteredThreadsDetailsModule(var59.activeConversationId, var46))
					
					return
				end
				var47(appChatNetworkingModule.rodux.GetConversationTopModal.API(var59.activeConversationId, var46)):catch(function(p50) --[[ line: 773 ]]
					-- upvalues: var7 (copy)
					var7:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationTopModal, Status: " .. tostring(p50))
				end)
			end
		end)
		
		return function() --[[ line: 785 ]]
			-- upvalues: chatModerationTypeEligibility (ref)
			if chatModerationTypeEligibility and chatModerationTypeEligibility.disconnect then
				chatModerationTypeEligibility:disconnect()
			end
		end
	end, { var47, var59.activeConversationId, var67 })
	useEffect(function() --[[ line: 792 ]]
		-- upvalues: robloxEventReceiver (ref), var7 (copy), var47 (ref), appChatNetworkingModule (copy), var46 (ref)
		local eligibilityStatusChanged = robloxEventReceiver:observeEvent("EligibilityStatusChanged", function(_, _) --[[ line: 795 ]]
			-- upvalues: var7 (copy), var47 (copy), appChatNetworkingModule (copy), var46 (copy)
			var7:info("Received EligibilityStatusChanged notification")
			var47(appChatNetworkingModule.rodux.GetChatLandingModal.API(var46)):catch(function(p51) --[[ line: 798 ]]
				-- upvalues: var7 (copy)
				var7:warning("Error in GetChatLandingModal request. Error: {}", tostring(p51))
			end)
		end)
		
		return function() --[[ line: 804 ]]
			-- upvalues: eligibilityStatusChanged (ref)
			if eligibilityStatusChanged and eligibilityStatusChanged.disconnect then
				eligibilityStatusChanged:disconnect()
			end
		end
	end, { var47 })
	useChatTrustedConnectionsEventsModule({ activeConversationId = var59.activeConversationId })
	
	return {}
end

return ChatEventReceiver
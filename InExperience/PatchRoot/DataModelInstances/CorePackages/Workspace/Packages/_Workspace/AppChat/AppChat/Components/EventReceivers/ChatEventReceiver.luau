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

local function chunkAndLogString(p0) --[[ line: 61 ]]
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

function ChatEventReceiver(p1) --[[ line: 84 ]]
	-- upvalues: useEffect (ref), var7 (ref), useSelector (ref), useCallback (ref), cryoModule (ref), useLocalUserId (ref), useIsChatEnabledModule (ref), useIsGroupChatEnabledModule (ref), useIsInExperienceModule (ref), useDispatch (ref), changedParticipantsModule (ref), fetchChatMetadataModule (ref), fetchLatestConversationDetailsModule (ref), getAllFriendsAsyncModule (ref), getAllUserPresencesModule (ref), getNewMessages (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), roduxAliasesModule (ref), receivedUserTypingModule (ref), paginateAndRefreshConversationsModule (ref), removedConversationModule (ref), renamedGroupConversationModule (ref), setConnectionStateModule (ref), t (ref), useRef (ref), useLocalization (ref), roactNavigationModule (ref), enumScreensModule (ref), formFactor (ref), friendshipDestroyedModule (ref), conversationModule (ref), communicationChannelsTypesModule (ref), conversationChannelsModule (ref), friendConversationCreatedModule (ref), useMemo (ref), getFFlagDebugUnfilteredThreads (ref), chunkAndLogString (ref), multiGetConversationDetailsModule (ref), appChatNetworkingModule (ref), fFlagAppChatEnableDoubleOptIn (ref), refreshConversationUnfilteredThreadsDetailsModule (ref), useChatTrustedConnectionsEventsModule (ref)
	useEffect(function() --[[ line: 85 ]]
		-- upvalues: var7 (copy)
		var7:info("ChatEventReceiver mounted")
		
		return function() --[[ line: 87 ]]
			-- upvalues: var7 (copy)
			var7:info("ChatEventReceiver unmounted")
		end
	end, {})
	local var37 = useSelector(useCallback(function(p2) --[[ line: 93 ]]
		return p2.ChatAppReducer.AppLoaded
	end, {}))
	local var38 = useSelector(useCallback(function(p3) --[[ line: 96 ]]
		return p3.ChatAppReducer.Conversations
	end, {}))
	local var39 = useSelector(useCallback(function(p4) --[[ line: 99 ]]
		return p4.FormFactor
	end, {}))
	local var40 = useSelector(useCallback(function(p5) --[[ line: 102 ]]
		return p5.Users
	end, {}))
	local var41 = cryoModule.isEmpty(var38)
	local var42 = useLocalUserId()
	local var43 = useIsChatEnabledModule()
	local var44 = useIsGroupChatEnabledModule()
	local var45 = useIsInExperienceModule()
	local var46 = useDispatch()
	
	local var47 = function(p6, p7, p8, p9) --[[ line: 113 ]]
		-- upvalues: var46 (ref), changedParticipantsModule (copy)
		var46(changedParticipantsModule(p6, p7, p8, p9))
	end
	
	local var48 = function() --[[ line: 116 ]]
		-- upvalues: var46 (ref), fetchChatMetadataModule (copy)
		return var46(fetchChatMetadataModule())
	end
	
	local var49 = function(p10) --[[ line: 120 ]]
		-- upvalues: var46 (ref), fetchLatestConversationDetailsModule (copy)
		return var46(fetchLatestConversationDetailsModule(p10))
	end
	
	local var50 = function() --[[ line: 123 ]]
		-- upvalues: var46 (ref), getAllFriendsAsyncModule (copy)
		var46(getAllFriendsAsyncModule())
	end
	
	local var51 = function() --[[ line: 126 ]]
		-- upvalues: var46 (ref), getAllUserPresencesModule (copy)
		spawn(function() --[[ line: 127 ]]
			-- upvalues: var46 (copy), getAllUserPresencesModule (copy)
			var46(getAllUserPresencesModule())
		end)
	end
	
	local var52 = function(p11, p12, p13) --[[ line: 131 ]]
		-- upvalues: var46 (ref), getNewMessages (copy)
		return var46(getNewMessages(p11, p12, p13))
	end
	
	local function restartMessageReceiveTracking(p14) --[[ line: 135 ]]
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
	
	local _ = function(p15, p16) --[[ line: 148 ]]
		-- upvalues: var46 (ref), roduxAliasesModule (copy)
		var46(roduxAliasesModule.Actions.AliasUpdated(p15, p16))
	end
	
	local var54 = function(p17, p18) --[[ line: 151 ]]
		-- upvalues: var46 (ref), receivedUserTypingModule (copy)
		var46(receivedUserTypingModule(p17, p18))
	end
	
	local var55 = function() --[[ line: 155 ]]
		-- upvalues: var46 (ref), paginateAndRefreshConversationsModule (copy)
		var46(paginateAndRefreshConversationsModule())
	end
	
	local var56 = function(p19) --[[ line: 159 ]]
		-- upvalues: var46 (ref), removedConversationModule (copy)
		var46(removedConversationModule(p19))
	end
	
	local var57 = function(p20, p21, p22, p23) --[[ line: 162 ]]
		-- upvalues: var46 (ref), renamedGroupConversationModule (copy)
		var46(renamedGroupConversationModule(p20, p21, p22, p23))
	end
	
	local _ = function(p24) --[[ line: 165 ]]
		-- upvalues: var46 (ref), setConnectionStateModule (copy)
		var46(setConnectionStateModule(p24))
	end
	
	local var58 = cryoModule.Dictionary.join(t, p1)
	local robloxEventReceiver = var58.robloxEventReceiver
	local var59 = useRef({})
	local var60 = useRef(Enum.ConnectionState.Connected)
	local var61 = useLocalization({
		networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		removedFromConversationToastTitle = "Feature.Chat.Message.RemovedFromConversation"
	})
	local networkErrorText = var61.networkErrorText
	local removedFromConversationToastTitle = var61.removedFromConversationToastTitle
	local var62 = useCallback(function(p25, p26) --[[ line: 182 ]]
		-- upvalues: var59 (ref)
		assert(var59.current, "table")
		var59.current[p25] = p26
	end, { var59.current })
	local var63 = useCallback(function() --[[ line: 187 ]]
		-- upvalues: var58 (ref), roactNavigationModule (copy), enumScreensModule (copy), networkErrorText (ref)
		if var58.rnBypassActionSignal then
			var58.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.RoactChatToast,
				params = {
					toastProps = { toastContent = { toastTitle = networkErrorText } }
				}
			}))
		end
	end, { var58.rnBypassActionSignal, networkErrorText })
	useEffect(function() --[[ line: 202 ]]
		-- upvalues: robloxEventReceiver (ref), var62 (ref), var7 (copy), var46 (ref), removedConversationModule (copy), var58 (ref), roactNavigationModule (copy), var39 (ref), formFactor (copy), enumScreensModule (copy), removedFromConversationToastTitle (ref), fetchLatestConversationDetailsModule (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var41 (ref), fFlagAppChatPerfTrackingModule (copy), restartMessageReceiveTracking (ref), getNewMessages (copy), receivedUserTypingModule (copy)
		local chatNotifications = robloxEventReceiver:observeEvent("ChatNotifications", function(p27, p28, _) --[[ line: 203 ]]
			-- upvalues: var62 (copy), var7 (copy), var46 (copy), removedConversationModule (copy), var58 (copy), roactNavigationModule (copy), var39 (copy), formFactor (copy), enumScreensModule (copy), removedFromConversationToastTitle (copy), fetchLatestConversationDetailsModule (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var41 (copy), fFlagAppChatPerfTrackingModule (copy), restartMessageReceiveTracking (copy), getNewMessages (copy), receivedUserTypingModule (copy)
			local var71
			var62("ChatNotifications", p27.SequenceNumber)
			local type = p27.Type or p28
			var7:info("Received chat notification: {}", type)
			local conversationId = p27.ConversationId and tostring(p27.ConversationId) or ""
			
			if type == "RemovedFromConversation" or type == "ConversationRemoved" then
				var46(removedConversationModule(conversationId))
				local activeConversationId = var58.activeConversationId
				
				if activeConversationId ~= nil and tostring(activeConversationId) == conversationId and var58.rnBypassActionSignal then
					var58.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
						routeName = if var39 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
					}))
				end
				if type == "RemovedFromConversation" then
					var58.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
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
				task.spawn(function() --[[ line: 241 ]]
					-- upvalues: conversationId (ref), var46 (copy), fetchLatestConversationDetailsModule (copy), type (ref), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var7 (copy)
					var46(fetchLatestConversationDetailsModule(conversationId)):andThen(function(p30) --[[ line: 243 ]]
						-- upvalues: type (copy), conversationId (copy), var46 (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy)
						local title = p30.title
						local lastUpdated = p30.lastUpdated
						
						if type == "ConversationTitleChanged" then
							var46(renamedGroupConversationModule(conversationId, title, p30.isDefaultTitle, lastUpdated))
							
							return
						end
						var46(changedParticipantsModule(conversationId, p30.participants, title, lastUpdated))
					end):catch(function(p29) --[[ line: 259 ]]
						-- upvalues: var7 (copy), type (copy)
						var7:warning(`NetworkingChat failure in RobloxEventReceiver->{type}, Status: {tostring(p29)}`)
					end)
				end)
				
				return
			elseif type == "AddedToConversation" or type == "NewConversation" then
				if var41 then
					var7:debug(`Received {type} event while loading conversation data`)
					
					return
				end
				task.spawn(function() --[[ line: 271 ]]
					-- upvalues: conversationId (ref), var46 (copy), fetchLatestConversationDetailsModule (copy), var7 (copy), type (ref)
					var46(fetchLatestConversationDetailsModule(conversationId)):catch(function(p31) --[[ line: 272 ]]
						-- upvalues: var7 (copy), type (copy)
						var7:warning(`NetworkingChat failure in RobloxEventReceiver->{type}, Status: {tostring(p31)}`)
					end)
				end)
				
				return
			elseif type == "NewMessage" then
				if fFlagAppChatPerfTrackingModule and var58.activeConversationId and tostring(var58.activeConversationId) == conversationId then
					restartMessageReceiveTracking(conversationId)
				end
				var71 = var46(getNewMessages(conversationId, false, tick()))
				
				return
			elseif type == "NewMessageBySelf" then
				var71 = var46(getNewMessages(conversationId, true, tick()))
				
				return
			elseif type == "ParticipantTyping" then
				var46(receivedUserTypingModule(conversationId, tostring(p27.UserId)))
			end
		end)
		
		return function() --[[ line: 296 ]]
			-- upvalues: chatNotifications (ref)
			if chatNotifications and chatNotifications.disconnect then
				chatNotifications:disconnect()
			end
		end
	end, {
		var46, var62, var58.activeConversationId, var58.rnBypassActionSignal, var41,
		var39, var40
	})
	useEffect(function() --[[ line: 311 ]]
		-- upvalues: var43 (ref), var58 (ref), var7 (copy), roactNavigationModule (copy), var39 (ref), formFactor (copy), enumScreensModule (copy)
		if not var43 and var58.activeConversationId and var58.rnBypassActionSignal then
			var7:debug("Chat is disabled for our user, navigating away from active conversation")
			var58.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
				routeName = if var39 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
			}))
		end
	end, { var43 })
	local var64 = if var58.activeConversationId then var38[var58.activeConversationId] else nil
	useEffect(function() --[[ line: 324 ]]
		-- upvalues: var44 (ref), var64 (ref), var58 (ref), var7 (copy), roactNavigationModule (copy), var39 (ref), formFactor (copy), enumScreensModule (copy)
		if not var44 and var64 and (var58.rnBypassActionSignal and var64.type == "group") then
			var7:debug("Group chats are disabled and we are navigated to a group chat. Navigating to ChatLanding")
			var58.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
				routeName = if var39 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
			}))
		end
	end, { var44, var64 })
	useEffect(function() --[[ line: 340 ]]
		-- upvalues: robloxEventReceiver (ref), var46 (ref), roduxAliasesModule (copy)
		local userTagChangeNotification = robloxEventReceiver:observeEvent("UserTagChangeNotification", function(p32, _) --[[ line: 341 ]]
			-- upvalues: var46 (copy), roduxAliasesModule (copy)
			if p32.Type == "UserTagUpdate" then
				var46(roduxAliasesModule.Actions.AliasUpdated(tostring(p32.UserId), p32.NewAlias))
			end
		end)
		
		return function() --[[ line: 347 ]]
			-- upvalues: userTagChangeNotification (ref)
			if userTagChangeNotification and userTagChangeNotification.disconnect then
				userTagChangeNotification:disconnect()
			end
		end
	end, { var46 })
	useEffect(function() --[[ line: 354 ]]
		-- upvalues: robloxEventReceiver (ref), var7 (copy), var46 (ref), paginateAndRefreshConversationsModule (copy), var42 (ref), friendshipDestroyedModule (copy), var64 (ref), conversationModule (copy), cryoModule (copy), var39 (ref), formFactor (copy), enumScreensModule (copy), var58 (ref), roactNavigationModule (copy)
		local friendshipNotifications = robloxEventReceiver:observeEvent("FriendshipNotifications", function(p33, _) --[[ line: 355 ]]
			-- upvalues: var7 (copy), var46 (copy), paginateAndRefreshConversationsModule (copy), var42 (copy), friendshipDestroyedModule (copy), var64 (copy), conversationModule (copy), cryoModule (copy), var39 (copy), formFactor (copy), enumScreensModule (copy), var58 (copy), roactNavigationModule (copy)
			local type = p33.Type
			var7:info("Received friendship notification: {}", type)
			
			if type == "FriendshipCreated" then
				var46(paginateAndRefreshConversationsModule())
				
				return
			elseif type == "FriendshipDestroyed" then
				local var74 = nil
				
				if p33.EventArgs then
					local var75 = tostring(p33.EventArgs.UserId1)
					local var76 = tostring(p33.EventArgs.UserId2)
					
					if var75 == var42 then
						var75 = "localUserId"
						var74 = var76
					end
					if var76 == var42 then
						var76 = "localUserId"
						var74 = var75
					end
					var46(friendshipDestroyedModule({ userId1 = var75, userId2 = var76 }))
				end
				if var64 and var64.source == "friends" and (var64.conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION and cryoModule.List.findWhere(var64.participants, function(p34) --[[ line: 387 ]]
					-- upvalues: var74 (write)
					return p34 == var74
				end)) then
					var58.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
						routeName = if var39 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
					}))
				end
			end
		end)
		
		return function() --[[ line: 401 ]]
			-- upvalues: friendshipNotifications (ref)
			if friendshipNotifications and friendshipNotifications.disconnect then
				friendshipNotifications:disconnect()
			end
		end
	end, {
		var46, var55, var42, var39, var64, var58.rnBypassActionSignal
	})
	useEffect(function() --[[ line: 415 ]]
		-- upvalues: robloxEventReceiver (ref), var7 (copy), var46 (ref), removedConversationModule (copy), fetchLatestConversationDetailsModule (copy), var58 (ref), roactNavigationModule (copy), enumScreensModule (copy)
		local chatMigration = robloxEventReceiver:observeEvent("ChatMigration", function(p35, _) --[[ line: 418 ]]
			-- upvalues: var7 (copy), var46 (copy), removedConversationModule (copy), fetchLatestConversationDetailsModule (copy), var58 (copy), roactNavigationModule (copy), enumScreensModule (copy)
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
			var46(removedConversationModule(channelId))
			var46(fetchLatestConversationDetailsModule(conversationId)):catch(function(p36) --[[ line: 436 ]]
				-- upvalues: var7 (copy), type (ref)
				var7:warning(`NetworkingChat failure in RobloxEventReceiver->{type}, Status: {tostring(p36)}`)
			end)
			
			if var58.activeConversationId and channelId and (tostring(var58.activeConversationId) == channelId and var58.rnBypassActionSignal) then
				var58.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
					routeName = enumScreensModule.ChatConversation,
					params = { conversationId = conversationId }
				}))
			end
		end)
		
		return function() --[[ line: 458 ]]
			-- upvalues: chatMigration (ref)
			if chatMigration and chatMigration.disconnect then
				chatMigration:disconnect()
			end
		end
	end, {
		var46,
		var58.activeConversationId,
		var58.rnBypassActionSignal,
		var49
	})
	local var65 = useCallback(function() --[[ line: 470 ]]
		-- upvalues: var37 (ref), var46 (ref), fetchChatMetadataModule (copy), var7 (copy), paginateAndRefreshConversationsModule (copy), getAllFriendsAsyncModule (copy), getAllUserPresencesModule (copy)
		if var37 then
			var46(fetchChatMetadataModule()):andThen(function(p37) --[[ line: 472 ]]
				-- upvalues: var7 (copy), var46 (copy), paginateAndRefreshConversationsModule (copy), getAllFriendsAsyncModule (copy), getAllUserPresencesModule (copy)
				if p37 then
					var7:trace("Chat is enabled for our user, refreshing conversations")
					var46(paginateAndRefreshConversationsModule())
					task.spawn(function() --[[ line: 477 ]]
						-- upvalues: var46 (copy), getAllFriendsAsyncModule (copy)
						var46(getAllFriendsAsyncModule())
					end)
					spawn(function() --[[ line: 127 ]]
						-- upvalues: var46 (copy), getAllUserPresencesModule (copy)
						var46(getAllUserPresencesModule())
					end)
					
					return
				end
				var7:trace("Chat is disabled for our user, no need to refresh conversations")
			end)
		end
	end, {
		var37,
		var55,
		var50,
		var51,
		var48
	})
	useEffect(function() --[[ line: 488 ]]
		-- upvalues: robloxEventReceiver (ref), var7 (copy), var46 (ref), setConnectionStateModule (copy), var60 (ref), var59 (ref), var37 (ref), var65 (ref)
		local signalR = robloxEventReceiver:observeEvent("signalR", function(p38, _, p39) --[[ line: 491 ]]
			-- upvalues: var7 (copy), var46 (copy), setConnectionStateModule (copy), var60 (copy), var59 (copy), var37 (copy), var65 (copy)
			var7:info("SignalR connection state transitioned to {}", tostring(p38))
			var46(setConnectionStateModule(p38))
			var60.current = p38
			
			if p38 == Enum.ConnectionState.Connected and p39 and (var59.current == nil or var59.current.ChatNotifications ~= p39.ChatNotifications or var59.current.CommunicationChannels ~= p39.CommunicationChannels) then
				var7:trace("We missed some messages while we were disconnected. The chat app was previously {}", if var37 then "loaded" else "unloaded")
				var65()
			end
		end)
		
		return function() --[[ line: 514 ]]
			-- upvalues: signalR (ref)
			if signalR and signalR.disconnect then
				signalR:disconnect()
			end
		end
	end, {
		var46,
		var60,
		var59,
		var63,
		var37
	})
	useEffect(function() --[[ line: 521 ]]
		-- upvalues: robloxEventReceiver (ref), communicationChannelsTypesModule (copy), var7 (copy), var62 (ref), var46 (ref), removedConversationModule (copy), var58 (ref), var39 (ref), formFactor (copy), enumScreensModule (copy), roactNavigationModule (copy), var42 (ref), removedFromConversationToastTitle (ref), fetchLatestConversationDetailsModule (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var41 (ref), conversationChannelsModule (copy), friendConversationCreatedModule (copy), fFlagAppChatPerfTrackingModule (copy), restartMessageReceiveTracking (ref), getNewMessages (copy), receivedUserTypingModule (copy)
		local communicationChannels = robloxEventReceiver:observeEvent("CommunicationChannels", function(p40, _) --[[ line: 524 ]]
			-- upvalues: communicationChannelsTypesModule (copy), var7 (copy), var62 (copy), var46 (copy), removedConversationModule (copy), var58 (copy), var39 (copy), formFactor (copy), enumScreensModule (copy), roactNavigationModule (copy), var42 (copy), removedFromConversationToastTitle (copy), fetchLatestConversationDetailsModule (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var41 (copy), conversationChannelsModule (copy), friendConversationCreatedModule (copy), fFlagAppChatPerfTrackingModule (copy), restartMessageReceiveTracking (copy), getNewMessages (copy), receivedUserTypingModule (copy)
			if p40.ChannelVertical ~= "PlatformChat" then return end
			if not table.find(communicationChannelsTypesModule.ChannelTypeAllowlist, p40.ChannelType) then return end
			var7:info("Received channels notification: {}", p40.Type)
			var62("CommunicationChannels", p40.SequenceNumber)
			local channelId = p40.ChannelId
			
			if p40.Type == "ChannelDeleted" or p40.Type == "RemovedFromChannel" or p40.Type == "ChannelArchived" then
				var46(removedConversationModule(channelId))
				local activeConversationId = var58.activeConversationId
				
				if activeConversationId ~= nil and tostring(activeConversationId) == p40.ChannelId and var58.rnBypassActionSignal then
					var58.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
						routeName = if var39 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
					}))
				end
				if p40.Actor.Id == tostring(var42) then
					return
				else
					var58.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
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
				task.spawn(function() --[[ line: 577 ]]
					-- upvalues: channelId (ref), var46 (copy), fetchLatestConversationDetailsModule (copy), p40 (ref), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var7 (copy)
					var46(fetchLatestConversationDetailsModule(channelId)):andThen(function(p42) --[[ line: 579 ]]
						-- upvalues: p40 (copy), channelId (copy), var46 (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy)
						local title = p42.title
						local lastUpdated = p42.lastUpdated
						
						if p40.Type == "ChannelUpdated" then
							var46(renamedGroupConversationModule(channelId, title, p42.isDefaultTitle, lastUpdated))
							
							return
						end
						var46(changedParticipantsModule(channelId, p42.participants, title, lastUpdated))
					end):catch(function(p41) --[[ line: 590 ]]
						-- upvalues: var7 (copy), p40 (copy)
						var7:warning(`Failure in RobloxEventReceiver->{p40.Type}, Status: {tostring(p41)}`)
					end)
				end)
				
				return
			elseif p40.Type == "AddedToChannel" or p40.Type == "ChannelCreated" or p40.Type == "ChannelMarkedRead" or (p40.Type == "ChannelMetadataUpdated" and channelId ~= nil or p40.Type == "ChannelUnarchived") then
				if var41 then
					var7:debug("Received {} event while loading conversation data", p40.Type)
					
					return
				end
				task.spawn(function() --[[ line: 608 ]]
					-- upvalues: channelId (ref), var46 (copy), fetchLatestConversationDetailsModule (copy), p40 (ref), conversationChannelsModule (copy), friendConversationCreatedModule (copy), var58 (copy), roactNavigationModule (copy), enumScreensModule (copy), var7 (copy)
					var46(fetchLatestConversationDetailsModule(channelId)):andThen(function(p44) --[[ line: 610 ]]
						-- upvalues: p40 (copy), conversationChannelsModule (copy), var46 (copy), friendConversationCreatedModule (copy), var58 (copy), roactNavigationModule (copy), enumScreensModule (copy)
						if (p40.Type == "ChannelCreated" or p40.Type == "ChannelUnarchived") and p44.type == "one_to_one" then
							local friendConversationId = conversationChannelsModule.getFriendConversationId(p44.participants)
							
							if friendConversationId then
								var46(friendConversationCreatedModule({
									newConversationId = p44.id,
									oldFriendConversationId = friendConversationId
								}))
								
								if var58.activeConversationId == friendConversationId then
									var58.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
										routeName = enumScreensModule.ChatConversation,
										params = { conversationId = p44.id }
									}))
								end
							end
						end
					end):catch(function(p43) --[[ line: 634 ]]
						-- upvalues: var7 (copy), p40 (copy)
						var7:warning("Failure in RobloxEventReceiver->{}, Status: {}", p40.Type, tostring(p43))
					end)
				end)
				
				return
			elseif p40.Type == "MessageCreated" or p40.Type == "SystemMessageCreated" then
				local var81
				if not fFlagAppChatPerfTrackingModule then
					var81 = var46(getNewMessages(channelId, p40.Actor.Id == tostring(var42), tick()))
					
					return
				end
				local var80 = p40.Actor.Id == tostring(var42)
				
				if not var80 and var58.activeConversationId and tostring(var58.activeConversationId) == channelId then
					restartMessageReceiveTracking(channelId)
				end
				var81 = var46(getNewMessages(channelId, var80, tick()))
				
				return
			elseif p40.Type == "ParticipantTyping" and p40.IsTyping then
				var46(receivedUserTypingModule(channelId, p40.Actor.Id))
			end
		end)
		
		return function() --[[ line: 663 ]]
			-- upvalues: communicationChannels (ref)
			if communicationChannels and communicationChannels.disconnect then
				communicationChannels:disconnect()
			end
		end
	end, {
		var42, robloxEventReceiver, var62, var56, var58.activeConversationId,
		var58.rnBypassActionSignal, removedFromConversationToastTitle, var49, var57,
		var47, var41, var52, var54, var65
	})
	local var66 = useMemo(function() --[[ line: 685 ]]
		-- upvalues: var38 (ref), cryoModule (copy)
		return if var38 then cryoModule.List.filterMap(cryoModule.Dictionary.values(var38), function(p45) --[[ line: 690 ]]
			return if p45 and p45.id and p45.source ~= "friends" then p45.id else nil
		end) else {}
	end, { var38 })
	useEffect(function() --[[ line: 700 ]]
		-- upvalues: robloxEventReceiver (ref), var7 (copy), getFFlagDebugUnfilteredThreads (copy), chunkAndLogString (copy), cryoModule (copy), var66 (ref), var46 (ref), multiGetConversationDetailsModule (copy), var58 (ref), appChatNetworkingModule (copy), fFlagAppChatEnableDoubleOptIn (copy), refreshConversationUnfilteredThreadsDetailsModule (copy), var45 (ref)
		local chatModerationTypeEligibility = robloxEventReceiver:observeEvent("ChatModerationTypeEligibility", function(p46, _) --[[ line: 703 ]]
			-- upvalues: var7 (copy), getFFlagDebugUnfilteredThreads (copy), chunkAndLogString (copy), cryoModule (copy), var66 (copy), var46 (copy), multiGetConversationDetailsModule (copy), var58 (copy), appChatNetworkingModule (copy), fFlagAppChatEnableDoubleOptIn (copy), refreshConversationUnfilteredThreadsDetailsModule (copy), var45 (copy)
			var7:debug("Received ChatModerationTypeEligibility notification")
			local channelsInspected = p46.channels_inspected
			
			if not channelsInspected or #channelsInspected == 0 then return end
			if getFFlagDebugUnfilteredThreads() then
				local var84 = ""
				
				for i, v in channelsInspected do
					var84 = `{var84}, {v}`
				end
				chunkAndLogString(`RTN CONVERSATIONS INSPECTED{var84}`)
			end
			local var85 = cryoModule.List.filter(channelsInspected, function(p47) --[[ line: 717 ]]
				-- upvalues: var66 (copy)
				return table.find(var66, p47)
			end)
			
			if #var85 == 0 then
				var7:debug("No filtered existing conversation IDs found in ChatModerationTypeEligibility notification")
				
				return
			elseif getFFlagDebugUnfilteredThreads() then
				local var86 = ""
				
				for i, v in var85 do
					var86 = `{var86}, {v}`
				end
				chunkAndLogString(`RTN FILTERED CONVERSATIONS{var86}`)
			end
			var46(multiGetConversationDetailsModule(var85)):catch(function(p48) --[[ line: 733 ]]
				-- upvalues: var7 (copy)
				var7:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->MultiGetConversationDetails, Status: " .. tostring(p48))
			end)
			
			if not var58.activeConversationId then return end
			if table.find(channelsInspected, var58.activeConversationId) then
				var46(appChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ var58.activeConversationId })):catch(function(p49) --[[ line: 747 ]]
					-- upvalues: var7 (copy)
					var7:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationsParticipantsMetadata, Status: " .. tostring(p49))
				end)
				
				if fFlagAppChatEnableDoubleOptIn then
					var46(refreshConversationUnfilteredThreadsDetailsModule(var58.activeConversationId, var45))
					
					return
				end
				var46(appChatNetworkingModule.rodux.GetConversationTopModal.API(var58.activeConversationId, var45)):catch(function(p50) --[[ line: 764 ]]
					-- upvalues: var7 (copy)
					var7:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationTopModal, Status: " .. tostring(p50))
				end)
			end
		end)
		
		return function() --[[ line: 776 ]]
			-- upvalues: chatModerationTypeEligibility (ref)
			if chatModerationTypeEligibility and chatModerationTypeEligibility.disconnect then
				chatModerationTypeEligibility:disconnect()
			end
		end
	end, { var46, var58.activeConversationId, var66 })
	useEffect(function() --[[ line: 783 ]]
		-- upvalues: robloxEventReceiver (ref), var7 (copy), var46 (ref), appChatNetworkingModule (copy), var45 (ref)
		local eligibilityStatusChanged = robloxEventReceiver:observeEvent("EligibilityStatusChanged", function(_, _) --[[ line: 786 ]]
			-- upvalues: var7 (copy), var46 (copy), appChatNetworkingModule (copy), var45 (copy)
			var7:info("Received EligibilityStatusChanged notification")
			var46(appChatNetworkingModule.rodux.GetChatLandingModal.API(var45)):catch(function(p51) --[[ line: 789 ]]
				-- upvalues: var7 (copy)
				var7:warning("Error in GetChatLandingModal request. Error: {}", tostring(p51))
			end)
		end)
		
		return function() --[[ line: 795 ]]
			-- upvalues: eligibilityStatusChanged (ref)
			if eligibilityStatusChanged and eligibilityStatusChanged.disconnect then
				eligibilityStatusChanged:disconnect()
			end
		end
	end, { var46 })
	useChatTrustedConnectionsEventsModule({ activeConversationId = var58.activeConversationId })
	
	return {}
end

return ChatEventReceiver
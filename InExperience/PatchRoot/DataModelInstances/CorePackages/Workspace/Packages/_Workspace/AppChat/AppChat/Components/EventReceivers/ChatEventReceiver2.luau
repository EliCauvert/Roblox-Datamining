local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local roactNavigationModule = require(parent.RoactNavigation)
local roactUtilsModule = require(parent.RoactUtils)
local cryoModule = require(parent.Cryo)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local dependencyArray = roactUtilsModule.Hooks.dependencyArray
local useCallback = reactModule.useCallback
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useLocalization = localizationModule.Hooks.useLocalization
local useMemo = reactModule.useMemo
local useRef = reactModule.useRef
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local formFactor = require(parent.FormFactor).Enums.FormFactor
local var1 = require(appChat.Logger):new("AppChat.Realtime.ChatEventReceiver2")
local conversationModule = require(appChat.Models.Conversation)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local changedParticipantsModule = require(appChat.Conversations.Actions.ChangedParticipants)
local roduxAliasesModule = require(appChat.Http.RoduxAliases)
local receivedUserTypingModule = require(appChat.Conversations.Actions.ReceivedUserTyping)
local removedConversationModule = require(appChat.Conversations.Actions.RemovedConversation)
local renamedGroupConversationModule = require(appChat.Conversations.Actions.RenamedGroupConversation)
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
local useChatTrustedConnectionsEventsModule = require(appChat.Components.EventReceivers.useChatTrustedConnectionsEvents)
local getFFlagDebugUnfilteredThreads = require(parent.SharedFlags).getFFlagDebugUnfilteredThreads
local fFlagAppChatEnableDoubleOptIn = require(parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
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

function ChatEventReceiver2(p2)
	-- upvalues: useEffect (ref), var1 (ref), useSelector (ref), cryoModule (ref), useLocalUserId (ref), useIsChatEnabledModule (ref), useIsGroupChatEnabledModule (ref), useIsInExperienceModule (ref), useDispatch (ref), changedParticipantsModule (ref), fetchChatMetadataModule (ref), fetchLatestConversationDetailsModule (ref), getAllFriendsAsyncModule (ref), fFlagAppChatPresenceStoreMigrationModule (ref), getAllUserPresencesModule (ref), getNewMessages (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), roduxAliasesModule (ref), receivedUserTypingModule (ref), paginateAndRefreshConversationsModule (ref), removedConversationModule (ref), renamedGroupConversationModule (ref), t (ref), useRef (ref), useLocalization (ref), useCallback (ref), roactNavigationModule (ref), enumScreensModule (ref), formFactor (ref), realtimeDeliveryModule (ref), dependencyArray (ref), friendshipDestroyedModule (ref), conversationModule (ref), communicationChannelsTypesModule (ref), conversationChannelsModule (ref), friendConversationCreatedModule (ref), useMemo (ref), getFFlagDebugUnfilteredThreads (ref), chunkAndLogString (ref), multiGetConversationDetailsModule (ref), appChatNetworkingModule (ref), fFlagAppChatEnableDoubleOptIn (ref), refreshConversationUnfilteredThreadsDetailsModule (ref), useChatTrustedConnectionsEventsModule (ref)
	useEffect(function()
		-- upvalues: var1 (copy)
		var1:info("ChatEventReceiver2 mounted")
		
		return function()
			-- upvalues: var1 (copy)
			var1:info("ChatEventReceiver2 unmounted")
		end
	end, {})
	local var2 = useSelector(function(p3)
		return p3.ChatAppReducer.AppLoaded
	end)
	local var3 = useSelector(function(p3)
		return p3.ChatAppReducer.Conversations
	end)
	local var4 = useSelector(function(p3)
		return p3.FormFactor
	end)
	local var5 = cryoModule.isEmpty(var3)
	local var6 = useLocalUserId()
	local var7 = useIsChatEnabledModule()
	local var8 = useIsGroupChatEnabledModule()
	local var9 = useIsInExperienceModule()
	local var10 = useDispatch()
	
	local var11 = function(p3, p4, p5, p6)
		-- upvalues: var10 (ref), changedParticipantsModule (copy)
		var10(changedParticipantsModule(p3, p4, p5, p6))
	end
	
	local var12 = function()
		-- upvalues: var10 (ref), fetchChatMetadataModule (copy)
		return var10(fetchChatMetadataModule())
	end
	
	local var13 = function(p3)
		-- upvalues: var10 (ref), fetchLatestConversationDetailsModule (copy)
		return var10(fetchLatestConversationDetailsModule(p3))
	end
	
	local var14 = function()
		-- upvalues: var10 (ref), getAllFriendsAsyncModule (copy)
		var10(getAllFriendsAsyncModule())
	end
	
	local var15 = if not fFlagAppChatPresenceStoreMigrationModule then function()
		-- upvalues: var10 (ref), getAllUserPresencesModule (copy)
		spawn(function()
			-- upvalues: var10 (copy), getAllUserPresencesModule (copy)
			var10(getAllUserPresencesModule())
		end)
	end else nil
	
	local var16 = function(p3, p4, p5)
		-- upvalues: var10 (ref), getNewMessages (copy)
		return var10(getNewMessages(p3, p4, p5))
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
	
	local var17 = function(p3, p4)
		-- upvalues: var10 (ref), roduxAliasesModule (copy)
		var10(roduxAliasesModule.Actions.AliasUpdated(p3, p4))
	end
	
	local var18 = function(p3, p4)
		-- upvalues: var10 (ref), receivedUserTypingModule (copy)
		var10(receivedUserTypingModule(p3, p4))
	end
	
	local var19 = function()
		-- upvalues: var10 (ref), paginateAndRefreshConversationsModule (copy)
		var10(paginateAndRefreshConversationsModule())
	end
	
	local var20 = function(p3)
		-- upvalues: var10 (ref), removedConversationModule (copy)
		var10(removedConversationModule(p3))
	end
	
	local var21 = function(p3, p4, p5, p6)
		-- upvalues: var10 (ref), renamedGroupConversationModule (copy)
		var10(renamedGroupConversationModule(p3, p4, p5, p6))
	end
	
	local var22 = cryoModule.Dictionary.join(t, p2)
	local var23 = useRef({})
	local var24 = useLocalization({
		networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		removedFromConversationToastTitle = "Feature.Chat.Message.RemovedFromConversation"
	})
	local networkErrorText = var24.networkErrorText
	local removedFromConversationToastTitle = var24.removedFromConversationToastTitle
	local var25 = useCallback(function(p3, p4)
		-- upvalues: var23 (ref)
		assert(var23.current, "table")
		var23.current[p3] = p4
	end, { var23.current })
	local var26 = useCallback(function()
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
		-- upvalues: var7 (ref), var22 (ref), var1 (copy), roactNavigationModule (copy), var4 (ref), formFactor (copy), enumScreensModule (copy)
		if not var7 and var22.activeConversationId and var22.rnBypassActionSignal then
			var1:debug("Chat is disabled for our user, navigating away from active conversation")
			var22.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
				routeName = if var4 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
			}))
		end
	end, {
		var7,
		var4,
		var22.activeConversationId,
		var22.rnBypassActionSignal
	})
	local var27 = if var22.activeConversationId then var3[var22.activeConversationId] else nil
	useEffect(function()
		-- upvalues: var8 (ref), var27 (ref), var22 (ref), var1 (copy), roactNavigationModule (copy), var4 (ref), formFactor (copy), enumScreensModule (copy)
		if not var8 and var27 and (var22.rnBypassActionSignal and var27.type == "group") then
			var1:debug("Group chats are disabled and we are navigated to a group chat. Navigating to ChatLanding")
			var22.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
				routeName = if var4 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
			}))
		end
	end, { var8, var27, var4, var22.rnBypassActionSignal })
	realtimeDeliveryModule.useRealtimeNamespace("UserTagChangeNotification", function(p3)
		-- upvalues: var1 (copy), var10 (ref), roduxAliasesModule (copy)
		var1:info("Received UserTagChangeNotification: {}", p3.Type)
		
		if p3.Type == "UserTagUpdate" then
			var10(roduxAliasesModule.Actions.AliasUpdated(tostring(p3.UserId), p3.NewAlias))
		end
	end, dependencyArray(var17))
	realtimeDeliveryModule.useRealtimeNamespace("FriendshipNotifications", function(p3)
		-- upvalues: var1 (copy), var10 (ref), paginateAndRefreshConversationsModule (copy), var6 (ref), friendshipDestroyedModule (copy), var27 (ref), conversationModule (copy), cryoModule (copy), var4 (ref), formFactor (copy), enumScreensModule (copy), var22 (ref), roactNavigationModule (copy)
		local type = p3.Type
		var1:info("Received FriendshipNotifications notification: {}", type)
		
		if type == "FriendshipCreated" then
			var10(paginateAndRefreshConversationsModule())
			
			return
		elseif type == "FriendshipDestroyed" then
			local var28 = nil
			
			if p3.EventArgs then
				local var29 = tostring(p3.EventArgs.UserId1)
				local var30 = tostring(p3.EventArgs.UserId2)
				
				if var29 == var6 then
					var29 = "localUserId"
					var28 = var30
				end
				if var30 == var6 then
					var30 = "localUserId"
					var28 = var29
				end
				var10(friendshipDestroyedModule({ userId1 = var29, userId2 = var30 }))
			end
			if var27 and var27.source == "friends" and (var27.conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION and cryoModule.List.findWhere(var27.participants, function(p4)
				-- upvalues: var28 (write)
				return p4 == var28
			end)) then
				var22.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
					routeName = if var4 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
				}))
			end
		end
	end, dependencyArray(var10, var19, var6, var4, var27, var22.rnBypassActionSignal))
	local var28 = useCallback(function()
		-- upvalues: var2 (ref), var10 (ref), fetchChatMetadataModule (copy), var1 (copy), paginateAndRefreshConversationsModule (copy), getAllFriendsAsyncModule (copy), fFlagAppChatPresenceStoreMigrationModule (copy), var15 (ref)
		if var2 then
			var10(fetchChatMetadataModule()):andThen(function(p3)
				-- upvalues: var1 (copy), var10 (copy), paginateAndRefreshConversationsModule (copy), getAllFriendsAsyncModule (copy), fFlagAppChatPresenceStoreMigrationModule (copy), var15 (copy)
				if p3 then
					var1:trace("Chat is enabled for our user, refreshing conversations")
					var10(paginateAndRefreshConversationsModule())
					task.spawn(function()
						-- upvalues: var10 (copy), getAllFriendsAsyncModule (copy)
						var10(getAllFriendsAsyncModule())
					end)
					
					if fFlagAppChatPresenceStoreMigrationModule then
						return
					else
						var15()
						
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
		var14,
		var15,
		var12
	})
	realtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(p3, p4)
		-- upvalues: var1 (copy), var26 (ref), var2 (ref), var28 (ref)
		var1:info("CommunicationChannels connection state transitioned to {}", tostring(p3))
		
		if p3 == Enum.ConnectionState.Disconnected then
			var1:info("CommunicationChannels disconnected, show network error toast.")
			var26()
			
			return
		elseif p3 == Enum.ConnectionState.Connected and p4 then
			var1:trace("We missed some messages while we were disconnected. The chat app was previously {}", if var2 then "loaded" else "unloaded")
			var28()
		end
	end, dependencyArray(var28, var2, var26))
	realtimeDeliveryModule.useRealtimeNamespace("CommunicationChannels", function(p3)
		-- upvalues: communicationChannelsTypesModule (copy), var1 (copy), var25 (ref), var10 (ref), removedConversationModule (copy), var22 (ref), var4 (ref), formFactor (copy), enumScreensModule (copy), roactNavigationModule (copy), var6 (ref), removedFromConversationToastTitle (ref), fetchLatestConversationDetailsModule (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var5 (ref), conversationChannelsModule (copy), friendConversationCreatedModule (copy), fFlagAppChatPerfTrackingModule (copy), restartMessageReceiveTracking (ref), getNewMessages (copy), receivedUserTypingModule (copy)
		if p3.ChannelVertical ~= "PlatformChat" then return end
		if not table.find(communicationChannelsTypesModule.ChannelTypeAllowlist, p3.ChannelType) then return end
		var1:info("Received CommunicationChannels notification: {}", p3.Type)
		var25("CommunicationChannels", p3.SequenceNumber)
		local channelId = p3.ChannelId
		
		if p3.Type == "ChannelDeleted" or p3.Type == "RemovedFromChannel" or p3.Type == "ChannelArchived" then
			var10(removedConversationModule(channelId))
			local activeConversationId = var22.activeConversationId
			
			if activeConversationId ~= nil and tostring(activeConversationId) == p3.ChannelId and var22.rnBypassActionSignal then
				var22.rnBypassActionSignal:fire(roactNavigationModule.Actions.navigate({
					routeName = if var4 == formFactor.WIDE then enumScreensModule.EmptyConversation else enumScreensModule.ChatLanding
				}))
			end
			if p3.Actor.Id == tostring(var6) then
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
				-- upvalues: channelId (ref), var10 (copy), fetchLatestConversationDetailsModule (copy), p3 (ref), renamedGroupConversationModule (copy), changedParticipantsModule (copy), var1 (copy)
				var10(fetchLatestConversationDetailsModule(channelId)):andThen(function(p4)
					-- upvalues: p3 (copy), channelId (copy), var10 (copy), renamedGroupConversationModule (copy), changedParticipantsModule (copy)
					local title = p4.title
					local lastUpdated = p4.lastUpdated
					
					if p3.Type == "ChannelUpdated" then
						var10(renamedGroupConversationModule(channelId, title, p4.isDefaultTitle, lastUpdated))
						
						return
					end
					var10(changedParticipantsModule(channelId, p4.participants, title, lastUpdated))
				end):catch(function(p4)
					-- upvalues: var1 (copy), p3 (copy)
					var1:warning(`Failure in RobloxEventReceiver->{p3.Type}, Status: {tostring(p4)}`)
				end)
			end)
			
			return
		elseif p3.Type == "AddedToChannel" or p3.Type == "ChannelCreated" or p3.Type == "ChannelMarkedRead" or (p3.Type == "ChannelMetadataUpdated" and channelId ~= nil or p3.Type == "ChannelUnarchived") then
			if var5 then
				var1:debug("Received {} event while loading conversation data", p3.Type)
				
				return
			end
			task.spawn(function()
				-- upvalues: channelId (ref), var10 (copy), fetchLatestConversationDetailsModule (copy), p3 (ref), conversationChannelsModule (copy), friendConversationCreatedModule (copy), var22 (copy), roactNavigationModule (copy), enumScreensModule (copy), var1 (copy)
				var10(fetchLatestConversationDetailsModule(channelId)):andThen(function(p4)
					-- upvalues: p3 (copy), conversationChannelsModule (copy), var10 (copy), friendConversationCreatedModule (copy), var22 (copy), roactNavigationModule (copy), enumScreensModule (copy)
					if (p3.Type == "ChannelCreated" or p3.Type == "ChannelUnarchived") and p4.type == "one_to_one" then
						local friendConversationId = conversationChannelsModule.getFriendConversationId(p4.participants)
						
						if friendConversationId then
							var10(friendConversationCreatedModule({
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
			local var29
			if not fFlagAppChatPerfTrackingModule then
				var29 = var10(getNewMessages(channelId, p3.Actor.Id == tostring(var6), tick()))
				
				return
			end
			local var30 = p3.Actor.Id == tostring(var6)
			
			if not var30 and var22.activeConversationId and tostring(var22.activeConversationId) == channelId then
				restartMessageReceiveTracking(channelId)
			end
			var29 = var10(getNewMessages(channelId, var30, tick()))
			
			return
		elseif p3.Type == "ParticipantTyping" and p3.IsTyping then
			var10(receivedUserTypingModule(channelId, p3.Actor.Id))
		end
	end, dependencyArray(var6, var25, var20, var22.activeConversationId, var22.rnBypassActionSignal, removedFromConversationToastTitle, var13, var21, var11, var5, var16, var18))
	local var29 = useMemo(function()
		-- upvalues: var3 (ref), cryoModule (copy)
		return if var3 then cryoModule.List.filterMap(cryoModule.Dictionary.values(var3), function(p3)
			return if p3 and p3.id and p3.source ~= "friends" then p3.id else nil
		end) else {}
	end, { var3 })
	realtimeDeliveryModule.useRealtimeNamespace("ChatModerationTypeEligibility", function(p3)
		-- upvalues: var1 (copy), getFFlagDebugUnfilteredThreads (copy), chunkAndLogString (copy), cryoModule (copy), var29 (ref), var10 (ref), multiGetConversationDetailsModule (copy), var22 (ref), appChatNetworkingModule (copy), fFlagAppChatEnableDoubleOptIn (copy), refreshConversationUnfilteredThreadsDetailsModule (copy), var9 (ref)
		var1:debug("Received ChatModerationTypeEligibility notification")
		local channelsInspected = p3.channels_inspected
		
		if not channelsInspected or #channelsInspected == 0 then return end
		if getFFlagDebugUnfilteredThreads() then
			local var30 = ""
			
			for i, v in channelsInspected do
				var30 = `{var30}, {v}`
			end
			chunkAndLogString(`RTN CONVERSATIONS INSPECTED{var30}`)
		end
		local var31 = cryoModule.List.filter(channelsInspected, function(p4)
			-- upvalues: var29 (copy)
			return table.find(var29, p4)
		end)
		
		if #var31 == 0 then
			var1:debug("No filtered existing conversation IDs found in ChatModerationTypeEligibility notification")
			
			return
		elseif getFFlagDebugUnfilteredThreads() then
			local var32 = ""
			
			for i, v in var31 do
				var32 = `{var32}, {v}`
			end
			chunkAndLogString(`RTN FILTERED CONVERSATIONS{var32}`)
		end
		var10(multiGetConversationDetailsModule(var31)):catch(function(p4)
			-- upvalues: var1 (copy)
			var1:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->MultiGetConversationDetails, Status: " .. tostring(p4))
		end)
		
		if not var22.activeConversationId then return end
		if table.find(channelsInspected, var22.activeConversationId) then
			var10(appChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ var22.activeConversationId })):catch(function(p4)
				-- upvalues: var1 (copy)
				var1:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationsParticipantsMetadata, Status: " .. tostring(p4))
			end)
			
			if fFlagAppChatEnableDoubleOptIn then
				var10(refreshConversationUnfilteredThreadsDetailsModule(var22.activeConversationId, var9))
				
				return
			end
			var10(appChatNetworkingModule.rodux.GetConversationTopModal.API(var22.activeConversationId, var9)):catch(function(p4)
				-- upvalues: var1 (copy)
				var1:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationTopModal, Status: " .. tostring(p4))
			end)
		end
	end, dependencyArray(var10, var22.activeConversationId, var29))
	realtimeDeliveryModule.useRealtimeNamespace("EligibilityStatusChanged", function(_)
		-- upvalues: var1 (copy), var10 (ref), appChatNetworkingModule (copy), var9 (ref)
		var1:info("Received EligibilityStatusChanged notification")
		var10(appChatNetworkingModule.rodux.GetChatLandingModal.API(var9)):catch(function(p4)
			-- upvalues: var1 (copy)
			var1:warning("NetworkingChat failure in ChatEventReceiver->EligibilityStatusChanged->GetChatLandingModal request. Status: {}", tostring(p4))
		end)
	end, dependencyArray(var10, var9))
	useChatTrustedConnectionsEventsModule({ activeConversationId = var22.activeConversationId })
	
	return {}
end

return ChatEventReceiver2
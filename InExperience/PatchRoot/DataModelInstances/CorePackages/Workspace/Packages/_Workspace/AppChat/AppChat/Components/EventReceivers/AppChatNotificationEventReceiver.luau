local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local eventNamesModule = require(appChat.Analytics.EventNames)
local useAnalyticsModule = require(appChat.Analytics.useAnalytics)
local useRealtimePlatformChatModule = require(script.Parent.useRealtimePlatformChat)
local useUnreadMessagesDispatchModule = require(appChat.Contexts.UnreadMessages.useUnreadMessagesDispatch)
local useChatIsVisibleModule = require(appChat.Hooks.useChatIsVisible)
local name = require(appChat.Logger):new(script.Name)

return reactModule.memo(function() --[[ line: 17 | named "AppChatNotificationEventReceiver" ]]
	-- upvalues: useAnalyticsModule (ref), useUnreadMessagesDispatchModule (ref), useDispatch (ref), useSelector (ref), useChatIsVisibleModule (ref), reactModule (ref), name (ref), appChatNetworkingModule (ref), eventNamesModule (ref), useRealtimePlatformChatModule (ref), realtimeDeliveryModule (ref)
	local var10 = useAnalyticsModule()
	local var11 = useUnreadMessagesDispatchModule()
	local var12 = useDispatch()
	local var13 = useSelector(function(p0) --[[ line: 22 ]]
		return p0.ChatAppReducer.unreadMessageCount
	end)
	local var14 = useChatIsVisibleModule()
	reactModule.useEffect(function() --[[ line: 28 ]]
		-- upvalues: name (copy), var12 (ref), appChatNetworkingModule (copy), var10 (ref), eventNamesModule (copy)
		name:debug("Fetching conversation metadata to get unread count")
		var12(appChatNetworkingModule.rodux.GetConversationMetadata.API()):andThen(function(p2) --[[ line: 32 ]]
			-- upvalues: name (copy), var10 (copy), eventNamesModule (copy)
			local globalUnreadMessageCount = p2.responseBody.global_unread_message_count
			name:info("Initial unread message count: {}", globalUnreadMessageCount)
			var10.fireAnalyticsEvent(eventNamesModule.preloadSocialTabDataEvent, { unreadConversationCount = globalUnreadMessageCount })
		end):catch(function(p1) --[[ line: 40 ]]
			-- upvalues: name (copy), var10 (copy), eventNamesModule (copy)
			name:error("Failure in GetConversationMetadata. Error: {}", tostring(p1))
			var10.fireAnalyticsEvent(eventNamesModule.preloadSocialTabDataFailedEvent, {})
		end)
	end, { var12, var10 })
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: name (copy), var13 (ref), var11 (ref)
		name:info("Dispatching unread messsage count as {}", var13)
		var11(var13)
	end, { var11, var13 })
	useRealtimePlatformChatModule(function(p3) --[[ line: 51 ]]
		-- upvalues: name (copy), var14 (ref), var12 (ref), appChatNetworkingModule (copy)
		if if p3.Type ~= "ChannelMetadataUpdated" then p3.Type == "ChannelMarkedRead" else true then
			name:info("Received event {}, fetching conversation metadata to get unread count", p3.Type)
			
			if var14 then
				name:info("Chat tab is visible during realtime event, calling clear endpoint")
				var12(appChatNetworkingModule.rodux.ClearGlobalUnreadCount.API()):catch(function(p4) --[[ line: 59 ]]
					-- upvalues: name (copy)
					name:error("Failure in ClearGlobalUnreadCount. Error: {}", tostring(p4))
				end)
				
				return
			end
			var12(appChatNetworkingModule.rodux.GetConversationMetadata.API()):catch(function(p5) --[[ line: 63 ]]
				-- upvalues: name (copy)
				name:error("Failure in GetConversationMetadata. Error: {}", tostring(p5))
			end)
		end
	end, { var12, var14 })
	realtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(p6, p7) --[[ line: 73 ]]
		-- upvalues: name (copy), var14 (ref), var12 (ref), appChatNetworkingModule (copy)
		if p6 == Enum.ConnectionState.Connected and p7 then
			name:info("Connection re-established, fetching conversation metadata to get unread count")
			
			if var14 then
				name:info("Chat tab is visible during connection recovery, calling clear endpoint")
				var12(appChatNetworkingModule.rodux.ClearGlobalUnreadCount.API()):catch(function(p8) --[[ line: 79 ]]
					-- upvalues: name (copy)
					name:error("Failure in ClearGlobalUnreadCount. Error: {}", tostring(p8))
				end)
				
				return
			end
			var12(appChatNetworkingModule.rodux.GetConversationMetadata.API()):catch(function(p9) --[[ line: 83 ]]
				-- upvalues: name (copy)
				name:error("Failure in GetConversationMetadata. Error: {}", tostring(p9))
			end)
		end
	end, { var12, var14 })
	
	return nil
end)
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
local inExperienceAppChatModalModule = require(appChat.App.InExperienceAppChatModal)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local name = require(appChat.Logger):new(script.Name)

return reactModule.memo(function(p0) --[[ line: 24 | named "AppChatNotificationEventReceiver" ]]
	-- upvalues: useAnalyticsModule (ref), useUnreadMessagesDispatchModule (ref), useDispatch (ref), useSelector (ref), useChatIsVisibleModule (ref), reactModule (ref), inExperienceAppChatModalModule (ref), fFlagExpChatEnableFriendsTab (ref), name (ref), appChatNetworkingModule (ref), eventNamesModule (ref), useRealtimePlatformChatModule (ref), realtimeDeliveryModule (ref)
	local var11 = useAnalyticsModule()
	local var12 = useUnreadMessagesDispatchModule()
	local var13 = useDispatch()
	local var14 = useSelector(function(p1) --[[ line: 29 ]]
		return p1.ChatAppReducer.unreadMessageCount
	end)
	local var15 = useChatIsVisibleModule()
	local var16, var17 = reactModule.useState(function() --[[ line: 34 ]]
		-- upvalues: inExperienceAppChatModalModule (copy)
		return inExperienceAppChatModalModule:getVisible()
	end)
	reactModule.useEffect(function() --[[ line: 38 ]]
		-- upvalues: inExperienceAppChatModalModule (copy), var17 (ref)
		local eventConnection = inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(var17)
		var17(inExperienceAppChatModalModule:getVisible())
		
		return function() --[[ line: 41 ]]
			-- upvalues: eventConnection (ref)
			eventConnection:Disconnect()
		end
	end, {})
	local var18 = if fFlagExpChatEnableFriendsTab and p0.isInExperience then var16 else var15
	reactModule.useEffect(function() --[[ line: 56 ]]
		-- upvalues: name (copy), var13 (ref), appChatNetworkingModule (copy), fFlagExpChatEnableFriendsTab (copy), p0 (ref), inExperienceAppChatModalModule (copy), var11 (ref), eventNamesModule (copy)
		name:debug("Fetching conversation metadata to get unread count")
		var13(appChatNetworkingModule.rodux.GetConversationMetadata.API()):andThen(function(p3) --[[ line: 60 ]]
			-- upvalues: name (copy), fFlagExpChatEnableFriendsTab (copy), p0 (copy), inExperienceAppChatModalModule (copy), var11 (copy), eventNamesModule (copy)
			local globalUnreadMessageCount = p3.responseBody.global_unread_message_count
			name:info("Initial unread message count: {}", globalUnreadMessageCount)
			
			if fFlagExpChatEnableFriendsTab and p0.isInExperience then
				inExperienceAppChatModalModule:markInitialUnreadCountReceived(globalUnreadMessageCount or 0)
			end
			var11.fireAnalyticsEvent(eventNamesModule.preloadSocialTabDataEvent, { unreadConversationCount = globalUnreadMessageCount })
		end):catch(function(p2) --[[ line: 74 ]]
			-- upvalues: name (copy), var11 (copy), eventNamesModule (copy)
			name:error("Failure in GetConversationMetadata. Error: {}", tostring(p2))
			var11.fireAnalyticsEvent(eventNamesModule.preloadSocialTabDataFailedEvent, {})
		end)
	end, { var13, var11 })
	reactModule.useEffect(function() --[[ line: 80 ]]
		-- upvalues: name (copy), var14 (ref), var12 (ref)
		name:info("Dispatching unread messsage count as {}", var14)
		var12(var14)
	end, { var12, var14 })
	useRealtimePlatformChatModule(function(p4) --[[ line: 85 ]]
		-- upvalues: name (copy), var18 (ref), var13 (ref), appChatNetworkingModule (copy)
		if if p4.Type ~= "ChannelMetadataUpdated" then p4.Type == "ChannelMarkedRead" else true then
			name:info("Received event {}, fetching conversation metadata to get unread count", p4.Type)
			
			if var18 then
				name:info("Chat tab is visible during realtime event, calling clear endpoint")
				var13(appChatNetworkingModule.rodux.ClearGlobalUnreadCount.API()):catch(function(p5) --[[ line: 93 ]]
					-- upvalues: name (copy)
					name:error("Failure in ClearGlobalUnreadCount. Error: {}", tostring(p5))
				end)
				
				return
			end
			var13(appChatNetworkingModule.rodux.GetConversationMetadata.API()):catch(function(p6) --[[ line: 97 ]]
				-- upvalues: name (copy)
				name:error("Failure in GetConversationMetadata. Error: {}", tostring(p6))
			end)
		end
	end, { var13, var18 })
	realtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(p7, p8) --[[ line: 107 ]]
		-- upvalues: name (copy), var18 (ref), var13 (ref), appChatNetworkingModule (copy)
		if p7 == Enum.ConnectionState.Connected and p8 then
			name:info("Connection re-established, fetching conversation metadata to get unread count")
			
			if var18 then
				name:info("Chat tab is visible during connection recovery, calling clear endpoint")
				var13(appChatNetworkingModule.rodux.ClearGlobalUnreadCount.API()):catch(function(p9) --[[ line: 113 ]]
					-- upvalues: name (copy)
					name:error("Failure in ClearGlobalUnreadCount. Error: {}", tostring(p9))
				end)
				
				return
			end
			var13(appChatNetworkingModule.rodux.GetConversationMetadata.API()):catch(function(p10) --[[ line: 117 ]]
				-- upvalues: name (copy)
				name:error("Failure in GetConversationMetadata. Error: {}", tostring(p10))
			end)
		end
	end, { var13, var18 })
	
	return nil
end)
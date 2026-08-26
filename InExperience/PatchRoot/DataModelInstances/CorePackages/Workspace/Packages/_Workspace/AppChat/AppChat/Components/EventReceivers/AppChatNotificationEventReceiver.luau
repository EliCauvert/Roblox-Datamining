local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local eventNamesModule = require(appChat.Analytics.EventNames)
local useAnalyticsModule = require(appChat.Analytics.useAnalytics)
local useRealtimePlatformChatModule = require(script.Parent.useRealtimePlatformChat)
local useUnreadMessagesDispatchModule = require(appChat.Contexts.UnreadMessages.useUnreadMessagesDispatch)
local useChatIsVisibleModule = require(appChat.Hooks.useChatIsVisible)
local inExperienceAppChatModalModule = require(appChat.App.InExperienceAppChatModal)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local fFlagAppChatUnreadMessageCountStoreModule = require(appChat.Flags.FFlagAppChatUnreadMessageCountStore)
local var1 = if fFlagAppChatUnreadMessageCountStoreModule then require(appChat.Stores.GetUnreadMessageCountStore) else nil
local name = require(appChat.Logger):new(script.Name)

return reactModule.memo(function(p1)
	-- upvalues: useAnalyticsModule (ref), useUnreadMessagesDispatchModule (ref), useDispatch (ref), fFlagAppChatUnreadMessageCountStoreModule (ref), useSignalState (ref), var1 (ref), useSelector (ref), useChatIsVisibleModule (ref), reactModule (ref), inExperienceAppChatModalModule (ref), fFlagExpChatEnableFriendsTab (ref), name (ref), appChatNetworkingModule (ref), eventNamesModule (ref), useRealtimePlatformChatModule (ref), realtimeDeliveryModule (ref)
	local var2 = useAnalyticsModule()
	local var3 = useUnreadMessagesDispatchModule()
	local var4 = useDispatch()
	local var5 = if fFlagAppChatUnreadMessageCountStoreModule then useSignalState(var1(false).getUnreadMessageCount) else useSelector(function(p2)
		return p2.ChatAppReducer.unreadMessageCount
	end)
	local var6 = useChatIsVisibleModule()
	local var7, var8 = reactModule.useState(function()
		-- upvalues: inExperienceAppChatModalModule (copy)
		return inExperienceAppChatModalModule:getVisible()
	end)
	reactModule.useEffect(function()
		-- upvalues: inExperienceAppChatModalModule (copy), var8 (ref)
		local eventConnection = inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(var8)
		var8(inExperienceAppChatModalModule:getVisible())
		
		return function()
			-- upvalues: eventConnection (ref)
			eventConnection:Disconnect()
		end
	end, {})
	local var9 = if fFlagExpChatEnableFriendsTab and p1.isInExperience then var7 else var6
	reactModule.useEffect(function()
		-- upvalues: name (copy), var4 (ref), appChatNetworkingModule (copy), fFlagExpChatEnableFriendsTab (copy), p1 (ref), inExperienceAppChatModalModule (copy), var2 (ref), eventNamesModule (copy)
		name:debug("Fetching conversation metadata to get unread count")
		var4(appChatNetworkingModule.rodux.GetConversationMetadata.API()):andThen(function(p2)
			-- upvalues: name (copy), fFlagExpChatEnableFriendsTab (copy), p1 (copy), inExperienceAppChatModalModule (copy), var2 (copy), eventNamesModule (copy)
			local globalUnreadMessageCount = p2.responseBody.global_unread_message_count
			name:info("Initial unread message count: {}", globalUnreadMessageCount)
			
			if fFlagExpChatEnableFriendsTab and p1.isInExperience then
				inExperienceAppChatModalModule:markInitialUnreadCountReceived(globalUnreadMessageCount or 0)
			end
			var2.fireAnalyticsEvent(eventNamesModule.preloadSocialTabDataEvent, { unreadConversationCount = globalUnreadMessageCount })
		end):catch(function(p2)
			-- upvalues: name (copy), var2 (copy), eventNamesModule (copy)
			name:error("Failure in GetConversationMetadata. Error: {}", tostring(p2))
			var2.fireAnalyticsEvent(eventNamesModule.preloadSocialTabDataFailedEvent, {})
		end)
	end, { var4, var2 })
	reactModule.useEffect(function()
		-- upvalues: name (copy), var5 (ref), var3 (ref)
		name:info("Dispatching unread messsage count as {}", var5)
		var3(var5)
	end, { var3, var5 })
	useRealtimePlatformChatModule(function(p2)
		-- upvalues: name (copy), var9 (ref), var4 (ref), appChatNetworkingModule (copy)
		if if p2.Type ~= "ChannelMetadataUpdated" then p2.Type == "ChannelMarkedRead" else true then
			name:info("Received event {}, fetching conversation metadata to get unread count", p2.Type)
			
			if var9 then
				name:info("Chat tab is visible during realtime event, calling clear endpoint")
				var4(appChatNetworkingModule.rodux.ClearGlobalUnreadCount.API()):catch(function(p3)
					-- upvalues: name (copy)
					name:error("Failure in ClearGlobalUnreadCount. Error: {}", tostring(p3))
				end)
				
				return
			end
			var4(appChatNetworkingModule.rodux.GetConversationMetadata.API()):catch(function(p3)
				-- upvalues: name (copy)
				name:error("Failure in GetConversationMetadata. Error: {}", tostring(p3))
			end)
		end
	end, { var4, var9 })
	realtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(p2, p3)
		-- upvalues: name (copy), var9 (ref), var4 (ref), appChatNetworkingModule (copy)
		if p2 == Enum.ConnectionState.Connected and p3 then
			name:info("Connection re-established, fetching conversation metadata to get unread count")
			
			if var9 then
				name:info("Chat tab is visible during connection recovery, calling clear endpoint")
				var4(appChatNetworkingModule.rodux.ClearGlobalUnreadCount.API()):catch(function(p4)
					-- upvalues: name (copy)
					name:error("Failure in ClearGlobalUnreadCount. Error: {}", tostring(p4))
				end)
				
				return
			end
			var4(appChatNetworkingModule.rodux.GetConversationMetadata.API()):catch(function(p4)
				-- upvalues: name (copy)
				name:error("Failure in GetConversationMetadata. Error: {}", tostring(p4))
			end)
		end
	end, { var4, var9 })
	
	return nil
end)
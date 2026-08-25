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
local var11 = if fFlagAppChatUnreadMessageCountStoreModule then require(appChat.Stores.GetUnreadMessageCountStore) else nil
local name = require(appChat.Logger):new(script.Name)

return reactModule.memo(function(p0)
	-- upvalues: useAnalyticsModule (ref), useUnreadMessagesDispatchModule (ref), useDispatch (ref), fFlagAppChatUnreadMessageCountStoreModule (ref), useSignalState (ref), var11 (ref), useSelector (ref), useChatIsVisibleModule (ref), reactModule (ref), inExperienceAppChatModalModule (ref), fFlagExpChatEnableFriendsTab (ref), name (ref), appChatNetworkingModule (ref), eventNamesModule (ref), useRealtimePlatformChatModule (ref), realtimeDeliveryModule (ref)
	local var13 = useAnalyticsModule()
	local var14 = useUnreadMessagesDispatchModule()
	local var15 = useDispatch()
	local var16 = if fFlagAppChatUnreadMessageCountStoreModule then useSignalState(var11(false).getUnreadMessageCount) else useSelector(function(p1)
		return p1.ChatAppReducer.unreadMessageCount
	end)
	local var17 = useChatIsVisibleModule()
	local var18, var19 = reactModule.useState(function()
		-- upvalues: inExperienceAppChatModalModule (copy)
		return inExperienceAppChatModalModule:getVisible()
	end)
	reactModule.useEffect(function()
		-- upvalues: inExperienceAppChatModalModule (copy), var19 (ref)
		local eventConnection = inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(var19)
		var19(inExperienceAppChatModalModule:getVisible())
		
		return function()
			-- upvalues: eventConnection (ref)
			eventConnection:Disconnect()
		end
	end, {})
	local var20 = if fFlagExpChatEnableFriendsTab and p0.isInExperience then var18 else var17
	reactModule.useEffect(function()
		-- upvalues: name (copy), var15 (ref), appChatNetworkingModule (copy), fFlagExpChatEnableFriendsTab (copy), p0 (ref), inExperienceAppChatModalModule (copy), var13 (ref), eventNamesModule (copy)
		name:debug("Fetching conversation metadata to get unread count")
		var15(appChatNetworkingModule.rodux.GetConversationMetadata.API()):andThen(function(p3)
			-- upvalues: name (copy), fFlagExpChatEnableFriendsTab (copy), p0 (copy), inExperienceAppChatModalModule (copy), var13 (copy), eventNamesModule (copy)
			local globalUnreadMessageCount = p3.responseBody.global_unread_message_count
			name:info("Initial unread message count: {}", globalUnreadMessageCount)
			
			if fFlagExpChatEnableFriendsTab and p0.isInExperience then
				inExperienceAppChatModalModule:markInitialUnreadCountReceived(globalUnreadMessageCount or 0)
			end
			var13.fireAnalyticsEvent(eventNamesModule.preloadSocialTabDataEvent, { unreadConversationCount = globalUnreadMessageCount })
		end):catch(function(p2)
			-- upvalues: name (copy), var13 (copy), eventNamesModule (copy)
			name:error("Failure in GetConversationMetadata. Error: {}", tostring(p2))
			var13.fireAnalyticsEvent(eventNamesModule.preloadSocialTabDataFailedEvent, {})
		end)
	end, { var15, var13 })
	reactModule.useEffect(function()
		-- upvalues: name (copy), var16 (ref), var14 (ref)
		name:info("Dispatching unread messsage count as {}", var16)
		var14(var16)
	end, { var14, var16 })
	useRealtimePlatformChatModule(function(p4)
		-- upvalues: name (copy), var20 (ref), var15 (ref), appChatNetworkingModule (copy)
		if if p4.Type ~= "ChannelMetadataUpdated" then p4.Type == "ChannelMarkedRead" else true then
			name:info("Received event {}, fetching conversation metadata to get unread count", p4.Type)
			
			if var20 then
				name:info("Chat tab is visible during realtime event, calling clear endpoint")
				var15(appChatNetworkingModule.rodux.ClearGlobalUnreadCount.API()):catch(function(p5)
					-- upvalues: name (copy)
					name:error("Failure in ClearGlobalUnreadCount. Error: {}", tostring(p5))
				end)
				
				return
			end
			var15(appChatNetworkingModule.rodux.GetConversationMetadata.API()):catch(function(p6)
				-- upvalues: name (copy)
				name:error("Failure in GetConversationMetadata. Error: {}", tostring(p6))
			end)
		end
	end, { var15, var20 })
	realtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(p7, p8)
		-- upvalues: name (copy), var20 (ref), var15 (ref), appChatNetworkingModule (copy)
		if p7 == Enum.ConnectionState.Connected and p8 then
			name:info("Connection re-established, fetching conversation metadata to get unread count")
			
			if var20 then
				name:info("Chat tab is visible during connection recovery, calling clear endpoint")
				var15(appChatNetworkingModule.rodux.ClearGlobalUnreadCount.API()):catch(function(p9)
					-- upvalues: name (copy)
					name:error("Failure in ClearGlobalUnreadCount. Error: {}", tostring(p9))
				end)
				
				return
			end
			var15(appChatNetworkingModule.rodux.GetConversationMetadata.API()):catch(function(p10)
				-- upvalues: name (copy)
				name:error("Failure in GetConversationMetadata. Error: {}", tostring(p10))
			end)
		end
	end, { var15, var20 })
	
	return nil
end)
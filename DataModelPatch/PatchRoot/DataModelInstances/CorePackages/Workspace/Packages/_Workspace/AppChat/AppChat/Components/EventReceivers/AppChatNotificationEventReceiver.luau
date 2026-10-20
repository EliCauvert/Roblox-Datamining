local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local EventNamesModule = require(AppChat.Analytics.EventNames)
local UseAnalyticsModule = require(AppChat.Analytics.useAnalytics)
local UseRealtimePlatformChatModule = require(script.Parent.useRealtimePlatformChat)
local UseUnreadMessagesDispatchModule = require(AppChat.Contexts.UnreadMessages.useUnreadMessagesDispatch)
local UseChatIsVisibleModule = require(AppChat.Hooks.useChatIsVisible)
local InExperienceAppChatModalModule = require(AppChat.App.InExperienceAppChatModal)
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local NewResult = require(AppChat.Logger):new(script.Name)

return ReactModule.memo(function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseUnreadMessagesDispatchModule (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), UseChatIsVisibleModule (copy), ReactModule (copy), InExperienceAppChatModalModule (copy), FFlagExpChatEnableFriendsTab (copy), NewResult (copy), AppChatNetworkingModule (copy), EventNamesModule (copy), UseRealtimePlatformChatModule (copy), RealtimeDeliveryModule (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseUnreadMessagesDispatchModuleResult = UseUnreadMessagesDispatchModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ChatAppReducer.unreadMessageCount
	end)
	local UseChatIsVisibleModuleResult = UseChatIsVisibleModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: InExperienceAppChatModalModule (upval)
		return InExperienceAppChatModalModule:getVisible()
	end)
	ReactModule.useEffect(function()
		-- upvalues: InExperienceAppChatModalModule (upval), UseStateResult2 (copy)
		local EventConnection = InExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(UseStateResult2)
		UseStateResult2(InExperienceAppChatModalModule:getVisible())
		
		return function()
			-- upvalues: EventConnection (copy)
			EventConnection:Disconnect()
		end
	end, {})
	local UseStateResult1 = if FFlagExpChatEnableFriendsTab and p1.isInExperience then UseStateResult else UseChatIsVisibleModuleResult
	ReactModule.useEffect(function()
		-- upvalues: NewResult (upval), UseDispatchResult (copy), AppChatNetworkingModule (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval)
		NewResult:debug("Fetching conversation metadata to get unread count")
		UseDispatchResult(AppChatNetworkingModule.rodux.GetConversationMetadata.API()):andThen(function(Result)
			-- upvalues: NewResult (upval), UseAnalyticsModuleResult (upval), EventNamesModule (upval)
			local GlobalUnreadMessageCount = Result.responseBody.global_unread_message_count
			NewResult:info("Initial unread message count: {}", GlobalUnreadMessageCount)
			UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.preloadSocialTabDataEvent, { unreadConversationCount = GlobalUnreadMessageCount })
		end):catch(function(Err)
			-- upvalues: NewResult (upval), UseAnalyticsModuleResult (upval), EventNamesModule (upval)
			NewResult:error("Failure in GetConversationMetadata. Error: {}", (tostring(Err)))
			UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.preloadSocialTabDataFailedEvent, {})
		end)
	end, { UseDispatchResult, UseAnalyticsModuleResult })
	ReactModule.useEffect(function()
		-- upvalues: NewResult (upval), UseSelectorResult (copy), UseUnreadMessagesDispatchModuleResult (copy)
		NewResult:info("Dispatching unread messsage count as {}", UseSelectorResult)
		UseUnreadMessagesDispatchModuleResult(UseSelectorResult)
	end, { UseUnreadMessagesDispatchModuleResult, UseSelectorResult })
	UseRealtimePlatformChatModule(function(p2)
		-- upvalues: NewResult (upval), UseStateResult1 (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval)
		if p2.Type == "ChannelMetadataUpdated" or p2.Type == "ChannelMarkedRead" then
			NewResult:info("Received event {}, fetching conversation metadata to get unread count", p2.Type)
			
			if UseStateResult1 then
				NewResult:info("Chat tab is visible during realtime event, calling clear endpoint")
				UseDispatchResult(AppChatNetworkingModule.rodux.ClearGlobalUnreadCount.API()):catch(function(Err)
					-- upvalues: NewResult (upval)
					NewResult:error("Failure in ClearGlobalUnreadCount. Error: {}", (tostring(Err)))
				end)
				
				return
			else
				UseDispatchResult(AppChatNetworkingModule.rodux.GetConversationMetadata.API()):catch(function(Err)
					-- upvalues: NewResult (upval)
					NewResult:error("Failure in GetConversationMetadata. Error: {}", (tostring(Err)))
				end)
			end
		end
	end, { UseDispatchResult, UseStateResult1 })
	RealtimeDeliveryModule.useRealtimeConnectionStateChanged("CommunicationChannels", function(ConnectionState, p2)
		-- upvalues: NewResult (upval), UseStateResult1 (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval)
		if ConnectionState == Enum.ConnectionState.Connected and p2 then
			NewResult:info("Connection re-established, fetching conversation metadata to get unread count")
			
			if UseStateResult1 then
				NewResult:info("Chat tab is visible during connection recovery, calling clear endpoint")
				UseDispatchResult(AppChatNetworkingModule.rodux.ClearGlobalUnreadCount.API()):catch(function(Err)
					-- upvalues: NewResult (upval)
					NewResult:error("Failure in ClearGlobalUnreadCount. Error: {}", (tostring(Err)))
				end)
				
				return
			else
				UseDispatchResult(AppChatNetworkingModule.rodux.GetConversationMetadata.API()):catch(function(Err)
					-- upvalues: NewResult (upval)
					NewResult:error("Failure in GetConversationMetadata. Error: {}", (tostring(Err)))
				end)
			end
		end
	end, { UseDispatchResult, UseStateResult1 })
	
	return nil
end)
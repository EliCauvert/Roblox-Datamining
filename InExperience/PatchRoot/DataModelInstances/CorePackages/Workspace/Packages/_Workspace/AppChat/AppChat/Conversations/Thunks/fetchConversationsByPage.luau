local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local name = require(appChat.Logger):new(script.Name)
local processConversationsModule = require(script.Parent.processConversations)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fFlagAppChatMessageTTIMilestonesModule = require(appChat.Flags.FFlagAppChatMessageTTIMilestones)
local fFlagAppChatConversationStoreModule = require(appChat.Flags.FFlagAppChatConversationStore)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local receivedPageConversationsModule = require(appChat.Conversations.Actions.ReceivedPageConversations)
local requestPageConversationsModule = require(appChat.Conversations.Actions.RequestPageConversations)

return function(p1)
	-- upvalues: name (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), fFlagAppChatConversationStoreModule (ref), requestPageConversationsModule (ref), appChatNetworkingModule (ref), processConversationsModule (ref), receivedPageConversationsModule (ref)
	name:info("Fetching conversations by page with cursor {}", p1 or "nil")
	
	return function(p2)
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), p1 (ref), appChatPerfTrackerModule (copy), fFlagAppChatConversationStoreModule (copy), requestPageConversationsModule (copy), appChatNetworkingModule (copy), processConversationsModule (copy), receivedPageConversationsModule (copy), name (copy)
		if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule and p1 == nil then
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatLandingTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatLandingTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch)
			appChatPerfTrackerModule.trackRequest(appChatPerfTrackerModule.Events.ChatLandingTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "GetUserConversations")
		end
		if fFlagAppChatConversationStoreModule then
			p2:dispatch(requestPageConversationsModule())
		end
		return p2:dispatch(appChatNetworkingModule.rodux.GetUserConversations.API(p1)):tap(function(p3)
			-- upvalues: p2 (ref), processConversationsModule (copy), fFlagAppChatConversationStoreModule (copy), receivedPageConversationsModule (copy), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), p1 (copy), appChatPerfTrackerModule (copy)
			p2:dispatch(processConversationsModule(p3.responseBody.conversations))
			
			if fFlagAppChatConversationStoreModule then
				p2:dispatch(receivedPageConversationsModule())
			end
			if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule and p1 == nil then
				appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatLandingTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name)
				appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatLandingTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived)
			end
		end):andThen(function(p3)
			-- upvalues: name (copy), p1 (copy)
			local responseBody = p3.responseBody
			
			if responseBody and responseBody.next_cursor and responseBody.next_cursor ~= "" then
				name:debug("Next cursor found: {}", responseBody.next_cursor)
				
				return p1, responseBody.next_cursor
			end
			name:debug("No next cursor found")
			
			return p1, ""
		end):catch(function(p3)
			-- upvalues: fFlagAppChatConversationStoreModule (copy), p2 (ref), receivedPageConversationsModule (copy), name (copy)
			if fFlagAppChatConversationStoreModule then
				p2:dispatch(receivedPageConversationsModule())
			end
			name:warning("Error in GetUserConversations request. Error: {}", tostring(p3))
		end)
	end
end
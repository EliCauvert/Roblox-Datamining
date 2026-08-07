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

return function(p0) --[[ line: 21 ]]
	-- upvalues: name (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), fFlagAppChatConversationStoreModule (ref), requestPageConversationsModule (ref), appChatNetworkingModule (ref), processConversationsModule (ref), receivedPageConversationsModule (ref)
	name:info("Fetching conversations by page with cursor {}", p0 or "nil")
	
	return function(p1) --[[ line: 23 ]]
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), p0 (ref), appChatPerfTrackerModule (copy), fFlagAppChatConversationStoreModule (copy), requestPageConversationsModule (copy), appChatNetworkingModule (copy), processConversationsModule (copy), receivedPageConversationsModule (copy), name (copy)
		if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule and p0 == nil then
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatLandingTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatLandingTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch)
			appChatPerfTrackerModule.trackRequest(appChatPerfTrackerModule.Events.ChatLandingTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "GetUserConversations")
		end
		if fFlagAppChatConversationStoreModule then
			p1:dispatch(requestPageConversationsModule())
		end
		return p1:dispatch(appChatNetworkingModule.rodux.GetUserConversations.API(p0)):tap(function(p4) --[[ line: 47 ]]
			-- upvalues: p1 (ref), processConversationsModule (copy), fFlagAppChatConversationStoreModule (copy), receivedPageConversationsModule (copy), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), p0 (copy), appChatPerfTrackerModule (copy)
			p1:dispatch(processConversationsModule(p4.responseBody.conversations))
			
			if fFlagAppChatConversationStoreModule then
				p1:dispatch(receivedPageConversationsModule())
			end
			if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule and p0 == nil then
				appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatLandingTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name)
				appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatLandingTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived)
			end
		end):andThen(function(p3) --[[ line: 65 ]]
			-- upvalues: name (copy), p0 (copy)
			local responseBody = p3.responseBody
			
			if responseBody and responseBody.next_cursor and responseBody.next_cursor ~= "" then
				name:debug("Next cursor found: {}", responseBody.next_cursor)
				
				return p0, responseBody.next_cursor
			end
			name:debug("No next cursor found")
			
			return p0, ""
		end):catch(function(p2) --[[ line: 75 ]]
			-- upvalues: fFlagAppChatConversationStoreModule (copy), p1 (ref), receivedPageConversationsModule (copy), name (copy)
			if fFlagAppChatConversationStoreModule then
				p1:dispatch(receivedPageConversationsModule())
			end
			name:warning("Error in GetUserConversations request. Error: {}", tostring(p2))
		end)
	end
end
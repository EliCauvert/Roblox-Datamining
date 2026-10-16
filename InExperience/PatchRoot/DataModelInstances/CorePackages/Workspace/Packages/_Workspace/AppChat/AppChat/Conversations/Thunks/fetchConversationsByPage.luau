local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local NewResult = require(AppChat.Logger):new(script.Name)
local ProcessConversationsModule = require(script.Parent.processConversations)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatMessageTTIMilestonesModule = require(AppChat.Flags.FFlagAppChatMessageTTIMilestones)
local FFlagAppChatConversationStoreModule = require(AppChat.Flags.FFlagAppChatConversationStore)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local ReceivedPageConversationsModule = require(AppChat.Conversations.Actions.ReceivedPageConversations)
local RequestPageConversationsModule = require(AppChat.Conversations.Actions.RequestPageConversations)

return function(p1) --[[ Line: 21 ]]
	-- upvalues: NewResult (copy), FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), FFlagAppChatConversationStoreModule (copy), RequestPageConversationsModule (copy), AppChatNetworkingModule (copy), ProcessConversationsModule (copy), ReceivedPageConversationsModule (copy)
	NewResult:info("Fetching conversations by page with cursor {}", p1 or "nil")
	
	return function(p2) --[[ Line: 23 ]]
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), p1 (copy), AppChatPerfTrackerModule (upval), FFlagAppChatConversationStoreModule (upval), RequestPageConversationsModule (upval), AppChatNetworkingModule (upval), ProcessConversationsModule (upval), ReceivedPageConversationsModule (upval), NewResult (upval)
		if FFlagAppChatPerfTrackingModule and FFlagAppChatMessageTTIMilestonesModule and p1 == nil then
			AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatLandingTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name)
			AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatLandingTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch)
			AppChatPerfTrackerModule.trackRequest(AppChatPerfTrackerModule.Events.ChatLandingTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "GetUserConversations")
		end
		if FFlagAppChatConversationStoreModule then
			p2:dispatch(RequestPageConversationsModule())
		end
		return p2:dispatch(AppChatNetworkingModule.rodux.GetUserConversations.API(p1)):tap(function(p3) --[[ Line: 47 ]]
			-- upvalues: p2 (copy), ProcessConversationsModule (upval), FFlagAppChatConversationStoreModule (upval), ReceivedPageConversationsModule (upval), FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), p1 (upval), AppChatPerfTrackerModule (upval)
			p2:dispatch(ProcessConversationsModule(p3.responseBody.conversations))
			
			if FFlagAppChatConversationStoreModule then
				p2:dispatch(ReceivedPageConversationsModule())
			end
			if FFlagAppChatPerfTrackingModule and FFlagAppChatMessageTTIMilestonesModule and p1 == nil then
				AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatLandingTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name)
				AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatLandingTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived)
			end
		end):andThen(function(Result) --[[ Line: 65 ]]
			-- upvalues: NewResult (upval), p1 (upval)
			local ResponseBody = Result.responseBody
			
			if ResponseBody and ResponseBody.next_cursor and ResponseBody.next_cursor ~= "" then
				NewResult:debug("Next cursor found: {}", ResponseBody.next_cursor)
				
				return p1, ResponseBody.next_cursor
			else
				NewResult:debug("No next cursor found")
				
				return p1, ""
			end
		end):catch(function(Err) --[[ Line: 75 ]]
			-- upvalues: FFlagAppChatConversationStoreModule (upval), p2 (copy), ReceivedPageConversationsModule (upval), NewResult (upval)
			if FFlagAppChatConversationStoreModule then
				p2:dispatch(ReceivedPageConversationsModule())
			end
			NewResult:warning("Error in GetUserConversations request. Error: {}", (tostring(Err)))
		end)
	end
end
local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatMessageTTIMilestonesModule = require(AppChat.Flags.FFlagAppChatMessageTTIMilestones)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)

return function(ConversationId, _, p1)
	-- upvalues: FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), AppChatNetworkingModule (copy)
	return function(p2)
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), p1 (copy), ConversationId (copy), AppChatPerfTrackerModule (upval), AppChatNetworkingModule (upval)
		local v1: boolean = FFlagAppChatPerfTrackingModule and (FFlagAppChatMessageTTIMilestonesModule and p1 == nil)
		
		if v1 then
			local config = { conversationId = ConversationId }
			AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, config)
			AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch, config)
			AppChatPerfTrackerModule.trackRequest(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "GetOlderMessages", config)
		end
		local DispatchResult = p2:dispatch(AppChatNetworkingModule.rodux.GetOlderMessages.API(ConversationId, p1))
		
		if v1 then
			DispatchResult = DispatchResult:tap(function()
				-- upvalues: ConversationId (upval), AppChatPerfTrackerModule (upval)
				local config = { conversationId = ConversationId }
				AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, config)
				AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived, config)
			end)
		end
		return DispatchResult:catch(function(Err)
			warn("AppChatNetworking failure in getOlderMessages, Status: " .. tostring(Err))
		end)
	end
end
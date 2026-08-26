local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fFlagAppChatMessageTTIMilestonesModule = require(appChat.Flags.FFlagAppChatMessageTTIMilestones)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)

return function(p1, _, p2)
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), appChatNetworkingModule (ref)
	return function(p3)
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), p2 (ref), p1 (ref), appChatPerfTrackerModule (copy), appChatNetworkingModule (copy)
		local var1 = fFlagAppChatPerfTrackingModule and (fFlagAppChatMessageTTIMilestonesModule and p2 == nil)
		
		if var1 then
			local t = { conversationId = p1 }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch, t)
			appChatPerfTrackerModule.trackRequest(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "GetOlderMessages", t)
		end
		local var2 = p3:dispatch(appChatNetworkingModule.rodux.GetOlderMessages.API(p1, p2))
		
		if var1 then
			var2 = var2:tap(function()
				-- upvalues: p1 (copy), appChatPerfTrackerModule (copy)
				local t = { conversationId = p1 }
				appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, t)
				appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived, t)
			end)
		end
		return var2:catch(function(p4)
			warn("AppChatNetworking failure in getOlderMessages, Status: " .. tostring(p4))
		end)
	end
end
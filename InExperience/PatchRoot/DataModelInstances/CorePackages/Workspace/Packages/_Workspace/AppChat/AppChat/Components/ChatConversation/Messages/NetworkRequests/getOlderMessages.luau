local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fFlagAppChatMessageTTIMilestonesModule = require(appChat.Flags.FFlagAppChatMessageTTIMilestones)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)

return function(p0, _, p1)
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), appChatNetworkingModule (ref)
	return function(p2)
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), p1 (ref), p0 (ref), appChatPerfTrackerModule (copy), appChatNetworkingModule (copy)
		local var5 = fFlagAppChatPerfTrackingModule and (fFlagAppChatMessageTTIMilestonesModule and p1 == nil)
		
		if var5 then
			local t = { conversationId = p0 }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch, t)
			appChatPerfTrackerModule.trackRequest(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "GetOlderMessages", t)
		end
		local var7 = p2:dispatch(appChatNetworkingModule.rodux.GetOlderMessages.API(p0, p1))
		
		if var5 then
			var7 = var7:tap(function()
				-- upvalues: p0 (copy), appChatPerfTrackerModule (copy)
				local t = { conversationId = p0 }
				appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, t)
				appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived, t)
			end)
		end
		return var7:catch(function(p3)
			warn("AppChatNetworking failure in getOlderMessages, Status: " .. tostring(p3))
		end)
	end
end
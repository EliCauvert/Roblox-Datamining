local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local processConversationsModule = require(script.Parent.processConversations)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local loggerModule = require(appChat.Logger)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fFlagAppChatMessageTTIMilestonesModule = require(appChat.Flags.FFlagAppChatMessageTTIMilestones)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)

return function(p1)
	-- upvalues: loggerModule (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), appChatNetworkingModule (ref), processConversationsModule (ref), conversationChannelsModule (ref)
	return function(p2)
		-- upvalues: loggerModule (copy), p1 (ref), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), appChatNetworkingModule (copy), processConversationsModule (copy), conversationChannelsModule (copy)
		loggerModule:info("Fetching latest conversation details for conversationId: {}", p1)
		
		if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule then
			local t = { conversationId = p1 }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch, t)
			appChatPerfTrackerModule.trackRequest(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "GetConversationDetails", t)
		end
		return p2:dispatch(appChatNetworkingModule.rodux.GetConversationDetails.API(p1)):andThen(function(p3)
			-- upvalues: p2 (ref), processConversationsModule (copy), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), p1 (copy), appChatPerfTrackerModule (copy), conversationChannelsModule (copy)
			local responseBody = p3.responseBody
			assert(responseBody.conversations and #responseBody.conversations == 1, "Expected exactly one conversation in response body")
			p2:dispatch(processConversationsModule(responseBody.conversations))
			
			if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule then
				local t = { conversationId = p1 }
				appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, t)
				appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived, t)
			end
			return conversationChannelsModule.fromChannelsApi(responseBody.conversations[1])
		end):catch(function(p3)
			-- upvalues: loggerModule (copy)
			loggerModule:warning("Failure in fetchLatestConversationDetails, Status: " .. tostring(p3))
		end)
	end
end
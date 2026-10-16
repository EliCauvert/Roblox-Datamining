local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local ProcessConversationsModule = require(script.Parent.processConversations)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local LoggerModule = require(AppChat.Logger)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatMessageTTIMilestonesModule = require(AppChat.Flags.FFlagAppChatMessageTTIMilestones)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)

return function(ConversationId) --[[ Line: 18 ]]
	-- upvalues: LoggerModule (copy), FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), AppChatNetworkingModule (copy), ProcessConversationsModule (copy), ConversationChannelsModule (copy)
	return function(p1) --[[ Line: 19 ]]
		-- upvalues: LoggerModule (upval), ConversationId (copy), FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), AppChatPerfTrackerModule (upval), AppChatNetworkingModule (upval), ProcessConversationsModule (upval), ConversationChannelsModule (upval)
		LoggerModule:info("Fetching latest conversation details for conversationId: {}", ConversationId)
		
		if FFlagAppChatPerfTrackingModule and FFlagAppChatMessageTTIMilestonesModule then
			local config = { conversationId = ConversationId }
			AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, config)
			AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch, config)
			AppChatPerfTrackerModule.trackRequest(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "GetConversationDetails", config)
		end
		return p1:dispatch(AppChatNetworkingModule.rodux.GetConversationDetails.API(ConversationId)):andThen(function(Result) --[[ Line: 45 ]]
			-- upvalues: p1 (copy), ProcessConversationsModule (upval), FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), ConversationId (upval), AppChatPerfTrackerModule (upval), ConversationChannelsModule (upval)
			local ResponseBody = Result.responseBody
			assert(ResponseBody.conversations and #ResponseBody.conversations == 1, "Expected exactly one conversation in response body")
			p1:dispatch(ProcessConversationsModule(ResponseBody.conversations))
			
			if FFlagAppChatPerfTrackingModule and FFlagAppChatMessageTTIMilestonesModule then
				local config = { conversationId = ConversationId }
				AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, config)
				AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived, config)
			end
			return ConversationChannelsModule.fromChannelsApi(ResponseBody.conversations[1])
		end):catch(function(Err) --[[ Line: 72 ]]
			-- upvalues: LoggerModule (upval)
			LoggerModule:warning("Failure in fetchLatestConversationDetails, Status: " .. tostring(Err))
		end)
	end
end
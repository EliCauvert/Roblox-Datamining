local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local PromiseModule = require(Parent.Promise)
local ConstantsModule = require(AppChat.Constants)
local ReportToDiagByCountryCodeModule = require(AppChat.Utils.reportToDiagByCountryCode)
local NewResult = require(AppChat.Logger):new(script.Name)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatMessageTTIMilestonesModule = require(AppChat.Flags.FFlagAppChatMessageTTIMilestones)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)

local function _(p1) --[[ Line: 14 ]]
	-- upvalues: ReportToDiagByCountryCodeModule (copy), ConstantsModule (copy)
	ReportToDiagByCountryCodeModule(ConstantsModule.PerformanceMeasurement.LUA_CHAT_RECEIVE_MESSAGE, "MessageReceivedTime", tick() - p1)
end

return function(ConversationId, p1, p2) --[[ Line: 23 ]]
	-- upvalues: NewResult (copy), AppChatNetworkingModule (copy), FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), ReportToDiagByCountryCodeModule (copy), ConstantsModule (copy), PromiseModule (copy)
	NewResult:info("Getting new messages for {}", ConversationId)
	
	return function(p3) --[[ Line: 25 ]]
		-- upvalues: ConversationId (copy), AppChatNetworkingModule (upval), NewResult (upval), FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), p1 (copy), AppChatPerfTrackerModule (upval), p2 (copy), ReportToDiagByCountryCodeModule (upval), ConstantsModule (upval), PromiseModule (upval)
		local List = {}
		
		if not p3:getState().ChatAppReducer.Conversations[ConversationId] then
			table.insert(List, p3:dispatch(AppChatNetworkingModule.rodux.GetConversationDetails.API(ConversationId)):catch(function(Err) --[[ Line: 32 ]]
				-- upvalues: NewResult (upval)
				NewResult:error(`AppChatNetworking failure in GetConversationDetails: {tostring(Err)}`)
			end))
		end
		local NoP2: boolean = FFlagAppChatPerfTrackingModule and (FFlagAppChatMessageTTIMilestonesModule and not p1)
		
		if NoP2 then
			local config = { conversationId = ConversationId }
			AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.MessageReceiveTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, config)
			AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.MessageReceiveTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch, config)
			AppChatPerfTrackerModule.trackRequest(AppChatPerfTrackerModule.Events.MessageReceiveTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "GetNewerMessages", config)
		end
		table.insert(List, p3:dispatch(AppChatNetworkingModule.rodux.GetNewerMessages.API(ConversationId)):andThen(function() --[[ Line: 67 ]]
			-- upvalues: p2 (upval), ReportToDiagByCountryCodeModule (upval), ConstantsModule (upval), NoP2 (copy), ConversationId (upval), AppChatPerfTrackerModule (upval)
			ReportToDiagByCountryCodeModule(ConstantsModule.PerformanceMeasurement.LUA_CHAT_RECEIVE_MESSAGE, "MessageReceivedTime", tick() - p2)
			
			if NoP2 then
				local config = { conversationId = ConversationId }
				AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.MessageReceiveTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, config)
				AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.MessageReceiveTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived, config)
			end
		end):catch(function(Err) --[[ Line: 84 ]]
			-- upvalues: NewResult (upval)
			NewResult:error(`AppChatNetworking failure in GetNewerMessages: {tostring(Err)}`)
		end))
		
		return PromiseModule.allSettled(List)
	end
end
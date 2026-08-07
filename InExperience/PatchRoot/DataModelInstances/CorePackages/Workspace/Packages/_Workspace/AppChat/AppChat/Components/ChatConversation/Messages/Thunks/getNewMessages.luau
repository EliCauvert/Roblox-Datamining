local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
game:DefineFastFlag("AppChatChannelsGetNewerMessagesWithPrevCursor", false)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local promiseModule = require(parent.Promise)
local constantsModule = require(appChat.Constants)
local reportToDiagByCountryCodeModule = require(appChat.Utils.reportToDiagByCountryCode)
local name = require(appChat.Logger):new(script.Name)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fFlagAppChatMessageTTIMilestonesModule = require(appChat.Flags.FFlagAppChatMessageTTIMilestones)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)

local _ = function(p0) --[[ line: 16 ]]
	-- upvalues: reportToDiagByCountryCodeModule (ref), constantsModule (ref)
	reportToDiagByCountryCodeModule(constantsModule.PerformanceMeasurement.LUA_CHAT_RECEIVE_MESSAGE, "MessageReceivedTime", tick() - p0)
end

return function(p1, p2, p3) --[[ line: 25 ]]
	-- upvalues: name (ref), appChatNetworkingModule (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), reportToDiagByCountryCodeModule (ref), constantsModule (ref), promiseModule (ref)
	name:info("Getting new messages for {}", p1)
	
	return function(p4) --[[ line: 27 ]]
		-- upvalues: p1 (ref), appChatNetworkingModule (copy), name (copy), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), p2 (ref), appChatPerfTrackerModule (copy), p3 (ref), reportToDiagByCountryCodeModule (copy), constantsModule (copy), promiseModule (copy)
		local t = {}
		local var10 = p4:getState().ChatAppReducer.Conversations[p1]
		
		if not var10 then
			table.insert(t, p4:dispatch(appChatNetworkingModule.rodux.GetConversationDetails.API(p1)):catch(function(p5) --[[ line: 34 ]]
				-- upvalues: name (copy)
				name:error(`AppChatNetworking failure in GetConversationDetails: {tostring(p5)}`)
			end))
		end
		local var11 = if game:GetFastFlag("AppChatChannelsGetNewerMessagesWithPrevCursor") then if var10 then var10.previousCursor else nil else nil
		local var12 = fFlagAppChatPerfTrackingModule and (fFlagAppChatMessageTTIMilestonesModule and not p2)
		
		if var12 then
			local t_1 = { conversationId = p1 }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.MessageReceiveTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, t_1)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.MessageReceiveTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch, t_1)
			appChatPerfTrackerModule.trackRequest(appChatPerfTrackerModule.Events.MessageReceiveTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "GetNewerMessages", t_1)
		end
		table.insert(t, p4:dispatch(appChatNetworkingModule.rodux.GetNewerMessages.API(p1, var11)):andThen(function() --[[ line: 74 ]]
			-- upvalues: p3 (copy), reportToDiagByCountryCodeModule (copy), constantsModule (copy), var12 (ref), p1 (copy), appChatPerfTrackerModule (copy)
			reportToDiagByCountryCodeModule(constantsModule.PerformanceMeasurement.LUA_CHAT_RECEIVE_MESSAGE, "MessageReceivedTime", tick() - p3)
			
			if var12 then
				local t = { conversationId = p1 }
				appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.MessageReceiveTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, t)
				appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.MessageReceiveTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived, t)
			end
		end):catch(function(p6) --[[ line: 91 ]]
			-- upvalues: name (copy)
			name:error(`AppChatNetworking failure in GetNewerMessages: {tostring(p6)}`)
		end))
		
		return promiseModule.allSettled(t)
	end
end
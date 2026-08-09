local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local requestTimeDiag = require(parent.Analytics).RequestTimeDiag
local constantsModule = require(appChat.Constants)
local promiseModule = require(parent.Promise)
local statusCodes = require(parent.Http).StatusCodes
local responseStatus = require(parent.AppChatNetworking).Constants.ResponseStatus
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fFlagAppChatMessageTTIMilestonesModule = require(appChat.Flags.FFlagAppChatMessageTTIMilestones)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)

return function(p0, _) --[[ line: 14 ]]
	-- upvalues: requestTimeDiag (ref), constantsModule (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), statusCodes (ref), responseStatus (ref), promiseModule (ref)
	local lua_chat_send_message = requestTimeDiag:new(constantsModule.PerformanceMeasurement.LUA_CHAT_SEND_MESSAGE)
	
	return function(p1) --[[ line: 17 ]]
		-- upvalues: p0 (ref), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), lua_chat_send_message (ref), statusCodes (copy), responseStatus (copy), promiseModule (copy)
		p0:onBeforeSendingMessage(p1)
		
		if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule then
			local t = { conversationId = p0.conversationId }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch, t)
			appChatPerfTrackerModule.trackRequest(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "SendChatTextMessage", t)
		end
		return p0:sendMessage(p1):andThen(function(p4) --[[ line: 43 ]]
			-- upvalues: lua_chat_send_message (copy), statusCodes (copy), responseStatus (copy), promiseModule (copy)
			lua_chat_send_message:report()
			
			return if p4 and p4.responseBody and (p4.responseCode == statusCodes.OK and p4.responseBody.messages) and #p4.responseBody.messages ~= 0 and (not p4.responseBody.messages[1].status or p4.responseBody.messages[1].status == "" or p4.responseBody.messages[1].status == responseStatus.SUCCESS) then p4 else promiseModule.reject(p4)
		end):andThen(function(p3) --[[ line: 64 ]]
			-- upvalues: p0 (copy), p1 (ref)
			return p0:onSuccess(p1, p3)
		end):catch(function(p2) --[[ line: 67 ]]
			-- upvalues: p0 (copy), p1 (ref)
			return p0:onFailure(p1, p2)
		end)
	end
end
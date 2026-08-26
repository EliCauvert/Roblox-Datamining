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
local fFlagAppChatCatchSendMessageSyncErrorModule = require(appChat.Flags.FFlagAppChatCatchSendMessageSyncError)
local name = require(appChat.Logger):new(script.Name)

local function invokeSendMessage(p1, p2)
	-- upvalues: fFlagAppChatCatchSendMessageSyncErrorModule (ref), name (ref), promiseModule (ref)
	if not fFlagAppChatCatchSendMessageSyncErrorModule then
		return p1:sendMessage(p2)
	end
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref)
		return p1:sendMessage(p2)
	end)
	
	if ok then
		return status
	end
	name:error("sendPolicy:sendMessage threw synchronously: {}", tostring(status))
	
	return promiseModule.reject({ sendMessageSyncError = tostring(status) })
end

return function(p1, _)
	-- upvalues: requestTimeDiag (ref), constantsModule (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), invokeSendMessage (ref), statusCodes (ref), responseStatus (ref), promiseModule (ref)
	local lua_chat_send_message = requestTimeDiag:new(constantsModule.PerformanceMeasurement.LUA_CHAT_SEND_MESSAGE)
	
	return function(p2)
		-- upvalues: p1 (ref), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), invokeSendMessage (copy), lua_chat_send_message (ref), statusCodes (copy), responseStatus (copy), promiseModule (copy)
		p1:onBeforeSendingMessage(p2)
		
		if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule then
			local t = { conversationId = p1.conversationId }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch, t)
			appChatPerfTrackerModule.trackRequest(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "SendChatTextMessage", t)
		end
		return invokeSendMessage(p1, p2):andThen(function(p3)
			-- upvalues: lua_chat_send_message (copy), statusCodes (copy), responseStatus (copy), promiseModule (copy)
			lua_chat_send_message:report()
			
			return if p3 and p3.responseBody and (p3.responseCode == statusCodes.OK and p3.responseBody.messages) and #p3.responseBody.messages ~= 0 and (not p3.responseBody.messages[1].status or p3.responseBody.messages[1].status == "" or p3.responseBody.messages[1].status == responseStatus.SUCCESS) then p3 else promiseModule.reject(p3)
		end):andThen(function(p3)
			-- upvalues: p1 (copy), p2 (ref)
			return p1:onSuccess(p2, p3)
		end):catch(function(p3)
			-- upvalues: p1 (copy), p2 (ref)
			return p1:onFailure(p2, p3)
		end)
	end
end
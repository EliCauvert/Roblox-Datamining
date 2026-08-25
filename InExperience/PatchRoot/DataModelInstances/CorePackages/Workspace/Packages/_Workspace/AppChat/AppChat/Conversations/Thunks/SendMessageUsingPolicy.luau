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

local function invokeSendMessage(p0, p1)
	-- upvalues: fFlagAppChatCatchSendMessageSyncErrorModule (ref), name (ref), promiseModule (ref)
	if not fFlagAppChatCatchSendMessageSyncErrorModule then
		return p0:sendMessage(p1)
	end
	local ok, status = pcall(function()
		-- upvalues: p0 (ref), p1 (ref)
		return p0:sendMessage(p1)
	end)
	
	if ok then
		return status
	end
	name:error("sendPolicy:sendMessage threw synchronously: {}", tostring(status))
	
	return promiseModule.reject({ sendMessageSyncError = tostring(status) })
end

return function(p2, _)
	-- upvalues: requestTimeDiag (ref), constantsModule (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), invokeSendMessage (ref), statusCodes (ref), responseStatus (ref), promiseModule (ref)
	local lua_chat_send_message = requestTimeDiag:new(constantsModule.PerformanceMeasurement.LUA_CHAT_SEND_MESSAGE)
	
	return function(p3)
		-- upvalues: p2 (ref), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), invokeSendMessage (copy), lua_chat_send_message (ref), statusCodes (copy), responseStatus (copy), promiseModule (copy)
		p2:onBeforeSendingMessage(p3)
		
		if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule then
			local t = { conversationId = p2.conversationId }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch, t)
			appChatPerfTrackerModule.trackRequest(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "SendChatTextMessage", t)
		end
		return invokeSendMessage(p2, p3):andThen(function(p6)
			-- upvalues: lua_chat_send_message (copy), statusCodes (copy), responseStatus (copy), promiseModule (copy)
			lua_chat_send_message:report()
			
			return if p6 and p6.responseBody and (p6.responseCode == statusCodes.OK and p6.responseBody.messages) and #p6.responseBody.messages ~= 0 and (not p6.responseBody.messages[1].status or p6.responseBody.messages[1].status == "" or p6.responseBody.messages[1].status == responseStatus.SUCCESS) then p6 else promiseModule.reject(p6)
		end):andThen(function(p5)
			-- upvalues: p2 (copy), p3 (ref)
			return p2:onSuccess(p3, p5)
		end):catch(function(p4)
			-- upvalues: p2 (copy), p3 (ref)
			return p2:onFailure(p3, p4)
		end)
	end
end
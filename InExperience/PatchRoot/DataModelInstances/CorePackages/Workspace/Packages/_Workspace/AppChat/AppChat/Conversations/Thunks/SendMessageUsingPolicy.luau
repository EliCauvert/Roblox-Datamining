local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RequestTimeDiag = require(Parent.Analytics).RequestTimeDiag
local ConstantsModule = require(AppChat.Constants)
local PromiseModule = require(Parent.Promise)
local StatusCodes = require(Parent.Http).StatusCodes
local ResponseStatus = require(Parent.AppChatNetworking).Constants.ResponseStatus
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatMessageTTIMilestonesModule = require(AppChat.Flags.FFlagAppChatMessageTTIMilestones)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local NewResult = require(AppChat.Logger):new(script.Name)

local function invokeSendMessage(p1, p2)
	-- upvalues: NewResult (copy), PromiseModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy), p2 (copy)
		return p1:sendMessage(p2)
	end)
	
	if Success then
		return Result
	else
		NewResult:error("sendPolicy:sendMessage threw synchronously: {}", (tostring(Result)))
		
		return PromiseModule.reject({ sendMessageSyncError = tostring(Result) })
	end
end

return function(p1, _)
	-- upvalues: RequestTimeDiag (copy), ConstantsModule (copy), FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), invokeSendMessage (copy), StatusCodes (copy), ResponseStatus (copy), PromiseModule (copy)
	local NewResult = RequestTimeDiag:new(ConstantsModule.PerformanceMeasurement.LUA_CHAT_SEND_MESSAGE)
	
	return function(p2)
		-- upvalues: p1 (copy), FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), AppChatPerfTrackerModule (upval), invokeSendMessage (upval), NewResult (copy), StatusCodes (upval), ResponseStatus (upval), PromiseModule (upval)
		p1:onBeforeSendingMessage(p2)
		
		if FFlagAppChatPerfTrackingModule and FFlagAppChatMessageTTIMilestonesModule then
			local config = { conversationId = p1.conversationId }
			AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.MessageSendTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, config)
			AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.MessageSendTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch, config)
			AppChatPerfTrackerModule.trackRequest(AppChatPerfTrackerModule.Events.MessageSendTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "SendChatTextMessage", config)
		end
		return invokeSendMessage(p1, p2):andThen(function(Result)
			-- upvalues: NewResult (upval), StatusCodes (upval), ResponseStatus (upval), PromiseModule (upval)
			NewResult:report()
			
			return if Result and Result.responseBody and Result.responseCode == StatusCodes.OK and Result.responseBody.messages and #Result.responseBody.messages ~= 0 and (not Result.responseBody.messages[1].status or Result.responseBody.messages[1].status == "" or Result.responseBody.messages[1].status == ResponseStatus.SUCCESS) then Result else PromiseModule.reject(Result)
		end):andThen(function(Result)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:onSuccess(p2, Result)
		end):catch(function(Err)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:onFailure(p2, Err)
		end)
	end
end
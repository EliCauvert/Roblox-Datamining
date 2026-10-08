local eventNamesModule = require(script.Parent.EventNames)
local realtimeEventNamesModule = require(script.Parent.RealtimeEventNames)
local realtimeTelemetryActionListModule = require(script.Parent.RealtimeTelemetryActionList)
local realtimeTelemetryEmitterModule = require(script.Parent.realtimeTelemetryEmitter)
local t = {
	[eventNamesModule.MomentCommentsListLoadAttempted] = {
		status = "attempted",
		counter = realtimeEventNamesModule.MomentsCommentsListLoad
	},
	[eventNamesModule.MomentCommentsListLoadSucceeded] = {
		status = "succeeded",
		counter = realtimeEventNamesModule.MomentsCommentsListLoad
	},
	[eventNamesModule.MomentCommentsListLoadFailed] = {
		status = "failed",
		counter = realtimeEventNamesModule.MomentsCommentsListLoad
	},
	[eventNamesModule.MomentCommentPostAttempted] = {
		status = "attempted",
		counter = realtimeEventNamesModule.MomentsCommentPost
	},
	[eventNamesModule.MomentCommentPostResult] = {
		statusField = "outcome",
		counter = realtimeEventNamesModule.MomentsCommentPost
	}
}
local t_1 = {
	[realtimeEventNamesModule.MomentsCommentReaction] = true,
	[realtimeEventNamesModule.MomentsCommentDelete] = true,
	[realtimeEventNamesModule.MomentsCommentReport] = true,
	[realtimeEventNamesModule.MomentsCommentAuthorBlock] = true
}

local function _(p1, p2, p3)
	-- upvalues: realtimeTelemetryEmitterModule (ref), realtimeTelemetryActionListModule (ref)
	;(p3 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[p1], p2)
end

return {
	reportMomentsComments = function(p1, p2, p3)
		-- upvalues: t (ref), realtimeTelemetryEmitterModule (ref), realtimeTelemetryActionListModule (ref)
		local var1 = t[p1]
		
		if var1 == nil then return end
		local status = var1.status
		
		if status == nil and var1.statusField ~= nil then
			status = p2[var1.statusField]
		end;
		(p3 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[var1.counter], {
			status = status or "",
			loadType = p2.loadType,
			surface = p2.surface or "",
			failureReason = p2.failureReason
		})
	end,
	reportMomentsCommentAction = function(p1, p2, p3)
		-- upvalues: t_1 (ref), realtimeTelemetryEmitterModule (ref), realtimeTelemetryActionListModule (ref)
		if t_1[p1] then
			(p3 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[p1], {
				status = p2.status or "",
				action = p2.action,
				surface = p2.surface or "",
				failureReason = p2.failureReason
			})
			
			return
		end
	end
}
local EventNamesModule = require(script.Parent.EventNames)
local RealtimeEventNamesModule = require(script.Parent.RealtimeEventNames)
local RealtimeTelemetryActionListModule = require(script.Parent.RealtimeTelemetryActionList)
local RealtimeTelemetryEmitterModule = require(script.Parent.realtimeTelemetryEmitter)
local config = {
	[EventNamesModule.MomentCommentsListLoadAttempted] = {
		status = "attempted",
		counter = RealtimeEventNamesModule.MomentsCommentsListLoad
	},
	[EventNamesModule.MomentCommentsListLoadSucceeded] = {
		status = "succeeded",
		counter = RealtimeEventNamesModule.MomentsCommentsListLoad
	},
	[EventNamesModule.MomentCommentsListLoadFailed] = {
		status = "failed",
		counter = RealtimeEventNamesModule.MomentsCommentsListLoad
	},
	[EventNamesModule.MomentCommentPostAttempted] = {
		status = "attempted",
		counter = RealtimeEventNamesModule.MomentsCommentPost
	},
	[EventNamesModule.MomentCommentPostResult] = {
		statusField = "outcome",
		counter = RealtimeEventNamesModule.MomentsCommentPost
	}
}
local config1 = {
	[RealtimeEventNamesModule.MomentsCommentReaction] = true,
	[RealtimeEventNamesModule.MomentsCommentDelete] = true,
	[RealtimeEventNamesModule.MomentsCommentReport] = true,
	[RealtimeEventNamesModule.MomentsCommentAuthorBlock] = true
}

local function _(p1, p2, p3)
	-- upvalues: RealtimeTelemetryEmitterModule (copy), RealtimeTelemetryActionListModule (copy)
	(p3 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[p1], p2)
end

return {
	reportMomentsComments = function(p1, p2, p3)
		-- upvalues: config (copy), RealtimeTelemetryEmitterModule (copy), RealtimeTelemetryActionListModule (copy)
		local Entry = config[p1]
		
		if Entry == nil then return end
		local Status = Entry.status
		
		if Status == nil and Entry.statusField ~= nil then
			Status = p2[Entry.statusField]
		end;
		(p3 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[Entry.counter], {
			status = Status or "",
			loadType = p2.loadType,
			surface = p2.surface or "",
			failureReason = p2.failureReason
		})
	end,
	reportMomentsCommentAction = function(p1, p2, p3)
		-- upvalues: config1 (copy), RealtimeTelemetryEmitterModule (copy), RealtimeTelemetryActionListModule (copy)
		if config1[p1] then
			(p3 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[p1], {
				status = p2.status or "",
				action = p2.action,
				surface = p2.surface or "",
				failureReason = p2.failureReason
			})
			
			return
		end
	end
}
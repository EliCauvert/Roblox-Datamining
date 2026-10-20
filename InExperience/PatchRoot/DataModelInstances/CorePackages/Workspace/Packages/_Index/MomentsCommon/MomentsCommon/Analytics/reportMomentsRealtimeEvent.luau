local RealtimeEventNamesModule = require(script.Parent.RealtimeEventNames)
local RealtimeTelemetryActionListModule = require(script.Parent.RealtimeTelemetryActionList)
local RealtimeTelemetryEmitterModule = require(script.Parent.realtimeTelemetryEmitter)

local function _(p1, p2, p3)
	-- upvalues: RealtimeTelemetryEmitterModule (copy)
	(p3 or RealtimeTelemetryEmitterModule.emit)(p1, p2)
end

return {
	reportMomentsFeedLoadAttempt = function(FeedType, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsFeedLoadAttempt], { feedType = FeedType })
	end,
	reportMomentsFeedLoadMore = function(Status, FeedType, FailureReason, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsFeedLoadMore], {
			status = Status,
			feedType = FeedType,
			failureReason = FailureReason
		})
	end,
	reportMomentsFeedMediaLoad = function(Status, FeedType, FailureReason, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsFeedMediaLoad], {
			status = Status,
			feedType = FeedType,
			failureReason = FailureReason
		})
	end,
	reportMomentsFeedState = function(Status, FeedType, FailureReason, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsFeedState], {
			status = Status,
			feedType = FeedType,
			failureReason = FailureReason
		})
	end,
	reportMomentsSurfaceLoadAbort = function(Reason, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsSurfaceLoadAbort], { reason = Reason })
	end,
	reportMomentsViewBegan = function(Source, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsViewBegan], { source = Source })
	end,
	reportMomentsSessionStarted = function(Source, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsSessionStarted], { source = Source })
	end,
	reportMomentsSessionEnded = function(Source, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsSessionEnded], { source = Source })
	end,
	reportMomentsSessionHeartbeat = function(Source, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsSessionHeartbeat], { source = Source })
	end,
	reportMomentsEngagement = function(Action, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsEngagement], { action = Action })
	end,
	reportMomentsCreationStep = function(Step, Status, Reason, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsCreationStep], { step = Step, status = Status, reason = Reason })
	end,
	reportMomentsFeedItemsReceived = function(FeedType, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsFeedItemsReceived], { feedType = FeedType })
	end,
	reportMomentsFeedItemFiltered = function(Reason, FeedType, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsFeedItemFiltered], { reason = Reason, feedType = FeedType })
	end,
	reportMomentsPublishedWithEdit = function(EditType, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsPublishedWithEdit], { editType = EditType })
	end,
	reportMomentsPublishedEditCount = function(p1: number, p2)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p2 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsPublishedEditCount], {
			bucket = if p1 >= 3 then "3plus" elseif p1 == 2 then "2" elseif p1 == 1 then "1" else "0"
		})
	end,
	reportMomentsPublishedByCaptureType = function(CaptureType, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsPublishedByCaptureType], { captureType = CaptureType })
	end,
	reportMomentsEditToolOpened = function(Tool, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsEditToolOpened], { tool = Tool })
	end,
	reportMomentsEditToolAbandoned = function(Tool, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsEditToolAbandoned], { tool = Tool })
	end,
	reportMomentsGenerateText = function(Status, p1)
		-- upvalues: RealtimeTelemetryActionListModule (copy), RealtimeEventNamesModule (copy), RealtimeTelemetryEmitterModule (copy)
		(p1 or RealtimeTelemetryEmitterModule.emit)(RealtimeTelemetryActionListModule[RealtimeEventNamesModule.MomentsGenerateText], { status = Status })
	end
}
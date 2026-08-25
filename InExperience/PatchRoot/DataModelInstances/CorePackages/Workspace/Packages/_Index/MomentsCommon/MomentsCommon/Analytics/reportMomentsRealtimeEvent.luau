local realtimeEventNamesModule = require(script.Parent.RealtimeEventNames)
local realtimeTelemetryActionListModule = require(script.Parent.RealtimeTelemetryActionList)
local realtimeTelemetryEmitterModule = require(script.Parent.realtimeTelemetryEmitter)

local function _(p1, p2, p3)
	-- upvalues: realtimeTelemetryEmitterModule (ref)
	;(p3 or realtimeTelemetryEmitterModule.emit)(p1, p2)
end

return {
	reportMomentsFeedLoadAttempt = function(p1, p2)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p2 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedLoadAttempt], { feedType = p1 })
	end,
	reportMomentsFeedLoadMore = function(p1, p2, p3, p4)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p4 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedLoadMore], { status = p1, feedType = p2, failureReason = p3 })
	end,
	reportMomentsFeedMediaLoad = function(p1, p2, p3, p4)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p4 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedMediaLoad], { status = p1, feedType = p2, failureReason = p3 })
	end,
	reportMomentsFeedState = function(p1, p2, p3, p4)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p4 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedState], { status = p1, feedType = p2, failureReason = p3 })
	end,
	reportMomentsSurfaceLoadAbort = function(p1, p2)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p2 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsSurfaceLoadAbort], { reason = p1 })
	end,
	reportMomentsViewBegan = function(p1, p2)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p2 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsViewBegan], { source = p1 })
	end,
	reportMomentsSessionStarted = function(p1, p2)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p2 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsSessionStarted], { source = p1 })
	end,
	reportMomentsSessionEnded = function(p1, p2)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p2 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsSessionEnded], { source = p1 })
	end,
	reportMomentsSessionHeartbeat = function(p1, p2)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p2 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsSessionHeartbeat], { source = p1 })
	end,
	reportMomentsEngagement = function(p1, p2)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p2 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsEngagement], { action = p1 })
	end,
	reportMomentsCreationStep = function(p1, p2, p3, p4)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p4 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsCreationStep], { step = p1, status = p2, reason = p3 })
	end,
	reportMomentsFeedItemsReceived = function(p1, p2)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p2 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedItemsReceived], { feedType = p1 })
	end,
	reportMomentsFeedItemFiltered = function(p1, p2, p3)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p3 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedItemFiltered], { reason = p1, feedType = p2 })
	end,
	reportMomentsPublishedWithEdit = function(p1, p2)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p2 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsPublishedWithEdit], { editType = p1 })
	end,
	reportMomentsPublishedEditCount = function(p1, p2)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p2 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsPublishedEditCount], {
			bucket = if p1 >= 3 then "3plus" elseif p1 == 2 then "2" elseif p1 == 1 then "1" else "0"
		})
	end,
	reportMomentsPublishedByCaptureType = function(p1, p2)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p2 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsPublishedByCaptureType], { captureType = p1 })
	end,
	reportMomentsEditToolOpened = function(p1, p2)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p2 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsEditToolOpened], { tool = p1 })
	end,
	reportMomentsEditToolAbandoned = function(p1, p2)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p2 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsEditToolAbandoned], { tool = p1 })
	end,
	reportMomentsGenerateText = function(p1, p2)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p2 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsGenerateText], { status = p1 })
	end
}
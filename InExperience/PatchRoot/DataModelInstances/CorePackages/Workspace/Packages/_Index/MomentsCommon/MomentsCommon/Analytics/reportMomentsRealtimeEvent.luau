local realtimeEventNamesModule = require(script.Parent.RealtimeEventNames)
local realtimeTelemetryActionListModule = require(script.Parent.RealtimeTelemetryActionList)
local realtimeTelemetryEmitterModule = require(script.Parent.realtimeTelemetryEmitter)

local function _(p0, p1, p2)
	-- upvalues: realtimeTelemetryEmitterModule (ref)
	;(p2 or realtimeTelemetryEmitterModule.emit)(p0, p1)
end

return {
	reportMomentsFeedLoadAttempt = function(p3, p4)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p4 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedLoadAttempt], { feedType = p3 })
	end,
	reportMomentsFeedLoadMore = function(p5, p6, p7, p8)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p8 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedLoadMore], { status = p5, feedType = p6, failureReason = p7 })
	end,
	reportMomentsFeedMediaLoad = function(p9, p10, p11, p12)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p12 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedMediaLoad], { status = p9, feedType = p10, failureReason = p11 })
	end,
	reportMomentsFeedState = function(p13, p14, p15, p16)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p16 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedState], { status = p13, feedType = p14, failureReason = p15 })
	end,
	reportMomentsSurfaceLoadAbort = function(p17, p18)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p18 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsSurfaceLoadAbort], { reason = p17 })
	end,
	reportMomentsViewBegan = function(p19, p20)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p20 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsViewBegan], { source = p19 })
	end,
	reportMomentsSessionStarted = function(p21, p22)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p22 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsSessionStarted], { source = p21 })
	end,
	reportMomentsSessionEnded = function(p23, p24)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p24 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsSessionEnded], { source = p23 })
	end,
	reportMomentsSessionHeartbeat = function(p25, p26)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p26 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsSessionHeartbeat], { source = p25 })
	end,
	reportMomentsEngagement = function(p27, p28)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p28 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsEngagement], { action = p27 })
	end,
	reportMomentsCreationStep = function(p29, p30, p31)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p31 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsCreationStep], { step = p29, status = p30 })
	end,
	reportMomentsFeedItemsReceived = function(p32, p33)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p33 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedItemsReceived], { feedType = p32 })
	end,
	reportMomentsFeedItemFiltered = function(p34, p35, p36)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p36 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedItemFiltered], { reason = p34, feedType = p35 })
	end,
	reportMomentsPublishedWithEdit = function(p37, p38)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p38 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsPublishedWithEdit], { editType = p37 })
	end,
	reportMomentsPublishedEditCount = function(p39, p40)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p40 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsPublishedEditCount], {
			bucket = if p39 >= 3 then "3plus" elseif p39 == 2 then "2" elseif p39 == 1 then "1" else "0"
		})
	end,
	reportMomentsPublishedByCaptureType = function(p41, p42)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p42 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsPublishedByCaptureType], { captureType = p41 })
	end,
	reportMomentsEditToolOpened = function(p43, p44)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p44 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsEditToolOpened], { tool = p43 })
	end,
	reportMomentsEditToolAbandoned = function(p45, p46)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p46 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsEditToolAbandoned], { tool = p45 })
	end,
	reportMomentsGenerateText = function(p47, p48)
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p48 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsGenerateText], { status = p47 })
	end
}
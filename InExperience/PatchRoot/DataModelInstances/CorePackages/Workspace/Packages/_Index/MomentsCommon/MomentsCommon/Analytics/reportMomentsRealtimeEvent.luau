local realtimeEventNamesModule = require(script.Parent.RealtimeEventNames)
local realtimeTelemetryActionListModule = require(script.Parent.RealtimeTelemetryActionList)
local realtimeTelemetryEmitterModule = require(script.Parent.realtimeTelemetryEmitter)

local function _(p0, p1, p2) --[[ line: 13 | named "emit" ]]
	-- upvalues: realtimeTelemetryEmitterModule (ref)
	;(p2 or realtimeTelemetryEmitterModule.emit)(p0, p1)
end

return {
	reportMomentsFeedLoadAttempt = function(p3, p4) --[[ line: 18 ]]
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p4 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedLoadAttempt], { feedType = p3 })
	end,
	reportMomentsFeedLoadMore = function(p5, p6, p7, p8) --[[ line: 32 ]]
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p8 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedLoadMore], { status = p5, feedType = p6, failureReason = p7 })
	end,
	reportMomentsFeedMediaLoad = function(p9, p10, p11, p12) --[[ line: 45 ]]
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p12 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedMediaLoad], { status = p9, feedType = p10, failureReason = p11 })
	end,
	reportMomentsFeedState = function(p13, p14, p15, p16) --[[ line: 24 ]]
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p16 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsFeedState], { status = p13, feedType = p14, failureReason = p15 })
	end,
	reportMomentsSurfaceLoadAbort = function(p17, p18) --[[ line: 58 ]]
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p18 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsSurfaceLoadAbort], { reason = p17 })
	end,
	reportMomentsViewBegan = function(p19, p20) --[[ line: 62 ]]
		-- upvalues: realtimeTelemetryActionListModule (ref), realtimeEventNamesModule (ref), realtimeTelemetryEmitterModule (ref)
		;(p20 or realtimeTelemetryEmitterModule.emit)(realtimeTelemetryActionListModule[realtimeEventNamesModule.MomentsViewBegan], { source = p19 })
	end
}
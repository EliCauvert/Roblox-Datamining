local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(script.Parent.FeedTypes)
local SwipeLatencyMachineModule = require(script.Parent.swipeLatencyMachine)
local Analytics = require(Parent.MomentsCommon).Analytics
local config = {
	video = "video",
	screenshot = "screenshot",
	unknown = "unknown"
}
local MomentsSwipeLatencyCapMs = game:DefineFastInt("MomentsSwipeLatencyCapMs", 15000)

local function fireSwipeLatency(p1, p2, p3) --[[ Line: 58 ]]
	-- upvalues: Analytics (copy), config (copy)
	Analytics.fireAnalyticsEvent(Analytics.EventNames.MomentsSwipeLatency, {
		mediaWaitMs = tostring(p1),
		totalLatencyMs = tostring(p2),
		captureType = config[p3.captureType] or "unknown"
	})
end

return function(p1) --[[ Line: 66 | Named "useSwipeLatency" ]]
	-- upvalues: ReactModule (copy), fireSwipeLatency (copy), SwipeLatencyMachineModule (copy), MomentsSwipeLatencyCapMs (copy), SignalsModule (copy)
	local GetIsSettledFunction = p1.getIsSettled
	local GetHasPresentedFrameFunction = p1.getHasPresentedFrame
	local GetTargetHasPresentedFrameFunction = p1.getTargetHasPresentedFrame
	local GetCaptureTypeFunction = p1.getCaptureType
	local UseRefResult = ReactModule.useRef(p1.onMeasurement or fireSwipeLatency)
	UseRefResult.current = p1.onMeasurement or fireSwipeLatency
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 80 ]]
		-- upvalues: p1 (copy), SwipeLatencyMachineModule (upval), MomentsSwipeLatencyCapMs (upval), UseRefResult (copy)
		return SwipeLatencyMachineModule({
			now = p1.now or function(): number --[[ Line: 81 ]]
				return os.clock() * 1000
			end,
			capMs = p1.capMs or MomentsSwipeLatencyCapMs,
			onMeasurement = function(p2, p3, p4) --[[ Line: 87 ]]
				-- upvalues: UseRefResult (upval)
				UseRefResult.current(p2, p3, p4)
			end
		})
	end, {})
	local UseResult = ReactModule.useCallback(function(_, _, p2) --[[ Line: 93 ]]
		-- upvalues: UseMemoResult (copy), GetIsSettledFunction (copy), GetTargetHasPresentedFrameFunction (copy), GetCaptureTypeFunction (copy)
		UseMemoResult.start(GetIsSettledFunction(false), GetTargetHasPresentedFrameFunction(p2), { captureType = GetCaptureTypeFunction(p2) })
	end, {
		UseMemoResult,
		GetIsSettledFunction,
		GetTargetHasPresentedFrameFunction,
		GetCaptureTypeFunction
	})
	ReactModule.useEffect(function() --[[ Line: 100 ]]
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), GetIsSettledFunction (copy), GetHasPresentedFrameFunction (copy)
		return (SignalsModule.createEffect(function(p2) --[[ Line: 101 ]]
			-- upvalues: UseMemoResult (upval), GetIsSettledFunction (upval), GetHasPresentedFrameFunction (upval)
			UseMemoResult.update(GetIsSettledFunction(p2), GetHasPresentedFrameFunction(p2))
		end))
	end, {
		GetIsSettledFunction,
		GetHasPresentedFrameFunction,
		UseMemoResult
	})
	
	return UseResult
end
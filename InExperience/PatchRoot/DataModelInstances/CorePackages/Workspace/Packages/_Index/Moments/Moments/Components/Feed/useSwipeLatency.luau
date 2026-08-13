local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(script.Parent.FeedTypes)
local swipeLatencyMachineModule = require(script.Parent.swipeLatencyMachine)
local analytics = momentsCommonModule.Analytics
local t = {
	video = "video",
	screenshot = "screenshot",
	unknown = "unknown"
}
local momentsSwipeLatencyCapMs = game:DefineFastInt("MomentsSwipeLatencyCapMs", 15000)

local function fireSwipeLatency(p0, p1, p2) --[[ line: 58 ]]
	-- upvalues: analytics (ref), t (ref)
	analytics.fireAnalyticsEvent(analytics.EventNames.MomentsSwipeLatency, {
		mediaWaitMs = tostring(p0),
		totalLatencyMs = tostring(p1),
		captureType = t[p2.captureType] or "unknown"
	})
end

return function(p3) --[[ line: 66 | named "useSwipeLatency" ]]
	-- upvalues: reactModule (ref), fireSwipeLatency (ref), swipeLatencyMachineModule (ref), momentsSwipeLatencyCapMs (ref), signalsModule (ref)
	local getIsSettled = p3.getIsSettled
	local getHasPresentedFrame = p3.getHasPresentedFrame
	local getTargetHasPresentedFrame = p3.getTargetHasPresentedFrame
	local getCaptureType = p3.getCaptureType
	local var7 = reactModule.useRef(p3.onMeasurement or fireSwipeLatency)
	var7.current = p3.onMeasurement or fireSwipeLatency
	local var8 = reactModule.useMemo(function() --[[ line: 80 ]]
		-- upvalues: p3 (ref), swipeLatencyMachineModule (copy), momentsSwipeLatencyCapMs (copy), var7 (ref)
		return swipeLatencyMachineModule({
			now = p3.now or function() --[[ line: 81 ]]
				return os.clock() * 1000
			end,
			capMs = p3.capMs or momentsSwipeLatencyCapMs,
			onMeasurement = function(p4, p5, p6) --[[ line: 87 ]]
				-- upvalues: var7 (copy)
				var7.current(p4, p5, p6)
			end
		})
	end, {})
	local var9 = reactModule.useCallback(function(_, _, p7) --[[ line: 93 ]]
		-- upvalues: var8 (ref), getIsSettled (ref), getTargetHasPresentedFrame (ref), getCaptureType (ref)
		var8.start(getIsSettled(false), getTargetHasPresentedFrame(p7), { captureType = getCaptureType(p7) })
	end, {
		var8,
		getIsSettled,
		getTargetHasPresentedFrame,
		getCaptureType
	})
	reactModule.useEffect(function() --[[ line: 100 ]]
		-- upvalues: signalsModule (copy), var8 (ref), getIsSettled (ref), getHasPresentedFrame (ref)
		return signalsModule.createEffect(function(p8) --[[ line: 101 ]]
			-- upvalues: var8 (copy), getIsSettled (copy), getHasPresentedFrame (copy)
			var8.update(getIsSettled(p8), getHasPresentedFrame(p8))
		end)
	end, { getIsSettled, getHasPresentedFrame, var8 })
	
	return var9
end
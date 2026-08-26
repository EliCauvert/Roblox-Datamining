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

local function fireSwipeLatency(p1, p2, p3)
	-- upvalues: analytics (ref), t (ref)
	analytics.fireAnalyticsEvent(analytics.EventNames.MomentsSwipeLatency, {
		mediaWaitMs = tostring(p1),
		totalLatencyMs = tostring(p2),
		captureType = t[p3.captureType] or "unknown"
	})
end

return function(p1)
	-- upvalues: reactModule (ref), fireSwipeLatency (ref), swipeLatencyMachineModule (ref), momentsSwipeLatencyCapMs (ref), signalsModule (ref)
	local getIsSettled = p1.getIsSettled
	local getHasPresentedFrame = p1.getHasPresentedFrame
	local getTargetHasPresentedFrame = p1.getTargetHasPresentedFrame
	local getCaptureType = p1.getCaptureType
	local var1 = reactModule.useRef(p1.onMeasurement or fireSwipeLatency)
	var1.current = p1.onMeasurement or fireSwipeLatency
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), swipeLatencyMachineModule (copy), momentsSwipeLatencyCapMs (copy), var1 (ref)
		return swipeLatencyMachineModule({
			now = p1.now or function()
				return os.clock() * 1000
			end,
			capMs = p1.capMs or momentsSwipeLatencyCapMs,
			onMeasurement = function(p2, p3, p4)
				-- upvalues: var1 (copy)
				var1.current(p2, p3, p4)
			end
		})
	end, {})
	local var3 = reactModule.useCallback(function(_, _, p2)
		-- upvalues: var2 (ref), getIsSettled (ref), getTargetHasPresentedFrame (ref), getCaptureType (ref)
		var2.start(getIsSettled(false), getTargetHasPresentedFrame(p2), { captureType = getCaptureType(p2) })
	end, {
		var2,
		getIsSettled,
		getTargetHasPresentedFrame,
		getCaptureType
	})
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var2 (ref), getIsSettled (ref), getHasPresentedFrame (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var2 (copy), getIsSettled (copy), getHasPresentedFrame (copy)
			var2.update(getIsSettled(p2), getHasPresentedFrame(p2))
		end)
	end, { getIsSettled, getHasPresentedFrame, var2 })
	
	return var3
end
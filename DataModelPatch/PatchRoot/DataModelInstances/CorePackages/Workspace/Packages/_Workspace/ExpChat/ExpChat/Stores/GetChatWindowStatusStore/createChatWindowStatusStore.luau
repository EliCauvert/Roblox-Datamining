local SignalsModule = require(script:FindFirstAncestor("ExpChat").Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal

return function()
	-- upvalues: CreateSignalFunction (copy), SignalsModule (copy)
	local Signal, Signal2 = CreateSignalFunction(0)
	local Signal1, Signal2_1 = CreateSignalFunction(0)
	local Signal3, Signal2_2 = CreateSignalFunction(0)
	local Signal4, Signal2_3 = CreateSignalFunction(0)
	local Signal5, Signal2_4 = CreateSignalFunction(0)
	local Unknown, Unknown2 = CreateSignalFunction("unknown")
	local Unknown1, Unknown2_1 = CreateSignalFunction("unknown")
	local v1 = 0
	local v2 = 0
	local v3 = 0
	local v4 = 0
	local Signal6, Signal2_5 = CreateSignalFunction({
		openDuration = 0,
		closedDuration = 0,
		textIdleDuration = 0,
		backgroundIdleDuration = 0
	})
	
	return {
		getBackgroundTimerStarted = Signal,
		getTextTimerStarted = Signal1,
		getOpenTimerStarted = Signal3,
		getClosedTimerStarted = Signal4,
		getPreviousChatWindowStateTimerExpired = Signal5,
		getCurrentChatWindowState = Unknown,
		getPreviousChatWindowState = Unknown1,
		getDurationUpdates = Signal6,
		setBackgroundTimerStarted = Signal2,
		setTextTimerStarted = Signal2_1,
		setOpenTimerStarted = Signal2_2,
		setClosedTimerStarted = Signal2_3,
		setPreviousChatWindowStateTimerExpired = Signal2_4,
		setCurrentChatWindowState = Unknown2,
		setPreviousChatWindowState = Unknown2_1,
		setDurationUpdates = Signal2_5,
		newStateEffect = SignalsModule.createEffect(function(p1)
			-- upvalues: Signal (copy), Signal1 (copy), Signal3 (copy), Signal4 (copy), Unknown2_1 (copy), Unknown (copy), Unknown2 (copy), Signal2_4 (copy)
			local SignalResult: number = Signal(p1)
			local SignalResult1 = Signal1(p1)
			local SignalResult2 = Signal3(p1)
			local SignalResult3 = Signal4(p1)
			Unknown2_1(Unknown(false))
			
			if SignalResult3 < SignalResult2 and SignalResult1 < SignalResult2 and SignalResult < SignalResult2 then
				Unknown2("open")
				Signal2_4(SignalResult2)
				
				return
			end
			if SignalResult1 < SignalResult3 and SignalResult < SignalResult3 then
				Unknown2("closed")
				Signal2_4(SignalResult3)
				
				return
			end
			if SignalResult < SignalResult1 then
				Unknown2("textIdle")
				Signal2_4(SignalResult1)
				
				return
			end
			if SignalResult > 0 then
				Unknown2("backgroundIdle")
				Signal2_4(SignalResult)
				
				return
			else
				Unknown2("unknown")
			end
		end),
		changingWindowStateEffect = SignalsModule.createEffect(function(p1)
			-- upvalues: Unknown1 (copy), Signal5 (copy), v1 (ref), Signal3 (copy), v2 (ref), Signal4 (copy), v3 (ref), Signal1 (copy), v4 (ref), Signal (copy), Signal2_5 (copy)
			local UnknownResult = Unknown1(p1)
			local SignalResult = Signal5(p1)
			
			if UnknownResult == "open" then
				v1 = SignalResult - Signal3(p1)
			elseif UnknownResult == "closed" then
				v2 = SignalResult - Signal4(p1)
			elseif UnknownResult == "textIdle" then
				v3 = SignalResult - Signal1(p1)
			elseif UnknownResult == "backgroundIdle" then
				v4 = SignalResult - Signal(p1)
			end
			Signal2_5(function(p2)
				-- upvalues: v1 (upval), v2 (upval), v3 (upval), v4 (upval)
				return {
					openDuration = p2.openDuration + v1,
					closedDuration = p2.closedDuration + v2,
					textIdleDuration = p2.textIdleDuration + v3,
					backgroundIdleDuration = p2.backgroundIdleDuration + v4
				}
			end)
		end)
	}
end
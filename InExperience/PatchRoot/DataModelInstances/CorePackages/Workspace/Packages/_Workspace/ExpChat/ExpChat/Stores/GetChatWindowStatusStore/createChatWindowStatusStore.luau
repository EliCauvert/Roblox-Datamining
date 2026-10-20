local ExpChat = script:FindFirstAncestor("ExpChat")
local SignalsModule = require(ExpChat.Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local FFlagExpChatWindowStatusEventFixesModule = require(ExpChat.Flags.FFlagExpChatWindowStatusEventFixes)

return function()
	-- upvalues: CreateSignalFunction (copy), SignalsModule (copy), FFlagExpChatWindowStatusEventFixesModule (copy)
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
	local v5 = nil
	
	local function _(p1)
		-- upvalues: Signal3 (copy), Signal4 (copy), Signal1 (copy), Signal (copy)
		return if p1 == "open" then Signal3(false) elseif p1 == "closed" then Signal4(false) elseif p1 == "textIdle" then Signal1(false) elseif p1 == "backgroundIdle" then Signal(false) else 0
	end
	
	local _ = function(p1, p2)
		-- upvalues: Signal3 (copy), Signal4 (copy), Signal1 (copy), Signal (copy), Signal2_5 (copy)
		if p1 == "unknown" then return end
		local v6 = p2 - (if p1 == "open" then Signal3(false) elseif p1 == "closed" then Signal4(false) elseif p1 == "textIdle" then Signal1(false) elseif p1 == "backgroundIdle" then Signal(false) else 0)
		
		if v6 > 0 then
			Signal2_5(function(p3)
				-- upvalues: p1 (copy), v6 (copy)
				return if p1 == "open" then {
					openDuration = p3.openDuration + v6,
					closedDuration = p3.closedDuration,
					textIdleDuration = p3.textIdleDuration,
					backgroundIdleDuration = p3.backgroundIdleDuration
				} elseif p1 == "closed" then {
					openDuration = p3.openDuration,
					closedDuration = p3.closedDuration + v6,
					textIdleDuration = p3.textIdleDuration,
					backgroundIdleDuration = p3.backgroundIdleDuration
				} elseif p1 == "textIdle" then {
					openDuration = p3.openDuration,
					closedDuration = p3.closedDuration,
					textIdleDuration = p3.textIdleDuration + v6,
					backgroundIdleDuration = p3.backgroundIdleDuration
				} elseif p1 == "backgroundIdle" then {
					openDuration = p3.openDuration,
					closedDuration = p3.closedDuration,
					textIdleDuration = p3.textIdleDuration,
					backgroundIdleDuration = p3.backgroundIdleDuration + v6
				} else p3
			end)
			
			return
		end
	end
	
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
		flushFinalDuration = function(p1)
			-- upvalues: v5 (ref), Unknown (copy), Signal6 (copy), Signal3 (copy), Signal4 (copy), Signal1 (copy), Signal (copy), Signal2_5 (copy)
			if v5 then
				return v5, false
			end
			local UnknownResult = Unknown(false)
			
			if UnknownResult == "unknown" then
				return Signal6(false), false
			end
			local P7 = p1 or os.clock()
			
			if UnknownResult ~= "unknown" then
				local PDelta = P7 - (if UnknownResult == "open" then Signal3(false) elseif UnknownResult == "closed" then Signal4(false) elseif UnknownResult == "textIdle" then Signal1(false) elseif UnknownResult == "backgroundIdle" then Signal(false) else 0)
				
				if PDelta > 0 then
					Signal2_5(function(p2)
						-- upvalues: UnknownResult (copy), PDelta (copy)
						return if UnknownResult == "open" then {
							openDuration = p2.openDuration + PDelta,
							closedDuration = p2.closedDuration,
							textIdleDuration = p2.textIdleDuration,
							backgroundIdleDuration = p2.backgroundIdleDuration
						} elseif UnknownResult == "closed" then {
							openDuration = p2.openDuration,
							closedDuration = p2.closedDuration + PDelta,
							textIdleDuration = p2.textIdleDuration,
							backgroundIdleDuration = p2.backgroundIdleDuration
						} elseif UnknownResult == "textIdle" then {
							openDuration = p2.openDuration,
							closedDuration = p2.closedDuration,
							textIdleDuration = p2.textIdleDuration + PDelta,
							backgroundIdleDuration = p2.backgroundIdleDuration
						} elseif UnknownResult == "backgroundIdle" then {
							openDuration = p2.openDuration,
							closedDuration = p2.closedDuration,
							textIdleDuration = p2.textIdleDuration,
							backgroundIdleDuration = p2.backgroundIdleDuration + PDelta
						} else p2
					end)
				end
			end
			local SignalResult = Signal6(false)
			v5 = SignalResult
			
			return SignalResult, true
		end,
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
			-- upvalues: Unknown1 (copy), Signal5 (copy), FFlagExpChatWindowStatusEventFixesModule (upval), Signal3 (copy), Signal4 (copy), Signal1 (copy), Signal (copy), Signal2_5 (copy), v1 (ref), v2 (ref), v3 (ref), v4 (ref)
			local UnknownResult = Unknown1(p1)
			local SignalResult = Signal5(p1)
			
			if not FFlagExpChatWindowStatusEventFixesModule then
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
				
				return
			elseif UnknownResult == "unknown" then return end
			local SignalResultDelta = SignalResult - (if UnknownResult == "open" then Signal3(false) elseif UnknownResult == "closed" then Signal4(false) elseif UnknownResult == "textIdle" then Signal1(false) elseif UnknownResult == "backgroundIdle" then Signal(false) else 0)
			
			if SignalResultDelta > 0 then
				Signal2_5(function(p2)
					-- upvalues: UnknownResult (copy), SignalResultDelta (copy)
					return if UnknownResult == "open" then {
						openDuration = p2.openDuration + SignalResultDelta,
						closedDuration = p2.closedDuration,
						textIdleDuration = p2.textIdleDuration,
						backgroundIdleDuration = p2.backgroundIdleDuration
					} elseif UnknownResult == "closed" then {
						openDuration = p2.openDuration,
						closedDuration = p2.closedDuration + SignalResultDelta,
						textIdleDuration = p2.textIdleDuration,
						backgroundIdleDuration = p2.backgroundIdleDuration
					} elseif UnknownResult == "textIdle" then {
						openDuration = p2.openDuration,
						closedDuration = p2.closedDuration,
						textIdleDuration = p2.textIdleDuration + SignalResultDelta,
						backgroundIdleDuration = p2.backgroundIdleDuration
					} elseif UnknownResult == "backgroundIdle" then {
						openDuration = p2.openDuration,
						closedDuration = p2.closedDuration,
						textIdleDuration = p2.textIdleDuration,
						backgroundIdleDuration = p2.backgroundIdleDuration + SignalResultDelta
					} else p2
				end)
				
				return
			end
		end)
	}
end
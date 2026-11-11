local SignalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)

return {
	createSessionScalarState = function(p1)
		-- upvalues: SignalsModule (copy)
		local Signal, Signal2 = SignalsModule.createSignal(p1)
		local Signal1, Signal2_1 = SignalsModule.createSignal(false)
		local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
		local Signal4, Signal2_3 = SignalsModule.createSignal(false)
		local Signal5, Signal2_4 = SignalsModule.createSignal(false)
		local Signal6, Signal2_5 = SignalsModule.createSignal(0)
		local Signal7, Signal2_6 = SignalsModule.createSignal(nil)
		
		return {
			getCasSessionId = Signal,
			setCasSessionId = Signal2,
			getHasLoadedHistory = Signal1,
			setHasLoadedHistory = Signal2_1,
			markHistoryLoaded = function()
				-- upvalues: Signal2_1 (copy)
				Signal2_1(true)
			end,
			getNextHistoryPageToken = Signal3,
			setNextHistoryPageToken = Signal2_2,
			getHistoryLoadInFlight = Signal4,
			setHistoryLoadInFlight = Signal2_3,
			getInitialized = Signal5,
			setInitialized = Signal2_4,
			getAssistantTurnSequence = Signal6,
			incrementAssistantTurnSequence = function(): number
				-- upvalues: Signal6 (copy), Signal2_5 (copy)
				local NewSignalResult = Signal6(false) + 1
				Signal2_5(NewSignalResult)
				
				return NewSignalResult
			end,
			getLatestObservedHistorySequenceId = Signal7,
			setLatestObservedHistorySequenceId = function(p2)
				-- upvalues: Signal2_6 (copy)
				Signal2_6(p2)
			end,
			noteHistorySequenceId = function(p2)
				-- upvalues: Signal7 (copy), Signal2_6 (copy)
				if p2 == nil then return end
				local SignalResult = Signal7(false)
				
				if SignalResult == nil or SignalResult < p2 then
					Signal2_6(p2)
				end
			end
		}
	end
}
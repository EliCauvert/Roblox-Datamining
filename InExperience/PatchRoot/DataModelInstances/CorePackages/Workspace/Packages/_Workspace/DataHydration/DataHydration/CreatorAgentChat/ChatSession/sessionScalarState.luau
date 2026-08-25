local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)

return {
	createSessionScalarState = function(p0)
		-- upvalues: signalsModule (ref)
		local var1, var2 = signalsModule.createSignal(p0)
		local var3, var4 = signalsModule.createSignal(false)
		local var5, var6 = signalsModule.createSignal(nil)
		local var7, var8 = signalsModule.createSignal(false)
		local var9, var10 = signalsModule.createSignal(false)
		local var11, var12 = signalsModule.createSignal(0)
		local var13, var14 = signalsModule.createSignal(nil)
		
		return {
			getCasSessionId = var1,
			setCasSessionId = var2,
			getHasLoadedHistory = var3,
			setHasLoadedHistory = var4,
			markHistoryLoaded = function()
				-- upvalues: var4 (ref)
				var4(true)
			end,
			getNextHistoryPageToken = var5,
			setNextHistoryPageToken = var6,
			getHistoryLoadInFlight = var7,
			setHistoryLoadInFlight = var8,
			getInitialized = var9,
			setInitialized = var10,
			getAssistantTurnSequence = var11,
			incrementAssistantTurnSequence = function()
				-- upvalues: var11 (ref), var12 (ref)
				local var15 = var11(false) + 1
				var12(var15)
				
				return var15
			end,
			getLatestObservedHistorySequenceId = var13,
			setLatestObservedHistorySequenceId = function(value)
				-- upvalues: var14 (ref)
				var14(value)
			end,
			noteHistorySequenceId = function(p1)
				-- upvalues: var13 (ref), var14 (ref)
				if p1 == nil then return end
				local var16 = var13(false)
				
				if var16 == nil or var16 < p1 then
					var14(p1)
				end
			end
		}
	end
}
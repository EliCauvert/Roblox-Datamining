local SignalsModule = require(script:FindFirstAncestor("GamePlayButton").Parent.Signals)

local function createStore(Callback)
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal("")
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local PopLatencyService = nil
	
	local function refresh()
		-- upvalues: Callback (copy), PopLatencyService (ref), Signal2 (copy), Signal2_1 (copy)
		local Success, Result, Result3 = pcall(function()
			-- upvalues: Callback (upval)
			local CallbackResult = Callback()
			
			if CallbackResult and type(CallbackResult.SetForcedPop) == "function" then
				return CallbackResult, CallbackResult:GetForcedPop()
			else
				return nil, nil
			end
		end)
		
		if Success and type(Result3) == "string" then
			PopLatencyService = Result
			Signal2(Result3)
			Signal2_1(true)
			
			return
		else
			PopLatencyService = nil
			Signal2_1(false)
		end
	end
	
	return {
		getSelection = Signal,
		getSupported = Signal1,
		refresh = refresh,
		select = function(PopCode): boolean
			-- upvalues: PopLatencyService (ref), refresh (copy), Signal1 (copy), Signal (copy)
			if not PopLatencyService then
				refresh()
			end
			if PopLatencyService then
				local Success = pcall(function()
					-- upvalues: PopLatencyService (upval), PopCode (copy)
					PopLatencyService:SetForcedPop(PopCode)
				end)
				refresh()
				
				return Success and (Signal1(false) and Signal(false) == PopCode)
			else
				return false
			end
		end,
		getSnapshot = function()
			-- upvalues: PopLatencyService (ref)
			local Success, Result = pcall(function()
				-- upvalues: PopLatencyService (upval)
				return PopLatencyService:GetSnapshot()
			end)
			
			return if Success and type(Result) == "table" then Result else nil
		end
	}
end

return {
	createStore = createStore,
	getStore = SignalsModule.createComputed(function()
		-- upvalues: createStore (copy)
		return (createStore(function()
			return game:GetService("PopLatencyService")
		end))
	end)
}
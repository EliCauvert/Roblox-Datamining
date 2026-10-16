local HttpService = game:GetService("HttpService")
local Signal, Signal2 = require(script.Parent.Parent.Parent.Signals).createSignal("")

return {
	Get = function(_) --[[ Line: 15 ]]
		-- upvalues: Signal (copy), HttpService (copy), Signal2 (copy)
		local SignalResult = Signal(false)
		
		if SignalResult == "" then
			SignalResult = HttpService:GenerateGUID(false)
			Signal2(SignalResult)
		end
		return SignalResult
	end,
	Refresh = function(_) --[[ Line: 24 ]]
		-- upvalues: HttpService (copy), Signal2 (copy)
		local Guid = HttpService:GenerateGUID(false)
		Signal2(Guid)
		
		return Guid
	end,
	GetSignal = function(_) --[[ Line: 30 ]]
		-- upvalues: Signal (copy)
		return Signal
	end
}
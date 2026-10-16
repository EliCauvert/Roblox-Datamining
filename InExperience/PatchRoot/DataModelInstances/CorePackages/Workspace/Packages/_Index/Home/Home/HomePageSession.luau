local HttpService = game:GetService("HttpService")

local function _() --[[ Line: 10 | Named "newSessionId" ]]
	-- upvalues: HttpService (copy)
	return HttpService:GenerateGUID(false):lower()
end

local Lowered = ""
local Signal, Signal2 = require(script:FindFirstAncestor("Home").Parent.Signals).createSignal(nil)

return {
	Get = function(_) --[[ Line: 37 ]]
		-- upvalues: Lowered (ref), HttpService (copy)
		if Lowered == "" then
			Lowered = HttpService:GenerateGUID(false):lower()
		end
		return Lowered
	end,
	Refresh = function(_) --[[ Line: 44 ]]
		-- upvalues: Lowered (ref), HttpService (copy)
		Lowered = HttpService:GenerateGUID(false):lower()
		
		return Lowered
	end,
	Adopt = function(_, Text: string): boolean --[[ Line: 51 ]]
		-- upvalues: Lowered (ref)
		if Text == "" then
			return false
		else
			Lowered = Text:lower()
			
			return true
		end
	end,
	Commit = function(p1, RequestId): boolean --[[ Line: 59 ]]
		-- upvalues: Signal (copy), Signal2 (copy)
		local GetResult = p1:Get()
		local SignalResult = Signal(false)
		
		if SignalResult == nil or SignalResult.sessionId ~= GetResult then
			Signal2({ sessionId = GetResult, requestId = RequestId })
			
			return true
		else
			return false
		end
	end,
	GetCommitted = function(_) --[[ Line: 70 ]]
		-- upvalues: Signal (copy)
		return Signal(false)
	end,
	GetCommittedSignal = function(_) --[[ Line: 74 ]]
		-- upvalues: Signal (copy)
		return Signal
	end
}
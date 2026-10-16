local CreateSignalFunction = require(script.Parent.Parent.Signals).createSignal
local _ = require(script.Parent.types)
local HttpService = game:GetService("HttpService")

return function(Options) --[[ Line: 16 | Named "fetch" ]]
	-- upvalues: CreateSignalFunction (copy), HttpService (copy)
	local Signal, Signal2 = CreateSignalFunction(function() --[[ Line: 17 ]]
		return { status = "pending" }
	end)
	local RequestInternalResult = HttpService:RequestInternal(Options)
	RequestInternalResult:Start(function(p1, Data) --[[ Line: 23 ]]
		-- upvalues: Signal2 (copy)
		if p1 then
			Signal2({ status = "success", data = Data })
			
			return
		else
			Signal2({ status = "error", error = Data })
		end
	end)
	
	return Signal, function() --[[ Line: 31 | Named "cancelRequest" ]]
		-- upvalues: RequestInternalResult (copy)
		RequestInternalResult:Cancel()
	end
end
local HttpService = game:GetService("HttpService")
local SignalsModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy), HttpService (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	
	return {
		getPageRequestIdMap = Signal,
		getOrCreatePageRequestId = function(Key)
			-- upvalues: Signal (copy), HttpService (upval), Signal2 (copy)
			local SignalResult = Signal(false)
			local SignalResultEntry = SignalResult[Key]
			
			if SignalResultEntry == nil then
				local Guid = HttpService:GenerateGUID(false)
				local Copy = table.clone(SignalResult)
				Copy[Key] = Guid
				Signal2(Copy)
				
				return Guid
			else
				return SignalResultEntry
			end
		end,
		resetPageRequestId = function(p1)
			-- upvalues: Signal (copy), Signal2 (copy)
			local SignalResult = Signal(false)
			
			if SignalResult[p1] == nil then return end
			local t = {}
			
			for i, value in SignalResult do
				if i ~= p1 then
					t[i] = value
				end
			end
			Signal2(t)
		end
	}
end
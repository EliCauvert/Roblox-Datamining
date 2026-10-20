local SignalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal

return function()
	-- upvalues: CreateSignalFunction (copy), SignalsModule (copy)
	local Id = 0
	local Signal, Signal2 = CreateSignalFunction({})
	
	return {
		getToasts = Signal,
		getToast = SignalsModule.createComputed(function(p1)
			-- upvalues: Signal (copy)
			local SignalResult = Signal(p1)
			
			return if #SignalResult == 0 then nil else SignalResult[#SignalResult].data
		end),
		triggerToast = function(Data)
			-- upvalues: Id (ref), Signal (copy), Signal2 (copy)
			Id += 1
			local config = { id = Id, data = Data }
			local SignalResult = Signal(false)
			
			if #SignalResult < 4 then
				local Copy = table.clone(SignalResult)
				table.insert(Copy, config)
				Signal2(Copy)
				
				return
			end
			local List = {}
			
			for i = #SignalResult - 4 + 2, #SignalResult do
				table.insert(List, SignalResult[i])
			end
			table.insert(List, config)
			Signal2(List)
		end,
		dismissToast = function(Id)
			-- upvalues: Signal (copy), Signal2 (copy)
			local List = {}
			
			for _, value in Signal(false) do
				if value.id ~= Id then
					table.insert(List, value)
				end
			end
			Signal2(List)
		end
	}
end
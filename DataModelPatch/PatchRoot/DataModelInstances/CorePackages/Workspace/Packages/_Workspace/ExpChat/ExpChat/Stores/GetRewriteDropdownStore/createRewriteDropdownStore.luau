local CreateSignalFunction = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	
	return {
		getOpenMessageId = Signal,
		getComponentId = Signal1,
		toggleDropdown = function(p1)
			-- upvalues: Signal2 (copy)
			Signal2(function(p2)
				-- upvalues: p1 (copy)
				return if p2 == p1 then nil else p1
			end)
		end,
		setComponentId = Signal2_1
	}
end
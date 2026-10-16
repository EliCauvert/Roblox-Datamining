local CreateSignalFunction = require(script:FindFirstAncestor("MomentsCreation").Parent.Signals).createSignal

return function() --[[ Line: 25 | Named "createEditsStore" ]]
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	
	return {
		getMap = Signal,
		setCommitted = function(Key, p1) --[[ Line: 28 ]]
			-- upvalues: Signal (copy), Signal2 (copy)
			local Copy = table.clone(Signal(false))
			Copy[Key] = p1
			Signal2(Copy)
		end,
		clear = function() --[[ Line: 34 ]]
			-- upvalues: Signal2 (copy)
			Signal2({})
		end
	}
end
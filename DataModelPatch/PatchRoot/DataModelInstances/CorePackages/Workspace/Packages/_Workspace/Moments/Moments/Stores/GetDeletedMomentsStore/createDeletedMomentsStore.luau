local Parent = script:FindFirstAncestor("Moments").Parent
local CryoModule = require(Parent.Cryo)
local CreateSignalFunction = require(Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy), CryoModule (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	
	return {
		getDeletedIds = Signal,
		markDeleted = function(Value)
			-- upvalues: Signal (copy), Signal2 (copy), CryoModule (upval)
			local SignalResult = Signal(false)
			
			if not table.find(SignalResult, Value) then
				Signal2((CryoModule.List.join(SignalResult, { Value })))
			end
		end
	}
end
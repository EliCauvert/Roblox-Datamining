local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local CreateSignalFunction = require(MomentsCreation.Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local v1 = nil
	
	return {
		getDraft = Signal,
		getIsDirty = Signal1,
		begin = function(p1)
			-- upvalues: v1 (ref), Signal2 (copy), Signal2_1 (copy)
			v1 = p1
			Signal2(p1)
			Signal2_1(false)
		end,
		update = function(p1)
			-- upvalues: Signal2 (copy), Signal2_1 (copy)
			Signal2(p1)
			Signal2_1(true)
		end,
		commit = function()
			-- upvalues: Signal (copy), v1 (ref), Signal2_1 (copy)
			local SignalResult = Signal(false)
			v1 = SignalResult
			Signal2_1(false)
			
			return SignalResult
		end,
		discard = function()
			-- upvalues: Signal2 (copy), v1 (ref), Signal2_1 (copy)
			Signal2(v1)
			Signal2_1(false)
		end
	}
end
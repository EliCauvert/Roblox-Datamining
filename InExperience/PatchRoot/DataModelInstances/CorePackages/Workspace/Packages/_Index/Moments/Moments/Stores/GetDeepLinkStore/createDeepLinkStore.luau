local CreateSignalFunction = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	
	return {
		getDeepLinkedMomentId = Signal,
		getDeepLinkedMomentTargetIdType = Signal1,
		setDeepLinkedMomentId = function(p1)
			-- upvalues: Signal2 (copy), Signal2_1 (copy)
			Signal2(p1)
			Signal2_1(if p1 == nil then nil else nil)
		end,
		setDeepLinkedMoment = function(p1, p2)
			-- upvalues: Signal2 (copy), Signal2_1 (copy)
			Signal2(p1)
			Signal2_1(if p1 == nil then nil else p2)
		end
	}
end
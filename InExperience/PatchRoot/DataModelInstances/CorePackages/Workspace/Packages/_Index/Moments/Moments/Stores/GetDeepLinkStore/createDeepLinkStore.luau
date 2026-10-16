local CreateSignalFunction = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function() --[[ Line: 23 | Named "createDeepLinkStore" ]]
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	
	return {
		getDeepLinkedMomentId = Signal,
		getDeepLinkedMomentTargetIdType = Signal1,
		setDeepLinkedMomentId = function(p1) --[[ Line: 34 ]]
			-- upvalues: Signal2 (copy), Signal2_1 (copy)
			Signal2(p1)
			Signal2_1(if p1 == nil then nil else nil)
		end,
		setDeepLinkedMoment = function(p1, p2) --[[ Line: 29 ]]
			-- upvalues: Signal2 (copy), Signal2_1 (copy)
			Signal2(p1)
			Signal2_1(if p1 == nil then nil else p2)
		end,
		consumeDeepLinkedMoment = function() --[[ Line: 38 ]]
			-- upvalues: Signal (copy), Signal1 (copy), Signal2 (copy), Signal2_1 (copy)
			local SignalResult = Signal(false)
			local SignalResult1 = Signal1(false)
			Signal2(nil)
			Signal2_1(nil)
			
			return if SignalResult == nil then nil else { targetId = SignalResult, targetIdType = SignalResult1 }
		end,
		consumeDeepLinkedMomentId = function() --[[ Line: 51 ]]
			-- upvalues: Signal (copy), Signal1 (copy), Signal2 (copy), Signal2_1 (copy)
			local SignalResult = Signal(false)
			local SignalResult1 = Signal1(false)
			Signal2(nil)
			Signal2_1(nil)
			local Config = if SignalResult == nil then nil else { targetId = SignalResult, targetIdType = SignalResult1 }
			
			return if Config == nil then nil else Config.targetId
		end
	}
end
local createSignal = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(nil)
	local var3, var4 = createSignal(nil)
	
	return {
		getDeepLinkedMomentId = var1,
		getDeepLinkedMomentTargetIdType = var3,
		setDeepLinkedMomentId = function(value)
			-- upvalues: var2 (ref), var4 (ref)
			var2(value)
			var4(if value ~= nil then nil else nil)
		end,
		setDeepLinkedMoment = function(value, p1)
			-- upvalues: var2 (ref), var4 (ref)
			var2(value)
			var4(if value ~= nil then nil else p1)
		end,
		consumeDeepLinkedMoment = function()
			-- upvalues: var1 (ref), var3 (ref), var2 (ref), var4 (ref)
			local var5 = var1(false)
			local var6 = var3(false)
			var2(nil)
			var4(nil)
			
			return if var5 == nil then nil else { targetId = var5, targetIdType = var6 }
		end,
		consumeDeepLinkedMomentId = function()
			-- upvalues: var1 (ref), var3 (ref), var2 (ref), var4 (ref)
			local var5 = var1(false)
			local var6 = var3(false)
			var2(nil)
			var4(nil)
			local var7 = if var5 == nil then nil else { targetId = var5, targetIdType = var6 }
			
			return if var7 == nil then nil else var7.targetId
		end
	}
end
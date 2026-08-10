local createSignal = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function() --[[ line: 23 | named "createDeepLinkStore" ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(nil)
	local var2, var3 = createSignal(nil)
	
	return {
		getDeepLinkedMomentId = var0,
		getDeepLinkedMomentTargetIdType = var2,
		setDeepLinkedMomentId = function(value) --[[ line: 34 ]]
			-- upvalues: var1 (ref), var3 (ref)
			var1(value)
			var3(if value ~= nil then nil else nil)
		end,
		setDeepLinkedMoment = function(value, p0) --[[ line: 29 ]]
			-- upvalues: var1 (ref), var3 (ref)
			var1(value)
			var3(if value ~= nil then nil else p0)
		end,
		consumeDeepLinkedMoment = function() --[[ line: 38 ]]
			-- upvalues: var0 (ref), var2 (ref), var1 (ref), var3 (ref)
			local var4 = var0(false)
			local var5 = var2(false)
			var1(nil)
			var3(nil)
			
			return if var4 == nil then nil else { targetId = var4, targetIdType = var5 }
		end,
		consumeDeepLinkedMomentId = function() --[[ line: 51 ]]
			-- upvalues: var0 (ref), var2 (ref), var1 (ref), var3 (ref)
			local var6 = var0(false)
			local var7 = var2(false)
			var1(nil)
			var3(nil)
			local var8 = if var6 == nil then nil else { targetId = var6, targetIdType = var7 }
			
			return if var8 == nil then nil else var8.targetId
		end
	}
end
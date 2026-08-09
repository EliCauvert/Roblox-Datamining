local createSignal = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function() --[[ line: 15 | named "createDeepLinkStore" ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(nil)
	
	return {
		getDeepLinkedMomentId = var0,
		setDeepLinkedMomentId = var1,
		consumeDeepLinkedMomentId = function() --[[ line: 19 ]]
			-- upvalues: var0 (ref), var1 (ref)
			local var2 = var0(false)
			
			if var2 then
				var1(nil)
			end
			return var2
		end
	}
end
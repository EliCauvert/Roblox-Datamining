local roactRodux = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).RoactRodux

return function(p1, p2)
	-- upvalues: roactRodux (ref)
	return function(p3)
		-- upvalues: roactRodux (copy), p1 (ref), p2 (ref)
		local var1 = roactRodux.UNSTABLE_connect2(p1, p2)(p3)
		
		function var0.getUnconnected()
			-- upvalues: p3 (ref)
			return p3
		end
		
		return var1
	end
end
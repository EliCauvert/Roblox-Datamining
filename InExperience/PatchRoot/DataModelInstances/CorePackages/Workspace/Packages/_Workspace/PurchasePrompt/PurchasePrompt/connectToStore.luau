local roactRodux = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).RoactRodux

return function(p0, p1)
	-- upvalues: roactRodux (ref)
	return function(p2)
		-- upvalues: roactRodux (copy), p0 (ref), p1 (ref)
		local var0 = roactRodux.UNSTABLE_connect2(p0, p1)(p2)
		
		function var0.getUnconnected()
			-- upvalues: p2 (ref)
			return p2
		end
		
		return var0
	end
end
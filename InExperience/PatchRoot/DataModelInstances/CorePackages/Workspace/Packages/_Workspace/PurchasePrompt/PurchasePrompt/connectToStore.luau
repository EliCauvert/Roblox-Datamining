local RoactRodux = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).RoactRodux

return function(p1, p2) --[[ Line: 12 | Named "connectToStore" ]]
	-- upvalues: RoactRodux (copy)
	return function(p3) --[[ Line: 13 ]]
		-- upvalues: RoactRodux (upval), p1 (copy), p2 (copy)
		local v1 = RoactRodux.UNSTABLE_connect2(p1, p2)(p3)
		
		function v1.getUnconnected() --[[ Line: 16 ]]
			-- upvalues: p3 (copy)
			return p3
		end
		
		return v1
	end
end
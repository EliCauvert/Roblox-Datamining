local getSduiApiStoreModule = require(script:FindFirstAncestor("SduiSharedUtilities").getSduiApiStore)

return {
	findInputData = function(p1, p2)
		-- upvalues: getSduiApiStoreModule (ref)
		local var1 = nil
		getSduiApiStoreModule().forEachInputData(p1, function(_, p3)
			-- upvalues: p2 (ref), var1 (write)
			if p2(p3) then
				var1 = p3
				
				return true
			end
			return false
		end)
		
		return var1
	end,
	updateInputDataField = function(p1, p2, p3, p4)
		-- upvalues: getSduiApiStoreModule (ref)
		local var1 = getSduiApiStoreModule()
		local var2 = false
		var1.forEachInputData(p1, function(p5, p6)
			-- upvalues: p2 (ref), p3 (ref), var2 (write), var1 (ref), p1 (ref), p4 (ref)
			if not p2(p6) then
				return false
			end
			local var3 = p6[p3]
			
			if var3 ~= nil then
				var2 = var1.setInputDataField(p1, p5, p3, p4(var3))
			end
			return true
		end)
		
		return var2
	end
}
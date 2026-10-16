local GetSduiApiStoreModule = require(script:FindFirstAncestor("SduiSharedUtilities").getSduiApiStore)

return {
	findInputData = function(p1, Callback) --[[ Line: 15 ]]
		-- upvalues: GetSduiApiStoreModule (copy)
		local v1 = nil
		GetSduiApiStoreModule().forEachInputData(p1, function(_, p2): boolean --[[ Line: 17 ]]
			-- upvalues: Callback (copy), v1 (ref)
			if Callback(p2) then
				v1 = p2
				
				return true
			else
				return false
			end
		end)
		
		return v1
	end,
	updateInputDataField = function(p1, Callback1, p2, Callback): boolean --[[ Line: 30 ]]
		-- upvalues: GetSduiApiStoreModule (copy)
		local SduiApiStoreModule = GetSduiApiStoreModule()
		local SetInputDataFieldResult = false
		SduiApiStoreModule.forEachInputData(p1, function(p3, p4): boolean --[[ Line: 38 ]]
			-- upvalues: Callback1 (copy), p2 (copy), SetInputDataFieldResult (ref), SduiApiStoreModule (copy), p1 (copy), Callback (copy)
			if not Callback1(p4) then
				return false
			end
			local v1 = p4[p2]
			
			if v1 ~= nil then
				SetInputDataFieldResult = SduiApiStoreModule.setInputDataField(p1, p3, p2, Callback(v1))
			end
			return true
		end)
		
		return SetInputDataFieldResult
	end
}
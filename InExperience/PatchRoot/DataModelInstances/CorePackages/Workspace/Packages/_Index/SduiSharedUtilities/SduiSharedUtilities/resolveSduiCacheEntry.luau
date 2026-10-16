local FFlagSduiAlwaysCacheWithIdentifier = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.SharedFlags).FFlagSduiAlwaysCacheWithIdentifier

return function(List, p1, p2) --[[ Line: 15 | Named "resolveSduiCacheEntry" ]]
	-- upvalues: FFlagSduiAlwaysCacheWithIdentifier (copy)
	if not List then
		return nil
	end
	local Entry = List[p2 or p1]
	
	if Entry then
		return Entry
	end
	if p2 == nil then
		if FFlagSduiAlwaysCacheWithIdentifier then
			local v1 = nil
			
			for _, value in List do
				if v1 ~= nil then
					return nil
				end
				v1 = value
			end
			return v1
		else
			for _, value1 in List do
				return value1
			end
		end
	end
	return nil
end
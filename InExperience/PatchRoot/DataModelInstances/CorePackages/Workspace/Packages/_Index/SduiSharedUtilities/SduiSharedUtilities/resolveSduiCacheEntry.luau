local fFlagSduiAlwaysCacheWithIdentifier = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.SharedFlags).FFlagSduiAlwaysCacheWithIdentifier

return function(p1, p2, p3)
	-- upvalues: fFlagSduiAlwaysCacheWithIdentifier (ref)
	if not p1 then
		return nil
	end
	local var1 = p1[p3 or p2]
	
	if var1 then
		return var1
	elseif p3 == nil then
		if fFlagSduiAlwaysCacheWithIdentifier then
			local var2 = nil
			
			for i, v in p1 do
				if var2 == nil then
					var2 = v
					continue
				end
				return nil
			end
			return var2
		else
			for i, v in p1 do
				return v
			end
		end
	end
	return nil
end
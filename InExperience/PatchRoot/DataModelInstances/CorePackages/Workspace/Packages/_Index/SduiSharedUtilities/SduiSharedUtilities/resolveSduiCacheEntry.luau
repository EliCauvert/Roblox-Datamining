local fFlagSduiAlwaysCacheWithIdentifier = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.SharedFlags).FFlagSduiAlwaysCacheWithIdentifier

return function(p0, p1, p2)
	-- upvalues: fFlagSduiAlwaysCacheWithIdentifier (ref)
	if not p0 then
		return nil
	end
	local var0 = p0[p2 or p1]
	
	if var0 then
		return var0
	elseif p2 == nil then
		if fFlagSduiAlwaysCacheWithIdentifier then
			local var1 = nil
			
			for i, v in p0 do
				if var1 == nil then
					var1 = v
					continue
				end
				return nil
			end
			return var1
		else
			for i, v in p0 do
				return v
			end
		end
	end
	return nil
end
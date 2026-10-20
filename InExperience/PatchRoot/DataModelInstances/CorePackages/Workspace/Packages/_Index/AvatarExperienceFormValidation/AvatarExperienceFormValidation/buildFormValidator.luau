local _ = require(script.Parent.FormValidationErrorEnum)

return function(p1)
	return function(p2)
		-- upvalues: p1 (copy)
		local v1 = nil
		for _, value in p1 do
			local v2
			v2, v2 = value(p2)
			
			if not v2 then
				return false, v1
			end
		end
		return true, nil
	end
end
local _ = require(script.Parent.FormValidationErrorEnum)

return function(p1)
	return function(p2)
		-- upvalues: p1 (ref)
		for i, v in p1 do
			local var1, var2 = v(p2)
			
			if not var1 then
				return false, var2
			end
		end
		return true, nil
	end
end
local _ = require(script.Parent.FormValidationErrorEnum)

return function(p0) --[[ line: 4 | named "buildFormValidator" ]]
	return function(p1) --[[ line: 5 ]]
		-- upvalues: p0 (ref)
		for i, v in p0 do
			local var0, var1 = v(p1)
			
			if not var0 then
				return false, var1
			end
		end
		return true, nil
	end
end
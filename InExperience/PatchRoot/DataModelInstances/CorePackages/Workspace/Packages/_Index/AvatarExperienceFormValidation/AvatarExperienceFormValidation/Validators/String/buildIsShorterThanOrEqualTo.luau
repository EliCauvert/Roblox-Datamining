local formValidationErrorEnumModule = require(script.Parent.Parent.Parent.FormValidationErrorEnum)

return function(p0) --[[ line: 4 | named "buildIsShorterThanOrEqualTo" ]]
	-- upvalues: formValidationErrorEnumModule (ref)
	return function(p1) --[[ line: 5 ]]
		-- upvalues: p0 (ref), formValidationErrorEnumModule (copy)
		local charCount = utf8.len(p1)
		
		if charCount == nil or charCount > p0 then
			return false, formValidationErrorEnumModule.FailedIsShorterThanOrEqualTo
		end
		return true
	end
end
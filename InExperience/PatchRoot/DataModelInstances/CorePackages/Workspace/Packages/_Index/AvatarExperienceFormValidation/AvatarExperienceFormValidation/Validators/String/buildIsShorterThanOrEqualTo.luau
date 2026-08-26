local formValidationErrorEnumModule = require(script.Parent.Parent.Parent.FormValidationErrorEnum)

return function(p1)
	-- upvalues: formValidationErrorEnumModule (ref)
	return function(p2)
		-- upvalues: p1 (ref), formValidationErrorEnumModule (copy)
		local charCount = utf8.len(p2)
		
		if charCount == nil or charCount > p1 then
			return false, formValidationErrorEnumModule.FailedIsShorterThanOrEqualTo
		end
		return true
	end
end
local FormValidationErrorEnumModule = require(script.Parent.Parent.Parent.FormValidationErrorEnum)

return function(p1)
	-- upvalues: FormValidationErrorEnumModule (copy)
	return function(Text)
		-- upvalues: p1 (copy), FormValidationErrorEnumModule (upval)
		local Length = utf8.len(Text)
		
		if Length == nil or Length > p1 then
			return false, FormValidationErrorEnumModule.FailedIsShorterThanOrEqualTo
		else
			return true
		end
	end
end
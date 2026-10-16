local FormValidationErrorEnumModule = require(script.Parent.Parent.Parent.FormValidationErrorEnum)

return function(p1) --[[ Line: 4 | Named "buildIsShorterThanOrEqualTo" ]]
	-- upvalues: FormValidationErrorEnumModule (copy)
	return function(Text) --[[ Line: 5 ]]
		-- upvalues: p1 (copy), FormValidationErrorEnumModule (upval)
		local Length = utf8.len(Text)
		
		if Length == nil or Length > p1 then
			return false, FormValidationErrorEnumModule.FailedIsShorterThanOrEqualTo
		else
			return true
		end
	end
end
local FormValidationErrorEnumModule = require(script.Parent.Parent.FormValidationErrorEnum)

return function(p1) --[[ Line: 4 | Named "isNotNull" ]]
	-- upvalues: FormValidationErrorEnumModule (copy)
	if p1 == nil then
		return false, FormValidationErrorEnumModule.FailedIsNotNull
	else
		return true
	end
end
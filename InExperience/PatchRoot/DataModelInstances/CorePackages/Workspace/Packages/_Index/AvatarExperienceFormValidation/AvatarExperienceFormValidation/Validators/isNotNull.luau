local formValidationErrorEnumModule = require(script.Parent.Parent.FormValidationErrorEnum)

return function(p0)
	-- upvalues: formValidationErrorEnumModule (ref)
	if p0 == nil then
		return false, formValidationErrorEnumModule.FailedIsNotNull
	end
	return true
end
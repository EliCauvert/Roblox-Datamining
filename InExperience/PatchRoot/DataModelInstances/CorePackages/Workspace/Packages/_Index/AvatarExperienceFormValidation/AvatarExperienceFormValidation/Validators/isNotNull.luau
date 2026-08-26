local formValidationErrorEnumModule = require(script.Parent.Parent.FormValidationErrorEnum)

return function(p1)
	-- upvalues: formValidationErrorEnumModule (ref)
	if p1 == nil then
		return false, formValidationErrorEnumModule.FailedIsNotNull
	end
	return true
end
local formValidationErrorEnumModule = require(script.Parent.Parent.Parent.FormValidationErrorEnum)

return function(p0)
	-- upvalues: formValidationErrorEnumModule (ref)
	if string.match(p0, "%S") == nil then
		return false, formValidationErrorEnumModule.FailedIsNotWhitespace
	end
	return true
end
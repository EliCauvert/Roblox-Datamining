local formValidationErrorEnumModule = require(script.Parent.Parent.Parent.FormValidationErrorEnum)

return function(p1)
	-- upvalues: formValidationErrorEnumModule (ref)
	if string.match(p1, "%S") == nil then
		return false, formValidationErrorEnumModule.FailedIsNotWhitespace
	end
	return true
end
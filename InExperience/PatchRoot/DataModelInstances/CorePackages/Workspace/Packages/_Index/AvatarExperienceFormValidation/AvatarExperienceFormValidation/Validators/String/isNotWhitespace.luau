local FormValidationErrorEnumModule = require(script.Parent.Parent.Parent.FormValidationErrorEnum)

return function(Text: string)
	-- upvalues: FormValidationErrorEnumModule (copy)
	if string.match(Text, "%S") == nil then
		return false, FormValidationErrorEnumModule.FailedIsNotWhitespace
	else
		return true
	end
end
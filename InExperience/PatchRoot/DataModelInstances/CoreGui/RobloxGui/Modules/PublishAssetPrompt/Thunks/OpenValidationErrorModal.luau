local OpenValidationErrorModalModule = require(script.Parent.Parent.Actions.OpenValidationErrorModal)

return function(p1)
	-- upvalues: OpenValidationErrorModalModule (copy)
	p1:dispatch(OpenValidationErrorModalModule())
end
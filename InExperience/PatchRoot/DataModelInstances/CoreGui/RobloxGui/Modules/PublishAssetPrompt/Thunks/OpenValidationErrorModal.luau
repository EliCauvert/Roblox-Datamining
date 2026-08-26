local openValidationErrorModalModule = require(script.Parent.Parent.Actions.OpenValidationErrorModal)

return function(p1)
	-- upvalues: openValidationErrorModalModule (ref)
	p1:dispatch(openValidationErrorModalModule())
end
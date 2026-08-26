local closeResultModalModule = require(script.Parent.Parent.Actions.CloseResultModal)

return function(p1)
	-- upvalues: closeResultModalModule (ref)
	p1:dispatch(closeResultModalModule())
end
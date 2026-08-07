local closeResultModalModule = require(script.Parent.Parent.Actions.CloseResultModal)

return function(p0) --[[ line: 4 ]]
	-- upvalues: closeResultModalModule (ref)
	p0:dispatch(closeResultModalModule())
end
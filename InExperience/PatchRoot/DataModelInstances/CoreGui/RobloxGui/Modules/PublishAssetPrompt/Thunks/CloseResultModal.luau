local CloseResultModalModule = require(script.Parent.Parent.Actions.CloseResultModal)

return function(p1) --[[ Line: 4 ]]
	-- upvalues: CloseResultModalModule (copy)
	p1:dispatch(CloseResultModalModule())
end
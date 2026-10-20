local OpenResultModalModule = require(script.Parent.Parent.Actions.OpenResultModal)

return function(p1)
	-- upvalues: OpenResultModalModule (copy)
	return function(p2)
		-- upvalues: OpenResultModalModule (upval), p1 (copy)
		p2:dispatch(OpenResultModalModule(p1))
	end
end
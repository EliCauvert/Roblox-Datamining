local ShowHelpModalModule = require(script.Parent.Parent.Actions.ShowHelpModal)

return function(p1)
	-- upvalues: ShowHelpModalModule (copy)
	return function(p2)
		-- upvalues: ShowHelpModalModule (upval), p1 (copy)
		p2:dispatch(ShowHelpModalModule(p1))
	end
end
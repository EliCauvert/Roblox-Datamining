local showHelpModalModule = require(script.Parent.Parent.Actions.ShowHelpModal)

return function(p1)
	-- upvalues: showHelpModalModule (ref)
	return function(p2)
		-- upvalues: showHelpModalModule (copy), p1 (ref)
		p2:dispatch(showHelpModalModule(p1))
	end
end
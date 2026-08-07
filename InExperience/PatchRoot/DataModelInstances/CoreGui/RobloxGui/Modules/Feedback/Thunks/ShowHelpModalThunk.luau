local showHelpModalModule = require(script.Parent.Parent.Actions.ShowHelpModal)

return function(p0) --[[ line: 7 ]]
	-- upvalues: showHelpModalModule (ref)
	return function(p1) --[[ line: 8 ]]
		-- upvalues: showHelpModalModule (copy), p0 (ref)
		p1:dispatch(showHelpModalModule(p0))
	end
end
local openResultModalModule = require(script.Parent.Parent.Actions.OpenResultModal)

return function(p1)
	-- upvalues: openResultModalModule (ref)
	return function(p2)
		-- upvalues: openResultModalModule (copy), p1 (ref)
		p2:dispatch(openResultModalModule(p1))
	end
end
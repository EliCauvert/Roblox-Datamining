local openResultModalModule = require(script.Parent.Parent.Actions.OpenResultModal)

return function(p0)
	-- upvalues: openResultModalModule (ref)
	return function(p1)
		-- upvalues: openResultModalModule (copy), p0 (ref)
		p1:dispatch(openResultModalModule(p0))
	end
end
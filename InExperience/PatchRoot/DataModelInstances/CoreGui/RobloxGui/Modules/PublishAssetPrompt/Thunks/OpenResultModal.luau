local openResultModalModule = require(script.Parent.Parent.Actions.OpenResultModal)

return function(p0) --[[ line: 11 ]]
	-- upvalues: openResultModalModule (ref)
	return function(p1) --[[ line: 12 ]]
		-- upvalues: openResultModalModule (copy), p0 (ref)
		p1:dispatch(openResultModalModule(p0))
	end
end
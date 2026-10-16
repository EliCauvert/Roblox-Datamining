local OpenResultModalModule = require(script.Parent.Parent.Actions.OpenResultModal)

return function(p1) --[[ Line: 11 ]]
	-- upvalues: OpenResultModalModule (copy)
	return function(p2) --[[ Line: 12 ]]
		-- upvalues: OpenResultModalModule (upval), p1 (copy)
		p2:dispatch(OpenResultModalModule(p1))
	end
end
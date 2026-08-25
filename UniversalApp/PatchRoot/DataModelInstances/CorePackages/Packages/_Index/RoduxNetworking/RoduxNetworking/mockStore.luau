return {
	config = function(p0)
		p0 = p0 or {}
		local state = p0.state or {}
		
		return {
			dispatch = p0.dispatch or function(p1, p2)
				if type(p2) == "function" then
					p2(p1)
				end
			end,
			getState = function()
				-- upvalues: state (write)
				return state
			end,
			setState = function(_, p3)
				-- upvalues: state (write)
				state = p3
			end
		}
	end
}
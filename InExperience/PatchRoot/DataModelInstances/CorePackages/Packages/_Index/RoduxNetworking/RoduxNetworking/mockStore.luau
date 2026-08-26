return {
	config = function(p1)
		p1 = p1 or {}
		local state = p1.state or {}
		
		return {
			dispatch = p1.dispatch or function(p2, p3)
				if type(p3) == "function" then
					p3(p2)
				end
			end,
			getState = function()
				-- upvalues: state (write)
				return state
			end,
			setState = function(_, p2)
				-- upvalues: state (write)
				state = p2
			end
		}
	end
}
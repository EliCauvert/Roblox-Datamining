return {
	config = function(p1)
		local P0 = p1 or {}
		local State = P0.state or {}
		
		return {
			dispatch = P0.dispatch or function(p2, Callback: (any) -> ())
				if type(Callback) == "function" then
					Callback(p2)
				end
			end,
			getState = function()
				-- upvalues: State (ref)
				return State
			end,
			setState = function(_, Value)
				-- upvalues: State (ref)
				State = Value
			end
		}
	end
}
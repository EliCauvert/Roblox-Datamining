return {
	config = function(p1) --[[ Line: 7 ]]
		local P0 = p1 or {}
		local State = P0.state or {}
		
		return {
			dispatch = P0.dispatch or function(p2, Callback: (any) -> ()) --[[ Line: 12 ]]
				if type(Callback) == "function" then
					Callback(p2)
				end
			end,
			getState = function() --[[ Line: 18 ]]
				-- upvalues: State (ref)
				return State
			end,
			setState = function(_, Value) --[[ Line: 22 ]]
				-- upvalues: State (ref)
				State = Value
			end
		}
	end
}
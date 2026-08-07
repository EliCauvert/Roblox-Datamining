return {
	new = function(p0) --[[ line: 7 ]]
		local t = {}
		setmetatable(t, {
			__tostring = function() --[[ line: 11 ]]
				return "Service(PublicBindables)"
			end
		})
		
		function t.getWindowStateChangedBindable() --[[ line: 16 ]]
			-- upvalues: p0 (ref)
			return p0.windowStateChangedBindable
		end
		
		return t
	end
}
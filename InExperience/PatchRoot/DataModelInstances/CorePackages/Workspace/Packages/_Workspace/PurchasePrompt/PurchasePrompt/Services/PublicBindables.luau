return {
	new = function(p1)
		local t = {}
		setmetatable(t, {
			__tostring = function()
				return "Service(PublicBindables)"
			end
		})
		
		function t.getWindowStateChangedBindable()
			-- upvalues: p1 (ref)
			return p1.windowStateChangedBindable
		end
		
		return t
	end
}
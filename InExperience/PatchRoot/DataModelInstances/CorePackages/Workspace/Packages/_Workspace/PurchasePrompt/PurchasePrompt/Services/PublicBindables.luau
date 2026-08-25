return {
	new = function(p0)
		local t = {}
		setmetatable(t, {
			__tostring = function()
				return "Service(PublicBindables)"
			end
		})
		
		function t.getWindowStateChangedBindable()
			-- upvalues: p0 (ref)
			return p0.windowStateChangedBindable
		end
		
		return t
	end
}
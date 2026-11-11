return {
	new = function(p1)
		local t = {}
		setmetatable(t, {
			__tostring = function(): string
				return "Service(PublicBindables)"
			end
		})
		
		function t.getWindowStateChangedBindable()
			-- upvalues: p1 (copy)
			return p1.windowStateChangedBindable
		end
		
		return t
	end
}
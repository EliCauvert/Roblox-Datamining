return {
	new = function(p1) --[[ Line: 7 ]]
		local t = {}
		setmetatable(t, {
			__tostring = function(): string --[[ Line: 11 ]]
				return "Service(PublicBindables)"
			end
		})
		
		function t.getWindowStateChangedBindable() --[[ Line: 16 ]]
			-- upvalues: p1 (copy)
			return p1.windowStateChangedBindable
		end
		
		return t
	end
}
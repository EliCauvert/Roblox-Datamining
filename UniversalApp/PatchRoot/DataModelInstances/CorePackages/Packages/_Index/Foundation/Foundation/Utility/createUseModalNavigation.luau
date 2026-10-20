local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	return function()
		-- upvalues: ReactModule (upval), p1 (copy)
		local UseContextResult = ReactModule.useContext(p1)
		
		return {
			closeAffordanceRef = UseContextResult.closeAffordanceRef,
			setContentStartRef = UseContextResult.setContentStartRef
		}
	end
end
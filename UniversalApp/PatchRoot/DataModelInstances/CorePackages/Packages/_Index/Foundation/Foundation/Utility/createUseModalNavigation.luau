local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(p1) --[[ Line: 16 | Named "createUseModalNavigation" ]]
	-- upvalues: ReactModule (copy)
	return function() --[[ Line: 17 ]]
		-- upvalues: ReactModule (upval), p1 (copy)
		local UseContextResult = ReactModule.useContext(p1)
		
		return {
			closeAffordanceRef = UseContextResult.closeAffordanceRef,
			setContentStartRef = UseContextResult.setContentStartRef
		}
	end
end
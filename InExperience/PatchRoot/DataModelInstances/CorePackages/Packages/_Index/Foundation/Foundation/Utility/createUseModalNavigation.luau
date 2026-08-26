local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	return function()
		-- upvalues: reactModule (copy), p1 (ref)
		local var1 = reactModule.useContext(p1)
		
		return {
			closeAffordanceRef = var1.closeAffordanceRef,
			setContentStartRef = var1.setContentStartRef
		}
	end
end
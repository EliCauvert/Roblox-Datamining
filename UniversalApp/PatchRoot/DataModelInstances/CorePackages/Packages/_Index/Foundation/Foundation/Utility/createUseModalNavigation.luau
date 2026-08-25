local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(p0)
	-- upvalues: reactModule (ref)
	return function()
		-- upvalues: reactModule (copy), p0 (ref)
		local var1 = reactModule.useContext(p0)
		
		return {
			closeAffordanceRef = var1.closeAffordanceRef,
			setContentStartRef = var1.setContentStartRef
		}
	end
end
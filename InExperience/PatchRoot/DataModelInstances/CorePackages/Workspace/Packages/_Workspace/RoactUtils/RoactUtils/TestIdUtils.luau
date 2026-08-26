local fFlagLuaAppAddTestIdsForArrow = require(script:FindFirstAncestor("RoactUtils").Parent.SharedFlags).FFlagLuaAppAddTestIdsForArrow

return {
	getTestId = function(p1, p2)
		-- upvalues: fFlagLuaAppAddTestIdsForArrow (ref)
		if not fFlagLuaAppAddTestIdsForArrow then
			return nil
		elseif not p1 then
			return nil
		end
		local var1 = `data-testid=--{p0}`
		
		if p2 then
			var1 = `{var1}-{tostring(p2)}`
		end
		return var0
	end
}
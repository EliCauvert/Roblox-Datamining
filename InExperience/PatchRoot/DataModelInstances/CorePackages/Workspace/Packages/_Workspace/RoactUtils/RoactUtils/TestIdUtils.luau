local fFlagLuaAppAddTestIdsForArrow = require(script:FindFirstAncestor("RoactUtils").Parent.SharedFlags).FFlagLuaAppAddTestIdsForArrow

return {
	getTestId = function(p0, p1) --[[ line: 19 ]]
		-- upvalues: fFlagLuaAppAddTestIdsForArrow (ref)
		if not fFlagLuaAppAddTestIdsForArrow then
			return nil
		elseif not p0 then
			return nil
		end
		local var0 = `data-testid=--{p0}`
		
		if p1 then
			var0 = `{var0}-{tostring(p1)}`
		end
		return var0
	end
}
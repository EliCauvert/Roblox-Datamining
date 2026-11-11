local FFlagLuaAppAddTestIdsForArrow = require(script:FindFirstAncestor("RoactUtils").Parent.SharedFlags).FFlagLuaAppAddTestIdsForArrow

return {
	getTestId = function(p1, p2): string?
		-- upvalues: FFlagLuaAppAddTestIdsForArrow (copy)
		if not FFlagLuaAppAddTestIdsForArrow then
			return nil
		end
		if not p1 then
			return nil
		end
		local TestidName: string = `data-testid=--{p0}`
		
		if p2 then
			TestidName = `{TestidName}-{tostring(p2)}`
		end
		return TestidName
	end
}
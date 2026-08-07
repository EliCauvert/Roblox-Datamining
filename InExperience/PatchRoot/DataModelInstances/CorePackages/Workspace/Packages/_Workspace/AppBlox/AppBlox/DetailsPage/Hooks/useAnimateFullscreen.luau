local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)

return function(p0, p1, p2) --[[ line: 7 | named "useAnimateFullscreen" ]]
	-- upvalues: reactModule (ref), reactOtterModule (ref)
	local var2_1
	local var2 = p1 ~= nil
	local var3 = if p0 and var2 then 0 else 1
	local var4, var5 = reactModule.useState(var3)
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactOtterModule.useAnimatedBinding(var3, reactModule.useCallback(function() --[[ line: 17 ]]
		-- upvalues: var7 (ref)
		var7(false)
	end, {}))
	reactModule.useEffect(function() --[[ line: 23 ]]
		-- upvalues: var3 (ref), var4 (ref), var5 (ref), var7 (ref), var9 (ref), reactOtterModule (copy), p2 (ref)
		if var3 == var4 then
			return nil
		end
		var5(var3)
		var7(true)
		var9(reactOtterModule.spring(var3, p2))
		
		return nil
	end, { var3, var4, p2 })
	
	if not var6 then
		var2_1 = p0 and var2
	end
	return var2_1, var8
end
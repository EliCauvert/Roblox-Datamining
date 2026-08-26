local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), reactOtterModule (ref)
	local var1
	local var2 = p2 ~= nil
	local var3 = if p1 and var2 then 0 else 1
	local var4, var5 = reactModule.useState(var3)
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactOtterModule.useAnimatedBinding(var3, reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		var7(false)
	end, {}))
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var4 (ref), var5 (ref), var7 (ref), var9 (ref), reactOtterModule (copy), p3 (ref)
		if var3 == var4 then
			return nil
		end
		var5(var3)
		var7(true)
		var9(reactOtterModule.spring(var3, p3))
		
		return nil
	end, { var3, var4, p3 })
	
	if not var6 then
		var1 = p1 and var2
	end
	return var1, var8
end
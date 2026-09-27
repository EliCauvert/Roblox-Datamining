local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local calculateCardLayoutModule = require(peopleReactView.Utils.calculateCardLayout)

return function()
	-- upvalues: useTokens (ref), reactModule (ref), calculateCardLayoutModule (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useBinding(0)
	local var4, var5 = reactModule.useBinding(0)
	local var6, var7 = reactModule.useBinding(0)
	
	return var2, var4, var6, reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: calculateCardLayoutModule (copy), var7 (ref), var3 (ref), var5 (ref), var1 (ref)
		local var8, var9 = calculateCardLayoutModule(p1, p2, p3)
		var7(var9)
		var3(var8)
		var5(var8 + var1.Size.Size_1400)
		
		return var8
	end, { var1.Size.Size_1400 })
end
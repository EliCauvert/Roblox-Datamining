local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local isScrollingFrameOverflowingYModule = require(foundation.Utility.isScrollingFrameOverflowingY)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function()
	-- upvalues: reactModule (ref), useTokensModule (ref), isScrollingFrameOverflowingYModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = useTokensModule()
	local var4, var5 = reactModule.useBinding(0)
	
	return var1, var4, reactModule.useCallback(function(p1)
		-- upvalues: isScrollingFrameOverflowingYModule (copy), var2 (ref), var5 (ref), var3 (ref)
		local var6 = isScrollingFrameOverflowingYModule(p1, 1)
		var2(var6)
		var5(if var6 then var3.Size.Size_150 else 0)
	end, { var3.Size.Size_150 })
end
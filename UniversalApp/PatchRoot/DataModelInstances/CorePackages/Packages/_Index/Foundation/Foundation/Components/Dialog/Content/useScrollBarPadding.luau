local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local isScrollingFrameOverflowingYModule = require(foundation.Utility.isScrollingFrameOverflowingY)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function()
	-- upvalues: reactModule (ref), useTokensModule (ref), isScrollingFrameOverflowingYModule (ref)
	local var4, var5 = reactModule.useState(false)
	local var6 = useTokensModule()
	local var7, var8 = reactModule.useBinding(0)
	
	return var4, var7, reactModule.useCallback(function(p0)
		-- upvalues: isScrollingFrameOverflowingYModule (copy), var5 (ref), var8 (ref), var6 (ref)
		local var9 = isScrollingFrameOverflowingYModule(p0, 1)
		var5(var9)
		var8(if var9 then var6.Size.Size_150 else 0)
	end, { var6.Size.Size_150 })
end
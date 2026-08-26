local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local t = { frequency = 3, dampingRatio = 1 }

return function()
	-- upvalues: reactModule (ref), reactOtterModule (ref), t (ref)
	local var1, var2 = reactModule.useState(true)
	local var3, var4 = reactOtterModule.useAnimatedBinding(0, function()
		-- upvalues: var2 (ref)
		var2(false)
	end)
	
	return {
		onLoaded = reactModule.useCallback(function(p1)
			-- upvalues: var4 (ref), reactOtterModule (copy), t (copy)
			if p1 == Enum.AssetFetchStatus.Success then
				var4(reactOtterModule.spring(1, t))
			end
		end, {}),
		skeletonVisible = var1,
		overlayTransparency = var3
	}
end
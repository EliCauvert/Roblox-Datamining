local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local t = { frequency = 3, dampingRatio = 1 }

return function() --[[ line: 18 | named "useImageLoadFade" ]]
	-- upvalues: reactModule (ref), reactOtterModule (ref), t (ref)
	local var3, var4 = reactModule.useState(true)
	local var5, var6 = reactOtterModule.useAnimatedBinding(0, function() --[[ line: 21 ]]
		-- upvalues: var4 (ref)
		var4(false)
	end)
	
	return {
		onLoaded = reactModule.useCallback(function(p0) --[[ line: 25 ]]
			-- upvalues: var6 (ref), reactOtterModule (copy), t (copy)
			if p0 == Enum.AssetFetchStatus.Success then
				var6(reactOtterModule.spring(1, t))
			end
		end, {}),
		skeletonVisible = var3,
		overlayTransparency = var5
	}
end
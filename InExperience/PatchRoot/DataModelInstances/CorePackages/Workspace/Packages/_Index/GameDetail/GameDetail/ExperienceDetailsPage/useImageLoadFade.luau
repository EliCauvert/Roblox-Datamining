local Parent = script:FindFirstAncestor("GameDetail").Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local config = { frequency = 3, dampingRatio = 1 }

return function() --[[ Line: 18 | Named "useImageLoadFade" ]]
	-- upvalues: ReactModule (copy), ReactOtterModule (copy), config (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, function() --[[ Line: 21 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end)
	
	return {
		onLoaded = ReactModule.useCallback(function(AssetFetchStatus) --[[ Line: 25 ]]
			-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
			if AssetFetchStatus == Enum.AssetFetchStatus.Success then
				UseAnimatedBindingResult2((ReactOtterModule.spring(1, config)))
			end
		end, {}),
		skeletonVisible = UseStateResult,
		overlayTransparency = UseAnimatedBindingResult
	}
end
local Parent = script:FindFirstAncestor("AppBlox").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local _ = require(script.Parent.MediaGalleryTypes)
local config = {
	zIndex = 1,
	overlayTransparency = 0.5,
	animationConfig = { dampingRatio = 1, frequency = 6.666666666666667 }
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), ReactModule (copy), ReactOtterModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local CountItems = #JoinResult.items
	local UseStyleResult = UseStyleFunction()
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, (ReactModule.useCallback(function()
		-- upvalues: JoinResult (copy)
		if JoinResult.crossAnim.isCrossFade then
			JoinResult.crossAnim.setCrossFade(false)
			JoinResult.crossAnim.setCurrentIndex(JoinResult.crossAnim.nextIndex)
		end
	end, {
		JoinResult.crossAnim.isCrossFade,
		JoinResult.crossAnim.nextIndex,
		JoinResult.crossAnim.setCrossFade,
		JoinResult.crossAnim.setCurrentIndex
	})))
	ReactModule.useEffect(function()
		-- upvalues: CountItems (copy), JoinResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		if CountItems < 2 then return end
		if JoinResult.crossAnim.isCrossFade then
			UseAnimatedBindingResult2(ReactOtterModule.spring(1, JoinResult.animationConfig))
			
			return
		else
			UseAnimatedBindingResult2((ReactOtterModule.instant(0)))
		end
	end, {
		JoinResult.crossAnim.isCrossFade,
		JoinResult.crossAnim.nextIndex,
		JoinResult.animationConfig
	})
	
	return ReactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = JoinResult.zIndex,
		Image = JoinResult.items[JoinResult.crossAnim.currentIndex].imageId,
		ScaleType = Enum.ScaleType.Crop,
		ImageTransparency = UseAnimatedBindingResult
	}, {
		NextImage = if CountItems >= 2 then ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(0, 0),
			Size = UDim2.fromScale(1, 1),
			Image = JoinResult.items[JoinResult.crossAnim.nextIndex].imageId,
			ScaleType = Enum.ScaleType.Crop,
			ImageTransparency = UseAnimatedBindingResult:map(function(p2: number): number
				return 1 - p2
			end)
		}) else nil,
		Overlay = ReactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = JoinResult.overlayTransparency,
			BackgroundColor3 = UseStyleResult.Theme.Overlay.Color
		})
	})
end
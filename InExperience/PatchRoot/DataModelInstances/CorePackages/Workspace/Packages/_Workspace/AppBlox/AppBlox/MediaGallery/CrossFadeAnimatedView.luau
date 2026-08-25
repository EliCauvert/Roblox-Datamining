local parent = script:FindFirstAncestor("AppBlox").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local _ = require(script.Parent.MediaGalleryTypes)
local t = {
	zIndex = 1,
	overlayTransparency = 0.5,
	animationConfig = { dampingRatio = 1, frequency = 6.666666666667 }
}

return function(vectorA)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), reactModule (ref), reactOtterModule (ref)
	local var4 = cryoModule.Dictionary.join(t, vectorA)
	local itemsCount = #var4.items
	local var6 = useStyle()
	local var7, var8 = reactOtterModule.useAnimatedBinding(0, reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		if var4.crossAnim.isCrossFade then
			var4.crossAnim.setCrossFade(false)
			var4.crossAnim.setCurrentIndex(var4.crossAnim.nextIndex)
		end
	end, {
		var4.crossAnim.isCrossFade,
		var4.crossAnim.nextIndex,
		var4.crossAnim.setCrossFade,
		var4.crossAnim.setCurrentIndex
	}))
	reactModule.useEffect(function()
		-- upvalues: itemsCount (ref), var4 (ref), var8 (ref), reactOtterModule (copy)
		if itemsCount < 2 then return end
		if var4.crossAnim.isCrossFade then
			var8(reactOtterModule.spring(1, var4.animationConfig))
			
			return
		end
		var8(reactOtterModule.instant(0))
	end, {
		var4.crossAnim.isCrossFade,
		var4.crossAnim.nextIndex,
		var4.animationConfig
	})
	
	return reactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = var4.zIndex,
		Image = var4.items[var4.crossAnim.currentIndex].imageId,
		ScaleType = Enum.ScaleType.Crop,
		ImageTransparency = var7
	}, {
		NextImage = if itemsCount >= 2 then reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(0, 0),
			Size = UDim2.fromScale(1, 1),
			Image = var4.items[var4.crossAnim.nextIndex].imageId,
			ScaleType = Enum.ScaleType.Crop,
			ImageTransparency = var7:map(function(p0)
				return 1 - p0
			end)
		}) else nil,
		Overlay = reactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = var4.overlayTransparency,
			BackgroundColor3 = var6.Theme.Overlay.Color
		})
	})
end
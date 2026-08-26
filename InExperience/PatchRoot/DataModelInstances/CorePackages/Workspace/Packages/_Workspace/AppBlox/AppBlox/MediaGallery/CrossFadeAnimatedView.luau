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
	local var1 = cryoModule.Dictionary.join(t, vectorA)
	local itemsCount = #var1.items
	local var2 = useStyle()
	local var3, var4 = reactOtterModule.useAnimatedBinding(0, reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		if var1.crossAnim.isCrossFade then
			var1.crossAnim.setCrossFade(false)
			var1.crossAnim.setCurrentIndex(var1.crossAnim.nextIndex)
		end
	end, {
		var1.crossAnim.isCrossFade,
		var1.crossAnim.nextIndex,
		var1.crossAnim.setCrossFade,
		var1.crossAnim.setCurrentIndex
	}))
	reactModule.useEffect(function()
		-- upvalues: itemsCount (ref), var1 (ref), var4 (ref), reactOtterModule (copy)
		if itemsCount < 2 then return end
		if var1.crossAnim.isCrossFade then
			var4(reactOtterModule.spring(1, var1.animationConfig))
			
			return
		end
		var4(reactOtterModule.instant(0))
	end, {
		var1.crossAnim.isCrossFade,
		var1.crossAnim.nextIndex,
		var1.animationConfig
	})
	
	return reactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = var1.zIndex,
		Image = var1.items[var1.crossAnim.currentIndex].imageId,
		ScaleType = Enum.ScaleType.Crop,
		ImageTransparency = var3
	}, {
		NextImage = if itemsCount >= 2 then reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(0, 0),
			Size = UDim2.fromScale(1, 1),
			Image = var1.items[var1.crossAnim.nextIndex].imageId,
			ScaleType = Enum.ScaleType.Crop,
			ImageTransparency = var3:map(function(p1)
				return 1 - p1
			end)
		}) else nil,
		Overlay = reactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = var1.overlayTransparency,
			BackgroundColor3 = var2.Theme.Overlay.Color
		})
	})
end
local Parent = script:FindFirstAncestor("MomentsCreation").Parent
local ReactModule = require(Parent.React)
local Image = require(Parent.Foundation).Image
local UseCallbackFunction = ReactModule.useCallback

return function(p1)
	-- upvalues: UseCallbackFunction (copy), ReactModule (copy), Image (copy)
	local StickerURI = p1.stickerURI
	local OnStickerSelectedFunction = p1.onStickerSelected
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: OnStickerSelectedFunction (copy), StickerURI (copy)
		if OnStickerSelectedFunction then
			OnStickerSelectedFunction(StickerURI)
		end
	end, { OnStickerSelectedFunction, StickerURI })
	
	return ReactModule.createElement(Image, {
		BackgroundTransparency = 1,
		tag = "size-1000-1000 radius-medium",
		LayoutOrder = p1.layoutOrder,
		onActivated = if OnStickerSelectedFunction then UseCallbackResult else nil,
		Image = StickerURI,
		ScaleType = Enum.ScaleType.Fit
	})
end
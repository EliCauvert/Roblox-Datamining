local parent = script:FindFirstAncestor("MomentsCreation").Parent
local reactModule = require(parent.React)
local image = require(parent.Foundation).Image
local useCallback = reactModule.useCallback

return function(p0)
	-- upvalues: useCallback (ref), reactModule (ref), image (ref)
	local stickerURI = p0.stickerURI
	local onStickerSelected = p0.onStickerSelected
	
	return reactModule.createElement(image, {
		BackgroundTransparency = 1,
		tag = "size-1000-1000 radius-medium",
		LayoutOrder = p0.layoutOrder,
		onActivated = if onStickerSelected then useCallback(function()
			-- upvalues: onStickerSelected (ref), stickerURI (ref)
			if onStickerSelected then
				onStickerSelected(stickerURI)
			end
		end, { onStickerSelected, stickerURI }) else nil,
		Image = stickerURI,
		ScaleType = Enum.ScaleType.Fit
	})
end
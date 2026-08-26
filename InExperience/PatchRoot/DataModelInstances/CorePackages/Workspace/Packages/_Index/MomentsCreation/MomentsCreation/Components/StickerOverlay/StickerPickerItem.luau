local parent = script:FindFirstAncestor("MomentsCreation").Parent
local reactModule = require(parent.React)
local image = require(parent.Foundation).Image
local useCallback = reactModule.useCallback

return function(p1)
	-- upvalues: useCallback (ref), reactModule (ref), image (ref)
	local stickerURI = p1.stickerURI
	local onStickerSelected = p1.onStickerSelected
	
	return reactModule.createElement(image, {
		BackgroundTransparency = 1,
		tag = "size-1000-1000 radius-medium",
		LayoutOrder = p1.layoutOrder,
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
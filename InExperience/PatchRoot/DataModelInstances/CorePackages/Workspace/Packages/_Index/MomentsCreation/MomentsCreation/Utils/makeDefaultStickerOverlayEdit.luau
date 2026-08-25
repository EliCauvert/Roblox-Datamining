local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local constantsModule = require(momentsCreation.Constants)
local _ = require(momentsCreation.Parent.MomentsTypes)

return function()
	-- upvalues: constantsModule (ref)
	return {
		stickerURI = nil,
		rotation = 0,
		scale = 1,
		zIndex = 1,
		position = UDim2.fromScale(0.5, 0.5),
		stickerSize = constantsModule.StickerOverlay.DefaultStickerSize
	}
end
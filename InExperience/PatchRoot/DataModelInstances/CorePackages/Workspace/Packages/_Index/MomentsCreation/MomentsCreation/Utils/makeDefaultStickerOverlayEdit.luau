local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local ConstantsModule = require(MomentsCreation.Constants)
local _ = require(MomentsCreation.Parent.MomentsTypes)

return function() --[[ Line: 9 | Named "makeDefaultStickerOverlayEdit" ]]
	-- upvalues: ConstantsModule (copy)
	return {
		stickerURI = nil,
		rotation = 0,
		scale = 1,
		zIndex = 1,
		position = UDim2.fromScale(0.5, 0.5),
		stickerSize = ConstantsModule.StickerOverlay.DefaultStickerSize
	}
end
local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local ReactModule = require(AvatarWorkshop.Parent.React)
local AvatarPreviewContainerModule = require(AvatarWorkshop.Components.AvatarPreview.AvatarPreviewContainer)
local _ = require(script.Parent.useInGameAvatarPreviewViewModel)

return function(p1)
	-- upvalues: ReactModule (copy), AvatarPreviewContainerModule (copy)
	return ReactModule.createElement(AvatarPreviewContainerModule, p1.previewProps)
end
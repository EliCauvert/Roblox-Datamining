local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)
local view = foundationModule.View
local image = foundationModule.Image

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), image (ref)
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-center",
		Size = p1.size,
		Position = p1.position,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		backgroundStyle = p1.backgroundStyle,
		AutomaticSize = p1.automaticSize,
		testId = p1.testId
	}, {
		Image = reactModule.createElement(image, {
			Image = p1.image,
			Size = p1.imageSize,
			TileSize = p1.tileSize,
			ScaleType = p1.scaleType,
			ResampleMode = p1.resampleMode,
			imageStyle = p1.imageStyle,
			tag = p1.imageTag,
			SizeConstraint = p1.imageSizeConstraint
		})
	})
end)
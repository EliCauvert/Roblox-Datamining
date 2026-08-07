local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)
local view = foundationModule.View
local image = foundationModule.Image

return reactModule.memo(function(p0) --[[ line: 42 | named "SduiDetailsPageImageHeader" ]]
	-- upvalues: reactModule (ref), view (ref), image (ref)
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-center",
		Size = p0.size,
		Position = p0.position,
		AnchorPoint = p0.anchorPoint,
		LayoutOrder = p0.layoutOrder,
		Visible = p0.visible,
		ZIndex = p0.zIndex,
		backgroundStyle = p0.backgroundStyle,
		AutomaticSize = p0.automaticSize,
		testId = p0.testId
	}, {
		Image = reactModule.createElement(image, {
			Image = p0.image,
			Size = p0.imageSize,
			TileSize = p0.tileSize,
			ScaleType = p0.scaleType,
			ResampleMode = p0.resampleMode,
			imageStyle = p0.imageStyle,
			tag = p0.imageTag,
			SizeConstraint = p0.imageSizeConstraint
		})
	})
end)
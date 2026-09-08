local graphing = script:FindFirstAncestor("Graphing")
local reactModule = require(graphing.Parent.React)
local _ = require(graphing.Types)
local positionerModule = require(graphing.Components.Positioner)
local styleUtilModule = require(graphing.Util.StyleUtil)

function Point(p1)
	-- upvalues: styleUtilModule (ref), reactModule (ref), positionerModule (ref)
	local size = p1.Size or styleUtilModule.POINT_HANDLE_SIZE
	local outlineThickness = p1.OutlineThickness or styleUtilModule.POINT_HANDLE_OUTLINE_THICKNESS
	local color3 = p1.Color3 or styleUtilModule.POINT_HANDLE_COLOR3
	
	return reactModule.createElement(positionerModule, {
		Position = p1.Position,
		ZIndex = p1.ZIndex,
		ref = p1.positionerRef
	}, {
		Outer = reactModule.createElement("ImageButton", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(size + 2 * outlineThickness, size + 2 * outlineThickness),
			Image = p1.Image or styleUtilModule.POINT_HANDLE_IMAGE,
			ImageColor3 = if outlineThickness == 0 then color3 else p1.OutlineColor3 or styleUtilModule.POINT_HANDLE_OUTLINE_COLOR3,
			ImageTransparency = p1.Transparency,
			BackgroundTransparency = 1,
			ZIndex = 1,
			[reactModule.Tag] = p1.Tag
		}, p1.children),
		Inner = outlineThickness > 0 and reactModule.createElement("ImageButton", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(size, size),
			Interactable = false,
			Selectable = false,
			Image = p1.Image or styleUtilModule.POINT_HANDLE_IMAGE,
			ImageColor3 = color3,
			ImageTransparency = p1.Transparency,
			BackgroundTransparency = 1,
			ZIndex = 2,
			[reactModule.Tag] = p1.Tag
		})
	})
end

return Point
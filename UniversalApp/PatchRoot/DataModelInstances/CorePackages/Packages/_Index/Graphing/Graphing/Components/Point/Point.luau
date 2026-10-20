local Graphing = script:FindFirstAncestor("Graphing")
local ReactModule = require(Graphing.Parent.React)
local _ = require(Graphing.Types)
local PositionerModule = require(Graphing.Components.Positioner)
local StyleUtilModule = require(Graphing.Util.StyleUtil)

function Point(p1)
	-- upvalues: StyleUtilModule (copy), ReactModule (copy), PositionerModule (copy)
	local Size = p1.Size or StyleUtilModule.POINT_HANDLE_SIZE
	local OutlineThickness = p1.OutlineThickness or StyleUtilModule.POINT_HANDLE_OUTLINE_THICKNESS
	local _Color3 = p1.Color3 or StyleUtilModule.POINT_HANDLE_COLOR3
	local OutlineColor3 = p1.OutlineColor3 or StyleUtilModule.POINT_HANDLE_OUTLINE_COLOR3
	
	return ReactModule.createElement(PositionerModule, {
		Position = p1.Position,
		ZIndex = p1.ZIndex,
		ref = p1.positionerRef
	}, {
		Outer = ReactModule.createElement("ImageButton", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(Size + 2 * OutlineThickness, Size + 2 * OutlineThickness),
			Image = p1.Image or StyleUtilModule.POINT_HANDLE_IMAGE,
			ImageColor3 = if OutlineThickness == 0 then _Color3 else OutlineColor3,
			ImageTransparency = p1.Transparency,
			BackgroundTransparency = 1,
			ZIndex = 1,
			[ReactModule.Tag] = p1.Tag
		}, p1.children),
		Inner = OutlineThickness > 0 and ReactModule.createElement("ImageButton", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(Size, Size),
			Interactable = false,
			Selectable = false,
			Image = p1.Image or StyleUtilModule.POINT_HANDLE_IMAGE,
			ImageColor3 = _Color3,
			ImageTransparency = p1.Transparency,
			BackgroundTransparency = 1,
			ZIndex = 2,
			[ReactModule.Tag] = p1.Tag
		})
	})
end

return Point
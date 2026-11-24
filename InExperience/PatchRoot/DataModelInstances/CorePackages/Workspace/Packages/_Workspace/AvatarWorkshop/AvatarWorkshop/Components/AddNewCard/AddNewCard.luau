local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local TileShapeModule = require(AvatarWorkshop.Constants.TileShape)

return function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy), StateLayerAffordance (copy), TileShapeModule (copy), IconName (copy), IconSize (copy)
	return ReactModule.createElement(FoundationModule.View, { tag = "size-full", LayoutOrder = Frame.LayoutOrder }, {
		Card = ReactModule.createElement(FoundationModule.View, {
			tag = "col gap-small size-full-0 auto-y",
			testId = "avatar-workshop-add-new-card",
			onActivated = Frame.onActivated,
			stateLayer = { affordance = StateLayerAffordance.None }
		}, {
			Thumbnail = ReactModule.createElement(FoundationModule.Image, {
				tag = "size-full radius-medium clip bg-shift-200",
				LayoutOrder = 1,
				Image = "",
				aspectRatio = {
					AspectRatio = if Frame.tileShape == "Tall" then TileShapeModule.TALL_ASPECT else TileShapeModule.SQUARE_ASPECT,
					AspectType = Enum.AspectType.FitWithinMaxSize,
					DominantAxis = Enum.DominantAxis.Width
				},
				ScaleType = Enum.ScaleType.Crop
			})
		}),
		Icon = ReactModule.createElement(FoundationModule.Icon, {
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			name = IconName.PlusLarge,
			size = IconSize.Large
		})
	})
end
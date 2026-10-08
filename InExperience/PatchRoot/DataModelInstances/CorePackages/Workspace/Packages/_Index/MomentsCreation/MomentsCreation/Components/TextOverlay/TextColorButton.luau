local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local fFlagMomentsTextOverlayColorPickerIconModule = require(momentsCreation.Flags.FFlagMomentsTextOverlayColorPickerIcon)
local image = foundationModule.Image
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), fFlagMomentsTextOverlayColorPickerIconModule (ref), reactModule (ref), view (ref), iconButton (ref), builderIconsModule (ref), foundationModule (ref), image (ref)
	local var1 = useTokens()
	
	return if fFlagMomentsTextOverlayColorPickerIconModule then reactModule.createElement(view, {
		tag = "radius-circle",
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.fromOffset(var1.Size.Size_1000, var1.Size.Size_1000),
		onActivated = p1.onToggle,
		cursor = {
			radius = UDim.new(0, var1.Radius.Circle),
			offset = var1.Size.Size_150,
			borderWidth = var1.Stroke.Thicker
		}
	}, {
		Highlight = if p1.expanded then reactModule.createElement(view, {
			ZIndex = 1,
			tag = "size-full radius-circle",
			backgroundStyle = var1.Color.State.Hover
		}) else nil,
		Icon = reactModule.createElement(image, {
			ZIndex = 2,
			Image = "rbxasset://textures/ui/Moments/text-color-picker.png",
			tag = "position-center-center anchor-center-center",
			Size = UDim2.fromOffset(var1.Size.Size_600, var1.Size.Size_600)
		})
	}) else reactModule.createElement(view, {
		tag = "auto-xy radius-circle",
		LayoutOrder = p1.LayoutOrder
	}, {
		Icon = reactModule.createElement(iconButton, {
			isCircular = true,
			icon = builderIconsModule.Icon.PaintBucket,
			onActivated = p1.onToggle,
			size = foundationModule.Enums.InputSize.Medium
		}),
		Highlight = if p1.expanded then reactModule.createElement(view, {
			ZIndex = 2,
			tag = "size-full radius-circle",
			backgroundStyle = var1.Color.State.Hover
		}) else nil
	})
end
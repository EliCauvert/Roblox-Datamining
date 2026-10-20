local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FFlagMomentsTextOverlayColorPickerIconModule = require(MomentsCreation.Flags.FFlagMomentsTextOverlayColorPickerIcon)
local Image = FoundationModule.Image
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), FFlagMomentsTextOverlayColorPickerIconModule (copy), ReactModule (copy), View (copy), IconButton (copy), BuilderIconsModule (copy), FoundationModule (copy), Image (copy)
	local UseTokensResult = UseTokensFunction()
	
	return if FFlagMomentsTextOverlayColorPickerIconModule then ReactModule.createElement(View, {
		tag = "radius-circle",
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_1000),
		onActivated = Frame.onToggle,
		cursor = {
			radius = UDim.new(0, UseTokensResult.Radius.Circle),
			offset = UseTokensResult.Size.Size_150,
			borderWidth = UseTokensResult.Stroke.Thicker
		}
	}, {
		Highlight = if Frame.expanded then ReactModule.createElement(View, {
			ZIndex = 1,
			tag = "size-full radius-circle",
			backgroundStyle = UseTokensResult.Color.State.Hover
		}) else nil,
		Icon = ReactModule.createElement(Image, {
			ZIndex = 2,
			Image = "rbxasset://textures/ui/Moments/text-color-picker.png",
			tag = "position-center-center anchor-center-center",
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_600, UseTokensResult.Size.Size_600)
		})
	}) else ReactModule.createElement(View, {
		tag = "auto-xy radius-circle",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Icon = ReactModule.createElement(IconButton, {
			isCircular = true,
			icon = BuilderIconsModule.Icon.PaintBucket,
			onActivated = Frame.onToggle,
			size = FoundationModule.Enums.InputSize.Medium
		}),
		Highlight = if Frame.expanded then ReactModule.createElement(View, {
			ZIndex = 2,
			tag = "size-full radius-circle",
			backgroundStyle = UseTokensResult.Color.State.Hover
		}) else nil
	})
end
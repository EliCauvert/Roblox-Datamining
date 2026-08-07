local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local core = parent_1.Core
local reactModule = require(parent_2.React)
local foundationModule = require(parent_2.Foundation)
local controlStateModule = require(core.Control.Enum.ControlState)
local getContentStyleModule = require(core.Button.getContentStyle)
local interactableModule = require(core.Control.Interactable)
local useStyleModule = require(core.Style.useStyle)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local skeleton = foundationModule.Skeleton
local genericTextLabelModule = require(core.Text.GenericTextLabel.GenericTextLabel)
local imagesModule = require(parent.ImageSet.Images)
local iconSizeModule = require(parent.ImageSet.Enum.IconSize)
local getIconSizeModule = require(parent.ImageSet.getIconSize)
local circle9 = imagesModule["component_assets/circle_9"]
local circle9Stroke1 = imagesModule["component_assets/circle_9_stroke_1"]
local t = {
	[controlStateModule.Default] = "SecondaryDefault",
	[controlStateModule.Hover] = "SecondaryOnHover"
}
local t_1 = {
	[controlStateModule.Default] = "SecondaryDefault",
	[controlStateModule.Hover] = "SecondaryDefault"
}
local t_2 = {
	[controlStateModule.Default] = "TextDefault",
	[controlStateModule.Hover] = "TextEmphasis"
}
local t_3 = {
	[controlStateModule.Default] = "TextEmphasis",
	[controlStateModule.Hover] = "TextEmphasis"
}
local t_4 = { [controlStateModule.Default] = "BackgroundMuted" }
local t_5 = { [controlStateModule.Default] = "PlaceHolder" }
local t_6 = { [controlStateModule.Default] = "PlaceHolder" }
local t_7 = { [controlStateModule.Default] = "TextEmphasis" }

return function(p0) --[[ line: 97 | named "TileSlot" ]]
	-- upvalues: reactModule (ref), controlStateModule (ref), useStyleModule (ref), getContentStyleModule (ref), t_1 (ref), t (ref), t_3 (ref), t_2 (ref), t_7 (ref), t_5 (ref), t_4 (ref), t_6 (ref), interactableModule (ref), imageSetComponentModule (ref), circle9 (ref), circle9Stroke1 (ref), getIconSizeModule (ref), iconSizeModule (ref), genericTextLabelModule (ref), skeleton (ref)
	local var19, var20 = reactModule.useState(controlStateModule.Initialize)
	local var21, var22 = reactModule.useState(false)
	local var23 = reactModule.useCallback(function() --[[ line: 101 ]]
		-- upvalues: p0 (ref)
		p0.onActivated(p0.index)
	end, { p0.onActivated, p0.index })
	local var24 = reactModule.useCallback(function(p1, p2) --[[ line: 105 ]]
		-- upvalues: var20 (ref), controlStateModule (copy), var22 (ref), p0 (ref)
		var20(p2)
		
		if p2 == controlStateModule.Hover then
			var22(true)
		else
			var22(false)
		end
		if p0.onStateChanged then
			p0.onStateChanged(p1, p2)
		end
	end, { p0.onStateChanged })
	local var25 = useStyleModule()
	local isDisabled = p0.isDisabled
	local isLoading = p0.isLoading
	local var26 = if isDisabled then controlStateModule.Disabled else var19
	local isSelected = p0.isSelected
	local var21_1 = var21 or isSelected
	local var28 = isSelected and getContentStyleModule(t_1, var26, var25) or getContentStyleModule(t, var26, var25)
	local var29 = isSelected and getContentStyleModule(t_3, var26, var25) or getContentStyleModule(t_2, var26, var25)
	local var30 = getContentStyleModule(t_7, var26, var25)
	local var31 = isSelected and getContentStyleModule(t_5, var26, var25) or getContentStyleModule(t_4, var26, var25)
	local var32 = getContentStyleModule(t_6, var26, var25)
	local subHeader1 = var25.Font.SubHeader1
	local thumbnail = p0.thumbnail
	local var33 = p0.thumbnail ~= nil
	local var34 = p0.displayText ~= nil
	local isDisabled_1 = isDisabled or isLoading
	
	if isDisabled_1 then
		var21_1 = false
	end
	return reactModule.createElement(interactableModule, {
		Size = UDim2.fromOffset(48, 48),
		Position = p0.position or UDim2.fromScale(0, 0),
		BackgroundTransparency = 1,
		onStateChanged = var24,
		[reactModule.Event.Activated] = if not isDisabled_1 then var23 else nil
	}, {
		Button = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Background = reactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				ZIndex = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0, 0),
				Image = circle9,
				ImageColor3 = if var34 then var31.Color else var32.Color,
				ImageTransparency = if var34 then var31.Transparency else var32.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(4, 4, 5, 5)
			}),
			Border = if var21_1 then reactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0, 0),
				Image = circle9Stroke1,
				ImageColor3 = var28.Color,
				ImageTransparency = var28.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(4, 4, 5, 5)
			}) else nil,
			ButtonContentLayer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 3,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0, 0)
			}, {
				Thumbnail = if isLoading or not var33 then nil else reactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					ZIndex = 3,
					Size = UDim2.fromOffset(getIconSizeModule(iconSizeModule.Medium), getIconSizeModule(iconSizeModule.Medium)),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = thumbnail,
					ImageColor3 = var30.Color,
					ImageTransparency = var30.Transparency
				}),
				Text = if isLoading or not var34 then nil else reactModule.createElement(genericTextLabelModule, {
					BackgroundTransparency = 1,
					ZIndex = 3,
					Size = UDim2.new(1, -24, 1, -24),
					Text = p0.displayText,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					fontStyle = subHeader1,
					colorStyle = var29
				}),
				LoadingShimmer = if isLoading then reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) }) else nil
			})
		})
	})
end
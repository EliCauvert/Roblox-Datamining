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

return function(p1)
	-- upvalues: reactModule (ref), controlStateModule (ref), useStyleModule (ref), getContentStyleModule (ref), t_1 (ref), t (ref), t_3 (ref), t_2 (ref), t_7 (ref), t_5 (ref), t_4 (ref), t_6 (ref), interactableModule (ref), imageSetComponentModule (ref), circle9 (ref), circle9Stroke1 (ref), getIconSizeModule (ref), iconSizeModule (ref), genericTextLabelModule (ref), skeleton (ref)
	local var1, var2 = reactModule.useState(controlStateModule.Initialize)
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.onActivated(p1.index)
	end, { p1.onActivated, p1.index })
	local var6 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (ref), controlStateModule (copy), var4 (ref), p1 (ref)
		var2(p3)
		
		if p3 == controlStateModule.Hover then
			var4(true)
		else
			var4(false)
		end
		if p1.onStateChanged then
			p1.onStateChanged(p2, p3)
		end
	end, { p1.onStateChanged })
	local var7 = useStyleModule()
	local isDisabled = p1.isDisabled
	local isLoading = p1.isLoading
	local var8 = if isDisabled then controlStateModule.Disabled else var1
	local isSelected = p1.isSelected
	local var9 = var3 or isSelected
	local var10 = isSelected and getContentStyleModule(t_1, var8, var7) or getContentStyleModule(t, var8, var7)
	local var11 = isSelected and getContentStyleModule(t_3, var8, var7) or getContentStyleModule(t_2, var8, var7)
	local var12 = getContentStyleModule(t_7, var8, var7)
	local var13 = isSelected and getContentStyleModule(t_5, var8, var7) or getContentStyleModule(t_4, var8, var7)
	local var14 = getContentStyleModule(t_6, var8, var7)
	local subHeader1 = var7.Font.SubHeader1
	local thumbnail = p1.thumbnail
	local var15 = p1.thumbnail ~= nil
	local var16 = p1.displayText ~= nil
	local isDisabled_1 = isDisabled or isLoading
	
	if isDisabled_1 then
		var9 = false
	end
	return reactModule.createElement(interactableModule, {
		Size = UDim2.fromOffset(48, 48),
		Position = p1.position or UDim2.fromScale(0, 0),
		BackgroundTransparency = 1,
		onStateChanged = var6,
		[reactModule.Event.Activated] = if not isDisabled_1 then var5 else nil
	}, {
		Button = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Background = reactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				ZIndex = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0, 0),
				Image = circle9,
				ImageColor3 = if var16 then var13.Color else var14.Color,
				ImageTransparency = if var16 then var13.Transparency else var14.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(4, 4, 5, 5)
			}),
			Border = if var9 then reactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0, 0),
				Image = circle9Stroke1,
				ImageColor3 = var10.Color,
				ImageTransparency = var10.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(4, 4, 5, 5)
			}) else nil,
			ButtonContentLayer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 3,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0, 0)
			}, {
				Thumbnail = if isLoading or not var15 then nil else reactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					ZIndex = 3,
					Size = UDim2.fromOffset(getIconSizeModule(iconSizeModule.Medium), getIconSizeModule(iconSizeModule.Medium)),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = thumbnail,
					ImageColor3 = var12.Color,
					ImageTransparency = var12.Transparency
				}),
				Text = if isLoading or not var16 then nil else reactModule.createElement(genericTextLabelModule, {
					BackgroundTransparency = 1,
					ZIndex = 3,
					Size = UDim2.new(1, -24, 1, -24),
					Text = p1.displayText,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					fontStyle = subHeader1,
					colorStyle = var11
				}),
				LoadingShimmer = if isLoading then reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) }) else nil
			})
		})
	})
end
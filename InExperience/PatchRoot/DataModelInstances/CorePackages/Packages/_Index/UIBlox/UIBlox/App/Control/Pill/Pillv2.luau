local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local core = parent_1.Core
local cryoModule = require(parent_2.Cryo)
local reactModule = require(parent_2.React)
local foundationModule = require(parent_2.Foundation)
local imagesModule = require(parent.ImageSet.Images)
local iconSizeModule = require(parent.ImageSet.Enum.IconSize)
local getIconSizeModule = require(parent.ImageSet.getIconSize)
local useSelectionCursorModule = require(parent.SelectionImage.useSelectionCursor)
local cursorKindModule = require(parent.SelectionImage.CursorKind)
local useStyleModule = require(core.Style.useStyle)
local controlStateModule = require(core.Control.Enum.ControlState)
local interactableModule = require(core.Control.Interactable)
local useControlStateModule = require(core.Control.useControlState)
local getContentStyleModule = require(core.Button.getContentStyle)
local genericTextLabelModule = require(core.Text.GenericTextLabel.GenericTextLabel)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local getTextSizeModule = require(parent_1.Core.Text.GetTextSize)
local t = {
	hasBorder = false,
	isDisabled = false,
	isLoading = false,
	isSelected = false,
	layoutOrder = 1,
	text = ""
}
local t_1 = {
	[controlStateModule.Default] = "SystemPrimaryContent",
	[controlStateModule.Hover] = "SystemPrimaryContent"
}
local t_2 = {
	[controlStateModule.Default] = "TextDefault",
	[controlStateModule.Hover] = "TextEmphasis"
}
local t_3 = {
	[controlStateModule.Default] = "SystemPrimaryContent",
	[controlStateModule.Hover] = "SystemPrimaryContent"
}
local t_4 = {
	[controlStateModule.Default] = "BackgroundUIDefault",
	[controlStateModule.Hover] = "BackgroundUIDefault"
}
local t_5 = {
	[controlStateModule.Default] = "SystemPrimaryDefault",
	[controlStateModule.Hover] = "SystemPrimaryOnHover"
}
local t_6 = {
	[controlStateModule.Default] = "BackgroundOnHover",
	[controlStateModule.Hover] = "BackgroundOnHover"
}

local function Pillv2(p1)
	-- upvalues: cryoModule (ref), t (ref), useControlStateModule (ref), reactModule (ref), useStyleModule (ref), useSelectionCursorModule (ref), cursorKindModule (ref), t_3 (ref), t_2 (ref), t_5 (ref), t_4 (ref), getContentStyleModule (ref), t_1 (ref), t_6 (ref), getIconSizeModule (ref), iconSizeModule (ref), getTextSizeModule (ref), skeleton (ref), radius (ref), controlStateModule (ref), interactableModule (ref), genericTextLabelModule (ref), imageSetComponentModule (ref), imagesModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local text = var1.text
	local var2, var3 = useControlStateModule()
	local var4 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var1 (ref), var3 (ref)
		if var1.onStateChanged then
			var1.onStateChanged(p2, p3)
		end
		var3(p2, p3)
	end, { var1.onStateChanged })
	local var5 = useStyleModule()
	local font = var5.Font
	local var6 = useSelectionCursorModule(cursorKindModule.SmallPill)
	local var7 = if var1.isSelected then t_3 else t_2
	local var8 = if var1.isSelected then t_5 else t_4
	local var9 = getContentStyleModule(t_1, var2, var5)
	local var10 = getContentStyleModule(var7, var2, var5)
	local var11 = getContentStyleModule(var8, var2, var5)
	local var12 = getContentStyleModule(t_6, var2, var5)
	local var13 = getIconSizeModule(iconSizeModule.Small)
	local var14 = font.CaptionHeader.RelativeSize * font.BaseSize
	local x = getTextSizeModule(text, var14, font.CaptionHeader.Font, Vector2.new(10000, 10000)).X
	local var15 = x + 24
	local var16 = 216
	
	if var1.isSelected then
		local var17 = 4 + var13
		var15 += var17
		var16 -= var17
	end
	return if var1.isLoading then reactModule.createElement(skeleton, {
		LayoutOrder = var1.layoutOrder,
		Size = UDim2.fromOffset(var15, 28),
		radius = radius.Circle
	}) else reactModule.createElement(interactableModule, {
		Size = UDim2.new(0, var15, 0, 28),
		BackgroundColor3 = var11.Color,
		BackgroundTransparency = var11.Transparency,
		ImageColor3 = var11.Color,
		ImageTransparency = var11.Transparency,
		AutoButtonColor = false,
		BorderSizePixel = 0,
		LayoutOrder = var1.layoutOrder,
		ScaleType = Enum.ScaleType.Slice,
		isDisabled = var1.isDisabled,
		SelectionImageObject = var6,
		[reactModule.Event.Activated] = if not var1.isLoading then var1.onActivated else nil,
		onStateChanged = var4,
		ref = var1.controlRef,
		NextSelectionLeft = var1.NextSelectionLeft,
		NextSelectionRight = var1.NextSelectionRight,
		NextSelectionUp = var1.NextSelectionUp,
		NextSelectionDown = var1.NextSelectionDown
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
		UISizeConstraint = reactModule.createElement("UISizeConstraint", {
			MinSize = Vector2.new(28, 28),
			MaxSize = Vector2.new(240, 28)
		}),
		BackgroundLayer2 = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = var12.Color,
			BackgroundTransparency = if not var1.isSelected and var2 == controlStateModule.Hover then var12.Transparency else 1
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			UIStroke = if var1.hasBorder then reactModule.createElement("UIStroke", {
				Thickness = 1,
				Color = var5.Theme.Divider.Color,
				Transparency = var5.Theme.Divider.Transparency
			}) else nil,
			Content = reactModule.createElement("Frame", {
				ClipsDescendants = true,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(0, x + 4 + var13, 1, 0)
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 4),
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				TextArea = string.len(text) > 0 and reactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(x, var14)
				}, {
					PillText = reactModule.createElement(genericTextLabelModule, {
						BackgroundTransparency = 1,
						Text = text,
						fontStyle = font.CaptionHeader,
						colorStyle = var10,
						TextTruncate = Enum.TextTruncate.AtEnd,
						Size = UDim2.fromOffset(var16, var14),
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}),
					reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var16, 28) })
				}),
				CloseIcon = var1.isSelected and reactModule.createElement(imageSetComponentModule.Label, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.fromOffset(var13, var13),
					Image = imagesModule["icons/navigation/close_small"],
					ImageColor3 = var9.Color,
					ImageTransparency = var9.Transparency
				}),
				UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(216, 28) })
			})
		})
	})
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), Pillv2 (ref), cryoModule (ref)
	return reactModule.createElement(Pillv2, cryoModule.Dictionary.join(p1, { controlRef = p2 }))
end)
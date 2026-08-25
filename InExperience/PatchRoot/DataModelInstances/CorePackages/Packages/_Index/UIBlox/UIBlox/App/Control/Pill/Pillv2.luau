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

local function Pillv2(p0)
	-- upvalues: cryoModule (ref), t (ref), useControlStateModule (ref), reactModule (ref), useStyleModule (ref), useSelectionCursorModule (ref), cursorKindModule (ref), t_3 (ref), t_2 (ref), t_5 (ref), t_4 (ref), getContentStyleModule (ref), t_1 (ref), t_6 (ref), getIconSizeModule (ref), iconSizeModule (ref), getTextSizeModule (ref), skeleton (ref), radius (ref), controlStateModule (ref), interactableModule (ref), genericTextLabelModule (ref), imageSetComponentModule (ref), imagesModule (ref)
	local var24 = cryoModule.Dictionary.join(t, p0)
	local text = var24.text
	local var25, var26 = useControlStateModule()
	local var27 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var24 (ref), var26 (ref)
		if var24.onStateChanged then
			var24.onStateChanged(p1, p2)
		end
		var26(p1, p2)
	end, { var24.onStateChanged })
	local var28 = useStyleModule()
	local font = var28.Font
	local var29 = useSelectionCursorModule(cursorKindModule.SmallPill)
	local var30 = if var24.isSelected then t_3 else t_2
	local var31 = if var24.isSelected then t_5 else t_4
	local var32 = getContentStyleModule(t_1, var25, var28)
	local var33 = getContentStyleModule(var30, var25, var28)
	local var34 = getContentStyleModule(var31, var25, var28)
	local var35 = getContentStyleModule(t_6, var25, var28)
	local var36 = getIconSizeModule(iconSizeModule.Small)
	local var37 = font.CaptionHeader.RelativeSize * font.BaseSize
	local x = getTextSizeModule(text, var37, font.CaptionHeader.Font, Vector2.new(10000, 10000)).X
	local var38 = x + 24
	local var39 = 216
	
	if var24.isSelected then
		local var40 = 4 + var36
		var38 += var40
		var39 -= var40
	end
	return if var24.isLoading then reactModule.createElement(skeleton, {
		LayoutOrder = var24.layoutOrder,
		Size = UDim2.fromOffset(var38, 28),
		radius = radius.Circle
	}) else reactModule.createElement(interactableModule, {
		Size = UDim2.new(0, var38, 0, 28),
		BackgroundColor3 = var34.Color,
		BackgroundTransparency = var34.Transparency,
		ImageColor3 = var34.Color,
		ImageTransparency = var34.Transparency,
		AutoButtonColor = false,
		BorderSizePixel = 0,
		LayoutOrder = var24.layoutOrder,
		ScaleType = Enum.ScaleType.Slice,
		isDisabled = var24.isDisabled,
		SelectionImageObject = var29,
		[reactModule.Event.Activated] = if not var24.isLoading then var24.onActivated else nil,
		onStateChanged = var27,
		ref = var24.controlRef,
		NextSelectionLeft = var24.NextSelectionLeft,
		NextSelectionRight = var24.NextSelectionRight,
		NextSelectionUp = var24.NextSelectionUp,
		NextSelectionDown = var24.NextSelectionDown
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
		UISizeConstraint = reactModule.createElement("UISizeConstraint", {
			MinSize = Vector2.new(28, 28),
			MaxSize = Vector2.new(240, 28)
		}),
		BackgroundLayer2 = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = var35.Color,
			BackgroundTransparency = if not var24.isSelected and var25 == controlStateModule.Hover then var35.Transparency else 1
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			UIStroke = if var24.hasBorder then reactModule.createElement("UIStroke", {
				Thickness = 1,
				Color = var28.Theme.Divider.Color,
				Transparency = var28.Theme.Divider.Transparency
			}) else nil,
			Content = reactModule.createElement("Frame", {
				ClipsDescendants = true,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(0, x + 4 + var36, 1, 0)
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
					Size = UDim2.fromOffset(x, var37)
				}, {
					PillText = reactModule.createElement(genericTextLabelModule, {
						BackgroundTransparency = 1,
						Text = text,
						fontStyle = font.CaptionHeader,
						colorStyle = var33,
						TextTruncate = Enum.TextTruncate.AtEnd,
						Size = UDim2.fromOffset(var39, var37),
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}),
					reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var39, 28) })
				}),
				CloseIcon = var24.isSelected and reactModule.createElement(imageSetComponentModule.Label, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.fromOffset(var36, var36),
					Image = imagesModule["icons/navigation/close_small"],
					ImageColor3 = var32.Color,
					ImageTransparency = var32.Transparency
				}),
				UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(216, 28) })
			})
		})
	})
end

return reactModule.forwardRef(function(p3, p4)
	-- upvalues: reactModule (ref), Pillv2 (ref), cryoModule (ref)
	return reactModule.createElement(Pillv2, cryoModule.Dictionary.join(p3, { controlRef = p4 }))
end)
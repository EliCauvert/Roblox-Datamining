local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local parent_4 = parent_3.Parent
local reactModule = require(parent_4.React)
local luauPolyfillModule = require(parent_4.LuauPolyfill)
local _ = require(parent.Types)
local styledTextLabelModule = require(parent_2.Text.StyledTextLabel)
local label = require(parent_3.Core.ImageSet.ImageSetComponent).Label
local buttonModule = require(parent_2.Button.Button)
local buttonTypeModule = require(parent_2.Button.Enum.ButtonType)
local standardButtonSizeModule = require(parent_3.Core.Button.Enum.StandardButtonSize)
local keyLabel = parent_2.Menu.KeyLabel
local keyLabelModule = require(keyLabel.KeyLabel)
local _ = require(keyLabel.Types)
local getKeyLabelWidth = require(keyLabel.Utilities).getKeyLabelWidth
local useStyleModule = require(parent_3.Core.Style.useStyle)
local constantsModule = require(parent.Constants)
local getTextSizeModule = require(parent_3.Core.Text.GetTextSize)
local tooltipOrientationModule = require(parent_1.Tooltip.Enum.TooltipOrientation)
local iconButtonModule = require(parent_3.App.Button.IconButton)
local iconSizeModule = require(parent_3.App.ImageSet.Enum.IconSize)
local imagesModule = require(parent_3.App.ImageSet.Images)
local UIBloxConfigModule = require(parent_3.UIBloxConfig)

local function _(p0, p1) --[[ line: 32 | named "product" ]]
	return Vector2.new(p0.X * p1.X, p0.Y * p1.Y)
end

function getOffsetPosition(value, p2, p3, p4) --[[ line: 37 ]]
	-- upvalues: constantsModule (ref)
	local var16 = constantsModule.ORIENTATION_VECTOR[p3]
	local var17 = p2 + Vector2.new(p4, p4)
	
	return value + Vector2.new(var16.X * var17.X, var16.Y * var17.Y)
end

local _ = function(p5) --[[ line: 44 | named "vectorToPosition" ]]
	return UDim2.fromOffset(p5.X, p5.Y)
end

local _ = function(p6) --[[ line: 50 | named "getContentAnchorPoint" ]]
	-- upvalues: constantsModule (ref)
	return Vector2.new(0.5, 0.5) - 0.5 * constantsModule.ORIENTATION_VECTOR[p6]
end

local _ = function(p7, p8) --[[ line: 55 | named "convertPadding" ]]
	return UDim.new(0, p7 or p8)
end

local _ = function(value, p9) --[[ line: 60 | named "addOffsets" ]]
	-- upvalues: tooltipOrientationModule (ref)
	return value + Vector2.new(p9[tooltipOrientationModule.Left] + p9[tooltipOrientationModule.Right], p9[tooltipOrientationModule.Top] + p9[tooltipOrientationModule.Bottom])
end

local function getHotkeysAndWidth(p10, p11, p12) --[[ line: 68 ]]
	-- upvalues: reactModule (ref), keyLabelModule (ref), getKeyLabelWidth (ref), constantsModule (ref)
	if not p10 or #p10 == 0 then
		return nil, p11
	end
	local t = {}
	local var19 = 0
	
	for i, v in ipairs(p10) do
		t[i] = reactModule.createElement(keyLabelModule, { keyCode = v, LayoutOrder = i })
		var19 += getKeyLabelWidth(v, p12)
	end
	local maxValue = math.max(var19 + constantsModule.HOTKEY_PADDING * (#p10 - 1), p11)
	t.Layout = reactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, constantsModule.HOTKEY_PADDING)
	})
	
	return reactModule.createElement("Frame", {
		Name = "Hotkeys",
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromOffset(maxValue, 0)
	}, t), maxValue
end

return reactModule.forwardRef(function(p13, p14) --[[ line: 104 | named "TooltipWithRef" ]]
	-- upvalues: reactModule (ref), useStyleModule (ref), constantsModule (ref), getTextSizeModule (ref), UIBloxConfigModule (ref), getHotkeysAndWidth (ref), luauPolyfillModule (ref), buttonTypeModule (ref), standardButtonSizeModule (ref), buttonModule (ref), tooltipOrientationModule (ref), label (ref), styledTextLabelModule (ref), iconButtonModule (ref), imagesModule (ref), iconSizeModule (ref)
	assert(p13.headerText or p13.bodyText, "Must supply either header or body")
	assert(not (p13.renderCustomComponents and p13.buttonProps), "renderCustomComponents and buttonProps are not compatible")
	local var21, var22 = reactModule.useState(Vector2.zero)
	local var23 = useStyleModule()
	local textAlignment = p13.textAlignment or Enum.TextXAlignment.Left
	local name = Enum.HorizontalAlignment[textAlignment.Name]
	local theme = var23.Theme
	local font = var23.Font
	local settings = var23.Settings
	local baseSize = font.BaseSize
	local captionHeader = font.CaptionHeader
	local var25 = baseSize * captionHeader.RelativeSize
	local var26 = constantsModule.MAX_WIDTH - (p13.PaddingLeft or constantsModule.DEFAULT_PADDING) - (p13.PaddingRight or constantsModule.DEFAULT_PADDING)
	local vector2 = Vector2.new(var26, 1e999)
	local var28 = 0
	local var29 = nil
	
	if p13.headerText then
		local vector2_1 = Vector2.new(var26, 2 * var25)
		local var31 = vector2_1
		
		if p13.onClose then
			var31 -= Vector2.new(constantsModule.CLOSE_BUTTON_SIZE, 0)
		end
		var29 = getTextSizeModule(p13.headerText, var25, captionHeader.Font, var31):Min(vector2_1)
		var28 = math.max(var28, var29.X)
	end
	local var32 = if UIBloxConfigModule.enableTooltipV2BodyFontFix then font.BodySmall else font.CaptionBody
	local var33 = nil
	
	if p13.bodyText then
		var33 = getTextSizeModule(p13.bodyText, baseSize * var32.RelativeSize, var32.Font, vector2)
		var28 = math.max(var28, var33.X)
	end
	if p13.minContentWidth then
		var28 = math.max(var28, p13.minContentWidth)
	end
	local _ = nil
	local var34, var35 = getHotkeysAndWidth(p13.hotkeyCodes, var28, font)
	local t = nil
	
	if p13.renderCustomComponents then
		t = {
			Content = p13.renderCustomComponents(var35),
			SizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = vector2 })
		}
	elseif p13.buttonProps then
		t = {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right
			}),
			SizeContraint = reactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(0, 28) }),
			Button = reactModule.createElement(buttonModule, luauPolyfillModule.Object.assign({}, p13.buttonProps, {
				buttonType = buttonTypeModule.PrimarySystem,
				standardSize = standardButtonSizeModule.XSmall,
				fontStyle = captionHeader
			}))
		}
	end
	var35 = t and reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(0, var35, 0, 0),
		Name = if p13.renderCustomComponents then "CustomComponents" else "ButtonFrame"
	}, t)
	local var37 = if var34 and var35 then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(0, var35, 0, 0)
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, p13.listPadding or constantsModule.DEFAULT_LIST_PADDING),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Hotkeys = var34,
		CustomContent = var35
	}) else var34 or var35
	local var38 = if p13.useLargeDropShadow then constantsModule.DropShadow.Large else constantsModule.DropShadow.Small
	local orientation = constantsModule.OPPOSITE_ORIENTATION[p13.orientation]
	local OFFSET = var38.OFFSET
	local var39 = var21 + Vector2.new(OFFSET[tooltipOrientationModule.Left] + OFFSET[tooltipOrientationModule.Right], OFFSET[tooltipOrientationModule.Top] + OFFSET[tooltipOrientationModule.Bottom])
	local cloned = table.clone(var38.OFFSET)
	local var41 = constantsModule.CONTENT_TO_CARET_TIP - cloned[orientation]
	local maxValue = math.max(0, var41)
	cloned[orientation] += maxValue
	local vector2_1 = Vector2.new(cloned[tooltipOrientationModule.Left], cloned[tooltipOrientationModule.Top])
	local var44 = Vector2.zero:Max(constantsModule.ORIENTATION_VECTOR[p13.orientation] * maxValue)
	local var45 = Vector2.new(0.5, 0.5) - 0.5 * constantsModule.ORIENTATION_VECTOR[p13.orientation]
	local var46 = vector2_1 + Vector2.new(var21.X * var45.X, var21.Y * var45.Y) - p13.contentOffsetVector + constantsModule.ORIENTATION_VECTOR[orientation] * constantsModule.CONTENT_TO_CARET_CENTER
	local var47 = var21 + Vector2.new(cloned[tooltipOrientationModule.Left] + cloned[tooltipOrientationModule.Right], cloned[tooltipOrientationModule.Top] + cloned[tooltipOrientationModule.Bottom])
	local var48 = getOffsetPosition(p13.triggerPointCenter, p13.triggerPointRadius, p13.orientation, constantsModule.CARET_DISTANCE + math.min(0, var41) + math.floor(p13.distanceOffset + 0.5)) + p13.contentOffsetVector
	local backgroundUIDefault = theme.BackgroundUIDefault
	local backgroundColor = p13.backgroundColor or backgroundUIDefault.Color
	local var50 = (p13.backgroundTransparency or backgroundUIDefault.Transparency) * settings.PreferredTransparency
	local createElement = reactModule.createElement
	local var51 = "CanvasGroup"
	local t_1 = {
		BorderSizePixel = 0,
		GroupTransparency = p13.transparency,
		Position = UDim2.fromOffset(var48.X, var48.Y),
		Size = UDim2.fromOffset(var47.X, var47.Y),
		AnchorPoint = Vector2.new(0.5, 0.5) - 0.5 * constantsModule.ORIENTATION_VECTOR[p13.orientation],
		BackgroundTransparency = if p13.canvasBackground then p13.canvasBackground.Transparency else 1,
		BackgroundColor3 = if p13.canvasBackground then p13.canvasBackground.Color else nil
	}
	local t_2 = {
		Caret = reactModule.createElement(label, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Image = constantsModule.CARET_IMAGE,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(var46.X, var46.Y),
			Size = constantsModule.CARET_SIZE,
			Rotation = constantsModule.CARET_ROTATION[p13.orientation],
			ImageColor3 = backgroundColor,
			ImageTransparency = var50
		}),
		DropShadow = reactModule.createElement(label, {
			BackgroundTransparency = 1,
			ZIndex = 1,
			Image = var38.IMAGE,
			ImageColor3 = theme.DropShadow.Color,
			ImageTransparency = theme.DropShadow.Transparency,
			Position = UDim2.fromOffset(var44.X, var44.Y),
			Size = UDim2.fromOffset(var39.X, var39.Y),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = var38.SLICE_CENTER
		})
	}
	local createElement_1 = reactModule.createElement
	local var54 = "Frame"
	local t_3 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		Position = UDim2.fromOffset(vector2_1.X, vector2_1.Y),
		BackgroundColor3 = backgroundColor,
		BackgroundTransparency = var50,
		[reactModule.Change.AbsoluteSize] = function(p15) --[[ line: 293 ]]
			-- upvalues: var22 (ref), p13 (ref)
			var22(p15.AbsoluteSize)
			
			if p13.onContentSizeChanged then
				p13.onContentSizeChanged(p15.AbsoluteSize)
			end
		end,
		ref = p14,
		ZIndex = 2
	}
	local t_4 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = name,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p13.listPadding or constantsModule.DEFAULT_LIST_PADDING)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, p13.PaddingTop or constantsModule.DEFAULT_PADDING),
			PaddingBottom = UDim.new(0, p13.PaddingBottom or constantsModule.DEFAULT_PADDING),
			PaddingLeft = UDim.new(0, p13.PaddingLeft or constantsModule.DEFAULT_PADDING),
			PaddingRight = UDim.new(0, p13.PaddingRight or constantsModule.DEFAULT_PADDING)
		}),
		Corner = reactModule.createElement("UICorner", { CornerRadius = constantsModule.CORNER_RADIUS })
	}
	local headerText = p13.headerText
	
	if headerText then
		headerText = reactModule.createElement
		local var57 = styledTextLabelModule
		local t_5 = {
			layoutOrder = 1,
			fluidSizing = false,
			lineHeight = 1,
			text = p13.headerText,
			fontStyle = captionHeader,
			colorStyle = theme.TextEmphasis,
			textYAlignment = Enum.TextYAlignment.Center,
			textXAlignment = textAlignment,
			textTruncate = Enum.TextTruncate.AtEnd
		}
		local var59 = var29
		t_5.size = UDim2.fromOffset(var59.X, var59.Y)
		t_5.richText = p13.enableHeaderRichText
		headerText = headerText(var57, t_5)
	end
	t_4.Header = headerText
	local bodyText = p13.bodyText
	
	if bodyText then
		bodyText = reactModule.createElement
		local var60 = styledTextLabelModule
		local t_5 = {
			layoutOrder = 2,
			fluidSizing = false,
			lineHeight = 1,
			text = p13.bodyText,
			fontStyle = var32,
			colorStyle = theme.TextEmphasis,
			textYAlignment = Enum.TextYAlignment.Center,
			textXAlignment = textAlignment,
			textTruncate = Enum.TextTruncate.None
		}
		local var62 = var33
		t_5.size = UDim2.fromOffset(var62.X, var62.Y)
		t_5.richText = p13.enableBodyRichText
		bodyText = bodyText(var60, t_5)
	end
	t_4.Body = bodyText
	t_4.Additional = var37
	t_2.Box = createElement_1(var54, t_3, t_4)
	t_2.CloseButton = p13.onClose ~= nil and reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 3,
		Size = UDim2.fromOffset(constantsModule.CLOSE_BUTTON_SIZE, constantsModule.CLOSE_BUTTON_SIZE),
		Position = UDim2.new(1, -(constantsModule.CLOSE_BUTTON_SIZE + constantsModule.CLOSE_BUTTON_PADDING * 2), 0, constantsModule.CLOSE_BUTTON_SIZE / 2)
	}, {
		Button = reactModule.createElement(iconButtonModule, {
			backgroundTransparency = 1,
			icon = imagesModule["icons/navigation/close"],
			iconSize = iconSizeModule.Small,
			size = UDim2.new(1, 0, 1, 0),
			onActivated = p13.onClose
		})
	})
	
	return createElement(var51, t_1, t_2)
end)
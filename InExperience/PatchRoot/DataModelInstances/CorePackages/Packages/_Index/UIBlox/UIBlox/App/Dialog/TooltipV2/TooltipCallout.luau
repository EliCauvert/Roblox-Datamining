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

local function _(p1, p2)
	return Vector2.new(p1.X * p2.X, p1.Y * p2.Y)
end

function getOffsetPosition(value, p1, p2, p3)
	-- upvalues: constantsModule (ref)
	local var1 = constantsModule.ORIENTATION_VECTOR[p2]
	local var2 = p1 + Vector2.new(p3, p3)
	
	return value + Vector2.new(var1.X * var2.X, var1.Y * var2.Y)
end

local _ = function(p1)
	return UDim2.fromOffset(p1.X, p1.Y)
end

local _ = function(p1)
	-- upvalues: constantsModule (ref)
	return Vector2.new(0.5, 0.5) - 0.5 * constantsModule.ORIENTATION_VECTOR[p1]
end

local _ = function(p1, p2)
	return UDim.new(0, p1 or p2)
end

local _ = function(value, p1)
	-- upvalues: tooltipOrientationModule (ref)
	return value + Vector2.new(p1[tooltipOrientationModule.Left] + p1[tooltipOrientationModule.Right], p1[tooltipOrientationModule.Top] + p1[tooltipOrientationModule.Bottom])
end

local function getHotkeysAndWidth(p1, p2, p3)
	-- upvalues: reactModule (ref), keyLabelModule (ref), getKeyLabelWidth (ref), constantsModule (ref)
	if not p1 or #p1 == 0 then
		return nil, p2
	end
	local t = {}
	local var1 = 0
	
	for i, v in ipairs(p1) do
		t[i] = reactModule.createElement(keyLabelModule, { keyCode = v, LayoutOrder = i })
		var1 += getKeyLabelWidth(v, p3)
	end
	local maxValue = math.max(var1 + constantsModule.HOTKEY_PADDING * (#p1 - 1), p2)
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

return reactModule.forwardRef(function(p4, p5)
	-- upvalues: reactModule (ref), useStyleModule (ref), constantsModule (ref), getTextSizeModule (ref), UIBloxConfigModule (ref), getHotkeysAndWidth (ref), luauPolyfillModule (ref), buttonTypeModule (ref), standardButtonSizeModule (ref), buttonModule (ref), tooltipOrientationModule (ref), label (ref), styledTextLabelModule (ref), iconButtonModule (ref), imagesModule (ref), iconSizeModule (ref)
	assert(p4.headerText or p4.bodyText, "Must supply either header or body")
	assert(not (p4.renderCustomComponents and p4.buttonProps), "renderCustomComponents and buttonProps are not compatible")
	local var2, var3 = reactModule.useState(Vector2.zero)
	local var4 = useStyleModule()
	local textAlignment = p4.textAlignment or Enum.TextXAlignment.Left
	local name = Enum.HorizontalAlignment[textAlignment.Name]
	local theme = var4.Theme
	local font = var4.Font
	local settings = var4.Settings
	local baseSize = font.BaseSize
	local captionHeader = font.CaptionHeader
	local var5 = baseSize * captionHeader.RelativeSize
	local var6 = constantsModule.MAX_WIDTH - (p4.PaddingLeft or constantsModule.DEFAULT_PADDING) - (p4.PaddingRight or constantsModule.DEFAULT_PADDING)
	local vector2 = Vector2.new(var6, 1e999)
	local var7 = 0
	local var8 = nil
	
	if p4.headerText then
		local vector2_1 = Vector2.new(var6, 2 * var5)
		local var9 = vector2_1
		
		if p4.onClose then
			var9 -= Vector2.new(constantsModule.CLOSE_BUTTON_SIZE, 0)
		end
		var8 = getTextSizeModule(p4.headerText, var5, captionHeader.Font, var9):Min(vector2_1)
		var7 = math.max(var7, var8.X)
	end
	local var10 = if UIBloxConfigModule.enableTooltipV2BodyFontFix then font.BodySmall else font.CaptionBody
	local var11 = nil
	
	if p4.bodyText then
		var11 = getTextSizeModule(p4.bodyText, baseSize * var10.RelativeSize, var10.Font, vector2)
		var7 = math.max(var7, var11.X)
	end
	if p4.minContentWidth then
		var7 = math.max(var7, p4.minContentWidth)
	end
	local _ = nil
	local var12, var13 = getHotkeysAndWidth(p4.hotkeyCodes, var7, font)
	local t = nil
	
	if p4.renderCustomComponents then
		t = {
			Content = p4.renderCustomComponents(var13),
			SizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = vector2 })
		}
	elseif p4.buttonProps then
		t = {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right
			}),
			SizeContraint = reactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(0, 28) }),
			Button = reactModule.createElement(buttonModule, luauPolyfillModule.Object.assign({}, p4.buttonProps, {
				buttonType = buttonTypeModule.PrimarySystem,
				standardSize = standardButtonSizeModule.XSmall,
				fontStyle = captionHeader
			}))
		}
	end
	var13 = t and reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(0, var13, 0, 0),
		Name = if p4.renderCustomComponents then "CustomComponents" else "ButtonFrame"
	}, t)
	local var14 = if var12 and var13 then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(0, var13, 0, 0)
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, p4.listPadding or constantsModule.DEFAULT_LIST_PADDING),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Hotkeys = var12,
		CustomContent = var13
	}) else var12 or var13
	local var15 = if p4.useLargeDropShadow then constantsModule.DropShadow.Large else constantsModule.DropShadow.Small
	local orientation = constantsModule.OPPOSITE_ORIENTATION[p4.orientation]
	local OFFSET = var15.OFFSET
	local var16 = var2 + Vector2.new(OFFSET[tooltipOrientationModule.Left] + OFFSET[tooltipOrientationModule.Right], OFFSET[tooltipOrientationModule.Top] + OFFSET[tooltipOrientationModule.Bottom])
	local cloned = table.clone(var15.OFFSET)
	local var17 = constantsModule.CONTENT_TO_CARET_TIP - cloned[orientation]
	local maxValue = math.max(0, var17)
	cloned[orientation] += maxValue
	local vector2_1 = Vector2.new(cloned[tooltipOrientationModule.Left], cloned[tooltipOrientationModule.Top])
	local var18 = Vector2.zero:Max(constantsModule.ORIENTATION_VECTOR[p4.orientation] * maxValue)
	local var19 = Vector2.new(0.5, 0.5) - 0.5 * constantsModule.ORIENTATION_VECTOR[p4.orientation]
	local var20 = vector2_1 + Vector2.new(var2.X * var19.X, var2.Y * var19.Y) - p4.contentOffsetVector + constantsModule.ORIENTATION_VECTOR[orientation] * constantsModule.CONTENT_TO_CARET_CENTER
	local var21 = var2 + Vector2.new(cloned[tooltipOrientationModule.Left] + cloned[tooltipOrientationModule.Right], cloned[tooltipOrientationModule.Top] + cloned[tooltipOrientationModule.Bottom])
	local var22 = getOffsetPosition(p4.triggerPointCenter, p4.triggerPointRadius, p4.orientation, constantsModule.CARET_DISTANCE + math.min(0, var17) + math.floor(p4.distanceOffset + 0.5)) + p4.contentOffsetVector
	local backgroundUIDefault = theme.BackgroundUIDefault
	local backgroundColor = p4.backgroundColor or backgroundUIDefault.Color
	local var23 = (p4.backgroundTransparency or backgroundUIDefault.Transparency) * settings.PreferredTransparency
	local createElement = reactModule.createElement
	local var24 = "CanvasGroup"
	local t_1 = {
		BorderSizePixel = 0,
		GroupTransparency = p4.transparency,
		Position = UDim2.fromOffset(var22.X, var22.Y),
		Size = UDim2.fromOffset(var21.X, var21.Y),
		AnchorPoint = Vector2.new(0.5, 0.5) - 0.5 * constantsModule.ORIENTATION_VECTOR[p4.orientation],
		BackgroundTransparency = if p4.canvasBackground then p4.canvasBackground.Transparency else 1,
		BackgroundColor3 = if p4.canvasBackground then p4.canvasBackground.Color else nil
	}
	local t_2 = {
		Caret = reactModule.createElement(label, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Image = constantsModule.CARET_IMAGE,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(var20.X, var20.Y),
			Size = constantsModule.CARET_SIZE,
			Rotation = constantsModule.CARET_ROTATION[p4.orientation],
			ImageColor3 = backgroundColor,
			ImageTransparency = var23
		}),
		DropShadow = reactModule.createElement(label, {
			BackgroundTransparency = 1,
			ZIndex = 1,
			Image = var15.IMAGE,
			ImageColor3 = theme.DropShadow.Color,
			ImageTransparency = theme.DropShadow.Transparency,
			Position = UDim2.fromOffset(var18.X, var18.Y),
			Size = UDim2.fromOffset(var16.X, var16.Y),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = var15.SLICE_CENTER
		})
	}
	local createElement_1 = reactModule.createElement
	local var25 = "Frame"
	local t_3 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		Position = UDim2.fromOffset(vector2_1.X, vector2_1.Y),
		BackgroundColor3 = backgroundColor,
		BackgroundTransparency = var23,
		[reactModule.Change.AbsoluteSize] = function(p6)
			-- upvalues: var3 (ref), p4 (ref)
			var3(p6.AbsoluteSize)
			
			if p4.onContentSizeChanged then
				p4.onContentSizeChanged(p6.AbsoluteSize)
			end
		end,
		ref = p5,
		ZIndex = 2
	}
	local t_4 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = name,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p4.listPadding or constantsModule.DEFAULT_LIST_PADDING)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, p4.PaddingTop or constantsModule.DEFAULT_PADDING),
			PaddingBottom = UDim.new(0, p4.PaddingBottom or constantsModule.DEFAULT_PADDING),
			PaddingLeft = UDim.new(0, p4.PaddingLeft or constantsModule.DEFAULT_PADDING),
			PaddingRight = UDim.new(0, p4.PaddingRight or constantsModule.DEFAULT_PADDING)
		}),
		Corner = reactModule.createElement("UICorner", { CornerRadius = constantsModule.CORNER_RADIUS })
	}
	local headerText = p4.headerText
	
	if headerText then
		headerText = reactModule.createElement
		local var26 = styledTextLabelModule
		local t_5 = {
			layoutOrder = 1,
			fluidSizing = false,
			lineHeight = 1,
			text = p4.headerText,
			fontStyle = captionHeader,
			colorStyle = theme.TextEmphasis,
			textYAlignment = Enum.TextYAlignment.Center,
			textXAlignment = textAlignment,
			textTruncate = Enum.TextTruncate.AtEnd
		}
		local var27 = var8
		t_5.size = UDim2.fromOffset(var27.X, var27.Y)
		t_5.richText = p4.enableHeaderRichText
		headerText = headerText(var26, t_5)
	end
	t_4.Header = headerText
	local bodyText = p4.bodyText
	
	if bodyText then
		bodyText = reactModule.createElement
		local var28 = styledTextLabelModule
		local t_5 = {
			layoutOrder = 2,
			fluidSizing = false,
			lineHeight = 1,
			text = p4.bodyText,
			fontStyle = var10,
			colorStyle = theme.TextEmphasis,
			textYAlignment = Enum.TextYAlignment.Center,
			textXAlignment = textAlignment,
			textTruncate = Enum.TextTruncate.None
		}
		local var29 = var11
		t_5.size = UDim2.fromOffset(var29.X, var29.Y)
		t_5.richText = p4.enableBodyRichText
		bodyText = bodyText(var28, t_5)
	end
	t_4.Body = bodyText
	t_4.Additional = var14
	t_2.Box = createElement_1(var25, t_3, t_4)
	t_2.CloseButton = p4.onClose ~= nil and reactModule.createElement("Frame", {
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
			onActivated = p4.onClose
		})
	})
	
	return createElement(var24, t_1, t_2)
end)
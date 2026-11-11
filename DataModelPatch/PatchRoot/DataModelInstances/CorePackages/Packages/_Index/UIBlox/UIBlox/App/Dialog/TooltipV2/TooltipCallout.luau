local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local Parent4 = Parent3.Parent
local ReactModule = require(Parent4.React)
local LuauPolyfillModule = require(Parent4.LuauPolyfill)
local _ = require(Parent.Types)
local StyledTextLabelModule = require(Parent2.Text.StyledTextLabel)
local Label = require(Parent3.Core.ImageSet.ImageSetComponent).Label
local ButtonModule = require(Parent2.Button.Button)
local ButtonTypeModule = require(Parent2.Button.Enum.ButtonType)
local StandardButtonSizeModule = require(Parent3.Core.Button.Enum.StandardButtonSize)
local KeyLabel = Parent2.Menu.KeyLabel
local KeyLabelModule = require(KeyLabel.KeyLabel)
local _ = require(KeyLabel.Types)
local GetKeyLabelWidthFunction = require(KeyLabel.Utilities).getKeyLabelWidth
local UseStyleModule = require(Parent3.Core.Style.useStyle)
local ConstantsModule = require(Parent.Constants)
local GetTextSizeModule = require(Parent3.Core.Text.GetTextSize)
local TooltipOrientationModule = require(Parent1.Tooltip.Enum.TooltipOrientation)
local IconButtonModule = require(Parent3.App.Button.IconButton)
local IconSizeModule = require(Parent3.App.ImageSet.Enum.IconSize)
local ImagesModule = require(Parent3.App.ImageSet.Images)
local UIBloxConfigModule = require(Parent3.UIBloxConfig)

local function _(Vector, Vector1): Vector2
	return Vector2.new(Vector.X * Vector1.X, Vector.Y * Vector1.Y)
end

function getOffsetPosition(p1, p2, p3, X): Vector2
	-- upvalues: ConstantsModule (copy)
	local ORIENTATIONVECTOREntry = ConstantsModule.ORIENTATION_VECTOR[p3]
	local NewVector = p2 + Vector2.new(X, X)
	
	return p1 + Vector2.new(ORIENTATIONVECTOREntry.X * NewVector.X, ORIENTATIONVECTOREntry.Y * NewVector.Y)
end

local _ = function(Vector): UDim2
	return UDim2.fromOffset(Vector.X, Vector.Y)
end

local _ = function(p1): Vector2
	-- upvalues: ConstantsModule (copy)
	return Vector2.new(0.5, 0.5) - 0.5 * ConstantsModule.ORIENTATION_VECTOR[p1]
end

local _ = function(p1, p2): UDim
	return UDim.new(0, p1 or p2)
end

local _ = function(p1, p2): Vector2
	-- upvalues: TooltipOrientationModule (copy)
	return p1 + Vector2.new(p2[TooltipOrientationModule.Left] + p2[TooltipOrientationModule.Right], p2[TooltipOrientationModule.Top] + p2[TooltipOrientationModule.Bottom])
end

local function getHotkeysAndWidth(HotkeyCodes, Largest: number, p1)
	-- upvalues: ReactModule (copy), KeyLabelModule (copy), GetKeyLabelWidthFunction (copy), ConstantsModule (copy)
	if not HotkeyCodes or #HotkeyCodes == 0 then
		return nil, Largest
	end
	local Elements = {}
	local Total = 0
	
	for LayoutOrder, hotkeyCode in ipairs(HotkeyCodes) do
		Elements[LayoutOrder] = ReactModule.createElement(KeyLabelModule, { keyCode = hotkeyCode, LayoutOrder = LayoutOrder })
		Total += GetKeyLabelWidthFunction(hotkeyCode, p1)
	end
	local Largest1 = math.max(Total + ConstantsModule.HOTKEY_PADDING * (#HotkeyCodes - 1), Largest)
	Elements.Layout = ReactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, ConstantsModule.HOTKEY_PADDING)
	})
	
	return ReactModule.createElement("Frame", {
		Name = "Hotkeys",
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromOffset(Largest1, 0)
	}, Elements), Largest1
end

return ReactModule.forwardRef(function(UIPadding, Ref)
	-- upvalues: ReactModule (copy), UseStyleModule (copy), ConstantsModule (copy), GetTextSizeModule (copy), UIBloxConfigModule (copy), getHotkeysAndWidth (copy), LuauPolyfillModule (copy), ButtonTypeModule (copy), StandardButtonSizeModule (copy), ButtonModule (copy), TooltipOrientationModule (copy), Label (copy), StyledTextLabelModule (copy), IconButtonModule (copy), ImagesModule (copy), IconSizeModule (copy)
	assert(UIPadding.headerText or UIPadding.bodyText, "Must supply either header or body")
	assert(not (UIPadding.renderCustomComponents and UIPadding.buttonProps), "renderCustomComponents and buttonProps are not compatible")
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	local UseStyleModuleResult = UseStyleModule()
	local TextAlignment = UIPadding.textAlignment or Enum.TextXAlignment.Left
	local HorizontalAlignmentEntry = Enum.HorizontalAlignment[TextAlignment.Name]
	local Theme = UseStyleModuleResult.Theme
	local UseStyleModuleResultFont = UseStyleModuleResult.Font
	local Settings = UseStyleModuleResult.Settings
	local BaseSize = UseStyleModuleResultFont.BaseSize
	local CaptionHeader = UseStyleModuleResultFont.CaptionHeader
	local ScaledBaseSize = BaseSize * CaptionHeader.RelativeSize
	local MAXWIDTHDelta = ConstantsModule.MAX_WIDTH - (UIPadding.PaddingLeft or ConstantsModule.DEFAULT_PADDING) - (UIPadding.PaddingRight or ConstantsModule.DEFAULT_PADDING)
	local _Vector2 = Vector2.new(MAXWIDTHDelta, 1e999)
	local Largest = 0
	local MinResult = nil
	
	if UIPadding.headerText then
		local _Vector2_1 = Vector2.new(MAXWIDTHDelta, 2 * ScaledBaseSize)
		local Total: Vector2 = _Vector2_1
		
		if UIPadding.onClose then
			Total -= Vector2.new(ConstantsModule.CLOSE_BUTTON_SIZE, 0)
		end
		MinResult = GetTextSizeModule(UIPadding.headerText, ScaledBaseSize, CaptionHeader.Font, Total):Min(_Vector2_1)
		Largest = math.max(Largest, MinResult.X)
	end
	local BodySmall = if UIBloxConfigModule.enableTooltipV2BodyFontFix then UseStyleModuleResultFont.BodySmall else UseStyleModuleResultFont.CaptionBody
	local Vector = nil
	
	if UIPadding.bodyText then
		Vector = GetTextSizeModule(UIPadding.bodyText, BaseSize * BodySmall.RelativeSize, BodySmall.Font, _Vector2)
		Largest = math.max(Largest, Vector.X)
	end
	if UIPadding.minContentWidth then
		Largest = math.max(Largest, UIPadding.minContentWidth)
	end
	local HotkeysAndWidth, HotkeysAndWidth2 = getHotkeysAndWidth(UIPadding.hotkeyCodes, Largest, UseStyleModuleResultFont)
	local Config = if UIPadding.renderCustomComponents then {
		Content = UIPadding.renderCustomComponents(HotkeysAndWidth2),
		SizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = _Vector2 })
	} elseif UIPadding.buttonProps then {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		}),
		SizeContraint = ReactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(0, 28) }),
		Button = ReactModule.createElement(ButtonModule, (LuauPolyfillModule.Object.assign({}, UIPadding.buttonProps, {
			buttonType = ButtonTypeModule.PrimarySystem,
			standardSize = StandardButtonSizeModule.XSmall,
			fontStyle = CaptionHeader
		})))
	} else nil
	local Frame = Config and ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(0, HotkeysAndWidth2, 0, 0),
		Name = if UIPadding.renderCustomComponents then "CustomComponents" else "ButtonFrame"
	}, Config)
	local HotkeysAndWidth1 = nil
	
	if HotkeysAndWidth and Frame then
		local DEFAULTLISTPADDING = ConstantsModule.DEFAULT_LIST_PADDING
		HotkeysAndWidth1 = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.new(0, HotkeysAndWidth2, 0, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, UIPadding.listPadding or DEFAULTLISTPADDING),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Hotkeys = HotkeysAndWidth,
			CustomContent = Frame
		})
	else
		HotkeysAndWidth1 = HotkeysAndWidth or Frame
	end
	local Large = if UIPadding.useLargeDropShadow then ConstantsModule.DropShadow.Large else ConstantsModule.DropShadow.Small
	local OPPOSITEORIENTATIONEntry = ConstantsModule.OPPOSITE_ORIENTATION[UIPadding.orientation]
	local OFFSET = Large.OFFSET
	local NewUseStateResult = UseStateResult + Vector2.new(OFFSET[TooltipOrientationModule.Left] + OFFSET[TooltipOrientationModule.Right], OFFSET[TooltipOrientationModule.Top] + OFFSET[TooltipOrientationModule.Bottom])
	local Copy = table.clone(Large.OFFSET)
	local CONTENTTOCARETTIPDelta = ConstantsModule.CONTENT_TO_CARET_TIP - Copy[OPPOSITEORIENTATIONEntry]
	local Largest1 = math.max(0, CONTENTTOCARETTIPDelta)
	Copy[OPPOSITEORIENTATIONEntry] += Largest1
	local _Vector21 = Vector2.new(Copy[TooltipOrientationModule.Left], Copy[TooltipOrientationModule.Top])
	local MaxResult = Vector2.zero:Max(ConstantsModule.ORIENTATION_VECTOR[UIPadding.orientation] * Largest1)
	local VectorDelta = Vector2.new(0.5, 0.5) - 0.5 * ConstantsModule.ORIENTATION_VECTOR[UIPadding.orientation]
	local NewVector = _Vector21 + Vector2.new(UseStateResult.X * VectorDelta.X, UseStateResult.Y * VectorDelta.Y) - UIPadding.contentOffsetVector + ConstantsModule.ORIENTATION_VECTOR[OPPOSITEORIENTATIONEntry] * ConstantsModule.CONTENT_TO_CARET_CENTER
	local NewUseStateResult1 = UseStateResult + Vector2.new(Copy[TooltipOrientationModule.Left] + Copy[TooltipOrientationModule.Right], Copy[TooltipOrientationModule.Top] + Copy[TooltipOrientationModule.Bottom])
	local NewOffsetPosition = getOffsetPosition(UIPadding.triggerPointCenter, UIPadding.triggerPointRadius, UIPadding.orientation, ConstantsModule.CARET_DISTANCE + math.min(0, CONTENTTOCARETTIPDelta) + math.floor(UIPadding.distanceOffset + 0.5)) + UIPadding.contentOffsetVector
	local BackgroundUIDefault = Theme.BackgroundUIDefault
	local BackgroundColor = UIPadding.backgroundColor or BackgroundUIDefault.Color
	local ScaledPreferredTransparency = (UIPadding.backgroundTransparency or BackgroundUIDefault.Transparency) * Settings.PreferredTransparency
	local DEFAULTLISTPADDING = ConstantsModule.DEFAULT_LIST_PADDING
	local config = {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = HorizontalAlignmentEntry,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, UIPadding.listPadding or DEFAULTLISTPADDING)
	}
	local DEFAULTPADDING = ConstantsModule.DEFAULT_PADDING
	local _UDim = UDim.new(0, UIPadding.PaddingTop or DEFAULTPADDING)
	local DEFAULTPADDING1 = ConstantsModule.DEFAULT_PADDING
	local _UDim1 = UDim.new(0, UIPadding.PaddingBottom or DEFAULTPADDING1)
	local DEFAULTPADDING2 = ConstantsModule.DEFAULT_PADDING
	local _UDim2 = UDim.new(0, UIPadding.PaddingLeft or DEFAULTPADDING2)
	local DEFAULTPADDING3 = ConstantsModule.DEFAULT_PADDING
	
	return ReactModule.createElement("CanvasGroup", {
		BorderSizePixel = 0,
		GroupTransparency = UIPadding.transparency,
		Position = UDim2.fromOffset(NewOffsetPosition.X, NewOffsetPosition.Y),
		Size = UDim2.fromOffset(NewUseStateResult1.X, NewUseStateResult1.Y),
		AnchorPoint = Vector2.new(0.5, 0.5) - 0.5 * ConstantsModule.ORIENTATION_VECTOR[UIPadding.orientation],
		BackgroundTransparency = if UIPadding.canvasBackground then UIPadding.canvasBackground.Transparency else 1,
		BackgroundColor3 = if UIPadding.canvasBackground then UIPadding.canvasBackground.Color else nil
	}, {
		Caret = ReactModule.createElement(Label, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Image = ConstantsModule.CARET_IMAGE,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(NewVector.X, NewVector.Y),
			Size = ConstantsModule.CARET_SIZE,
			Rotation = ConstantsModule.CARET_ROTATION[UIPadding.orientation],
			ImageColor3 = BackgroundColor,
			ImageTransparency = ScaledPreferredTransparency
		}),
		DropShadow = ReactModule.createElement(Label, {
			BackgroundTransparency = 1,
			ZIndex = 1,
			Image = Large.IMAGE,
			ImageColor3 = Theme.DropShadow.Color,
			ImageTransparency = Theme.DropShadow.Transparency,
			Position = UDim2.fromOffset(MaxResult.X, MaxResult.Y),
			Size = UDim2.fromOffset(NewUseStateResult.X, NewUseStateResult.Y),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Large.SLICE_CENTER
		}),
		Box = ReactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			Position = UDim2.fromOffset(_Vector21.X, _Vector21.Y),
			BackgroundColor3 = BackgroundColor,
			BackgroundTransparency = ScaledPreferredTransparency,
			[ReactModule.Change.AbsoluteSize] = function(Frame: Frame)
				-- upvalues: UseStateResult2 (copy), UIPadding (copy)
				UseStateResult2(Frame.AbsoluteSize)
				
				if UIPadding.onContentSizeChanged then
					UIPadding.onContentSizeChanged(Frame.AbsoluteSize)
				end
			end,
			ref = Ref,
			ZIndex = 2
		}, {
			Layout = ReactModule.createElement("UIListLayout", config),
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = _UDim,
				PaddingBottom = _UDim1,
				PaddingLeft = _UDim2,
				PaddingRight = UDim.new(0, UIPadding.PaddingRight or DEFAULTPADDING3)
			}),
			Corner = ReactModule.createElement("UICorner", { CornerRadius = ConstantsModule.CORNER_RADIUS }),
			Header = UIPadding.headerText and ReactModule.createElement(StyledTextLabelModule, {
				layoutOrder = 1,
				fluidSizing = false,
				lineHeight = 1,
				text = UIPadding.headerText,
				fontStyle = CaptionHeader,
				colorStyle = Theme.TextEmphasis,
				textYAlignment = Enum.TextYAlignment.Center,
				textXAlignment = TextAlignment,
				textTruncate = Enum.TextTruncate.AtEnd,
				size = UDim2.fromOffset(MinResult.X, MinResult.Y),
				richText = UIPadding.enableHeaderRichText
			}),
			Body = UIPadding.bodyText and ReactModule.createElement(StyledTextLabelModule, {
				layoutOrder = 2,
				fluidSizing = false,
				lineHeight = 1,
				text = UIPadding.bodyText,
				fontStyle = BodySmall,
				colorStyle = Theme.TextEmphasis,
				textYAlignment = Enum.TextYAlignment.Center,
				textXAlignment = TextAlignment,
				textTruncate = Enum.TextTruncate.None,
				size = UDim2.fromOffset(Vector.X, Vector.Y),
				richText = UIPadding.enableBodyRichText
			}),
			Additional = HotkeysAndWidth1
		}),
		CloseButton = UIPadding.onClose ~= nil and ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 3,
			Size = UDim2.fromOffset(ConstantsModule.CLOSE_BUTTON_SIZE, ConstantsModule.CLOSE_BUTTON_SIZE),
			Position = UDim2.new(1, -(ConstantsModule.CLOSE_BUTTON_SIZE + ConstantsModule.CLOSE_BUTTON_PADDING * 2), 0, ConstantsModule.CLOSE_BUTTON_SIZE / 2)
		}, {
			Button = ReactModule.createElement(IconButtonModule, {
				backgroundTransparency = 1,
				icon = ImagesModule["icons/navigation/close"],
				iconSize = IconSizeModule.Small,
				size = UDim2.new(1, 0, 1, 0),
				onActivated = UIPadding.onClose
			})
		})
	})
end)
-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:56 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local withStyleModule = require(parent.Core.Style.withStyle)
local validateColorInfoModule = require(parent.Core.Style.Validator.validateColorInfo)
local withSelectionCursorProviderModule = require(parent.App.SelectionImage.withSelectionCursorProvider)
local cursorKindModule = require(parent.App.SelectionImage.CursorKind)
local _ = require(parent.App.Style.StyleTypes)
local object = require(parent_1.LuauPolyfill).Object
local imageSetComponentModule = require(parent_1.UIBlox.Core.ImageSet.ImageSetComponent)
local imagesModule = require(parent_1.UIBlox.App.ImageSet.Images)
local genericTextLabelModule = require(parent.Core.Text.GenericTextLabel.GenericTextLabel)
local divideTransparencyModule = require(parent.Utility.divideTransparency)
local validateFontInfoModule = require(parent_1.UIBlox.Core.Style.Validator.validateFontInfo)
local controlStateModule = require(parent_1.UIBlox.Core.Control.Enum.ControlState)
local keyLabelModule = require(script.Parent.KeyLabel.KeyLabel)
local roundedFrameModule = require(script.Parent.RoundedFrame)
local interactableModule = require(parent.Core.Control.Interactable)
local circle17 = imagesModule["component_assets/circle_17"]
local cell = roactModule.PureComponent:extend("Cell")
cell.validateProps = tModule.strictInterface({
	icon = tModule.optional(tModule.union(tModule.table, tModule.string)),
	text = tModule.string,
	onActivated = tModule.callback,
	keyCodeLabel = tModule.optional(tModule.union(tModule.enum(Enum.KeyCode), tModule.strictInterface({
		key = tModule.enum(Enum.KeyCode),
		axis = tModule.optional(tModule.string)
	}))),
	selected = tModule.optional(tModule.boolean),
	iconColorOverride = tModule.optional(tModule.Color3),
	textColorOverride = tModule.optional(tModule.Color3),
	elementHeight = tModule.integer,
	hasRoundTop = tModule.boolean,
	hasRoundBottom = tModule.boolean,
	hasDivider = tModule.boolean,
	disabled = tModule.optional(tModule.boolean),
	stayOnActivated = tModule.optional(tModule.boolean),
	renderRightSideGadget = tModule.optional(tModule.callback),
	rightSideGadgetSize = tModule.optional(tModule.Vector2),
	leftPaddingOffset = tModule.optional(tModule.number),
	layoutOrder = tModule.integer,
	setButtonRef = tModule.optional(tModule.union(tModule.callback, tModule.table)),
	cursorKind = tModule.optional(cursorKindModule.isEnumValue),
	isElementBackgroundVisible = tModule.optional(tModule.boolean),
	dividerOffset = tModule.optional(tModule.number),
	dividerSize = tModule.optional(tModule.number),
	fontStyle = tModule.optional(tModule.union(tModule.string, validateFontInfoModule)),
	iconSize = tModule.optional(tModule.integer),
	selectedIconSize = tModule.optional(tModule.integer),
	iconPaddingLeft = tModule.optional(tModule.integer),
	textPadding = tModule.optional(tModule.strictInterface({ left = tModule.integer, right = tModule.integer })),
	selectedIconPaddingRight = tModule.optional(tModule.integer),
	keyLabelPaddingRight = tModule.optional(tModule.integer),
	textOnlyPadding = tModule.optional(tModule.integer),
	borderCornerRadius = tModule.optional(tModule.integer),
	background = tModule.optional(validateColorInfoModule),
	selectionOrder = tModule.optional(tModule.number),
	selectionCursor = tModule.optional(tModule.table)
})
cell.defaultProps = {
	selected = false,
	disabled = false,
	rightSideGadgetSize = nil,
	leftPaddingOffset = 0,
	isElementBackgroundVisible = true,
	dividerOffset = 0,
	dividerSize = 1,
	iconSize = 36,
	selectedIconSize = 16,
	iconPaddingLeft = 12,
	selectedIconPaddingRight = 24,
	textOnlyPadding = 24,
	keyLabelPaddingRight = 16,
	borderCornerRadius = 4,
	textPadding = { left = 12, right = 12 }
}

function cell.init(p0) --[[ line: 134 ]]
	-- upvalues: controlStateModule (ref)
	p0.state = {
		keyLabelWidth = 0,
		controlState = controlStateModule.Default
	}
	
	function p0.keyLabelSizeChanged(p1) --[[ line: 141 ]]
		-- upvalues: p0 (ref)
		p0:setState({ keyLabelWidth = p1.AbsoluteSize.X })
	end
	
	function p0.setControlState(p2) --[[ line: 147 ]]
		-- upvalues: p0 (ref)
		p0:setState({ controlState = p2 })
	end
	
	function p0.onStateChanged(_, p3) --[[ line: 153 ]]
		-- upvalues: p0 (ref)
		p0.setControlState(p3)
	end
end

function cell.getImageProperties(p4) --[[ line: 158 ]]
	-- upvalues: circle17 (ref), imagesModule (ref)
	local imageRectSize = circle17.ImageRectSize
	local imageRectOffset = circle17.ImageRectOffset
	local var16 = 8 * imagesModule.ImagesResolutionScale
	local var17 = 8 * imagesModule.ImagesResolutionScale
	local rect = Rect.new(var16, var17, imageRectSize.x - var16, imageRectSize.y - var17)
	local x = imageRectSize.X
	local floored = math.floor(x / 2)
	local _ = nil
	local _ = nil
	local _ = nil
	
	if p4.props.hasRoundTop and p4.props.hasRoundBottom then
		return imageRectSize, imageRectOffset, rect
	elseif p4.props.hasRoundTop then
		return Vector2.new(x, floored), imageRectOffset, Rect.new(floored - 1, floored - 1, floored + 1, floored)
	elseif p4.props.hasRoundBottom then
		return Vector2.new(x, floored), imageRectOffset + Vector2.new(0, floored), Rect.new(floored - 1, 0, floored + 1, 1)
	end
	return Vector2.new(1, 1), imageRectOffset + Vector2.new(floored, floored), Rect.new(0, 0, 0, 0)
end

function cell.renderRoundedBackground(value, p5, p6) --[[ line: 192 ]]
	-- upvalues: roactModule (ref), roundedFrameModule (ref)
	local uDim = UDim.new(0, value.props.borderCornerRadius)
	
	return roactModule.createElement(roundedFrameModule, {
		zIndex = p5,
		background = p6,
		topCornerRadius = if value.props.hasRoundTop then uDim else nil,
		bottomCornerRadius = if value.props.hasRoundBottom then uDim else nil
	})
end

function cell.renderWithSelectionCursor(p7, _) --[[ line: 202 ]]
	-- upvalues: withStyleModule (ref), controlStateModule (ref), divideTransparencyModule (ref), object (ref), roactModule (ref), imageSetComponentModule (ref), genericTextLabelModule (ref), keyLabelModule (ref), imagesModule (ref), interactableModule (ref)
	return withStyleModule(function(p8) --[[ line: 203 ]]
		-- upvalues: p7 (ref), controlStateModule (copy), divideTransparencyModule (copy), object (copy), roactModule (copy), imageSetComponentModule (copy), genericTextLabelModule (copy), keyLabelModule (copy), imagesModule (copy), interactableModule (copy)
		local theme = p8.Theme
		local font = p8.Font
		local settings = p8.Settings
		local var21 = (if p7.props.icon then p7.props.iconPaddingLeft else p7.props.textOnlyPadding) + p7.props.leftPaddingOffset
		local var22 = 0
		
		if p7.props.keyCodeLabel then
			var22 = p7.props.keyLabelPaddingRight
		elseif p7.props.selected then
			var22 = p7.props.selectedIconPaddingRight
		end
		local t = { Transparency = 1, Color = Color3.new(1, 1, 1) }
		
		if p7.state.controlState == controlStateModule.Pressed then
			t = theme.BackgroundOnPress
		elseif p7.state.controlState == controlStateModule.Hover then
			t = theme.BackgroundOnHover
		end
		local imageProperties, imageProperties_1, imageProperties_2 = p7:getImageProperties()
		local var27 = 0
		local var28 = true
		
		if p7.props.rightSideGadgetSize == nil then
			if p7.props.icon then
				var28 = false
				var21 = p7.props.iconPaddingLeft
				var27 = p7.props.iconPaddingLeft + p7.props.iconSize
			end
			if p7.props.selected then
				var28 = false
				var27 = var27 + p7.props.selectedIconSize + p7.props.selectedIconPaddingRight
			end
			if p7.props.keyCodeLabel then
				var28 = false
				var27 = var27 + p7.props.keyLabelPaddingRight + p7.state.keyLabelWidth
			end
			var27 = if var28 then var27 + p7.props.textOnlyPadding * 2 else var27 + p7.props.textPadding.left + p7.props.textPadding.right
		else
			var27 = p7.props.rightSideGadgetSize.X + p7.props.iconPaddingLeft + p7.props.iconSize + p7.props.textPadding.left
		end
		local var29 = if p7.props.textColorOverride then {
			Color = p7.props.textColorOverride,
			Transparency = theme.TextEmphasis.Transparency
		} else theme.TextEmphasis
		
		if p7.state.controlState == controlStateModule.Pressed or p7.props.disabled then
			var29 = {
				Color = var29.Color,
				Transparency = divideTransparencyModule(theme.TextEmphasis.Transparency, 2)
			}
		end
		local backgroundUIDefault = theme.BackgroundUIDefault
		local var30 = object.assign({}, {
			Color = backgroundUIDefault.Color,
			Transparency = backgroundUIDefault.Transparency
		}, p7.props.background)
		var30.Transparency *= settings.PreferredTransparency
		
		return roactModule.createElement(interactableModule, {
			Size = UDim2.new(1, 0, 0, p7.props.elementHeight),
			BackgroundTransparency = 1,
			Image = nil,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = imageProperties_2,
			ImageRectSize = imageProperties,
			ImageRectOffset = imageProperties_1,
			SliceScale = 1 / imagesModule.ImagesResolutionScale,
			ImageTransparency = 1,
			ImageColor3 = var30.Color,
			AutoButtonColor = false,
			LayoutOrder = p7.props.layoutOrder,
			BorderSizePixel = 0,
			[roactModule.Ref] = p7.props.setButtonRef,
			SelectionImageObject = p7.props.selectionCursor,
			SelectionOrder = p7.props.selectionOrder,
			onStateChanged = p7.onStateChanged,
			[roactModule.Event.Activated] = p7.props.onActivated,
			isDisabled = p7.props.disabled
		}, {
			Background = if p7.props.isElementBackgroundVisible then p7:renderRoundedBackground(-1, var30) else nil,
			Divider = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundColor3 = theme.Divider.Color,
				BackgroundTransparency = theme.Divider.Transparency,
				Size = UDim2.new(1, -p7.props.dividerOffset, 0, p7.props.dividerSize),
				Position = UDim2.new(0, p7.props.dividerOffset, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				Visible = p7.props.hasDivider
			}),
			StateOverlay = p7:renderRoundedBackground(2, t),
			LeftAlignedContent = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Layout = roactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, p7.props.textPadding.left)
				}),
				LeftPadding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var21) }),
				Icon = p7.props.icon and roactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Image = p7.props.icon,
					Size = UDim2.fromOffset(p7.props.iconSize, p7.props.iconSize),
					ImageColor3 = p7.props.iconColorOverride or theme.IconEmphasis.Color,
					ImageTransparency = divideTransparencyModule(theme.IconEmphasis.Transparency, if p7.props.disabled then 2 else 1)
				}),
				Text = roactModule.createElement(genericTextLabelModule, {
					BackgroundTransparency = 1,
					TextWrapped = false,
					LayoutOrder = 2,
					fontStyle = p7.props.fontStyle or font.Header2,
					colorStyle = var29,
					Size = UDim2.new(1, -var27, 1, 0),
					Text = p7.props.text,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			RightAlignedContent = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Layout = roactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, p7.props.textPadding.right)
				}),
				RightPadding = roactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, var22) }),
				RightSideContent = p7.props.renderRightSideGadget and (p7.props.rightSideGadgetSize and (roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 3,
					Size = UDim2.fromOffset(p7.props.rightSideGadgetSize.X, p7.props.rightSideGadgetSize.Y)
				}, p7.props.renderRightSideGadget()) or roactModule.createFragment({
					KeyLabel = p7.props.keyCodeLabel and roactModule.createElement(keyLabelModule, {
						keyCode = p7.props.keyCodeLabel,
						LayoutOrder = 2,
						[roactModule.Change.AbsoluteSize] = p7.keyLabelSizeChanged
					}),
					SelectedIcon = roactModule.createElement(imageSetComponentModule.Label, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Image = imagesModule["icons/status/success_small"],
						Size = UDim2.fromOffset(p7.props.selectedIconSize, p7.props.selectedIconSize),
						ImageColor3 = theme.IconEmphasis.Color,
						ImageTransparency = theme.IconEmphasis.Transparency,
						Visible = p7.props.selected
					})
				})))
			})
		})
	end)
end

function cell.render(p9) --[[ line: 417 ]]
	-- upvalues: withSelectionCursorProviderModule (ref)
	return withSelectionCursorProviderModule(function(p10) --[[ line: 418 ]]
		-- upvalues: p9 (ref)
		return p9:renderWithSelectionCursor(p10)
	end)
end

return cell
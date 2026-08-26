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

function cell.init(p1)
	-- upvalues: controlStateModule (ref)
	p1.state = {
		keyLabelWidth = 0,
		controlState = controlStateModule.Default
	}
	
	function p0.keyLabelSizeChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ keyLabelWidth = p2.AbsoluteSize.X })
	end
	
	function p0.setControlState(p2)
		-- upvalues: p1 (ref)
		p1:setState({ controlState = p2 })
	end
	
	function p0.onStateChanged(_, p2)
		-- upvalues: p1 (ref)
		p1.setControlState(p2)
	end
end

function cell.getImageProperties(p1)
	-- upvalues: circle17 (ref), imagesModule (ref)
	local imageRectSize = circle17.ImageRectSize
	local imageRectOffset = circle17.ImageRectOffset
	local var1 = 8 * imagesModule.ImagesResolutionScale
	local var2 = 8 * imagesModule.ImagesResolutionScale
	local rect = Rect.new(var1, var2, imageRectSize.x - var1, imageRectSize.y - var2)
	local x = imageRectSize.X
	local floored = math.floor(x / 2)
	local _ = nil
	local _ = nil
	local _ = nil
	
	if p1.props.hasRoundTop and p1.props.hasRoundBottom then
		return imageRectSize, imageRectOffset, rect
	elseif p1.props.hasRoundTop then
		return Vector2.new(x, floored), imageRectOffset, Rect.new(floored - 1, floored - 1, floored + 1, floored)
	elseif p1.props.hasRoundBottom then
		return Vector2.new(x, floored), imageRectOffset + Vector2.new(0, floored), Rect.new(floored - 1, 0, floored + 1, 1)
	end
	return Vector2.new(1, 1), imageRectOffset + Vector2.new(floored, floored), Rect.new(0, 0, 0, 0)
end

function cell.renderRoundedBackground(value, p1, p2)
	-- upvalues: roactModule (ref), roundedFrameModule (ref)
	local uDim = UDim.new(0, value.props.borderCornerRadius)
	
	return roactModule.createElement(roundedFrameModule, {
		zIndex = p1,
		background = p2,
		topCornerRadius = if value.props.hasRoundTop then uDim else nil,
		bottomCornerRadius = if value.props.hasRoundBottom then uDim else nil
	})
end

function cell.renderWithSelectionCursor(p1, _)
	-- upvalues: withStyleModule (ref), controlStateModule (ref), divideTransparencyModule (ref), object (ref), roactModule (ref), imageSetComponentModule (ref), genericTextLabelModule (ref), keyLabelModule (ref), imagesModule (ref), interactableModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), controlStateModule (copy), divideTransparencyModule (copy), object (copy), roactModule (copy), imageSetComponentModule (copy), genericTextLabelModule (copy), keyLabelModule (copy), imagesModule (copy), interactableModule (copy)
		local theme = p2.Theme
		local font = p2.Font
		local settings = p2.Settings
		local var1 = (if p1.props.icon then p1.props.iconPaddingLeft else p1.props.textOnlyPadding) + p1.props.leftPaddingOffset
		local var2 = 0
		
		if p1.props.keyCodeLabel then
			var2 = p1.props.keyLabelPaddingRight
		elseif p1.props.selected then
			var2 = p1.props.selectedIconPaddingRight
		end
		local t = { Transparency = 1, Color = Color3.new(1, 1, 1) }
		
		if p1.state.controlState == controlStateModule.Pressed then
			t = theme.BackgroundOnPress
		elseif p1.state.controlState == controlStateModule.Hover then
			t = theme.BackgroundOnHover
		end
		local imageProperties, imageProperties_1, imageProperties_2 = p1:getImageProperties()
		local var3 = 0
		local var4 = true
		
		if p1.props.rightSideGadgetSize == nil then
			if p1.props.icon then
				var4 = false
				var1 = p1.props.iconPaddingLeft
				var3 = p1.props.iconPaddingLeft + p1.props.iconSize
			end
			if p1.props.selected then
				var4 = false
				var3 = var3 + p1.props.selectedIconSize + p1.props.selectedIconPaddingRight
			end
			if p1.props.keyCodeLabel then
				var4 = false
				var3 = var3 + p1.props.keyLabelPaddingRight + p1.state.keyLabelWidth
			end
			var3 = if var4 then var3 + p1.props.textOnlyPadding * 2 else var3 + p1.props.textPadding.left + p1.props.textPadding.right
		else
			var3 = p1.props.rightSideGadgetSize.X + p1.props.iconPaddingLeft + p1.props.iconSize + p1.props.textPadding.left
		end
		local var5 = if p1.props.textColorOverride then {
			Color = p1.props.textColorOverride,
			Transparency = theme.TextEmphasis.Transparency
		} else theme.TextEmphasis
		
		if p1.state.controlState == controlStateModule.Pressed or p1.props.disabled then
			var5 = {
				Color = var5.Color,
				Transparency = divideTransparencyModule(theme.TextEmphasis.Transparency, 2)
			}
		end
		local backgroundUIDefault = theme.BackgroundUIDefault
		local var6 = object.assign({}, {
			Color = backgroundUIDefault.Color,
			Transparency = backgroundUIDefault.Transparency
		}, p1.props.background)
		var6.Transparency *= settings.PreferredTransparency
		
		return roactModule.createElement(interactableModule, {
			Size = UDim2.new(1, 0, 0, p1.props.elementHeight),
			BackgroundTransparency = 1,
			Image = nil,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = imageProperties_2,
			ImageRectSize = imageProperties,
			ImageRectOffset = imageProperties_1,
			SliceScale = 1 / imagesModule.ImagesResolutionScale,
			ImageTransparency = 1,
			ImageColor3 = var6.Color,
			AutoButtonColor = false,
			LayoutOrder = p1.props.layoutOrder,
			BorderSizePixel = 0,
			[roactModule.Ref] = p1.props.setButtonRef,
			SelectionImageObject = p1.props.selectionCursor,
			SelectionOrder = p1.props.selectionOrder,
			onStateChanged = p1.onStateChanged,
			[roactModule.Event.Activated] = p1.props.onActivated,
			isDisabled = p1.props.disabled
		}, {
			Background = if p1.props.isElementBackgroundVisible then p1:renderRoundedBackground(-1, var6) else nil,
			Divider = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundColor3 = theme.Divider.Color,
				BackgroundTransparency = theme.Divider.Transparency,
				Size = UDim2.new(1, -p1.props.dividerOffset, 0, p1.props.dividerSize),
				Position = UDim2.new(0, p1.props.dividerOffset, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				Visible = p1.props.hasDivider
			}),
			StateOverlay = p1:renderRoundedBackground(2, t),
			LeftAlignedContent = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Layout = roactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, p1.props.textPadding.left)
				}),
				LeftPadding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var1) }),
				Icon = p1.props.icon and roactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Image = p1.props.icon,
					Size = UDim2.fromOffset(p1.props.iconSize, p1.props.iconSize),
					ImageColor3 = p1.props.iconColorOverride or theme.IconEmphasis.Color,
					ImageTransparency = divideTransparencyModule(theme.IconEmphasis.Transparency, if p1.props.disabled then 2 else 1)
				}),
				Text = roactModule.createElement(genericTextLabelModule, {
					BackgroundTransparency = 1,
					TextWrapped = false,
					LayoutOrder = 2,
					fontStyle = p1.props.fontStyle or font.Header2,
					colorStyle = var5,
					Size = UDim2.new(1, -var3, 1, 0),
					Text = p1.props.text,
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
					Padding = UDim.new(0, p1.props.textPadding.right)
				}),
				RightPadding = roactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, var2) }),
				RightSideContent = p1.props.renderRightSideGadget and (p1.props.rightSideGadgetSize and (roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 3,
					Size = UDim2.fromOffset(p1.props.rightSideGadgetSize.X, p1.props.rightSideGadgetSize.Y)
				}, p1.props.renderRightSideGadget()) or roactModule.createFragment({
					KeyLabel = p1.props.keyCodeLabel and roactModule.createElement(keyLabelModule, {
						keyCode = p1.props.keyCodeLabel,
						LayoutOrder = 2,
						[roactModule.Change.AbsoluteSize] = p1.keyLabelSizeChanged
					}),
					SelectedIcon = roactModule.createElement(imageSetComponentModule.Label, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Image = imagesModule["icons/status/success_small"],
						Size = UDim2.fromOffset(p1.props.selectedIconSize, p1.props.selectedIconSize),
						ImageColor3 = theme.IconEmphasis.Color,
						ImageTransparency = theme.IconEmphasis.Transparency,
						Visible = p1.props.selected
					})
				})))
			})
		})
	end)
end

function cell.render(p1)
	-- upvalues: withSelectionCursorProviderModule (ref)
	return withSelectionCursorProviderModule(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return cell
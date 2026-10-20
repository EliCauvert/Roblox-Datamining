local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local WithSelectionCursorProviderModule = require(Parent.App.SelectionImage.withSelectionCursorProvider)
local _ = require(Parent.App.Style.StyleTypes)
local Object = require(Parent1.LuauPolyfill).Object
local ImageSetComponentModule = require(Parent1.UIBlox.Core.ImageSet.ImageSetComponent)
local ImagesModule = require(Parent1.UIBlox.App.ImageSet.Images)
local GenericTextLabelModule = require(Parent.Core.Text.GenericTextLabel.GenericTextLabel)
local DivideTransparencyModule = require(Parent.Utility.divideTransparency)
local ControlStateModule = require(Parent1.UIBlox.Core.Control.Enum.ControlState)
local KeyLabelModule = require(script.Parent.KeyLabel.KeyLabel)
local RoundedFrameModule = require(script.Parent.RoundedFrame)
local InteractableModule = require(Parent.Core.Control.Interactable)
local ComponentAssetsCircle17 = ImagesModule["component_assets/circle_17"]
local Cell = RoactModule.PureComponent:extend("Cell")
Cell.validateProps = TModule.strictInterface({
	icon = TModule.optional(TModule.union(TModule.table, TModule.string)),
	text = TModule.string,
	onActivated = TModule.callback,
	keyCodeLabel = TModule.optional(TModule.union(TModule.enum(Enum.KeyCode), TModule.strictInterface({
		key = TModule.enum(Enum.KeyCode),
		axis = TModule.optional(TModule.string)
	}))),
	selected = TModule.optional(TModule.boolean),
	iconColorOverride = TModule.optional(TModule.Color3),
	textColorOverride = TModule.optional(TModule.Color3),
	elementHeight = TModule.integer,
	hasRoundTop = TModule.boolean,
	hasRoundBottom = TModule.boolean,
	hasDivider = TModule.boolean,
	disabled = TModule.optional(TModule.boolean),
	stayOnActivated = TModule.optional(TModule.boolean),
	renderRightSideGadget = TModule.optional(TModule.callback),
	rightSideGadgetSize = TModule.optional(TModule.Vector2),
	leftPaddingOffset = TModule.optional(TModule.number),
	layoutOrder = TModule.integer,
	setButtonRef = TModule.optional(TModule.union(TModule.callback, TModule.table)),
	cursorKind = TModule.optional(require(Parent.App.SelectionImage.CursorKind).isEnumValue),
	isElementBackgroundVisible = TModule.optional(TModule.boolean),
	dividerOffset = TModule.optional(TModule.number),
	dividerSize = TModule.optional(TModule.number),
	fontStyle = TModule.optional(TModule.union(TModule.string, (require(Parent1.UIBlox.Core.Style.Validator.validateFontInfo)))),
	iconSize = TModule.optional(TModule.integer),
	selectedIconSize = TModule.optional(TModule.integer),
	iconPaddingLeft = TModule.optional(TModule.integer),
	textPadding = TModule.optional(TModule.strictInterface({ left = TModule.integer, right = TModule.integer })),
	selectedIconPaddingRight = TModule.optional(TModule.integer),
	keyLabelPaddingRight = TModule.optional(TModule.integer),
	textOnlyPadding = TModule.optional(TModule.integer),
	borderCornerRadius = TModule.optional(TModule.integer),
	background = TModule.optional((require(Parent.Core.Style.Validator.validateColorInfo))),
	selectionOrder = TModule.optional(TModule.number),
	selectionCursor = TModule.optional(TModule.table)
})
Cell.defaultProps = {
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

function Cell.init(p1)
	-- upvalues: ControlStateModule (copy)
	p1.state = {
		keyLabelWidth = 0,
		controlState = ControlStateModule.Default
	}
	
	function p1.keyLabelSizeChanged(Frame)
		-- upvalues: p1 (copy)
		p1:setState({ keyLabelWidth = Frame.AbsoluteSize.X })
	end
	
	function p1.setControlState(ControlState)
		-- upvalues: p1 (copy)
		p1:setState({ controlState = ControlState })
	end
	
	function p1:onStateChanged(ControlState)
		-- upvalues: p1 (copy)
		p1.setControlState(ControlState)
	end
end

function Cell.getImageProperties(p1)
	-- upvalues: ComponentAssetsCircle17 (copy), ImagesModule (copy)
	local ImageRectSize = ComponentAssetsCircle17.ImageRectSize
	local ImageRectOffset = ComponentAssetsCircle17.ImageRectOffset
	local ScaledImagesResolutionScale = 8 * ImagesModule.ImagesResolutionScale
	local ScaledImagesResolutionScale1 = 8 * ImagesModule.ImagesResolutionScale
	local _Rect = Rect.new(ScaledImagesResolutionScale, ScaledImagesResolutionScale1, ImageRectSize.x - ScaledImagesResolutionScale, ImageRectSize.y - ScaledImagesResolutionScale1)
	local X: number = ImageRectSize.X
	local Floored = math.floor(X / 2)
	
	if p1.props.hasRoundTop and p1.props.hasRoundBottom then
		return ImageRectSize, ImageRectOffset, _Rect
	elseif p1.props.hasRoundTop then
		return Vector2.new(X, Floored), ImageRectOffset, (Rect.new(Floored - 1, Floored - 1, Floored + 1, Floored))
	elseif p1.props.hasRoundBottom then
		return Vector2.new(X, Floored), ImageRectOffset + Vector2.new(0, Floored), (Rect.new(Floored - 1, 0, Floored + 1, 1))
	else
		return Vector2.new(1, 1), ImageRectOffset + Vector2.new(Floored, Floored), (Rect.new(0, 0, 0, 0))
	end
end

function Cell.renderRoundedBackground(p1, ZIndex, Background)
	-- upvalues: RoactModule (copy), RoundedFrameModule (copy)
	local _UDim = UDim.new(0, p1.props.borderCornerRadius)
	
	return RoactModule.createElement(RoundedFrameModule, {
		zIndex = ZIndex,
		background = Background,
		topCornerRadius = if p1.props.hasRoundTop then _UDim else nil,
		bottomCornerRadius = if p1.props.hasRoundBottom then _UDim else nil
	})
end

function Cell.renderWithSelectionCursor(p1, _)
	-- upvalues: WithStyleModule (copy), ControlStateModule (copy), DivideTransparencyModule (copy), Object (copy), RoactModule (copy), ImageSetComponentModule (copy), GenericTextLabelModule (copy), KeyLabelModule (copy), ImagesModule (copy), InteractableModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), ControlStateModule (upval), DivideTransparencyModule (upval), Object (upval), RoactModule (upval), ImageSetComponentModule (upval), GenericTextLabelModule (upval), KeyLabelModule (upval), ImagesModule (upval), InteractableModule (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local Settings = p2.Settings
		local NewLeftPaddingOffset = (if p1.props.icon then p1.props.iconPaddingLeft else p1.props.textOnlyPadding) + p1.props.leftPaddingOffset
		local KeyLabelPaddingRight = if p1.props.keyCodeLabel then p1.props.keyLabelPaddingRight elseif p1.props.selected then p1.props.selectedIconPaddingRight else 0
		local BackgroundOnPress = if p1.state.controlState == ControlStateModule.Pressed then Theme.BackgroundOnPress elseif p1.state.controlState == ControlStateModule.Hover then Theme.BackgroundOnHover else { Transparency = 1, Color = Color3.new(1, 1, 1) }
		local ImageProperties, ImageProperties2, ImageProperties3 = p1:getImageProperties()
		local NewIconPaddingLeft = 0
		local Flag = true
		local NewX = nil
		
		if p1.props.rightSideGadgetSize == nil then
			if p1.props.icon then
				Flag = false
				NewLeftPaddingOffset = p1.props.iconPaddingLeft
				NewIconPaddingLeft = p1.props.iconPaddingLeft + p1.props.iconSize
			end
			if p1.props.selected then
				Flag = false
				NewIconPaddingLeft = NewIconPaddingLeft + p1.props.selectedIconSize + p1.props.selectedIconPaddingRight
			end
			if p1.props.keyCodeLabel then
				Flag = false
				NewIconPaddingLeft = NewIconPaddingLeft + p1.props.keyLabelPaddingRight + p1.state.keyLabelWidth
			end
			NewX = if Flag then NewIconPaddingLeft + p1.props.textOnlyPadding * 2 else NewIconPaddingLeft + p1.props.textPadding.left + p1.props.textPadding.right
		else
			NewX = p1.props.rightSideGadgetSize.X + p1.props.iconPaddingLeft + p1.props.iconSize + p1.props.textPadding.left
		end
		local Config = if p1.props.textColorOverride then {
			Color = p1.props.textColorOverride,
			Transparency = Theme.TextEmphasis.Transparency
		} else Theme.TextEmphasis
		
		if p1.state.controlState == ControlStateModule.Pressed or p1.props.disabled then
			Config = {
				Color = Config.Color,
				Transparency = DivideTransparencyModule(Theme.TextEmphasis.Transparency, 2)
			}
		end
		local BackgroundUIDefault = Theme.BackgroundUIDefault
		local AssignResult = Object.assign({}, {
			Color = BackgroundUIDefault.Color,
			Transparency = BackgroundUIDefault.Transparency
		}, p1.props.background)
		AssignResult.Transparency *= Settings.PreferredTransparency
		
		return RoactModule.createElement(InteractableModule, {
			Size = UDim2.new(1, 0, 0, p1.props.elementHeight),
			BackgroundTransparency = 1,
			Image = nil,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = ImageProperties3,
			ImageRectSize = ImageProperties,
			ImageRectOffset = ImageProperties2,
			SliceScale = 1 / ImagesModule.ImagesResolutionScale,
			ImageTransparency = 1,
			ImageColor3 = AssignResult.Color,
			AutoButtonColor = false,
			LayoutOrder = p1.props.layoutOrder,
			BorderSizePixel = 0,
			[RoactModule.Ref] = p1.props.setButtonRef,
			SelectionImageObject = p1.props.selectionCursor,
			SelectionOrder = p1.props.selectionOrder,
			onStateChanged = p1.onStateChanged,
			[RoactModule.Event.Activated] = p1.props.onActivated,
			isDisabled = p1.props.disabled
		}, {
			Background = if p1.props.isElementBackgroundVisible then p1:renderRoundedBackground(-1, AssignResult) else nil,
			Divider = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundColor3 = Theme.Divider.Color,
				BackgroundTransparency = Theme.Divider.Transparency,
				Size = UDim2.new(1, -p1.props.dividerOffset, 0, p1.props.dividerSize),
				Position = UDim2.new(0, p1.props.dividerOffset, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				Visible = p1.props.hasDivider
			}),
			StateOverlay = p1:renderRoundedBackground(2, BackgroundOnPress),
			LeftAlignedContent = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Layout = RoactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, p1.props.textPadding.left)
				}),
				LeftPadding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, NewLeftPaddingOffset) }),
				Icon = p1.props.icon and RoactModule.createElement(ImageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Image = p1.props.icon,
					Size = UDim2.fromOffset(p1.props.iconSize, p1.props.iconSize),
					ImageColor3 = p1.props.iconColorOverride or Theme.IconEmphasis.Color,
					ImageTransparency = DivideTransparencyModule(Theme.IconEmphasis.Transparency, if p1.props.disabled then 2 else 1)
				}),
				Text = RoactModule.createElement(GenericTextLabelModule, {
					BackgroundTransparency = 1,
					TextWrapped = false,
					LayoutOrder = 2,
					fontStyle = p1.props.fontStyle or _Font.Header2,
					colorStyle = Config,
					Size = UDim2.new(1, -NewX, 1, 0),
					Text = p1.props.text,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			RightAlignedContent = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Layout = RoactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, p1.props.textPadding.right)
				}),
				RightPadding = RoactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, KeyLabelPaddingRight) }),
				RightSideContent = p1.props.renderRightSideGadget and p1.props.rightSideGadgetSize and RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 3,
					Size = UDim2.fromOffset(p1.props.rightSideGadgetSize.X, p1.props.rightSideGadgetSize.Y)
				}, p1.props.renderRightSideGadget()) or RoactModule.createFragment({
					KeyLabel = p1.props.keyCodeLabel and RoactModule.createElement(KeyLabelModule, {
						keyCode = p1.props.keyCodeLabel,
						LayoutOrder = 2,
						[RoactModule.Change.AbsoluteSize] = p1.keyLabelSizeChanged
					}),
					SelectedIcon = RoactModule.createElement(ImageSetComponentModule.Label, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Image = ImagesModule["icons/status/success_small"],
						Size = UDim2.fromOffset(p1.props.selectedIconSize, p1.props.selectedIconSize),
						ImageColor3 = Theme.IconEmphasis.Color,
						ImageTransparency = Theme.IconEmphasis.Transparency,
						Visible = p1.props.selected
					})
				})
			})
		})
	end)
end

function Cell.render(p1)
	-- upvalues: WithSelectionCursorProviderModule (copy)
	return WithSelectionCursorProviderModule(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return Cell
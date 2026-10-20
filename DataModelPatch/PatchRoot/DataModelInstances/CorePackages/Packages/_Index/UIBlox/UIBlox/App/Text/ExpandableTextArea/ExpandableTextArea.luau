local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local CryoModule = require(Parent2.Cryo)
local RoactGamepadModule = require(Parent2.RoactGamepad)
local TModule = require(Parent2.t)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local SpringAnimatedItemModule = require(Parent1.Utility.SpringAnimatedItem)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local ImagesModule = require(Parent1.App.ImageSet.Images)
local GenericTextLabelModule = require(Parent1.Core.Text.GenericTextLabel.GenericTextLabel)
local ExpandableTextUtilsModule = require(Parent1.Core.Text.ExpandableText.ExpandableTextUtils)
local WithSelectionCursorProviderModule = require(Parent.SelectionImage.withSelectionCursorProvider)
local CursorTypeModule = require(Parent.SelectionCursor.CursorType)
local UseCursorByTypeModule = require(Parent.SelectionCursor.useCursorByType)
local Y = 30
local X = 5
local _UDim2 = UDim2.new(0, 36, 0, 36)
local _UDim2_1 = UDim2.new(1, 0, 0, 36)
local GradientGradient0100 = ImagesModule["gradient/gradient_0_100"]
local TruncateArrowsActionsTruncationExpand = ImagesModule["truncate_arrows/actions_truncationExpand"]
local TruncateArrowsActionsTruncationCollapse = ImagesModule["truncate_arrows/actions_truncationCollapse"]
local SpringOptions = { dampingRatio = 1, frequency = 3.5 }
local SpringOptions1 = { dampingRatio = 1, frequency = 3.5 }
local WrapResult = SpringAnimatedItemModule.wrap(ImageSetComponentModule.Label)
local ExpandableTextArea = RoactModule.PureComponent:extend("ExpandableTextArea")
ExpandableTextArea.validateProps = TModule.strictInterface({
	Text = TModule.optional(TModule.string),
	Position = TModule.optional(TModule.UDim2),
	compactNumberOfLines = TModule.optional(TModule.number),
	LayoutOrder = TModule.optional(TModule.number),
	width = TModule.optional(TModule.UDim),
	padding = TModule.optional(TModule.Vector2),
	onClick = TModule.optional(TModule.callback),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	frameRef = TModule.optional(TModule.table),
	gradientColor = TModule.optional(TModule.Color3),
	selectionCursor = TModule.table,
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})
ExpandableTextArea.defaultProps = {
	compactNumberOfLines = 2,
	Text = "",
	isRoactGamepadEnabled = true
}

function ExpandableTextArea.init(p1)
	-- upvalues: RoactModule (copy)
	p1.state = { isExpanded = false, frameWidth = 0 }
	
	function p1.onClick()
		-- upvalues: p1 (copy)
		p1:setState(function(p2)
			return { isExpanded = not p2.isExpanded }
		end)
		
		if p1.props.onClick then
			p1.props.onClick(p1.state.isExpanded)
		end
	end
	
	p1.ref = RoactModule.createRef()
	p1.layoutRef = RoactModule.createRef()
end

function ExpandableTextArea.getRef(p1)
	return p1.props.frameRef or p1.ref
end

function ExpandableTextArea.applyFit(p1, Y1)
	-- upvalues: Y (ref), X (ref)
	local Ref = p1:getRef()
	
	if not Ref.current then return end
	local Current = Ref.current
	local NewY = Y1 + Y + X
	local Width = p1.props.width
	
	if Width then
		Current.Size = UDim2.new(Width.Scale, Width.Offset, 0, NewY)
		
		return
	else
		Current.Size = UDim2.new(1, 0, 0, NewY)
	end
end

function ExpandableTextArea.didMount(p1)
	p1.isMounted = true
	local Current = p1.layoutRef.current
	
	if Current then
		p1:applyFit(Current.AbsoluteContentSize.y)
	end
end

function ExpandableTextArea.willUnmount(p1)
	p1.isMounted = false
end

function ExpandableTextArea.render(p1)
	-- upvalues: Y (ref), X (ref), WithStyleModule (copy), WithSelectionCursorProviderModule (copy), ExpandableTextUtilsModule (copy), RoactGamepadModule (copy), RoactModule (copy), SpringAnimatedItemModule (copy), SpringOptions (copy), GenericTextLabelModule (copy), WrapResult (copy), GradientGradient0100 (copy), SpringOptions1 (copy), _UDim2_1 (copy), ImageSetComponentModule (copy), TruncateArrowsActionsTruncationCollapse (copy), TruncateArrowsActionsTruncationExpand (copy), _UDim2 (copy)
	local Text = p1.props.Text
	local Position = p1.props.Position
	local CompactNumberOfLines = p1.props.compactNumberOfLines
	local LayoutOrder = p1.props.LayoutOrder
	local Width = p1.props.width
	local Padding = p1.props.padding
	local GradientColor = p1.props.gradientColor
	local Ref = p1:getRef()
	Y = Padding and Padding.Y or 30
	X = Padding and Padding.X or 5
	
	return WithStyleModule(function(p2)
		-- upvalues: WithSelectionCursorProviderModule (upval), ExpandableTextUtilsModule (upval), p1 (copy), Text (copy), CompactNumberOfLines (copy), X (upval), RoactGamepadModule (upval), RoactModule (upval), LayoutOrder (copy), Position (copy), Width (copy), Ref (copy), Y (upval), SpringAnimatedItemModule (upval), SpringOptions (upval), GenericTextLabelModule (upval), WrapResult (upval), GradientGradient0100 (upval), GradientColor (copy), SpringOptions1 (upval), _UDim2_1 (upval), ImageSetComponentModule (upval), TruncateArrowsActionsTruncationCollapse (upval), TruncateArrowsActionsTruncationExpand (upval), _UDim2 (upval)
		return WithSelectionCursorProviderModule(function(_)
			-- upvalues: p2 (copy), ExpandableTextUtilsModule (upval), p1 (upval), Text (upval), CompactNumberOfLines (upval), X (upval), RoactGamepadModule (upval), RoactModule (upval), LayoutOrder (upval), Position (upval), Width (upval), Ref (upval), Y (upval), SpringAnimatedItemModule (upval), SpringOptions (upval), GenericTextLabelModule (upval), WrapResult (upval), GradientGradient0100 (upval), GradientColor (upval), SpringOptions1 (upval), _UDim2_1 (upval), ImageSetComponentModule (upval), TruncateArrowsActionsTruncationCollapse (upval), TruncateArrowsActionsTruncationExpand (upval), _UDim2 (upval)
			local Theme = p2.Theme
			local _Font = p2.Font
			local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
			local ExpandableTextHeights, ExpandableTextHeights2 = ExpandableTextUtilsModule.getExpandableTextHeights(_Font, p1.state.frameWidth, Text, CompactNumberOfLines)
			local _UDim2_2 = UDim2.new(1, 0, 0, ExpandableTextHeights2 + X)
			local _UDim2_3 = UDim2.new(1, 0, 0, ExpandableTextHeights + X)
			local IsExpandableTextHeightsBelow = ExpandableTextHeights2 < ExpandableTextHeights
			local NoIsExpandableTextHeightsBelow = not IsExpandableTextHeightsBelow or p1.state.isExpanded
			local _UDim2_3_1: UDim2 = NoIsExpandableTextHeightsBelow and _UDim2_3 or _UDim2_2
			
			return RoactModule.createElement(if p1.props.isRoactGamepadEnabled and IsExpandableTextHeightsBelow then RoactGamepadModule.Focusable.Frame else "Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = LayoutOrder,
				Position = Position,
				Size = Width and UDim2.new(Width.Scale, Width.Offset, 0, 0) or UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				SelectionImageObject = p1.props.selectionCursor,
				[RoactModule.Ref] = Ref,
				[RoactModule.Change.AbsoluteSize] = function(Frame: Frame)
					-- upvalues: p1 (upval)
					if p1.state.frameWidth ~= Frame.AbsoluteSize.X then
						p1:setState({ frameWidth = Frame.AbsoluteSize.X })
					end
				end,
				NextSelectionUp = p1.props.NextSelectionUp,
				NextSelectionDown = p1.props.NextSelectionDown,
				NextSelectionLeft = p1.props.NextSelectionLeft,
				NextSelectionRight = p1.props.NextSelectionRight,
				inputBindings = if p1.props.isRoactGamepadEnabled and IsExpandableTextHeightsBelow then {
					Activated = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, p1.onClick)
				} else nil
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 10),
					[RoactModule.Change.AbsoluteContentSize] = function(p3)
						-- upvalues: p1 (upval)
						p1:applyFit(p3.AbsoluteContentSize.y)
					end,
					[RoactModule.Ref] = p1.layoutRef
				}),
				UIPadding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, Y) }),
				ExpandableContainer = RoactModule.createElement(SpringAnimatedItemModule.AnimatedFrame, {
					animatedValues = { height = _UDim2_3_1.Y.Offset },
					mapValuesToProps = function(p3)
						-- upvalues: _UDim2_3_1 (copy)
						return { Size = UDim2.new(1, 0, _UDim2_3_1.Y.Scale, p3.height) }
					end,
					regularProps = {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ClipsDescendants = true,
						LayoutOrder = 0,
						Size = _UDim2_3_1
					},
					springOptions = SpringOptions
				}, {
					DescriptionText = RoactModule.createElement(GenericTextLabelModule, {
						TextWrapped = true,
						BackgroundTransparency = 1,
						colorStyle = Theme.TextDefault,
						fontStyle = _Font.Body,
						Size = _UDim2_3_1,
						Text = Text,
						TextSize = ScaledBaseSize,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					Gradient = IsExpandableTextHeightsBelow and RoactModule.createElement(WrapResult, {
						animatedValues = {
							height = if NoIsExpandableTextHeightsBelow then 0 else 30
						},
						mapValuesToProps = function(p3)
							return { Size = UDim2.new(1, 0, 0, p3.height) }
						end,
						regularProps = {
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 30),
							Position = UDim2.new(0, 0, 1, 0),
							AnchorPoint = Vector2.new(0, 1),
							Image = GradientGradient0100,
							ImageColor3 = GradientColor or Theme.BackgroundDefault.Color
						},
						springOptions = SpringOptions1
					})
				}),
				ButtonContainer = IsExpandableTextHeightsBelow and RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 10)
				}, {
					PressableButton = RoactModule.createElement("TextButton", {
						Position = UDim2.new(0, 0, 0, -24),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = _UDim2_1,
						Text = "",
						[RoactModule.Event.Activated] = p1.onClick
					}, {
						DownArrow = RoactModule.createElement(ImageSetComponentModule.Label, {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							AnchorPoint = Vector2.new(0.5, 0),
							Position = UDim2.new(0.5, 0, 0, 0),
							Image = _UDim2_3_1 == _UDim2_3 and TruncateArrowsActionsTruncationCollapse or TruncateArrowsActionsTruncationExpand,
							ImageColor3 = Theme.IconEmphasis.Color,
							ImageTransparency = Theme.IconEmphasis.Transparency,
							Size = _UDim2
						})
					})
				})
			})
		end)
	end)
end

return RoactModule.forwardRef(function(p1, FrameRef)
	-- upvalues: UseCursorByTypeModule (copy), CursorTypeModule (copy), CryoModule (copy), RoactModule (copy), ExpandableTextArea (copy)
	return RoactModule.createElement(ExpandableTextArea, CryoModule.Dictionary.join(CryoModule.Dictionary.join(p1, {
		selectionCursor = UseCursorByTypeModule(CursorTypeModule.RoundedRect)
	}), { frameRef = FrameRef }))
end)
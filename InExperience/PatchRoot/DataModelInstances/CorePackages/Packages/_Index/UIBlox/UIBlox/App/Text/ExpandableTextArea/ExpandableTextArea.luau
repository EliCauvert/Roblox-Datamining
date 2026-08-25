local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local cryoModule = require(parent_2.Cryo)
local roactGamepadModule = require(parent_2.RoactGamepad)
local tModule = require(parent_2.t)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local springAnimatedItemModule = require(parent_1.Utility.SpringAnimatedItem)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local imagesModule = require(parent_1.App.ImageSet.Images)
local genericTextLabelModule = require(parent_1.Core.Text.GenericTextLabel.GenericTextLabel)
local expandableTextUtilsModule = require(parent_1.Core.Text.ExpandableText.ExpandableTextUtils)
local withSelectionCursorProviderModule = require(parent.SelectionImage.withSelectionCursorProvider)
local cursorTypeModule = require(parent.SelectionCursor.CursorType)
local useCursorByTypeModule = require(parent.SelectionCursor.useCursorByType)
local var13 = 30
local var14 = 5
local uDim2 = UDim2.new(0, 36, 0, 36)
local uDim2_1 = UDim2.new(1, 0, 0, 36)
local gradient0100 = imagesModule["gradient/gradient_0_100"]
local actionsTruncationExpand = imagesModule["truncate_arrows/actions_truncationExpand"]
local actionsTruncationCollapse = imagesModule["truncate_arrows/actions_truncationCollapse"]
local t = { dampingRatio = 1, frequency = 3.5 }
local t_1 = { dampingRatio = 1, frequency = 3.5 }
local var19 = springAnimatedItemModule.wrap(imageSetComponentModule.Label)
local expandableTextArea = roactModule.PureComponent:extend("ExpandableTextArea")
expandableTextArea.validateProps = tModule.strictInterface({
	Text = tModule.optional(tModule.string),
	Position = tModule.optional(tModule.UDim2),
	compactNumberOfLines = tModule.optional(tModule.number),
	LayoutOrder = tModule.optional(tModule.number),
	width = tModule.optional(tModule.UDim),
	padding = tModule.optional(tModule.Vector2),
	onClick = tModule.optional(tModule.callback),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	frameRef = tModule.optional(tModule.table),
	gradientColor = tModule.optional(tModule.Color3),
	selectionCursor = tModule.table,
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})
expandableTextArea.defaultProps = {
	compactNumberOfLines = 2,
	Text = "",
	isRoactGamepadEnabled = true
}

function expandableTextArea.init(p0)
	-- upvalues: roactModule (ref)
	p0.state = { isExpanded = false, frameWidth = 0 }
	
	function p0.onClick()
		-- upvalues: p0 (ref)
		p0:setState(function(p1)
			return { isExpanded = not p1.isExpanded }
		end)
		
		if p0.props.onClick then
			p0.props.onClick(p0.state.isExpanded)
		end
	end
	
	p0.ref = roactModule.createRef()
	p0.layoutRef = roactModule.createRef()
end

function expandableTextArea.getRef(p2)
	return p2.props.frameRef or p2.ref
end

function expandableTextArea.applyFit(p3, p4)
	-- upvalues: var13 (write), var14 (write)
	local ref = p3:getRef()
	
	if not ref.current then return end
	local current = ref.current
	local var22 = p4 + var13 + var14
	local width = p3.props.width
	
	if width then
		current.Size = UDim2.new(width.Scale, width.Offset, 0, var22)
		
		return
	end
	current.Size = UDim2.new(1, 0, 0, var22)
end

function expandableTextArea.didMount(p5)
	p5.isMounted = true
	local current = p5.layoutRef.current
	
	if current then
		p5:applyFit(current.AbsoluteContentSize.y)
	end
end

function expandableTextArea.willUnmount(p6)
	p6.isMounted = false
end

function expandableTextArea.render(p7)
	-- upvalues: var13 (write), var14 (write), withStyleModule (ref), withSelectionCursorProviderModule (ref), expandableTextUtilsModule (ref), roactGamepadModule (ref), roactModule (ref), springAnimatedItemModule (ref), t (ref), genericTextLabelModule (ref), var19 (ref), gradient0100 (ref), t_1 (ref), uDim2_1 (ref), imageSetComponentModule (ref), actionsTruncationCollapse (ref), actionsTruncationExpand (ref), uDim2 (ref)
	local text = p7.props.Text
	local position = p7.props.Position
	local compactNumberOfLines = p7.props.compactNumberOfLines
	local layoutOrder = p7.props.LayoutOrder
	local width = p7.props.width
	local padding = p7.props.padding
	local gradientColor = p7.props.gradientColor
	local ref = p7:getRef()
	var13 = if padding then padding.Y else 30
	var14 = if padding then padding.X else 5
	
	return withStyleModule(function(p8)
		-- upvalues: withSelectionCursorProviderModule (copy), expandableTextUtilsModule (copy), p7 (ref), text (ref), compactNumberOfLines (ref), var14 (copy), roactGamepadModule (copy), roactModule (copy), layoutOrder (ref), position (ref), width (ref), ref (ref), var13 (copy), springAnimatedItemModule (copy), t (copy), genericTextLabelModule (copy), var19 (copy), gradient0100 (copy), gradientColor (ref), t_1 (copy), uDim2_1 (copy), imageSetComponentModule (copy), actionsTruncationCollapse (copy), actionsTruncationExpand (copy), uDim2 (copy)
		return withSelectionCursorProviderModule(function(_)
			-- upvalues: p8 (ref), expandableTextUtilsModule (copy), p7 (copy), text (copy), compactNumberOfLines (copy), var14 (copy), roactGamepadModule (copy), roactModule (copy), layoutOrder (copy), position (copy), width (copy), ref (copy), var13 (copy), springAnimatedItemModule (copy), t (copy), genericTextLabelModule (copy), var19 (copy), gradient0100 (copy), gradientColor (copy), t_1 (copy), uDim2_1 (copy), imageSetComponentModule (copy), actionsTruncationCollapse (copy), actionsTruncationExpand (copy), uDim2 (copy)
			local theme = p8.Theme
			local font = p8.Font
			local var24 = font.BaseSize * font.Body.RelativeSize
			local expandableTextHeights, expandableTextHeights_1 = expandableTextUtilsModule.getExpandableTextHeights(font, p7.state.frameWidth, text, compactNumberOfLines)
			local uDim2_2 = UDim2.new(1, 0, 0, expandableTextHeights_1 + var14)
			local uDim2_3 = UDim2.new(1, 0, 0, expandableTextHeights + var14)
			local var29 = expandableTextHeights_1 < expandableTextHeights
			local var30 = not var29 or p7.state.isExpanded
			local var31 = if var30 then uDim2_3 else uDim2_2
			
			return roactModule.createElement(if p7.props.isRoactGamepadEnabled and var29 then roactGamepadModule.Focusable.Frame else "Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = layoutOrder,
				Position = position,
				Size = width and UDim2.new(width.Scale, width.Offset, 0, 0) or UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				SelectionImageObject = p7.props.selectionCursor,
				[roactModule.Ref] = ref,
				[roactModule.Change.AbsoluteSize] = function(p9)
					-- upvalues: p7 (copy)
					if p7.state.frameWidth ~= p9.AbsoluteSize.X then
						p7:setState({ frameWidth = p9.AbsoluteSize.X })
					end
				end,
				NextSelectionUp = p7.props.NextSelectionUp,
				NextSelectionDown = p7.props.NextSelectionDown,
				NextSelectionLeft = p7.props.NextSelectionLeft,
				NextSelectionRight = p7.props.NextSelectionRight,
				inputBindings = if p7.props.isRoactGamepadEnabled and var29 then {
					Activated = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, p7.onClick)
				} else nil
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 10),
					[roactModule.Change.AbsoluteContentSize] = function(p10)
						-- upvalues: p7 (copy)
						p7:applyFit(p10.AbsoluteContentSize.y)
					end,
					[roactModule.Ref] = p7.layoutRef
				}),
				UIPadding = roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var13) }),
				ExpandableContainer = roactModule.createElement(springAnimatedItemModule.AnimatedFrame, {
					animatedValues = { height = var31.Y.Offset },
					mapValuesToProps = function(p11)
						-- upvalues: var31 (ref)
						return { Size = UDim2.new(1, 0, var31.Y.Scale, p11.height) }
					end,
					regularProps = {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ClipsDescendants = true,
						LayoutOrder = 0,
						Size = var31
					},
					springOptions = t
				}, {
					DescriptionText = roactModule.createElement(genericTextLabelModule, {
						TextWrapped = true,
						BackgroundTransparency = 1,
						colorStyle = theme.TextDefault,
						fontStyle = font.Body,
						Size = var31,
						Text = text,
						TextSize = var24,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					Gradient = var29 and roactModule.createElement(var19, {
						animatedValues = { height = if var30 then 0 else 30 },
						mapValuesToProps = function(p12)
							return { Size = UDim2.new(1, 0, 0, p12.height) }
						end,
						regularProps = {
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 30),
							Position = UDim2.new(0, 0, 1, 0),
							AnchorPoint = Vector2.new(0, 1),
							Image = gradient0100,
							ImageColor3 = gradientColor or theme.BackgroundDefault.Color
						},
						springOptions = t_1
					})
				}),
				ButtonContainer = var29 and roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 10)
				}, {
					PressableButton = roactModule.createElement("TextButton", {
						Position = UDim2.new(0, 0, 0, -24),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = uDim2_1,
						Text = "",
						[roactModule.Event.Activated] = p7.onClick
					}, {
						DownArrow = roactModule.createElement(imageSetComponentModule.Label, {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							AnchorPoint = Vector2.new(0.5, 0),
							Position = UDim2.new(0.5, 0, 0, 0),
							Image = if var31 == uDim2_3 then actionsTruncationCollapse else actionsTruncationExpand,
							ImageColor3 = theme.IconEmphasis.Color,
							ImageTransparency = theme.IconEmphasis.Transparency,
							Size = uDim2
						})
					})
				})
			})
		end)
	end)
end

return roactModule.forwardRef(function(p13, p14)
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), cryoModule (ref), roactModule (ref), expandableTextArea (ref)
	return roactModule.createElement(expandableTextArea, cryoModule.Dictionary.join(cryoModule.Dictionary.join(p13, {
		selectionCursor = useCursorByTypeModule(cursorTypeModule.RoundedRect)
	}), { frameRef = p14 }))
end)
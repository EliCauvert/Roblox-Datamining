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
local var1 = 30
local var2 = 5
local uDim2 = UDim2.new(0, 36, 0, 36)
local uDim2_1 = UDim2.new(1, 0, 0, 36)
local gradient0100 = imagesModule["gradient/gradient_0_100"]
local actionsTruncationExpand = imagesModule["truncate_arrows/actions_truncationExpand"]
local actionsTruncationCollapse = imagesModule["truncate_arrows/actions_truncationCollapse"]
local t = { dampingRatio = 1, frequency = 3.5 }
local t_1 = { dampingRatio = 1, frequency = 3.5 }
local var3 = springAnimatedItemModule.wrap(imageSetComponentModule.Label)
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

function expandableTextArea.init(p1)
	-- upvalues: roactModule (ref)
	p1.state = { isExpanded = false, frameWidth = 0 }
	
	function p0.onClick()
		-- upvalues: p1 (ref)
		p1:setState(function(p2)
			return { isExpanded = not p2.isExpanded }
		end)
		
		if p1.props.onClick then
			p1.props.onClick(p1.state.isExpanded)
		end
	end
	
	p1.ref = roactModule.createRef()
	p1.layoutRef = roactModule.createRef()
end

function expandableTextArea.getRef(p1)
	return p1.props.frameRef or p1.ref
end

function expandableTextArea.applyFit(p1, p2)
	-- upvalues: var1 (write), var2 (write)
	local ref = p1:getRef()
	
	if not ref.current then return end
	local current = ref.current
	local var4 = p2 + var1 + var2
	local width = p1.props.width
	
	if width then
		current.Size = UDim2.new(width.Scale, width.Offset, 0, var4)
		
		return
	end
	current.Size = UDim2.new(1, 0, 0, var4)
end

function expandableTextArea.didMount(p1)
	p1.isMounted = true
	local current = p1.layoutRef.current
	
	if current then
		p1:applyFit(current.AbsoluteContentSize.y)
	end
end

function expandableTextArea.willUnmount(p1)
	p1.isMounted = false
end

function expandableTextArea.render(p1)
	-- upvalues: var1 (write), var2 (write), withStyleModule (ref), withSelectionCursorProviderModule (ref), expandableTextUtilsModule (ref), roactGamepadModule (ref), roactModule (ref), springAnimatedItemModule (ref), t (ref), genericTextLabelModule (ref), var3 (ref), gradient0100 (ref), t_1 (ref), uDim2_1 (ref), imageSetComponentModule (ref), actionsTruncationCollapse (ref), actionsTruncationExpand (ref), uDim2 (ref)
	local text = p1.props.Text
	local position = p1.props.Position
	local compactNumberOfLines = p1.props.compactNumberOfLines
	local layoutOrder = p1.props.LayoutOrder
	local width = p1.props.width
	local padding = p1.props.padding
	local gradientColor = p1.props.gradientColor
	local ref = p1:getRef()
	var1 = if padding then padding.Y else 30
	var2 = if padding then padding.X else 5
	
	return withStyleModule(function(p2)
		-- upvalues: withSelectionCursorProviderModule (copy), expandableTextUtilsModule (copy), p1 (ref), text (ref), compactNumberOfLines (ref), var2 (copy), roactGamepadModule (copy), roactModule (copy), layoutOrder (ref), position (ref), width (ref), ref (ref), var1 (copy), springAnimatedItemModule (copy), t (copy), genericTextLabelModule (copy), var3 (copy), gradient0100 (copy), gradientColor (ref), t_1 (copy), uDim2_1 (copy), imageSetComponentModule (copy), actionsTruncationCollapse (copy), actionsTruncationExpand (copy), uDim2 (copy)
		return withSelectionCursorProviderModule(function(_)
			-- upvalues: p2 (ref), expandableTextUtilsModule (copy), p1 (copy), text (copy), compactNumberOfLines (copy), var2 (copy), roactGamepadModule (copy), roactModule (copy), layoutOrder (copy), position (copy), width (copy), ref (copy), var1 (copy), springAnimatedItemModule (copy), t (copy), genericTextLabelModule (copy), var3 (copy), gradient0100 (copy), gradientColor (copy), t_1 (copy), uDim2_1 (copy), imageSetComponentModule (copy), actionsTruncationCollapse (copy), actionsTruncationExpand (copy), uDim2 (copy)
			local theme = p2.Theme
			local font = p2.Font
			local var4 = font.BaseSize * font.Body.RelativeSize
			local expandableTextHeights, expandableTextHeights_1 = expandableTextUtilsModule.getExpandableTextHeights(font, p1.state.frameWidth, text, compactNumberOfLines)
			local uDim2_2 = UDim2.new(1, 0, 0, expandableTextHeights_1 + var2)
			local uDim2_3 = UDim2.new(1, 0, 0, expandableTextHeights + var2)
			local var5 = expandableTextHeights_1 < expandableTextHeights
			local var6 = not var5 or p1.state.isExpanded
			local var7 = if var6 then uDim2_3 else uDim2_2
			
			return roactModule.createElement(if p1.props.isRoactGamepadEnabled and var5 then roactGamepadModule.Focusable.Frame else "Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = layoutOrder,
				Position = position,
				Size = width and UDim2.new(width.Scale, width.Offset, 0, 0) or UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				SelectionImageObject = p1.props.selectionCursor,
				[roactModule.Ref] = ref,
				[roactModule.Change.AbsoluteSize] = function(p3)
					-- upvalues: p1 (copy)
					if p1.state.frameWidth ~= p3.AbsoluteSize.X then
						p1:setState({ frameWidth = p3.AbsoluteSize.X })
					end
				end,
				NextSelectionUp = p1.props.NextSelectionUp,
				NextSelectionDown = p1.props.NextSelectionDown,
				NextSelectionLeft = p1.props.NextSelectionLeft,
				NextSelectionRight = p1.props.NextSelectionRight,
				inputBindings = if p1.props.isRoactGamepadEnabled and var5 then {
					Activated = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, p1.onClick)
				} else nil
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 10),
					[roactModule.Change.AbsoluteContentSize] = function(p3)
						-- upvalues: p1 (copy)
						p1:applyFit(p3.AbsoluteContentSize.y)
					end,
					[roactModule.Ref] = p1.layoutRef
				}),
				UIPadding = roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var1) }),
				ExpandableContainer = roactModule.createElement(springAnimatedItemModule.AnimatedFrame, {
					animatedValues = { height = var7.Y.Offset },
					mapValuesToProps = function(p3)
						-- upvalues: var7 (ref)
						return { Size = UDim2.new(1, 0, var7.Y.Scale, p3.height) }
					end,
					regularProps = {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ClipsDescendants = true,
						LayoutOrder = 0,
						Size = var7
					},
					springOptions = t
				}, {
					DescriptionText = roactModule.createElement(genericTextLabelModule, {
						TextWrapped = true,
						BackgroundTransparency = 1,
						colorStyle = theme.TextDefault,
						fontStyle = font.Body,
						Size = var7,
						Text = text,
						TextSize = var4,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					Gradient = var5 and roactModule.createElement(var3, {
						animatedValues = { height = if var6 then 0 else 30 },
						mapValuesToProps = function(p3)
							return { Size = UDim2.new(1, 0, 0, p3.height) }
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
				ButtonContainer = var5 and roactModule.createElement("Frame", {
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
						[roactModule.Event.Activated] = p1.onClick
					}, {
						DownArrow = roactModule.createElement(imageSetComponentModule.Label, {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							AnchorPoint = Vector2.new(0.5, 0),
							Position = UDim2.new(0.5, 0, 0, 0),
							Image = if var7 == uDim2_3 then actionsTruncationCollapse else actionsTruncationExpand,
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

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), cryoModule (ref), roactModule (ref), expandableTextArea (ref)
	return roactModule.createElement(expandableTextArea, cryoModule.Dictionary.join(cryoModule.Dictionary.join(p1, {
		selectionCursor = useCursorByTypeModule(cursorTypeModule.RoundedRect)
	}), { frameRef = p2 }))
end)
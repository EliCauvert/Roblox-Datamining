local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent
local TModule = require(Parent1.t)
local CryoModule = require(Parent1.Cryo)
local RoactModule = require(Parent1.Roact)
local FitFrameModule = require(Parent1.FitFrame)
local ThreeSectionBar = RoactModule.PureComponent:extend("ThreeSectionBar")
ThreeSectionBar.validateProps = TModule.strictInterface({
	BackgroundColor3 = TModule.optional(TModule.Color3),
	BackgroundTransparency = TModule.optional(TModule.union(TModule.number, require(Parent.Utility.bindingValidator)(TModule.number))),
	barHeight = TModule.optional(TModule.number),
	contentPaddingLeft = TModule.optional(TModule.UDim),
	contentPaddingRight = TModule.optional(TModule.UDim),
	estimatedCenterWidth = TModule.optional(TModule.number),
	marginLeft = TModule.optional(TModule.number),
	marginRight = TModule.optional(TModule.number),
	onWidthChange = TModule.optional(TModule.callback),
	renderCenter = TModule.optional(TModule.callback),
	renderLeft = TModule.optional(TModule.callback),
	renderRight = TModule.optional(TModule.callback),
	automaticHeight = TModule.optional(TModule.boolean),
	sectionSpacing = TModule.optional(TModule.number)
})
ThreeSectionBar.defaultProps = {
	barHeight = 32,
	BackgroundTransparency = 0,
	marginLeft = 0,
	marginRight = 0,
	renderLeft = nil,
	renderRight = nil,
	renderCenter = nil,
	estimatedCenterWidth = 1e999,
	automaticHeight = false,
	sectionSpacing = 8,
	contentPaddingLeft = UDim.new(0, 0),
	contentPaddingRight = UDim.new(0, 0),
	onWidthChange = function() --[[ Line: 46 ]]
		return nil
	end
}

function ThreeSectionBar.init(p1) --[[ Line: 55 ]]
	-- upvalues: RoactModule (copy)
	p1.leftWidth, p1.updateLeftWidth = RoactModule.createBinding(0)
	p1.rightWidth, p1.updateRightWidth = RoactModule.createBinding(0)
	p1.fullWidth, p1.updateFullWidth = RoactModule.createBinding(0)
	
	function p1.computeCenteredSize(Entry): UDim2 --[[ Line: 60 ]]
		-- upvalues: p1 (copy)
		local Largest = math.max(Entry[1], Entry[2])
		local Magnitude: number = (Vector2.new(Entry[3] / 2, 0) - Vector2.new(Largest, 0)).magnitude
		
		return if p1.props.renderLeft and p1.props.renderRight then UDim2.new(0, Magnitude * 2, 1, 0) else UDim2.new(1, -Largest, 1, 0)
	end
	
	function p1.computeBumpedPosition(Entry): UDim2 --[[ Line: 78 ]]
		local Entry1 = Entry[1]
		
		return UDim2.new(0, Entry1 + (Entry[3] - Entry1 - Entry[2]) / 2, 0.5, 0)
	end
	
	function p1.computeBumpedSize(Entry): UDim2 --[[ Line: 86 ]]
		return UDim2.new(1, -Entry[1] - Entry[2], 1, 0)
	end
end

function ThreeSectionBar.didUpdate(p1) --[[ Line: 93 ]]
	if not p1.props.renderLeft then
		p1.updateLeftWidth(0)
	end
	if not p1.props.renderRight then
		p1.updateRightWidth(0)
	end
end

function ThreeSectionBar.render(p1) --[[ Line: 104 ]]
	-- upvalues: RoactModule (copy), FitFrameModule (copy), CryoModule (copy)
	local _Vector2 = Vector2.new(0.5, 0.5)
	local _UDim2 = nil
	_UDim2 = if p1.props.renderLeft or not p1.props.renderRight then if p1.props.renderLeft and not p1.props.renderRight then UDim2.fromScale(1, 0.5) else UDim2.fromScale(0.5, 0.5) else UDim2.fromScale(0, 0.5)
	
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, p1.props.barHeight),
		BackgroundColor3 = p1.props.BackgroundColor3,
		BackgroundTransparency = p1.props.BackgroundTransparency,
		BorderSizePixel = 0,
		AutomaticSize = if p1.props.automaticHeight then Enum.AutomaticSize.Y else nil,
		[RoactModule.Change.AbsoluteSize] = function(Frame: Frame) --[[ Line: 123 ]]
			-- upvalues: p1 (copy)
			p1.props.onWidthChange(Frame.AbsoluteSize.X)
			p1.updateFullWidth(Frame.AbsoluteSize.X)
		end
	}, {
		leftFrame = p1.props.renderLeft and RoactModule.createElement(FitFrameModule.FitFrameHorizontal, {
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromScale(0, 0),
			BackgroundTransparency = 1,
			minimumSize = UDim.new(0, 200),
			height = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			contentPadding = p1.props.contentPaddingLeft,
			margin = {
				top = 0,
				bottom = 0,
				left = p1.props.marginLeft,
				right = p1.props.sectionSpacing
			},
			[RoactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 144 ]]
				-- upvalues: p1 (copy)
				p1.updateLeftWidth(Frame.AbsoluteSize.X)
			end
		}, {
			leftContent = p1.props.renderLeft(CryoModule.Dictionary.join(p1.props, {
				[RoactModule.Children] = {
					sizeConstraint = RoactModule.createElement("UISizeConstraint", {
						MaxSize = RoactModule.joinBindings({ p1.leftWidth, p1.rightWidth, p1.fullWidth }):map(function(Entry): Vector2 --[[ Line: 153 ]]
							-- upvalues: p1 (copy)
							local _ = Entry[1]
							
							return Vector2.new(math.max(0, Entry[3] - Entry[2] - p1.props.marginLeft), 1e999)
						end)
					})
				}
			}))
		}),
		centerFrame = p1.props.renderCenter and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = _Vector2,
			Position = RoactModule.joinBindings({ p1.leftWidth, p1.rightWidth, p1.fullWidth }):map(function(p2) --[[ Line: 169 ]]
				-- upvalues: p1 (copy), _UDim2 (ref)
				return if math.abs(p1.computeCenteredSize(p2).X.Offset) <= p1.props.estimatedCenterWidth then p1.computeBumpedPosition(p2) else _UDim2
			end),
			Size = RoactModule.joinBindings({ p1.leftWidth, p1.rightWidth, p1.fullWidth }):map(function(p2) --[[ Line: 178 ]]
				-- upvalues: p1 (copy)
				local CenteredSize = p1.computeCenteredSize(p2)
				
				return if math.abs(CenteredSize.X.Offset) <= p1.props.estimatedCenterWidth then p1.computeBumpedSize(p2) else CenteredSize
			end)
		}, {
			UIPadding = RoactModule.createElement("UIPadding", {
				PaddingLeft = p1.props.renderLeft and UDim.new(0, 0) or UDim.new(0, p1.props.marginLeft),
				PaddingRight = p1.props.renderRight and UDim.new(0, 0) or UDim.new(0, p1.props.marginRight)
			}),
			["$layout"] = RoactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			centerContent = p1.props.renderCenter(p1.props)
		}),
		rightFrame = p1.props.renderRight and RoactModule.createElement(FitFrameModule.FitFrameHorizontal, {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			BackgroundTransparency = 1,
			minimumSize = UDim.new(0, 200),
			height = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			contentPadding = p1.props.contentPaddingRight,
			margin = {
				top = 0,
				bottom = 0,
				left = p1.props.sectionSpacing,
				right = p1.props.marginRight
			},
			[RoactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 216 ]]
				-- upvalues: p1 (copy)
				p1.updateRightWidth(Frame.AbsoluteSize.X)
			end
		}, { rightContent = p1.props.renderRight(p1.props) })
	})
end

return ThreeSectionBar
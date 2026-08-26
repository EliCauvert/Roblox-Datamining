local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local tModule = require(parent_1.t)
local cryoModule = require(parent_1.Cryo)
local roactModule = require(parent_1.Roact)
local fitFrameModule = require(parent_1.FitFrame)
local threeSectionBar = roactModule.PureComponent:extend("ThreeSectionBar")
threeSectionBar.validateProps = tModule.strictInterface({
	BackgroundColor3 = tModule.optional(tModule.Color3),
	BackgroundTransparency = tModule.optional(tModule.union(tModule.number, require(parent.Utility.bindingValidator)(tModule.number))),
	barHeight = tModule.optional(tModule.number),
	contentPaddingLeft = tModule.optional(tModule.UDim),
	contentPaddingRight = tModule.optional(tModule.UDim),
	estimatedCenterWidth = tModule.optional(tModule.number),
	marginLeft = tModule.optional(tModule.number),
	marginRight = tModule.optional(tModule.number),
	onWidthChange = tModule.optional(tModule.callback),
	renderCenter = tModule.optional(tModule.callback),
	renderLeft = tModule.optional(tModule.callback),
	renderRight = tModule.optional(tModule.callback),
	automaticHeight = tModule.optional(tModule.boolean),
	sectionSpacing = tModule.optional(tModule.number)
})
threeSectionBar.defaultProps = {
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
	onWidthChange = function()
		return nil
	end
}

function threeSectionBar.init(p1)
	-- upvalues: roactModule (ref)
	local var1, var2 = roactModule.createBinding(0)
	p1.leftWidth = var1
	p1.updateLeftWidth = var2
	local var3, var4 = roactModule.createBinding(0)
	p1.rightWidth = var3
	p1.updateRightWidth = var4
	local var5, var6 = roactModule.createBinding(0)
	p1.fullWidth = var5
	p1.updateFullWidth = var6
	
	function p0.computeCenteredSize(p2)
		-- upvalues: p1 (ref)
		local maxValue = math.max(p2[1], p2[2])
		
		return if p1.props.renderLeft and p1.props.renderRight then UDim2.new(0, (Vector2.new(p2[3] / 2, 0) - Vector2.new(maxValue, 0)).magnitude * 2, 1, 0) else UDim2.new(1, -maxValue, 1, 0)
	end
	
	function p0.computeBumpedPosition(p2)
		local var7 = p2[1]
		
		return UDim2.new(0, var7 + (p2[3] - var7 - p2[2]) / 2, 0.5, 0)
	end
	
	function p0.computeBumpedSize(p2)
		return UDim2.new(1, (-p2[1]) - p2[2], 1, 0)
	end
end

function threeSectionBar.didUpdate(p1)
	if not p1.props.renderLeft then
		p1.updateLeftWidth(0)
	end
	if not p1.props.renderRight then
		p1.updateRightWidth(0)
	end
end

function threeSectionBar.render(p1)
	-- upvalues: roactModule (ref), fitFrameModule (ref), cryoModule (ref)
	local vector2 = Vector2.new(0.5, 0.5)
	local _ = nil
	local var1 = if not p1.props.renderLeft and p1.props.renderRight then if p1.props.renderLeft and not p1.props.renderRight then UDim2.fromScale(1, 0.5) else UDim2.fromScale(0.5, 0.5) else UDim2.fromScale(0, 0.5)
	
	return roactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, p1.props.barHeight),
		BackgroundColor3 = p1.props.BackgroundColor3,
		BackgroundTransparency = p1.props.BackgroundTransparency,
		BorderSizePixel = 0,
		AutomaticSize = if p1.props.automaticHeight then Enum.AutomaticSize.Y else nil,
		[roactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: p1 (ref)
			p1.props.onWidthChange(p2.AbsoluteSize.X)
			p1.updateFullWidth(p2.AbsoluteSize.X)
		end
	}, {
		leftFrame = p1.props.renderLeft and roactModule.createElement(fitFrameModule.FitFrameHorizontal, {
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
			[roactModule.Change.AbsoluteSize] = function(p2)
				-- upvalues: p1 (ref)
				p1.updateLeftWidth(p2.AbsoluteSize.X)
			end
		}, {
			leftContent = p1.props.renderLeft(cryoModule.Dictionary.join(p1.props, {
				[roactModule.Children] = {
					sizeConstraint = roactModule.createElement("UISizeConstraint", {
						MaxSize = roactModule.joinBindings({ p1.leftWidth, p1.rightWidth, p1.fullWidth }):map(function(p2)
							-- upvalues: p1 (ref)
							local _ = p2[1]
							
							return Vector2.new(math.max(0, p2[3] - p2[2] - p1.props.marginLeft), 1e999)
						end)
					})
				}
			}))
		}),
		centerFrame = p1.props.renderCenter and roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = vector2,
			Position = roactModule.joinBindings({ p1.leftWidth, p1.rightWidth, p1.fullWidth }):map(function(p2)
				-- upvalues: p1 (ref), var1 (write)
				return if math.abs(p1.computeCenteredSize(p2).X.Offset) <= p1.props.estimatedCenterWidth then p1.computeBumpedPosition(p2) else var1
			end),
			Size = roactModule.joinBindings({ p1.leftWidth, p1.rightWidth, p1.fullWidth }):map(function(p2)
				-- upvalues: p1 (ref)
				local var2 = p1.computeCenteredSize(p2)
				
				return if math.abs(var2.X.Offset) <= p1.props.estimatedCenterWidth then p1.computeBumpedSize(p2) else var2
			end)
		}, {
			UIPadding = roactModule.createElement("UIPadding", {
				PaddingLeft = p1.props.renderLeft and UDim.new(0, 0) or UDim.new(0, p1.props.marginLeft),
				PaddingRight = p1.props.renderRight and UDim.new(0, 0) or UDim.new(0, p1.props.marginRight)
			}),
			["$layout"] = roactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			centerContent = p1.props.renderCenter(p1.props)
		}),
		rightFrame = p1.props.renderRight and roactModule.createElement(fitFrameModule.FitFrameHorizontal, {
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
			[roactModule.Change.AbsoluteSize] = function(p2)
				-- upvalues: p1 (ref)
				p1.updateRightWidth(p2.AbsoluteSize.X)
			end
		}, { rightContent = p1.props.renderRight(p1.props) })
	})
end

return threeSectionBar
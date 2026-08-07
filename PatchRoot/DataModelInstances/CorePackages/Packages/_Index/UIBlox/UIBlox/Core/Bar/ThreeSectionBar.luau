-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:01 2026 Pacific Standard Time.

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
	onWidthChange = function() --[[ line: 46 ]]
		return nil
	end
}

function threeSectionBar.init(p0) --[[ line: 55 ]]
	-- upvalues: roactModule (ref)
	local var5, var6 = roactModule.createBinding(0)
	p0.leftWidth = var5
	p0.updateLeftWidth = var6
	local var7, var8 = roactModule.createBinding(0)
	p0.rightWidth = var7
	p0.updateRightWidth = var8
	local var9, var10 = roactModule.createBinding(0)
	p0.fullWidth = var9
	p0.updateFullWidth = var10
	
	function p0.computeCenteredSize(p1) --[[ line: 60 ]]
		-- upvalues: p0 (ref)
		local maxValue = math.max(p1[1], p1[2])
		
		return if p0.props.renderLeft and p0.props.renderRight then UDim2.new(0, (Vector2.new(p1[3] / 2, 0) - Vector2.new(maxValue, 0)).magnitude * 2, 1, 0) else UDim2.new(1, -maxValue, 1, 0)
	end
	
	function p0.computeBumpedPosition(p2) --[[ line: 78 ]]
		local var12 = p2[1]
		
		return UDim2.new(0, var12 + (p2[3] - var12 - p2[2]) / 2, 0.5, 0)
	end
	
	function p0.computeBumpedSize(p3) --[[ line: 86 ]]
		return UDim2.new(1, (-p3[1]) - p3[2], 1, 0)
	end
end

function threeSectionBar.didUpdate(p4) --[[ line: 93 ]]
	if not p4.props.renderLeft then
		p4.updateLeftWidth(0)
	end
	if not p4.props.renderRight then
		p4.updateRightWidth(0)
	end
end

function threeSectionBar.render(p5) --[[ line: 104 ]]
	-- upvalues: roactModule (ref), fitFrameModule (ref), cryoModule (ref)
	local vector2 = Vector2.new(0.5, 0.5)
	local _ = nil
	local var14 = if not p5.props.renderLeft and p5.props.renderRight then if p5.props.renderLeft and not p5.props.renderRight then UDim2.fromScale(1, 0.5) else UDim2.fromScale(0.5, 0.5) else UDim2.fromScale(0, 0.5)
	
	return roactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, p5.props.barHeight),
		BackgroundColor3 = p5.props.BackgroundColor3,
		BackgroundTransparency = p5.props.BackgroundTransparency,
		BorderSizePixel = 0,
		AutomaticSize = if p5.props.automaticHeight then Enum.AutomaticSize.Y else nil,
		[roactModule.Change.AbsoluteSize] = function(p6) --[[ line: 123 ]]
			-- upvalues: p5 (ref)
			p5.props.onWidthChange(p6.AbsoluteSize.X)
			p5.updateFullWidth(p6.AbsoluteSize.X)
		end
	}, {
		leftFrame = p5.props.renderLeft and roactModule.createElement(fitFrameModule.FitFrameHorizontal, {
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromScale(0, 0),
			BackgroundTransparency = 1,
			minimumSize = UDim.new(0, 200),
			height = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			contentPadding = p5.props.contentPaddingLeft,
			margin = {
				top = 0,
				bottom = 0,
				left = p5.props.marginLeft,
				right = p5.props.sectionSpacing
			},
			[roactModule.Change.AbsoluteSize] = function(p7) --[[ line: 144 ]]
				-- upvalues: p5 (ref)
				p5.updateLeftWidth(p7.AbsoluteSize.X)
			end
		}, {
			leftContent = p5.props.renderLeft(cryoModule.Dictionary.join(p5.props, {
				[roactModule.Children] = {
					sizeConstraint = roactModule.createElement("UISizeConstraint", {
						MaxSize = roactModule.joinBindings({ p5.leftWidth, p5.rightWidth, p5.fullWidth }):map(function(p8) --[[ line: 153 ]]
							-- upvalues: p5 (ref)
							local _ = p8[1]
							
							return Vector2.new(math.max(0, p8[3] - p8[2] - p5.props.marginLeft), 1e999)
						end)
					})
				}
			}))
		}),
		centerFrame = p5.props.renderCenter and roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = vector2,
			Position = roactModule.joinBindings({ p5.leftWidth, p5.rightWidth, p5.fullWidth }):map(function(p9) --[[ line: 169 ]]
				-- upvalues: p5 (ref), var14 (write)
				return if math.abs(p5.computeCenteredSize(p9).X.Offset) <= p5.props.estimatedCenterWidth then p5.computeBumpedPosition(p9) else var14
			end),
			Size = roactModule.joinBindings({ p5.leftWidth, p5.rightWidth, p5.fullWidth }):map(function(p10) --[[ line: 178 ]]
				-- upvalues: p5 (ref)
				local var15 = p5.computeCenteredSize(p10)
				
				return if math.abs(var15.X.Offset) <= p5.props.estimatedCenterWidth then p5.computeBumpedSize(p10) else var15
			end)
		}, {
			UIPadding = roactModule.createElement("UIPadding", {
				PaddingLeft = p5.props.renderLeft and UDim.new(0, 0) or UDim.new(0, p5.props.marginLeft),
				PaddingRight = p5.props.renderRight and UDim.new(0, 0) or UDim.new(0, p5.props.marginRight)
			}),
			["$layout"] = roactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			centerContent = p5.props.renderCenter(p5.props)
		}),
		rightFrame = p5.props.renderRight and roactModule.createElement(fitFrameModule.FitFrameHorizontal, {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			BackgroundTransparency = 1,
			minimumSize = UDim.new(0, 200),
			height = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			contentPadding = p5.props.contentPaddingRight,
			margin = {
				top = 0,
				bottom = 0,
				left = p5.props.sectionSpacing,
				right = p5.props.marginRight
			},
			[roactModule.Change.AbsoluteSize] = function(p11) --[[ line: 216 ]]
				-- upvalues: p5 (ref)
				p5.updateRightWidth(p11.AbsoluteSize.X)
			end
		}, { rightContent = p5.props.renderRight(p5.props) })
	})
end

return threeSectionBar
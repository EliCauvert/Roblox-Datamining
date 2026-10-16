local Parent = script.Parent.Parent.Parent.Parent
local CryoModule = require(Parent.Cryo)
local RoactModule = require(Parent.Roact)
local TModule = require(Parent.t)
local GetPageMarginModule = require(script.Parent.getPageMargin)
local PageMargin = RoactModule.Component:extend("PageMargin")
PageMargin.validateProps = TModule.interface({
	anchorPoint = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.UDim2),
	backgroundColor3 = TModule.optional(TModule.Color3),
	backgroundTransparency = TModule.optional(TModule.number),
	layoutOrder = TModule.optional(TModule.number),
	size = TModule.optional(TModule.UDim2),
	useAutomaticSizing = TModule.optional(TModule.boolean),
	zIndex = TModule.optional(TModule.number)
})
PageMargin.defaultProps = {
	backgroundTransparency = 0,
	layoutOrder = 0,
	useAutomaticSizing = false,
	anchorPoint = Vector2.new(0, 0),
	position = UDim2.new(),
	size = UDim2.fromScale(1, 1)
}

function PageMargin.init(p1) --[[ Line: 41 ]]
	-- upvalues: RoactModule (copy), GetPageMarginModule (copy)
	p1.state = {}
	p1.ref = RoactModule.createRef()
	
	function p1.onResize(Frame) --[[ Line: 44 ]]
		-- upvalues: p1 (copy), GetPageMarginModule (upval)
		if p1.mounted then
			local X = Frame.AbsoluteSize.X
			p1:setState(function(p2) --[[ Line: 47 ]]
				-- upvalues: GetPageMarginModule (upval), X (copy)
				local PageMarginModule = GetPageMarginModule(X)
				
				return if p2.margin == PageMarginModule then nil else { margin = PageMarginModule }
			end)
		end
	end
end

function PageMargin.render(p1) --[[ Line: 61 ]]
	-- upvalues: RoactModule (copy), CryoModule (copy)
	return RoactModule.createElement("Frame", {
		AnchorPoint = p1.props.anchorPoint,
		AutomaticSize = p1.props.useAutomaticSizing and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
		BackgroundColor3 = p1.props.backgroundColor3,
		BackgroundTransparency = p1.props.backgroundTransparency,
		BorderSizePixel = 0,
		Position = p1.props.position,
		Size = p1.props.size,
		[RoactModule.Change.AbsoluteSize] = p1.onResize,
		[RoactModule.Ref] = p1.ref,
		LayoutOrder = p1.props.layoutOrder,
		ZIndex = p1.props.zIndex
	}, CryoModule.Dictionary.join(p1.props[RoactModule.Children], {
		padding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p1.state.margin),
			PaddingRight = UDim.new(0, p1.state.margin)
		})
	}))
end

function PageMargin.didMount(p1) --[[ Line: 86 ]]
	p1.mounted = true
	
	if p1.ref.current then
		p1.onResize(p1.ref.current)
	end
end

function PageMargin.willUnmount(p1) --[[ Line: 93 ]]
	p1.mounted = false
end

return PageMargin
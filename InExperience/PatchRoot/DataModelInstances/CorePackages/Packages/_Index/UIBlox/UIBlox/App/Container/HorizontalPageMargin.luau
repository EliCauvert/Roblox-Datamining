local parent = script.Parent.Parent.Parent.Parent
local cryoModule = require(parent.Cryo)
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
local getPageMarginModule = require(script.Parent.getPageMargin)
local pageMargin = roactModule.Component:extend("PageMargin")
pageMargin.validateProps = tModule.interface({
	anchorPoint = tModule.optional(tModule.Vector2),
	position = tModule.optional(tModule.UDim2),
	backgroundColor3 = tModule.optional(tModule.Color3),
	backgroundTransparency = tModule.optional(tModule.number),
	layoutOrder = tModule.optional(tModule.number),
	size = tModule.optional(tModule.UDim2),
	useAutomaticSizing = tModule.optional(tModule.boolean),
	zIndex = tModule.optional(tModule.number)
})
pageMargin.defaultProps = {
	backgroundTransparency = 0,
	layoutOrder = 0,
	useAutomaticSizing = false,
	anchorPoint = Vector2.new(0, 0),
	position = UDim2.new(),
	size = UDim2.fromScale(1, 1)
}

function pageMargin.init(p0)
	-- upvalues: roactModule (ref), getPageMarginModule (ref)
	p0.state = {}
	p0.ref = roactModule.createRef()
	
	function p0.onResize(p1)
		-- upvalues: p0 (ref), getPageMarginModule (copy)
		if p0.mounted then
			local x = p1.AbsoluteSize.X
			p0:setState(function(p2)
				-- upvalues: getPageMarginModule (copy), x (ref)
				local var5 = getPageMarginModule(x)
				
				return if p2.margin == var5 then nil else { margin = var5 }
			end)
		end
	end
end

function pageMargin.render(p3)
	-- upvalues: roactModule (ref), cryoModule (ref)
	return roactModule.createElement("Frame", {
		AnchorPoint = p3.props.anchorPoint,
		AutomaticSize = if p3.props.useAutomaticSizing then Enum.AutomaticSize.Y else Enum.AutomaticSize.None,
		BackgroundColor3 = p3.props.backgroundColor3,
		BackgroundTransparency = p3.props.backgroundTransparency,
		BorderSizePixel = 0,
		Position = p3.props.position,
		Size = p3.props.size,
		[roactModule.Change.AbsoluteSize] = p3.onResize,
		[roactModule.Ref] = p3.ref,
		LayoutOrder = p3.props.layoutOrder,
		ZIndex = p3.props.zIndex
	}, cryoModule.Dictionary.join(p3.props[roactModule.Children], {
		padding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p3.state.margin),
			PaddingRight = UDim.new(0, p3.state.margin)
		})
	}))
end

function pageMargin.didMount(p4)
	p4.mounted = true
	
	if p4.ref.current then
		p4.onResize(p4.ref.current)
	end
end

function pageMargin.willUnmount(p5)
	p5.mounted = false
end

return pageMargin
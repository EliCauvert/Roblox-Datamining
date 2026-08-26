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

function pageMargin.init(p1)
	-- upvalues: roactModule (ref), getPageMarginModule (ref)
	p1.state = {}
	p1.ref = roactModule.createRef()
	
	function p0.onResize(p2)
		-- upvalues: p1 (ref), getPageMarginModule (copy)
		if p1.mounted then
			local x = p2.AbsoluteSize.X
			p1:setState(function(p3)
				-- upvalues: getPageMarginModule (copy), x (ref)
				local var1 = getPageMarginModule(x)
				
				return if p3.margin == var1 then nil else { margin = var1 }
			end)
		end
	end
end

function pageMargin.render(p1)
	-- upvalues: roactModule (ref), cryoModule (ref)
	return roactModule.createElement("Frame", {
		AnchorPoint = p1.props.anchorPoint,
		AutomaticSize = if p1.props.useAutomaticSizing then Enum.AutomaticSize.Y else Enum.AutomaticSize.None,
		BackgroundColor3 = p1.props.backgroundColor3,
		BackgroundTransparency = p1.props.backgroundTransparency,
		BorderSizePixel = 0,
		Position = p1.props.position,
		Size = p1.props.size,
		[roactModule.Change.AbsoluteSize] = p1.onResize,
		[roactModule.Ref] = p1.ref,
		LayoutOrder = p1.props.layoutOrder,
		ZIndex = p1.props.zIndex
	}, cryoModule.Dictionary.join(p1.props[roactModule.Children], {
		padding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p1.state.margin),
			PaddingRight = UDim.new(0, p1.state.margin)
		})
	}))
end

function pageMargin.didMount(p1)
	p1.mounted = true
	
	if p1.ref.current then
		p1.onResize(p1.ref.current)
	end
end

function pageMargin.willUnmount(p1)
	p1.mounted = false
end

return pageMargin
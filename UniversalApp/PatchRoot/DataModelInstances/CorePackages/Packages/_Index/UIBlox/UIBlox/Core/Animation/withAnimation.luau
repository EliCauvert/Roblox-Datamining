local parent = script.Parent.Parent.Parent.Parent
local roactModule = require(parent.Roact)
local otterModule = require(parent.Otter)
local tModule = require(parent.t)
local animatedComponent = roactModule.PureComponent:extend("AnimatedComponent")
animatedComponent.validateProps = tModule.strictInterface({
	values = tModule.table,
	render = tModule.callback,
	options = tModule.optional(tModule.table)
})

function animatedComponent.update(p1, p2)
	-- upvalues: roactModule (ref)
	local t = {}
	
	for i, v in pairs(p2) do
		if type(i) == "function" then
			i(v)
		else
			t[i] = v
		end
	end
	for i_1, v_1 in pairs(p1.state) do
		if not p2[i_1] then
			t[i_1] = roactModule.None
		end
	end
	if next(t) ~= nil then
		p1:setState(t)
	end
end

function animatedComponent.init(p3)
	-- upvalues: otterModule (ref)
	p3:update(p3.props.values)
	p3.motor = otterModule.createGroupMotor(p3.props.values)
	p3.motor:onStep(function(p4)
		-- upvalues: p3 (ref)
		p3:update(p4)
	end)
end

function animatedComponent.didUpdate(p3, p4)
	-- upvalues: otterModule (ref)
	local values = p3.props.values
	local options = p3.props.options
	
	if values ~= p4.values or options ~= p4.options then
		local t = {}
		
		for i, v in pairs(values) do
			t[i] = otterModule.spring(v, options)
		end
		p3.motor:setGoal(t)
	end
end

function animatedComponent.render(p5)
	return p5.props.render(p5.state)
end

function animatedComponent.willUnmount(p5)
	if p5.motor then
		p5.motor:destroy()
		p5.motor = nil
	end
end

return function(p5, p6, p7)
	-- upvalues: roactModule (ref), animatedComponent (ref)
	return roactModule.createElement(animatedComponent, { values = p5, options = p7, render = p6 })
end
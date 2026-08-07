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

function animatedComponent.update(p0, p1) --[[ line: 37 ]]
	-- upvalues: roactModule (ref)
	local t = {}
	
	for i, v in pairs(p1) do
		if type(i) == "function" then
			i(v)
		else
			t[i] = v
		end
	end
	for i_1, v_1 in pairs(p0.state) do
		if not p1[i_1] then
			t[i_1] = roactModule.None
		end
	end
	if next(t) ~= nil then
		p0:setState(t)
	end
end

function animatedComponent.init(p2) --[[ line: 56 ]]
	-- upvalues: otterModule (ref)
	p2:update(p2.props.values)
	p2.motor = otterModule.createGroupMotor(p2.props.values)
	p2.motor:onStep(function(p3) --[[ line: 59 ]]
		-- upvalues: p2 (ref)
		p2:update(p3)
	end)
end

function animatedComponent.didUpdate(p4, p5) --[[ line: 64 ]]
	-- upvalues: otterModule (ref)
	local values = p4.props.values
	local options = p4.props.options
	
	if values ~= p5.values or options ~= p5.options then
		local t = {}
		
		for i, v in pairs(values) do
			t[i] = otterModule.spring(v, options)
		end
		p4.motor:setGoal(t)
	end
end

function animatedComponent.render(p6) --[[ line: 80 ]]
	return p6.props.render(p6.state)
end

function animatedComponent.willUnmount(p7) --[[ line: 85 ]]
	if p7.motor then
		p7.motor:destroy()
		p7.motor = nil
	end
end

return function(p8, p9, p10) --[[ line: 92 ]]
	-- upvalues: roactModule (ref), animatedComponent (ref)
	return roactModule.createElement(animatedComponent, { values = p8, options = p10, render = p9 })
end
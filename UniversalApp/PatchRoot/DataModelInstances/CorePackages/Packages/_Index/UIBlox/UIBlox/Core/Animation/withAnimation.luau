local Parent = script.Parent.Parent.Parent.Parent
local RoactModule = require(Parent.Roact)
local OtterModule = require(Parent.Otter)
local TModule = require(Parent.t)
local AnimatedComponent = RoactModule.PureComponent:extend("AnimatedComponent")
AnimatedComponent.validateProps = TModule.strictInterface({
	values = TModule.table,
	render = TModule.callback,
	options = TModule.optional(TModule.table)
})

function AnimatedComponent.update(p1, Values) --[[ Line: 37 ]]
	-- upvalues: RoactModule (copy)
	local Nones = {}
	
	for i, value in pairs(Values) do
		if type(i) == "function" then
			i(value)
		else
			Nones[i] = value
		end
	end
	for i1, _ in pairs(p1.state) do
		if not Values[i1] then
			Nones[i1] = RoactModule.None
		end
	end
	if next(Nones) ~= nil then
		p1:setState(Nones)
	end
end

function AnimatedComponent.init(p2) --[[ Line: 56 ]]
	-- upvalues: OtterModule (copy)
	p2:update(p2.props.values)
	p2.motor = OtterModule.createGroupMotor(p2.props.values)
	p2.motor:onStep(function(p3) --[[ Line: 59 ]]
		-- upvalues: p2 (copy)
		p2:update(p3)
	end)
end

function AnimatedComponent.didUpdate(p2, p3) --[[ Line: 64 ]]
	-- upvalues: OtterModule (copy)
	local Values = p2.props.values
	local Options = p2.props.options
	local IsNotOptionsMatch = Options ~= p3.options
	
	if Values ~= p3.values or IsNotOptionsMatch then
		local SpringResults = {}
		
		for i, value in pairs(Values) do
			SpringResults[i] = OtterModule.spring(value, Options)
		end
		p2.motor:setGoal(SpringResults)
	end
end

function AnimatedComponent.render(p4) --[[ Line: 80 ]]
	return p4.props.render(p4.state)
end

function AnimatedComponent.willUnmount(p4) --[[ Line: 85 ]]
	if p4.motor then
		p4.motor:destroy()
		p4.motor = nil
	end
end

return function(Values, Render, Options) --[[ Line: 92 ]]
	-- upvalues: RoactModule (copy), AnimatedComponent (copy)
	return RoactModule.createElement(AnimatedComponent, { values = Values, options = Options, render = Render })
end
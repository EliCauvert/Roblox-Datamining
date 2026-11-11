local StepSpringModule = require(script.Parent.stepSpring)
local MergeModule = require(script.Parent.merge)
local ConfigModule = require(script.Parent.Config)
local MotionTypeModule = require(script.Parent.MotionType)
local MotionSpecifierModule = require(script.Parent.MotionSpecifier)
local SimpleMotion = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact).Component:extend("SimpleMotion")
local t = {}
game:GetService("RunService").RenderStepped:Connect(function(DeltaTime)
	-- upvalues: t (copy)
	for i in pairs(t) do
		i(DeltaTime)
	end
end)

function SimpleMotion.init(p1)
	-- upvalues: MotionSpecifierModule (copy)
	local Values = {}
	local Velocities = {}
	
	for i, value in pairs(p1.props.style) do
		Velocities[i] = 0
		Values[i] = MotionSpecifierModule.extractValue(value)
	end
	if p1.props.defaultStyle then
		for i1, value1 in pairs(p1.props.defaultStyle) do
			Values[i1] = value1
		end
	end
	p1.resting = false
	p1.wasResting = true
	p1.accumulator = 0
	p1.state = { values = Values, velocities = Velocities }
end

function SimpleMotion.render(p2)
	return p2.props.render(p2.state.values)
end

function SimpleMotion.update(p2, p3: number)
	-- upvalues: MergeModule (copy), ConfigModule (copy), MotionSpecifierModule (copy), MotionTypeModule (copy), StepSpringModule (copy)
	if p2.resting then return end
	local MergeModuleResult = MergeModule(p2.state.values)
	local MergeModuleResult1 = MergeModule(p2.state.velocities)
	local Flag = false
	p2.accumulator += p3 % ConfigModule.MAX_ACCUMULATION
	while ConfigModule.UPDATE_RATE <= p2.accumulator do
		p2.accumulator -= ConfigModule.UPDATE_RATE
		local Flag1 = true
		
		for i, value in pairs(p2.props.style) do
			local Type = MotionSpecifierModule.getType(value)
			local v1 = nil
			local Velocity: number? = nil
			
			if Type == MotionTypeModule.Instant then
				v1 = value
				Velocity = 0
				p2.wasResting = false
			elseif Type == MotionTypeModule.Spring then
				v1, Velocity = StepSpringModule(ConfigModule.UPDATE_RATE * ConfigModule.TIME_FACTOR, MergeModuleResult[i], MergeModuleResult1[i], value.value, value.stiffness, value.damping, value.precision)
			else
				error(("Unsupported MotionType %q"):format(Type))
			end
			MergeModuleResult[i] = v1
			MergeModuleResult1[i] = Velocity
			
			if v1 ~= p2.state.values[i] or Velocity ~= p2.state.velocities[i] then
				Flag = true
			end
			if v1 ~= MotionSpecifierModule.extractValue(value) or Velocity ~= 0 then
				Flag1 = false
			end
		end
		if not Flag1 then continue end
		p2.resting = true
		p2.accumulator = 0
		break
	end
	if Flag then
		p2:setState({
			values = MergeModuleResult,
			velocities = MergeModuleResult1
		})
	end
	if not p2.wasResting and p2.resting and p2.props.onRested then
		p2.props.onRested()
	end
	p2.wasResting = p2.resting
end

function SimpleMotion.didMount(p4)
	-- upvalues: t (copy)
	function p4.renderCallback(p5)
		-- upvalues: p4 (copy)
		p4:update(p5)
	end
	
	t[p4.renderCallback] = true
end

function SimpleMotion.willUnmount(p4)
	-- upvalues: t (copy)
	t[p4.renderCallback] = nil
end

function SimpleMotion.didUpdate(p4, Props)
	if Props ~= p4.props then
		p4.resting = false
		
		return
	end
end

return SimpleMotion
local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local SignalsModule = require(Parent.Signals)
local OtterModule = require(Parent.Otter)
local config = {
	dampingRatio = 1,
	frequency = 3,
	restingVelocityLimit = 0.1,
	restingPositionLimit = 0.1
}

return function(p1)
	-- upvalues: SignalsModule (copy), OtterModule (copy), config (copy)
	local P0 = p1 or 1
	local Signal, Signal2 = SignalsModule.createSignal(P0)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Signal3, Signal2_2 = SignalsModule.createSignal(P0 > 0.5)
	local SingleMotor = OtterModule.createSingleMotor(P0)
	SingleMotor:onStep(function(p2)
		-- upvalues: Signal2 (copy)
		Signal2(p2)
	end)
	SingleMotor:onComplete(function()
		-- upvalues: Signal2_1 (copy)
		Signal2_1(false)
	end)
	
	return {
		getVisibilityRatio = Signal,
		getIsVisible = Signal3,
		getIsAnimating = Signal1,
		show = function()
			-- upvalues: Signal2_2 (copy), Signal2_1 (copy), SingleMotor (copy), OtterModule (upval), config (copy)
			Signal2_2(true)
			Signal2_1(true)
			SingleMotor:setGoal(OtterModule.spring(1, config))
		end,
		hide = function()
			-- upvalues: Signal2_2 (copy), Signal2_1 (copy), SingleMotor (copy), OtterModule (upval), config (copy)
			Signal2_2(false)
			Signal2_1(true)
			SingleMotor:setGoal(OtterModule.spring(0, config))
		end,
		destroy = function()
			-- upvalues: SingleMotor (copy)
			SingleMotor:destroy()
		end
	}
end
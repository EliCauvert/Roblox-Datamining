local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local signalsModule = require(parent.Signals)
local otterModule = require(parent.Otter)
local t = {
	dampingRatio = 1,
	frequency = 3,
	restingVelocityLimit = 0.1,
	restingPositionLimit = 0.1
}

return function(p1)
	-- upvalues: signalsModule (ref), otterModule (ref), t (ref)
	p1 = p1 or 1
	local var1, var2 = signalsModule.createSignal(p1)
	local var3, var4 = signalsModule.createSignal(false)
	local var5, var6 = signalsModule.createSignal(p1 > 0.5)
	local var7 = otterModule.createSingleMotor(p1)
	var7:onStep(function(p2)
		-- upvalues: var2 (ref)
		var2(p2)
	end)
	var7:onComplete(function()
		-- upvalues: var4 (ref)
		var4(false)
	end)
	
	return {
		getVisibilityRatio = var1,
		getIsVisible = var5,
		getIsAnimating = var3,
		show = function()
			-- upvalues: var6 (ref), var4 (ref), var7 (ref), otterModule (copy), t (ref)
			var6(true)
			var4(true)
			var7:setGoal(otterModule.spring(1, t))
		end,
		hide = function()
			-- upvalues: var6 (ref), var4 (ref), var7 (ref), otterModule (copy), t (ref)
			var6(false)
			var4(true)
			var7:setGoal(otterModule.spring(0, t))
		end,
		destroy = function()
			-- upvalues: var7 (ref)
			var7:destroy()
		end
	}
end
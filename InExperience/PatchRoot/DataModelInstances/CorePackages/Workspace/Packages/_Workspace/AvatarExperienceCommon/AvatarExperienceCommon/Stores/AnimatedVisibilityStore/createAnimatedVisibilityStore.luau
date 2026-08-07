local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local signalsModule = require(parent.Signals)
local otterModule = require(parent.Otter)
local t = {
	dampingRatio = 1,
	frequency = 3,
	restingVelocityLimit = 0.1,
	restingPositionLimit = 0.1
}

return function(p0) --[[ line: 38 | named "createAnimatedVisibilityStore" ]]
	-- upvalues: signalsModule (ref), otterModule (ref), t (ref)
	p0 = p0 or 1
	local var4, var5 = signalsModule.createSignal(p0)
	local var6, var7 = signalsModule.createSignal(false)
	local var8, var9 = signalsModule.createSignal(p0 > 0.5)
	local var10 = otterModule.createSingleMotor(p0)
	var10:onStep(function(p1) --[[ line: 51 ]]
		-- upvalues: var5 (ref)
		var5(p1)
	end)
	var10:onComplete(function() --[[ line: 55 ]]
		-- upvalues: var7 (ref)
		var7(false)
	end)
	
	return {
		getVisibilityRatio = var4,
		getIsVisible = var8,
		getIsAnimating = var6,
		show = function() --[[ line: 60 ]]
			-- upvalues: var9 (ref), var7 (ref), var10 (ref), otterModule (copy), t (ref)
			var9(true)
			var7(true)
			var10:setGoal(otterModule.spring(1, t))
		end,
		hide = function() --[[ line: 67 ]]
			-- upvalues: var9 (ref), var7 (ref), var10 (ref), otterModule (copy), t (ref)
			var9(false)
			var7(true)
			var10:setGoal(otterModule.spring(0, t))
		end,
		destroy = function() --[[ line: 73 ]]
			-- upvalues: var10 (ref)
			var10:destroy()
		end
	}
end
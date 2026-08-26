local parent = script:FindFirstAncestor("VrSpatialUi").Parent
local otterModule = require(parent.Otter)
local _ = require(parent.Observable)

local var1 = function() end

local t = {
	Default = { dampingRatio = 1, frequency = 4.5 },
	Slower = { dampingRatio = 1, frequency = 0.66 }
}
local t_1 = {}
t_1.__index = t_1

function t_1.checkIfAnimateNeeded(p1, p2)
	return p2 ~= p1._currentGoal
end

function t_1.hideAndBlockAnimationUntilLookBackAgain(p1)
	p1._ignoreAnimateShow = true
	p1:animateHideIfNeeded(true)
end

function t_1.animateHideIfNeeded(p1, p2)
	-- upvalues: var1 (ref), t (ref)
	if not p2 then
		p1._ignoreAnimateShow = false
	end
	if p1:checkIfAnimateNeeded(1) and (not p1._pendingHideAnimation or p1._pendingHideAnimation == var1) then
		p1._currentGoal = 1
		p1:animateToGoal(p1._currentGoal, t.Slower)
		
		return
	end
end

function t_1.animateShowIfNeeded(p1)
	-- upvalues: t (ref), var1 (ref)
	if p1:checkIfAnimateNeeded(0) and not p1._ignoreAnimateShow then
		p1:cancelPendingTaskIfNeeded()
		p1._currentGoal = 0
		p1:animateToGoal(p1._currentGoal, t.Default)
		local pendingHideAnimation = nil
		
		function p5._pendingHideAnimation()
			-- upvalues: p1 (ref), pendingHideAnimation (write), var1 (copy), t (copy)
			if p1._pendingHideAnimation == pendingHideAnimation then
				p1._pendingHideAnimation = var1
				p1:animateToGoal(1, t.Slower)
			end
		end
		
		pendingHideAnimation = p1._pendingHideAnimation
		task.delay(3, p1._pendingHideAnimation)
		
		return
	end
end

function t_1.animateToGoal(p1, p2, p3)
	-- upvalues: otterModule (ref)
	p1._fadeTransparencyMotor:stop()
	p1._fadeTransparencyMotor:setGoal(otterModule.spring(p2, p3))
end

function t_1.isTargetVisible(p1)
	return p1._targetInstance.GroupTransparency == 0
end

function t_1.reset(value)
	value._fadeTransparencyMotor:stop()
	value:cancelPendingTaskIfNeeded()
	value._ignoreAnimateShow = false
	value._currentGoal = -1
	value._targetInstance.GroupTransparency = 0
	value._visibilityObservable:set(true)
end

function t_1.cancelPendingTaskIfNeeded(p1)
	-- upvalues: var1 (ref)
	p1._pendingHideAnimation = var1
end

function t_1.create(p1, p2)
	-- upvalues: otterModule (ref), var1 (ref), t_1 (ref)
	local var2 = nil
	
	for i, v in ipairs(p1:GetDescendants()) do
		if v.Name == "AnimatablePanelManagedContent" then
			var2 = v
			break
		end
	end
	if var2 == nil then
		return nil
	end
	p2:set(var2.GroupTransparency == 0)
	local var3 = otterModule.createSingleMotor(0)
	var3:onStep(function(p3)
		-- upvalues: var2 (write), p2 (ref)
		var2.GroupTransparency = p3
		p2:set(var2.GroupTransparency == 0)
	end)
	local t = {
		_currentGoal = -1,
		_ignoreAnimateShow = false,
		_targetInstance = var2,
		_fadeTransparencyMotor = var3,
		_pendingHideAnimation = var1,
		_visibilityObservable = p2
	}
	setmetatable(t, t_1)
	
	return t
end

return t_1
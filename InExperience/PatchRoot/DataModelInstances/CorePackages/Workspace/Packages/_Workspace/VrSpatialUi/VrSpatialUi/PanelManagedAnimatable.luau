local parent = script:FindFirstAncestor("VrSpatialUi").Parent
local otterModule = require(parent.Otter)
local _ = require(parent.Observable)

local var1 = function() --[[ line: 8 ]] end

local t = {
	Default = { dampingRatio = 1, frequency = 4.5 },
	Slower = { dampingRatio = 1, frequency = 0.66 }
}
local t_1 = {}
t_1.__index = t_1

function t_1.checkIfAnimateNeeded(p0, p1) --[[ line: 36 ]]
	return p1 ~= p0._currentGoal
end

function t_1.hideAndBlockAnimationUntilLookBackAgain(p2) --[[ line: 43 ]]
	p2._ignoreAnimateShow = true
	p2:animateHideIfNeeded(true)
end

function t_1.animateHideIfNeeded(p3, p4) --[[ line: 48 ]]
	-- upvalues: var1 (ref), t (ref)
	if not p4 then
		p3._ignoreAnimateShow = false
	end
	if p3:checkIfAnimateNeeded(1) and (not p3._pendingHideAnimation or p3._pendingHideAnimation == var1) then
		p3._currentGoal = 1
		p3:animateToGoal(p3._currentGoal, t.Slower)
		
		return
	end
end

function t_1.animateShowIfNeeded(p5) --[[ line: 59 ]]
	-- upvalues: t (ref), var1 (ref)
	if p5:checkIfAnimateNeeded(0) and not p5._ignoreAnimateShow then
		p5:cancelPendingTaskIfNeeded()
		p5._currentGoal = 0
		p5:animateToGoal(p5._currentGoal, t.Default)
		local pendingHideAnimation = nil
		
		function p5._pendingHideAnimation() --[[ line: 68 ]]
			-- upvalues: p5 (ref), pendingHideAnimation (write), var1 (copy), t (copy)
			if p5._pendingHideAnimation == pendingHideAnimation then
				p5._pendingHideAnimation = var1
				p5:animateToGoal(1, t.Slower)
			end
		end
		
		pendingHideAnimation = p5._pendingHideAnimation
		task.delay(3, p5._pendingHideAnimation)
		
		return
	end
end

function t_1.animateToGoal(p6, p7, p8) --[[ line: 78 ]]
	-- upvalues: otterModule (ref)
	p6._fadeTransparencyMotor:stop()
	p6._fadeTransparencyMotor:setGoal(otterModule.spring(p7, p8))
end

function t_1.isTargetVisible(p9) --[[ line: 83 ]]
	return p9._targetInstance.GroupTransparency == 0
end

function t_1.reset(value) --[[ line: 87 ]]
	value._fadeTransparencyMotor:stop()
	value:cancelPendingTaskIfNeeded()
	value._ignoreAnimateShow = false
	value._currentGoal = -1
	value._targetInstance.GroupTransparency = 0
	value._visibilityObservable:set(true)
end

function t_1.cancelPendingTaskIfNeeded(p10) --[[ line: 96 ]]
	-- upvalues: var1 (ref)
	p10._pendingHideAnimation = var1
end

function t_1.create(p11, p12) --[[ line: 100 ]]
	-- upvalues: otterModule (ref), var1 (ref), t_1 (ref)
	local var4 = nil
	
	for i, v in ipairs(p11:GetDescendants()) do
		if v.Name == "AnimatablePanelManagedContent" then
			var4 = v
			break
		end
	end
	if var4 == nil then
		return nil
	end
	p12:set(var4.GroupTransparency == 0)
	local var5 = otterModule.createSingleMotor(0)
	var5:onStep(function(p13) --[[ line: 116 ]]
		-- upvalues: var4 (write), p12 (ref)
		var4.GroupTransparency = p13
		p12:set(var4.GroupTransparency == 0)
	end)
	local t = {
		_currentGoal = -1,
		_ignoreAnimateShow = false,
		_targetInstance = var4,
		_fadeTransparencyMotor = var5,
		_pendingHideAnimation = var1,
		_visibilityObservable = p12
	}
	setmetatable(t, t_1)
	
	return t
end

return t_1
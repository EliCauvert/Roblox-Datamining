local Parent = script:FindFirstAncestor("VrSpatialUi").Parent
local OtterModule = require(Parent.Otter)
local _ = require(Parent.Observable)

local function _pendingHideAnimation() end

local config = {
	Default = { dampingRatio = 1, frequency = 4.5 },
	Slower = { dampingRatio = 1, frequency = 0.66 }
}
local PanelManagedAnimatableModule = {}
PanelManagedAnimatableModule.__index = PanelManagedAnimatableModule

function PanelManagedAnimatableModule.checkIfAnimateNeeded(p1, CurrentGoal): boolean
	return CurrentGoal ~= p1._currentGoal
end

function PanelManagedAnimatableModule.hideAndBlockAnimationUntilLookBackAgain(p1)
	p1._ignoreAnimateShow = true
	p1:animateHideIfNeeded(true)
end

function PanelManagedAnimatableModule.animateHideIfNeeded(p1, p2)
	-- upvalues: _pendingHideAnimation (copy), config (copy)
	if not p2 then
		p1._ignoreAnimateShow = false
	end
	if p1:checkIfAnimateNeeded(1) and (not p1._pendingHideAnimation or p1._pendingHideAnimation == _pendingHideAnimation) then
		p1._currentGoal = 1
		p1:animateToGoal(p1._currentGoal, config.Slower)
		
		return
	end
end

function PanelManagedAnimatableModule.animateShowIfNeeded(p1)
	-- upvalues: config (copy), _pendingHideAnimation (copy)
	if p1:checkIfAnimateNeeded(0) and not p1._ignoreAnimateShow then
		p1:cancelPendingTaskIfNeeded()
		p1._currentGoal = 0
		p1:animateToGoal(p1._currentGoal, config.Default)
		local PendingHideAnimation = nil
		
		function p1._pendingHideAnimation()
			-- upvalues: p1 (copy), PendingHideAnimation (ref), _pendingHideAnimation (upval), config (upval)
			if p1._pendingHideAnimation == PendingHideAnimation then
				p1._pendingHideAnimation = _pendingHideAnimation
				p1:animateToGoal(1, config.Slower)
			end
		end
		
		PendingHideAnimation = p1._pendingHideAnimation
		task.delay(3, p1._pendingHideAnimation)
		
		return
	end
end

function PanelManagedAnimatableModule.animateToGoal(p1, CurrentGoal, Slower)
	-- upvalues: OtterModule (copy)
	p1._fadeTransparencyMotor:stop()
	p1._fadeTransparencyMotor:setGoal(OtterModule.spring(CurrentGoal, Slower))
end

function PanelManagedAnimatableModule.isTargetVisible(p1): boolean
	return p1._targetInstance.GroupTransparency == 0
end

function PanelManagedAnimatableModule.reset(p1)
	p1._fadeTransparencyMotor:stop()
	p1:cancelPendingTaskIfNeeded()
	p1._ignoreAnimateShow = false
	p1._currentGoal = -1
	p1._targetInstance.GroupTransparency = 0
	p1._visibilityObservable:set(true)
end

function PanelManagedAnimatableModule.cancelPendingTaskIfNeeded(p1)
	-- upvalues: _pendingHideAnimation (copy)
	p1._pendingHideAnimation = _pendingHideAnimation
end

function PanelManagedAnimatableModule.create(Object, _visibilityObservable)
	-- upvalues: OtterModule (copy), _pendingHideAnimation (copy), PanelManagedAnimatableModule (copy)
	local _targetInstance = nil
	
	for _, descendant in ipairs(Object:GetDescendants()) do
		if descendant.Name == "AnimatablePanelManagedContent" then
			_targetInstance = descendant
			break
		end
	end
	if _targetInstance == nil then
		return nil
	else
		_visibilityObservable:set(_targetInstance.GroupTransparency == 0)
		local SingleMotor = OtterModule.createSingleMotor(0)
		SingleMotor:onStep(function(GroupTransparency)
			-- upvalues: _targetInstance (ref), _visibilityObservable (copy)
			_targetInstance.GroupTransparency = GroupTransparency
			_visibilityObservable:set(_targetInstance.GroupTransparency == 0)
		end)
		local config = {
			_currentGoal = -1,
			_ignoreAnimateShow = false,
			_targetInstance = _targetInstance,
			_fadeTransparencyMotor = SingleMotor,
			_pendingHideAnimation = _pendingHideAnimation,
			_visibilityObservable = _visibilityObservable
		}
		setmetatable(config, PanelManagedAnimatableModule)
		
		return config
	end
end

return PanelManagedAnimatableModule
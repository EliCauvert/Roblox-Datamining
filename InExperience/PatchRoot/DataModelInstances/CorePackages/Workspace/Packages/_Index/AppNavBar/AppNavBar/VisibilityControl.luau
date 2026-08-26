local userInputService = game:GetService("UserInputService")
local parent = script.Parent.Parent
local reactModule = require(parent.React)
local otterModule = require(parent.Otter)
local sharedFlagsModule = require(parent.SharedFlags)
local appIaScrollAwayIgnoreHorizontal = game:DefineFastFlag("AppIaScrollAwayIgnoreHorizontal", false)
local appIaScrollAwayThreshold = game:DefineFastInt("AppIaScrollAwayThreshold", 10)
local fFlagAppIaScrollAwayPinHeader = sharedFlagsModule.FFlagAppIaScrollAwayPinHeader
local fFlagAppIaScopedScrollAway = sharedFlagsModule.FFlagAppIaScopedScrollAway
local fFlagEnableScrollAwayContentScrollableFix = sharedFlagsModule.FFlagEnableScrollAwayContentScrollableFix
local t = {
	dampingRatio = 1,
	frequency = 3,
	restingVelocityLimit = 0.1,
	restingPositionLimit = 0.1
}
local t_1 = { binding = nil, motor = nil }
t_1.__index = t_1

function t_1.create(p1)
	-- upvalues: reactModule (ref), otterModule (ref), t_1 (ref)
	local var1, var2 = reactModule.createBinding(p1)
	local var3 = otterModule.createSingleMotor(p1)
	var3:onStep(var2)
	local t = { binding = var1, motor = var3 }
	setmetatable(t, t_1)
	
	return t
end

function t_1.destroy(p1)
	p1.motor:destroy()
end

function t_1.getBinding(p1)
	return p1.binding
end

function t_1.show(p1)
	-- upvalues: otterModule (ref), t (ref)
	p1.motor:setGoal(otterModule.spring(1, t))
end

function t_1.hide(p1)
	-- upvalues: otterModule (ref), t (ref)
	p1.motor:setGoal(otterModule.spring(0, t))
end

function t_1.update(p1, p2)
	-- upvalues: otterModule (ref)
	p1.motor:setGoal(otterModule.instant(math.clamp(p1.binding:getValue() + p2, 0, 1)))
end

function t_1.finishUp(p1)
	if p1.binding:getValue() < 0.5 then
		p1:hide()
		
		return
	end
	p1:show()
end

local t_2 = {
	enabled = false,
	header = nil,
	footer = nil,
	footerVisible = false,
	connections = nil,
	touching = false,
	moving = false,
	touchPositionX = 0,
	touchPositionY = 0,
	horizontalLocked = false,
	scrollDistance = 50,
	contentScrollable = true,
	headerScrollAwayDisabled = if fFlagAppIaScrollAwayPinHeader then false else nil,
	globalTouchDisabled = if fFlagAppIaScopedScrollAway then false else nil
}
t_2.__index = t_2
local var1 = nil

function t_2.onTouchMoved(p1, p2)
	-- upvalues: fFlagEnableScrollAwayContentScrollableFix (ref), fFlagAppIaScrollAwayPinHeader (ref)
	if fFlagEnableScrollAwayContentScrollableFix and not p1.contentScrollable then return end
	local var2 = p2 / p1.scrollDistance
	
	if p1.footerVisible then
		p1.footer:update(var2)
	end
	if fFlagAppIaScrollAwayPinHeader then
		if p1.headerScrollAwayDisabled then
			return
		else
			p1.header:update(var2)
			
			return
		end
	else
		p1.header:update(var2)
	end
end

function t_2.onTouchEnded(p1)
	-- upvalues: fFlagAppIaScrollAwayPinHeader (ref)
	if p1.footerVisible then
		p1.footer:finishUp()
	end
	if fFlagAppIaScrollAwayPinHeader then
		if p1.headerScrollAwayDisabled then
			return
		else
			p1.header:finishUp()
			
			return
		end
	else
		p1.header:finishUp()
	end
end

function t_2.connectTouch(p1)
	-- upvalues: userInputService (ref), appIaScrollAwayIgnoreHorizontal (ref), appIaScrollAwayThreshold (ref)
	if p1.connections == nil then
		p1.connections = {}
		p1.connections.started = userInputService.TouchStarted:Connect(function(p2)
			-- upvalues: p1 (ref), appIaScrollAwayIgnoreHorizontal (copy)
			p1.touching = true
			
			if appIaScrollAwayIgnoreHorizontal then
				p1.moving = false
				p1.horizontalLocked = false
				p1.touchPositionX = p2.Position.X
			end
			p1.touchPositionY = p2.Position.Y
		end)
		p1.connections.moved = userInputService.TouchMoved:Connect(function(p2)
			-- upvalues: p1 (ref), appIaScrollAwayIgnoreHorizontal (copy), appIaScrollAwayThreshold (copy)
			if not p1.touching then return end
			if appIaScrollAwayIgnoreHorizontal and p1.horizontalLocked then return end
			local y = p2.Position.Y
			
			if p1.moving then
				local var2 = y - p1.touchPositionY
				p1.touchPositionY = y
				p1:onTouchMoved(var2)
				
				return
			elseif appIaScrollAwayIgnoreHorizontal then
				local absValue = math.abs(p2.Position.X - p1.touchPositionX)
				local absValue_1 = math.abs(y - p1.touchPositionY)
				
				if appIaScrollAwayThreshold < absValue and absValue_1 < absValue then
					p1.horizontalLocked = true
					
					return
				elseif appIaScrollAwayThreshold < absValue_1 then
					p1.moving = true
					p1.touchPositionY = y
					
					return
				end
			elseif appIaScrollAwayThreshold < math.abs(y - p1.touchPositionY) then
				p1.moving = true
				p1.touchPositionY = y
			end
		end)
		p1.connections.ended = userInputService.TouchEnded:Connect(function(_)
			-- upvalues: p1 (ref), appIaScrollAwayIgnoreHorizontal (copy)
			if not p1.touching then return end
			p1.touching = false
			p1.moving = false
			
			if appIaScrollAwayIgnoreHorizontal then
				p1.horizontalLocked = false
			end
			p1:onTouchEnded()
		end)
		
		return
	end
end

function t_2.disconnectTouch(p1)
	if p1.connections == nil then return end
	for i, v in pairs(p1.connections) do
		v:Disconnect()
	end
	p1.connections = nil
end

function t_2.isEnabled(p2)
	return p2.enabled
end

function t_2.setEnabled(value, p2)
	-- upvalues: fFlagAppIaScopedScrollAway (ref), fFlagEnableScrollAwayContentScrollableFix (ref)
	if value.enabled == p2 then return end
	value.enabled = p2
	
	if p2 then
		if fFlagAppIaScopedScrollAway then
			if value.globalTouchDisabled then
				return
			else
				value:connectTouch()
				
				return
			end
		else
			value:connectTouch()
			
			return
		end
	else
		value:disconnectTouch()
		
		if fFlagEnableScrollAwayContentScrollableFix then
			value.contentScrollable = true
		end
	end
end

function t_2.setGlobalTouchEnabled(value, p2)
	value.globalTouchDisabled = not p2
	
	if p2 then
		if value.enabled then
			value:connectTouch()
			
			return
		end
	else
		value:disconnectTouch()
	end
end

function t_2.setContentScrollable(value, p2)
	if value.contentScrollable == p2 then return end
	if not p2 then
		value:show()
	end
	value.contentScrollable = p2
end

function t_2.setFooterVisible(value, p2)
	if value.footerVisible == p2 then return end
	value.footerVisible = p2
	
	if p2 then
		value.footer:show()
		
		return
	end
	value.footer:hide()
end

function t_2.getHeaderBinding(p2)
	return p2.header:getBinding()
end

function t_2.getFooterBinding(p2)
	return p2.footer:getBinding()
end

function t_2.setHeaderScrollAwayDisabled(value, p2)
	-- upvalues: fFlagAppIaScrollAwayPinHeader (ref)
	if not fFlagAppIaScrollAwayPinHeader then return end
	value.headerScrollAwayDisabled = p2
	
	if p2 then
		value.header:show()
	end
end

function t_2.show(p2)
	-- upvalues: fFlagEnableScrollAwayContentScrollableFix (ref)
	if fFlagEnableScrollAwayContentScrollableFix then
		p2.contentScrollable = true
	end
	p2.header:show()
	
	if p2.footerVisible then
		p2.footer:show()
	end
end

function t_2.hide(p2)
	-- upvalues: fFlagAppIaScrollAwayPinHeader (ref)
	if not fFlagAppIaScrollAwayPinHeader then
		p2.header:hide()
	elseif not p2.headerScrollAwayDisabled then
		p2.header:hide()
	end
	if p2.footerVisible then
		p2.footer:hide()
	end
end

function t_2.getInstance()
	-- upvalues: var1 (write), t_2 (ref)
	if not var1 then
		var1 = {}
		setmetatable(var1, t_2)
		var1:initialize()
	end
	return var1
end

function t_2.initialize(p2)
	-- upvalues: t_1 (ref)
	p2.header = t_1.create(1)
	p2.footer = t_1.create(0)
end

function t_2.destroy(p2)
	-- upvalues: var1 (write)
	p2.header:destroy()
	p2.footer:destroy()
	p2:disconnectTouch()
	var1 = nil
end

function t_2.setScrollDistance(value, p2)
	if p2 == 0 then
		return
	end
	value.scrollDistance = p2
end

return {
	isEnabled = function()
		-- upvalues: t_2 (ref)
		return t_2.getInstance():isEnabled()
	end,
	setEnabled = function(value)
		-- upvalues: t_2 (ref)
		t_2.getInstance():setEnabled(value)
	end,
	getHeaderBinding = function()
		-- upvalues: t_2 (ref)
		return t_2.getInstance():getHeaderBinding()
	end,
	getFooterBinding = function()
		-- upvalues: t_2 (ref)
		return t_2.getInstance():getFooterBinding()
	end,
	setFooterVisible = function(value)
		-- upvalues: t_2 (ref)
		t_2.getInstance():setFooterVisible(value)
	end,
	setHeaderScrollAwayDisabled = if fFlagAppIaScrollAwayPinHeader then function(p2)
		-- upvalues: t_2 (ref)
		t_2.getInstance():setHeaderScrollAwayDisabled(p2)
	end else nil,
	show = function()
		-- upvalues: t_2 (ref)
		t_2.getInstance():show()
	end,
	hide = function()
		-- upvalues: t_2 (ref)
		t_2.getInstance():hide()
	end,
	destroy = function()
		-- upvalues: t_2 (ref)
		t_2.getInstance():destroy()
	end,
	setScrollDistance = function(value)
		-- upvalues: t_2 (ref)
		t_2.getInstance():setScrollDistance(value)
	end,
	setGlobalTouchEnabled = if fFlagAppIaScopedScrollAway then function(p2)
		-- upvalues: t_2 (ref)
		t_2.getInstance():setGlobalTouchEnabled(p2)
	end else nil,
	onTouchMoved = if fFlagAppIaScopedScrollAway then function(p2)
		-- upvalues: t_2 (ref)
		local instance = t_2.getInstance()
		
		if instance.enabled then
			instance:onTouchMoved(p2)
		end
	end else nil,
	onTouchEnded = if fFlagAppIaScopedScrollAway then function()
		-- upvalues: t_2 (ref)
		local instance = t_2.getInstance()
		
		if instance.enabled then
			instance:onTouchEnded()
		end
	end else nil,
	setContentScrollable = function(value)
		-- upvalues: t_2 (ref)
		t_2.getInstance():setContentScrollable(value)
	end
}
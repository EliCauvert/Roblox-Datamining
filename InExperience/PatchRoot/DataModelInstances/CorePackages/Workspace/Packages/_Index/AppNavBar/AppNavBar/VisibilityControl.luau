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

function t_1.create(p0)
	-- upvalues: reactModule (ref), otterModule (ref), t_1 (ref)
	local var10, var11 = reactModule.createBinding(p0)
	local var12 = otterModule.createSingleMotor(p0)
	var12:onStep(var11)
	local t = { binding = var10, motor = var12 }
	setmetatable(t, t_1)
	
	return t
end

function t_1.destroy(p1)
	p1.motor:destroy()
end

function t_1.getBinding(p2)
	return p2.binding
end

function t_1.show(p3)
	-- upvalues: otterModule (ref), t (ref)
	p3.motor:setGoal(otterModule.spring(1, t))
end

function t_1.hide(p4)
	-- upvalues: otterModule (ref), t (ref)
	p4.motor:setGoal(otterModule.spring(0, t))
end

function t_1.update(p5, p6)
	-- upvalues: otterModule (ref)
	p5.motor:setGoal(otterModule.instant(math.clamp(p5.binding:getValue() + p6, 0, 1)))
end

function t_1.finishUp(p7)
	if p7.binding:getValue() < 0.5 then
		p7:hide()
		
		return
	end
	p7:show()
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
local var9 = nil

function t_2.onTouchMoved(p8, p9)
	-- upvalues: fFlagEnableScrollAwayContentScrollableFix (ref), fFlagAppIaScrollAwayPinHeader (ref)
	if fFlagEnableScrollAwayContentScrollableFix and not p8.contentScrollable then return end
	local var14 = p9 / p8.scrollDistance
	
	if p8.footerVisible then
		p8.footer:update(var14)
	end
	if fFlagAppIaScrollAwayPinHeader then
		if p8.headerScrollAwayDisabled then
			return
		else
			p8.header:update(var14)
			
			return
		end
	else
		p8.header:update(var14)
	end
end

function t_2.onTouchEnded(p10)
	-- upvalues: fFlagAppIaScrollAwayPinHeader (ref)
	if p10.footerVisible then
		p10.footer:finishUp()
	end
	if fFlagAppIaScrollAwayPinHeader then
		if p10.headerScrollAwayDisabled then
			return
		else
			p10.header:finishUp()
			
			return
		end
	else
		p10.header:finishUp()
	end
end

function t_2.connectTouch(p11)
	-- upvalues: userInputService (ref), appIaScrollAwayIgnoreHorizontal (ref), appIaScrollAwayThreshold (ref)
	if p11.connections == nil then
		p11.connections = {}
		p11.connections.started = userInputService.TouchStarted:Connect(function(p12)
			-- upvalues: p11 (ref), appIaScrollAwayIgnoreHorizontal (copy)
			p11.touching = true
			
			if appIaScrollAwayIgnoreHorizontal then
				p11.moving = false
				p11.horizontalLocked = false
				p11.touchPositionX = p12.Position.X
			end
			p11.touchPositionY = p12.Position.Y
		end)
		p11.connections.moved = userInputService.TouchMoved:Connect(function(p13)
			-- upvalues: p11 (ref), appIaScrollAwayIgnoreHorizontal (copy), appIaScrollAwayThreshold (copy)
			if not p11.touching then return end
			if appIaScrollAwayIgnoreHorizontal and p11.horizontalLocked then return end
			local y = p13.Position.Y
			
			if p11.moving then
				local var17 = y - p11.touchPositionY
				p11.touchPositionY = y
				p11:onTouchMoved(var17)
				
				return
			elseif appIaScrollAwayIgnoreHorizontal then
				local absValue = math.abs(p13.Position.X - p11.touchPositionX)
				local absValue_1 = math.abs(y - p11.touchPositionY)
				
				if appIaScrollAwayThreshold < absValue and absValue_1 < absValue then
					p11.horizontalLocked = true
					
					return
				elseif appIaScrollAwayThreshold < absValue_1 then
					p11.moving = true
					p11.touchPositionY = y
					
					return
				end
			elseif appIaScrollAwayThreshold < math.abs(y - p11.touchPositionY) then
				p11.moving = true
				p11.touchPositionY = y
			end
		end)
		p11.connections.ended = userInputService.TouchEnded:Connect(function(_)
			-- upvalues: p11 (ref), appIaScrollAwayIgnoreHorizontal (copy)
			if not p11.touching then return end
			p11.touching = false
			p11.moving = false
			
			if appIaScrollAwayIgnoreHorizontal then
				p11.horizontalLocked = false
			end
			p11:onTouchEnded()
		end)
		
		return
	end
end

function t_2.disconnectTouch(p14)
	if p14.connections == nil then return end
	for i, v in pairs(p14.connections) do
		v:Disconnect()
	end
	p14.connections = nil
end

function t_2.isEnabled(p15)
	return p15.enabled
end

function t_2.setEnabled(value, p16)
	-- upvalues: fFlagAppIaScopedScrollAway (ref), fFlagEnableScrollAwayContentScrollableFix (ref)
	if value.enabled == p16 then return end
	value.enabled = p16
	
	if p16 then
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

function t_2.setGlobalTouchEnabled(value, p17)
	value.globalTouchDisabled = not p17
	
	if p17 then
		if value.enabled then
			value:connectTouch()
			
			return
		end
	else
		value:disconnectTouch()
	end
end

function t_2.setContentScrollable(value, p18)
	if value.contentScrollable == p18 then return end
	if not p18 then
		value:show()
	end
	value.contentScrollable = p18
end

function t_2.setFooterVisible(value, p19)
	if value.footerVisible == p19 then return end
	value.footerVisible = p19
	
	if p19 then
		value.footer:show()
		
		return
	end
	value.footer:hide()
end

function t_2.getHeaderBinding(p20)
	return p20.header:getBinding()
end

function t_2.getFooterBinding(p21)
	return p21.footer:getBinding()
end

function t_2.setHeaderScrollAwayDisabled(value, p22)
	-- upvalues: fFlagAppIaScrollAwayPinHeader (ref)
	if not fFlagAppIaScrollAwayPinHeader then return end
	value.headerScrollAwayDisabled = p22
	
	if p22 then
		value.header:show()
	end
end

function t_2.show(p23)
	-- upvalues: fFlagEnableScrollAwayContentScrollableFix (ref)
	if fFlagEnableScrollAwayContentScrollableFix then
		p23.contentScrollable = true
	end
	p23.header:show()
	
	if p23.footerVisible then
		p23.footer:show()
	end
end

function t_2.hide(p24)
	-- upvalues: fFlagAppIaScrollAwayPinHeader (ref)
	if not fFlagAppIaScrollAwayPinHeader then
		p24.header:hide()
	elseif not p24.headerScrollAwayDisabled then
		p24.header:hide()
	end
	if p24.footerVisible then
		p24.footer:hide()
	end
end

function t_2.getInstance()
	-- upvalues: var9 (write), t_2 (ref)
	if not var9 then
		var9 = {}
		setmetatable(var9, t_2)
		var9:initialize()
	end
	return var9
end

function t_2.initialize(p25)
	-- upvalues: t_1 (ref)
	p25.header = t_1.create(1)
	p25.footer = t_1.create(0)
end

function t_2.destroy(p26)
	-- upvalues: var9 (write)
	p26.header:destroy()
	p26.footer:destroy()
	p26:disconnectTouch()
	var9 = nil
end

function t_2.setScrollDistance(value, p27)
	if p27 == 0 then
		return
	end
	value.scrollDistance = p27
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
	setHeaderScrollAwayDisabled = if fFlagAppIaScrollAwayPinHeader then function(p28)
		-- upvalues: t_2 (ref)
		t_2.getInstance():setHeaderScrollAwayDisabled(p28)
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
	setGlobalTouchEnabled = if fFlagAppIaScopedScrollAway then function(p29)
		-- upvalues: t_2 (ref)
		t_2.getInstance():setGlobalTouchEnabled(p29)
	end else nil,
	onTouchMoved = if fFlagAppIaScopedScrollAway then function(p30)
		-- upvalues: t_2 (ref)
		local instance = t_2.getInstance()
		
		if instance.enabled then
			instance:onTouchMoved(p30)
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
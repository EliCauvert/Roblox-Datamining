local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local OtterModule = require(Parent.Otter)
local SharedFlagsModule = require(Parent.SharedFlags)
local AppIaScrollAwayIgnoreHorizontal = game:DefineFastFlag("AppIaScrollAwayIgnoreHorizontal", false)
local AppIaScrollAwayThreshold = game:DefineFastInt("AppIaScrollAwayThreshold", 10)
local FFlagAppIaScrollAwayPinHeader = SharedFlagsModule.FFlagAppIaScrollAwayPinHeader
local FFlagAppIaScopedScrollAway = SharedFlagsModule.FFlagAppIaScopedScrollAway
local FFlagEnableScrollAwayContentScrollableFix = SharedFlagsModule.FFlagEnableScrollAwayContentScrollableFix
local config = {
	dampingRatio = 1,
	frequency = 3,
	restingVelocityLimit = 0.1,
	restingPositionLimit = 0.1
}
local Module = { binding = nil, motor = nil }
Module.__index = Module

function Module.create(p1) --[[ Line: 40 ]]
	-- upvalues: ReactModule (copy), OtterModule (copy), Module (copy)
	local Binding, Binding2 = ReactModule.createBinding(p1)
	local SingleMotor = OtterModule.createSingleMotor(p1)
	SingleMotor:onStep(Binding2)
	local config = { binding = Binding, motor = SingleMotor }
	setmetatable(config, Module)
	
	return config
end

function Module.destroy(p1) --[[ Line: 54 ]]
	p1.motor:destroy()
end

function Module.getBinding(p1) --[[ Line: 58 ]]
	return p1.binding
end

function Module.show(p1) --[[ Line: 62 ]]
	-- upvalues: OtterModule (copy), config (copy)
	p1.motor:setGoal(OtterModule.spring(1, config))
end

function Module.hide(p1) --[[ Line: 66 ]]
	-- upvalues: OtterModule (copy), config (copy)
	p1.motor:setGoal(OtterModule.spring(0, config))
end

function Module.update(p1, p2) --[[ Line: 70 ]]
	-- upvalues: OtterModule (copy)
	p1.motor:setGoal(OtterModule.instant((math.clamp(p1.binding:getValue() + p2, 0, 1))))
end

function Module.finishUp(p1) --[[ Line: 76 ]]
	if p1.binding:getValue() < 0.5 then
		p1:hide()
		
		return
	else
		p1:show()
	end
end

local Module1 = {
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
	headerScrollAwayDisabled = not FFlagAppIaScrollAwayPinHeader and nil,
	globalTouchDisabled = not FFlagAppIaScopedScrollAway and nil
}
Module1.__index = Module1
local T = nil

function Module1.onTouchMoved(p1, p2) --[[ Line: 120 ]]
	-- upvalues: FFlagEnableScrollAwayContentScrollableFix (copy), FFlagAppIaScrollAwayPinHeader (copy)
	if FFlagEnableScrollAwayContentScrollableFix and not p1.contentScrollable then return end
	local v1 = p2 / p1.scrollDistance
	
	if p1.footerVisible then
		p1.footer:update(v1)
	end
	if not FFlagAppIaScrollAwayPinHeader then
		p1.header:update(v1)
	elseif not p1.headerScrollAwayDisabled then
		p1.header:update(v1)
		
		return
	end
end

function Module1.onTouchEnded(p1) --[[ Line: 139 ]]
	-- upvalues: FFlagAppIaScrollAwayPinHeader (copy)
	if p1.footerVisible then
		p1.footer:finishUp()
	end
	if not FFlagAppIaScrollAwayPinHeader then
		p1.header:finishUp()
	elseif not p1.headerScrollAwayDisabled then
		p1.header:finishUp()
		
		return
	end
end

function Module1.connectTouch(p1) --[[ Line: 154 ]]
	-- upvalues: UserInputService (copy), AppIaScrollAwayIgnoreHorizontal (copy), AppIaScrollAwayThreshold (copy)
	if p1.connections == nil then
		p1.connections = {}
		p1.connections.started = UserInputService.TouchStarted:Connect(function(Touch) --[[ Line: 159 ]]
			-- upvalues: p1 (copy), AppIaScrollAwayIgnoreHorizontal (upval)
			p1.touching = true
			
			if AppIaScrollAwayIgnoreHorizontal then
				p1.moving = false
				p1.horizontalLocked = false
				p1.touchPositionX = Touch.Position.X
			end
			p1.touchPositionY = Touch.Position.Y
		end)
		p1.connections.moved = UserInputService.TouchMoved:Connect(function(Touch) --[[ Line: 168 ]]
			-- upvalues: p1 (copy), AppIaScrollAwayIgnoreHorizontal (upval), AppIaScrollAwayThreshold (upval)
			if not p1.touching then return end
			if AppIaScrollAwayIgnoreHorizontal and p1.horizontalLocked then return end
			local Y = Touch.Position.Y
			
			if p1.moving then
				p1.touchPositionY = Y
				p1:onTouchMoved(Y - p1.touchPositionY)
				
				return
			end
			if AppIaScrollAwayIgnoreHorizontal then
				local Magnitude = math.abs(Touch.Position.X - p1.touchPositionX)
				local Magnitude1 = math.abs(Y - p1.touchPositionY)
				
				if AppIaScrollAwayThreshold < Magnitude and Magnitude1 < Magnitude then
					p1.horizontalLocked = true
					
					return
				end
				if AppIaScrollAwayThreshold < Magnitude1 then
					p1.moving = true
					p1.touchPositionY = Y
					
					return
				end
			elseif AppIaScrollAwayThreshold < math.abs(Y - p1.touchPositionY) then
				p1.moving = true
				p1.touchPositionY = Y
			end
		end)
		p1.connections.ended = UserInputService.TouchEnded:Connect(function(_) --[[ Line: 202 ]]
			-- upvalues: p1 (copy), AppIaScrollAwayIgnoreHorizontal (upval)
			if not p1.touching then return end
			p1.touching = false
			p1.moving = false
			
			if AppIaScrollAwayIgnoreHorizontal then
				p1.horizontalLocked = false
			end
			p1:onTouchEnded()
		end)
		
		return
	end
end

function Module1.disconnectTouch(p1) --[[ Line: 215 ]]
	if p1.connections == nil then return end
	for _, connection in pairs(p1.connections) do
		connection:Disconnect()
	end
	p1.connections = nil
end

function Module1.isEnabled(p2) --[[ Line: 228 ]]
	return p2.enabled
end

function Module1.setEnabled(p2, Enabled) --[[ Line: 235 ]]
	-- upvalues: FFlagAppIaScopedScrollAway (copy), FFlagEnableScrollAwayContentScrollableFix (copy)
	if p2.enabled == Enabled then return end
	p2.enabled = Enabled
	
	if not Enabled then
		p2:disconnectTouch()
		
		if FFlagEnableScrollAwayContentScrollableFix then
			p2.contentScrollable = true
		end
	elseif not FFlagAppIaScopedScrollAway then
		p2:connectTouch()
		
		return
	else
		if not p2.globalTouchDisabled then
			p2:connectTouch()
			
			return
		end
	end
end

function Module1.setGlobalTouchEnabled(p2, p3) --[[ Line: 261 ]]
	p2.globalTouchDisabled = not p3
	
	if not p3 then
		p2:disconnectTouch()
	elseif p2.enabled then
		p2:connectTouch()
		
		return
	end
end

function Module1.setContentScrollable(p2, ContentScrollable) --[[ Line: 272 ]]
	if p2.contentScrollable == ContentScrollable then return end
	if not ContentScrollable then
		p2:show()
	end
	p2.contentScrollable = ContentScrollable
end

function Module1.setFooterVisible(p2, FooterVisible) --[[ Line: 285 ]]
	if p2.footerVisible == FooterVisible then return end
	p2.footerVisible = FooterVisible
	
	if FooterVisible then
		p2.footer:show()
		
		return
	else
		p2.footer:hide()
	end
end

function Module1.getHeaderBinding(p2) --[[ Line: 300 ]]
	return p2.header:getBinding()
end

function Module1.getFooterBinding(p2) --[[ Line: 307 ]]
	return p2.footer:getBinding()
end

function Module1.setHeaderScrollAwayDisabled(p2, HeaderScrollAwayDisabled) --[[ Line: 315 ]]
	-- upvalues: FFlagAppIaScrollAwayPinHeader (copy)
	if not FFlagAppIaScrollAwayPinHeader then return end
	p2.headerScrollAwayDisabled = HeaderScrollAwayDisabled
	
	if HeaderScrollAwayDisabled then
		p2.header:show()
	end
end

function Module1.show(p2) --[[ Line: 328 ]]
	-- upvalues: FFlagEnableScrollAwayContentScrollableFix (copy)
	if FFlagEnableScrollAwayContentScrollableFix then
		p2.contentScrollable = true
	end
	p2.header:show()
	
	if p2.footerVisible then
		p2.footer:show()
	end
end

function Module1.hide(p2) --[[ Line: 341 ]]
	-- upvalues: FFlagAppIaScrollAwayPinHeader (copy)
	if FFlagAppIaScrollAwayPinHeader then
		if not p2.headerScrollAwayDisabled then
			p2.header:hide()
		end
	else
		p2.header:hide()
	end
	if p2.footerVisible then
		p2.footer:hide()
	end
end

function Module1.getInstance() --[[ Line: 357 ]]
	-- upvalues: T (ref), Module1 (copy)
	if not T then
		T = {}
		setmetatable(T, Module1)
		T:initialize()
	end
	return T
end

function Module1.initialize(p2) --[[ Line: 367 ]]
	-- upvalues: Module (copy)
	p2.header = Module.create(1)
	p2.footer = Module.create(0)
end

function Module1.destroy(p2) --[[ Line: 377 ]]
	-- upvalues: T (ref)
	p2.header:destroy()
	p2.footer:destroy()
	p2:disconnectTouch()
	T = nil
end

function Module1.setScrollDistance(p2, ScrollDistance) --[[ Line: 387 ]]
	if ScrollDistance ~= 0 then
		p2.scrollDistance = ScrollDistance
		
		return
	end
end

return {
	isEnabled = function() --[[ Line: 399 ]]
		-- upvalues: Module1 (copy)
		return Module1.getInstance():isEnabled()
	end,
	setEnabled = function(p2) --[[ Line: 402 ]]
		-- upvalues: Module1 (copy)
		Module1.getInstance():setEnabled(p2)
	end,
	getHeaderBinding = function() --[[ Line: 405 ]]
		-- upvalues: Module1 (copy)
		return Module1.getInstance():getHeaderBinding()
	end,
	getFooterBinding = function() --[[ Line: 408 ]]
		-- upvalues: Module1 (copy)
		return Module1.getInstance():getFooterBinding()
	end,
	setFooterVisible = function(p2) --[[ Line: 411 ]]
		-- upvalues: Module1 (copy)
		Module1.getInstance():setFooterVisible(p2)
	end,
	setHeaderScrollAwayDisabled = if FFlagAppIaScrollAwayPinHeader then function(p2) --[[ Line: 415 ]]
		-- upvalues: Module1 (copy)
		Module1.getInstance():setHeaderScrollAwayDisabled(p2)
	end else nil,
	show = function() --[[ Line: 419 ]]
		-- upvalues: Module1 (copy)
		Module1.getInstance():show()
	end,
	hide = function() --[[ Line: 422 ]]
		-- upvalues: Module1 (copy)
		Module1.getInstance():hide()
	end,
	destroy = function() --[[ Line: 425 ]]
		-- upvalues: Module1 (copy)
		Module1.getInstance():destroy()
	end,
	setScrollDistance = function(p2) --[[ Line: 428 ]]
		-- upvalues: Module1 (copy)
		Module1.getInstance():setScrollDistance(p2)
	end,
	setGlobalTouchEnabled = if FFlagAppIaScopedScrollAway then function(p2) --[[ Line: 432 ]]
		-- upvalues: Module1 (copy)
		Module1.getInstance():setGlobalTouchEnabled(p2)
	end else nil,
	onTouchMoved = if FFlagAppIaScopedScrollAway then function(p2) --[[ Line: 437 ]]
		-- upvalues: Module1 (copy)
		local _Instance = Module1.getInstance()
		
		if _Instance.enabled then
			_Instance:onTouchMoved(p2)
		end
	end else nil,
	onTouchEnded = if FFlagAppIaScopedScrollAway then function() --[[ Line: 445 ]]
		-- upvalues: Module1 (copy)
		local _Instance = Module1.getInstance()
		
		if _Instance.enabled then
			_Instance:onTouchEnded()
		end
	end else nil,
	setContentScrollable = function(p2) --[[ Line: 452 ]]
		-- upvalues: Module1 (copy)
		Module1.getInstance():setContentScrollable(p2)
	end
}
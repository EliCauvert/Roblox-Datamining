local corePackagesService = game:GetService("CorePackages")
local starterGuiService = game:GetService("StarterGui")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local _ = require(corePackagesService.Workspace.Packages.Chrome)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local t = { Unavailable = 0, Loading = 1, Available = 2, Pinned = 3 }
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t (ref), fFlagEnableConsoleExpControls (ref), signal (ref), t_1 (ref)
	return setmetatable({
		_state = p0 or t.Unavailable,
		_forceUnavailable = if fFlagEnableConsoleExpControls then false else nil,
		_changeSignal = signal.new()
	}, t_1)
end

function t_1:connect(p1)
	return self._changeSignal:connect(p1)
end

function t_1:set(p2)
	-- upvalues: fFlagEnableConsoleExpControls (ref)
	if self._state ~= p2 then
		self._state = p2
		
		if not fFlagEnableConsoleExpControls or not self._forceUnavailable then
			self._changeSignal:fire(p2)
		end
	end
end

function t_1:get()
	-- upvalues: fFlagEnableConsoleExpControls (ref), t (ref)
	return if fFlagEnableConsoleExpControls and self._forceUnavailable then t.Unavailable else self._state
end

function t_1:available()
	-- upvalues: t (ref)
	self:set(t.Available)
end

function t_1:loading()
	-- upvalues: t (ref)
	self:set(t.Loading)
end

function t_1:unavailable()
	-- upvalues: t (ref)
	self:set(t.Unavailable)
end

function t_1:pinned()
	-- upvalues: t (ref)
	self:set(t.Pinned)
end

function t_1:forceUnavailable()
	-- upvalues: fFlagEnableConsoleExpControls (ref), t (ref)
	if fFlagEnableConsoleExpControls and not self._forceUnavailable then
		self._forceUnavailable = true
		
		if self._state ~= t.Unavailable then
			self._changeSignal:fire(t.Unavailable)
		end
	end
end

function t_1:unforceUnavailable()
	-- upvalues: fFlagEnableConsoleExpControls (ref), t (ref)
	if fFlagEnableConsoleExpControls and self._forceUnavailable then
		self._forceUnavailable = false
		
		if self._state ~= t.Unavailable then
			self._changeSignal:fire(self._state)
		end
	end
end

local t_2 = {}
t_2.__index = t_2

function t_2.new(p3)
	-- upvalues: signal (ref), t_2 (ref)
	return setmetatable({
		_value = { type = "empty", value = nil },
		_changeSignal = signal.new(),
		_excludeFromTotalCounts = p3 or false
	}, t_2)
end

function t_2:setExcludeFromTotalCounts(p4)
	self._excludeFromTotalCounts = p4
end

function t_2:excludeFromTotalCounts()
	return self._excludeFromTotalCounts
end

function t_2:connect(p5)
	return self._changeSignal:connect(p5)
end

function t_2:get()
	return self._value
end

function t_2:clear()
	if self._value and self._value.type ~= "empty" then
		self._value = { type = "empty", value = nil }
		self._changeSignal:fire(self._value)
	end
end

function t_2:fireCount(p6)
	local t = { type = "count", value = p6 }
	
	if self._value ~= t then
		self._value = t
		self._changeSignal:fire(self._value)
	end
end

function t_2:isEmpty()
	return self._value and self._value.type == "empty"
end

local t_3 = {}
t_3.__index = t_3

function t_3.new(p7)
	-- upvalues: signal (ref), t_3 (ref)
	return setmetatable({ _value = p7, _changeSignal = signal.new() }, t_3)
end

function t_3:get()
	return self._value
end

function t_3:setMomentary(p8, p9, p10)
	if self._value ~= p8 then
		self._value = p8
		self._changeSignal:fire(p8)
	end
	local momentaryClearThread = self._momentaryClearThread
	
	if momentaryClearThread then
		task.cancel(momentaryClearThread)
	end
	self._momentaryClearThread = task.delay(p9, function()
		-- upvalues: self (ref), p10 (ref)
		self._momentaryClearThread = nil
		self:set(p10)
	end)
end

function t_3:set(p11)
	local momentaryClearThread = self._momentaryClearThread
	
	if momentaryClearThread then
		task.cancel(momentaryClearThread)
		self._momentaryClearThread = nil
	end
	if self._value ~= p11 then
		self._value = p11
		self._changeSignal:fire(p11)
	end
end

function t_3:signal()
	return self._changeSignal
end

function t_3:connect(p12, p13)
	local changeSignalConnection = self._changeSignal:connect(p12)
	
	if p13 == true then
		p12(self._value)
	end
	return changeSignalConnection
end

local t_4 = {}
t_4.__index = t_4

function t_4.new(p14, p15, p16)
	-- upvalues: t_4 (ref)
	if not p14 then
		error("No signal provided to MappedSignal")
	end
	if not p15 then
		error("No fetchMapFunction provided to MappedSignal")
	end
	return setmetatable({
		_signal = p14,
		_fetchMapFunction = p15,
		_eventReceiver = p16
	}, t_4)
end

function t_4:connect(p17)
	if not self._signal then
		warn("MappedSignal: Missing signal")
		
		return function() end
	end
	local signalConnection = self._signal:connect(function()
		-- upvalues: self (ref), p17 (ref)
		if self._eventReceiver then
			self._eventReceiver()
		end
		p17(self._fetchMapFunction())
	end)
	
	if self._eventReceiver then
		self._eventReceiver()
	end
	p17(self._fetchMapFunction())
	
	return signalConnection
end

function t_4:get()
	return self._fetchMapFunction()
end

function setCoreGuiAvailability(value, p18, p19)
	-- upvalues: starterGuiService (ref)
	local coreGuiChangedSignalConnection = starterGuiService.CoreGuiChangedSignal:Connect(function()
		-- upvalues: starterGuiService (copy), p18 (ref), p19 (ref), value (ref)
		local var13 = starterGuiService:GetCoreGuiEnabled(p18)
		
		if p19 then
			p19(var13)
			
			return
		elseif var13 then
			value.availability:available()
			
			return
		end
		value.availability:unavailable()
	end)
	local var12 = starterGuiService:GetCoreGuiEnabled(p18)
	
	if p19 then
		p19(var12)
		
		return coreGuiChangedSignalConnection
	elseif var12 then
		value.availability:available()
		
		return coreGuiChangedSignalConnection
	end
	value.availability:unavailable()
	
	return coreGuiChangedSignalConnection
end

return {
	MappedSignal = t_4,
	AvailabilitySignal = t_1,
	AvailabilitySignalState = t,
	NotifySignal = t_2,
	ObservableValue = t_3,
	setCoreGuiAvailability = setCoreGuiAvailability
}
local CorePackages = game:GetService("CorePackages")
local StarterGui = game:GetService("StarterGui")
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local _ = require(CorePackages.Workspace.Packages.Chrome)
local FFlagEnableConsoleExpControls = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local AvailabilitySignalState = { Unavailable = 0, Loading = 1, Available = 2, Pinned = 3 }
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 28 ]]
	-- upvalues: AvailabilitySignalState (copy), FFlagEnableConsoleExpControls (copy), Signal (copy), Module (copy)
	return (setmetatable({
		_state = p1 or AvailabilitySignalState.Unavailable,
		_forceUnavailable = not FFlagEnableConsoleExpControls and nil,
		_changeSignal = Signal.new()
	}, Module))
end

function Module:connect(p1) --[[ Line: 37 ]]
	return self._changeSignal:connect(p1)
end

function Module:set(_state) --[[ Line: 41 ]]
	-- upvalues: FFlagEnableConsoleExpControls (copy)
	if self._state ~= _state then
		self._state = _state
		
		if not FFlagEnableConsoleExpControls or not self._forceUnavailable then
			self._changeSignal:fire(_state)
		end
	end
end

function Module.get(p1) --[[ Line: 50 ]]
	-- upvalues: FFlagEnableConsoleExpControls (copy), AvailabilitySignalState (copy)
	return if FFlagEnableConsoleExpControls and p1._forceUnavailable then AvailabilitySignalState.Unavailable else p1._state
end

function Module:available() --[[ Line: 58 ]]
	-- upvalues: AvailabilitySignalState (copy)
	self:set(AvailabilitySignalState.Available)
end

function Module:loading() --[[ Line: 62 ]]
	-- upvalues: AvailabilitySignalState (copy)
	self:set(AvailabilitySignalState.Loading)
end

function Module:unavailable() --[[ Line: 66 ]]
	-- upvalues: AvailabilitySignalState (copy)
	self:set(AvailabilitySignalState.Unavailable)
end

function Module:pinned() --[[ Line: 70 ]]
	-- upvalues: AvailabilitySignalState (copy)
	self:set(AvailabilitySignalState.Pinned)
end

function Module:forceUnavailable() --[[ Line: 74 ]]
	-- upvalues: FFlagEnableConsoleExpControls (copy), AvailabilitySignalState (copy)
	if FFlagEnableConsoleExpControls and not self._forceUnavailable then
		self._forceUnavailable = true
		
		if self._state ~= AvailabilitySignalState.Unavailable then
			self._changeSignal:fire(AvailabilitySignalState.Unavailable)
		end
	end
end

function Module:unforceUnavailable() --[[ Line: 84 ]]
	-- upvalues: FFlagEnableConsoleExpControls (copy), AvailabilitySignalState (copy)
	if FFlagEnableConsoleExpControls and self._forceUnavailable then
		self._forceUnavailable = false
		
		if self._state ~= AvailabilitySignalState.Unavailable then
			self._changeSignal:fire(self._state)
		end
	end
end

local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 97 ]]
	-- upvalues: Signal (copy), Module1 (copy)
	return (setmetatable({
		_value = { type = "empty", value = nil },
		_changeSignal = Signal.new(),
		_excludeFromTotalCounts = p1 or false
	}, Module1))
end

function Module1:setExcludeFromTotalCounts(_excludeFromTotalCounts) --[[ Line: 106 ]]
	self._excludeFromTotalCounts = _excludeFromTotalCounts
end

function Module1:excludeFromTotalCounts() --[[ Line: 110 ]]
	return self._excludeFromTotalCounts
end

function Module1:connect(p1) --[[ Line: 114 ]]
	return self._changeSignal:connect(p1)
end

function Module1:get() --[[ Line: 118 ]]
	return self._value
end

function Module1:clear() --[[ Line: 122 ]]
	if self._value and self._value.type ~= "empty" then
		self._value = { type = "empty", value = nil }
		self._changeSignal:fire(self._value)
	end
end

function Module1:fireCount(Value) --[[ Line: 129 ]]
	local config = { type = "count", value = Value }
	
	if self._value ~= config then
		self._value = config
		self._changeSignal:fire(self._value)
	end
end

function Module1:isEmpty(): boolean --[[ Line: 137 ]]
	return self._value and self._value.type == "empty"
end

local Module2 = {}
Module2.__index = Module2

function Module2.new(_value) --[[ Line: 146 ]]
	-- upvalues: Signal (copy), Module2 (copy)
	return (setmetatable({ _value = _value, _changeSignal = Signal.new() }, Module2))
end

function Module2:get() --[[ Line: 153 ]]
	return self._value
end

function Module2:setMomentary(_value, Delay, p1) --[[ Line: 157 ]]
	if self._value ~= _value then
		self._value = _value
		self._changeSignal:fire(_value)
	end
	local MomentaryClearThread = self._momentaryClearThread
	
	if MomentaryClearThread then
		task.cancel(MomentaryClearThread)
	end
	self._momentaryClearThread = task.delay(Delay, function() --[[ Line: 169 ]]
		-- upvalues: self (copy), p1 (copy)
		self._momentaryClearThread = nil
		self.set(self, p1)
	end)
end

function Module2:set(_value) --[[ Line: 176 ]]
	local MomentaryClearThread = self._momentaryClearThread
	
	if MomentaryClearThread then
		task.cancel(MomentaryClearThread)
		self._momentaryClearThread = nil
	end
	if self._value ~= _value then
		self._value = _value
		self._changeSignal:fire(_value)
	end
end

function Module2:signal() --[[ Line: 189 ]]
	return self._changeSignal
end

function Module2:connect(Callback: (any) -> (), Enabled) --[[ Line: 193 ]]
	local ChangeSignalConnection = self._changeSignal:connect(Callback)
	
	if Enabled == true then
		Callback(self._value)
	end
	return ChangeSignalConnection
end

local Module3 = {}
Module3.__index = Module3

function Module3.new(_signal, _fetchMapFunction, _eventReceiver) --[[ Line: 219 ]]
	-- upvalues: Module3 (copy)
	if not _signal then
		error("No signal provided to MappedSignal")
	end
	if not _fetchMapFunction then
		error("No fetchMapFunction provided to MappedSignal")
	end
	return (setmetatable({
		_signal = _signal,
		_fetchMapFunction = _fetchMapFunction,
		_eventReceiver = _eventReceiver
	}, Module3))
end

function Module3:connect(Callback: (any) -> ()) --[[ Line: 233 ]]
	if not self._signal then
		warn("MappedSignal: Missing signal")
		
		return function() --[[ Line: 236 ]] end
	end
	local SignalConnection = self._signal:connect(function() --[[ Line: 239 ]]
		-- upvalues: self (copy), Callback (copy)
		if self._eventReceiver then
			self._eventReceiver()
		end
		Callback(self._fetchMapFunction())
	end)
	
	if self._eventReceiver then
		self._eventReceiver()
	end
	Callback(self._fetchMapFunction())
	
	return SignalConnection
end

function Module3:get() --[[ Line: 253 ]]
	return self._fetchMapFunction()
end

function setCoreGuiAvailability(p1, CoreGuiType, Callback: (any) -> ()) --[[ Line: 257 ]]
	-- upvalues: StarterGui (copy)
	local CoreGuiChangedSignalConnection = StarterGui.CoreGuiChangedSignal:Connect(function() --[[ Line: 262 | Named "updateAvailable" ]]
		-- upvalues: StarterGui (upval), CoreGuiType (copy), Callback (copy), p1 (copy)
		local CoreGuiEnabled = StarterGui:GetCoreGuiEnabled(CoreGuiType)
		
		if Callback then
			Callback(CoreGuiEnabled)
			
			return
		end
		if CoreGuiEnabled then
			p1.availability:available()
			
			return
		else
			p1.availability:unavailable()
		end
	end)
	local CoreGuiEnabled = StarterGui:GetCoreGuiEnabled(CoreGuiType)
	
	if Callback then
		Callback(CoreGuiEnabled)
		
		return CoreGuiChangedSignalConnection
	elseif CoreGuiEnabled then
		p1.availability:available()
		
		return CoreGuiChangedSignalConnection
	else
		p1.availability:unavailable()
		
		return CoreGuiChangedSignalConnection
	end
end

return {
	MappedSignal = Module3,
	AvailabilitySignal = Module,
	AvailabilitySignalState = AvailabilitySignalState,
	NotifySignal = Module1,
	ObservableValue = Module2,
	setCoreGuiAvailability = setCoreGuiAvailability
}
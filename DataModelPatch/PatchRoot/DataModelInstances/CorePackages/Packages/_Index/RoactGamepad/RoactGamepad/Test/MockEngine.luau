local CryoModule = require(script.Parent.Parent.Parent.Cryo)
local CreateSignalModule = require(script.Parent.Parent.createSignal)
local MockEngineModule = {}
MockEngineModule.__index = MockEngineModule
local config = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true,
	[Enum.UserInputType.Keyboard] = true
}
local list = {
	Enum.KeyCode.Thumbstick2, Enum.KeyCode.DPadDown, Enum.KeyCode.DPadUp,
	Enum.KeyCode.ButtonL3, Enum.KeyCode.ButtonL2, Enum.KeyCode.DPadRight,
	Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonSelect, Enum.KeyCode.ButtonStart,
	Enum.KeyCode.ButtonY, Enum.KeyCode.DPadLeft, Enum.KeyCode.ButtonR2,
	Enum.KeyCode.ButtonR3, Enum.KeyCode.ButtonX, Enum.KeyCode.Thumbstick1,
	Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonA, Enum.KeyCode.ButtonL1
}
local config1 = {
	[Enum.KeyCode.DPadUp] = "NextSelectionUp",
	[Enum.KeyCode.Up] = "NextSelectionUp",
	[Enum.KeyCode.DPadDown] = "NextSelectionDown",
	[Enum.KeyCode.Down] = "NextSelectionDown",
	[Enum.KeyCode.DPadLeft] = "NextSelectionLeft",
	[Enum.KeyCode.Left] = "NextSelectionLeft",
	[Enum.KeyCode.DPadRight] = "NextSelectionRight",
	[Enum.KeyCode.Right] = "NextSelectionRight"
}

local function _(KeyCode)
	return {
		KeyCode = KeyCode,
		Delta = Vector3.new(),
		Position = Vector3.new(),
		UserInputType = Enum.UserInputType.Gamepad1,
		UserInputState = Enum.UserInputState.End
	}
end

local _ = function(Disconnect)
	return { Disconnect = Disconnect }
end

function MockEngineModule.new()
	-- upvalues: CreateSignalModule (copy), MockEngineModule (copy), CryoModule (copy)
	local self = setmetatable({
		__mockSelected = nil,
		__interface = nil,
		__connectedGamepads = {},
		__gamepadStates = {},
		__selectionChangedSignal = CreateSignalModule(),
		__inputSignal = CreateSignalModule(),
		__renderStepped = CreateSignalModule(),
		__gamepadConnected = CreateSignalModule(),
		__gamepadDisconnected = CreateSignalModule()
	}, MockEngineModule)
	local config = {
		getSelection = function()
			-- upvalues: self (copy)
			return self.__mockSelected
		end,
		setSelection = function(p1)
			-- upvalues: self (copy)
			self.__mockSelected = p1
			self.__selectionChangedSignal:fire()
		end,
		getGamepadConnected = function(p1)
			-- upvalues: self (copy)
			return self.__connectedGamepads[p1] or false
		end,
		getGamepadState = function(p1)
			-- upvalues: self (copy)
			if self.__gamepadStates[p1] == nil then
				self:__initializeGamepadState(p1)
			end
			return self.__gamepadStates[p1]
		end,
		getNavigationGamepads = function(_)
			-- upvalues: CryoModule (upval), self (copy)
			return CryoModule.Dictionary.keys(self.__connectedGamepads)
		end,
		subscribeToSelectionChanged = function(p1)
			-- upvalues: self (copy)
			return { Disconnect = self.__selectionChangedSignal:subscribe(p1) }
		end,
		subscribeToInputBegan = function(p1)
			-- upvalues: self (copy)
			return { Disconnect = self.__inputSignal:subscribe(p1) }
		end,
		subscribeToInputChanged = function(p1)
			-- upvalues: self (copy)
			return { Disconnect = self.__inputSignal:subscribe(p1) }
		end,
		subscribeToInputEnded = function(p1)
			-- upvalues: self (copy)
			return { Disconnect = self.__inputSignal:subscribe(p1) }
		end,
		subscribeToRenderStepped = function(p1)
			-- upvalues: self (copy)
			return { Disconnect = self.__renderStepped:subscribe(p1) }
		end,
		subscribeToGamepadConnected = function(p1)
			-- upvalues: self (copy)
			return { Disconnect = self.__gamepadConnected:subscribe(p1) }
		end,
		subscribeToGamepadDisconnected = function(p1)
			-- upvalues: self (copy)
			return { Disconnect = self.__gamepadDisconnected:subscribe(p1) }
		end
	}
	self.__interface = config
	
	return self, config
end

function MockEngineModule:__initializeGamepadState(p1)
	-- upvalues: CryoModule (copy), list (copy)
	self.__gamepadStates[p1] = CryoModule.List.map(list, function(KeyCode)
		return {
			KeyCode = KeyCode,
			Delta = Vector3.new(),
			Position = Vector3.new(),
			UserInputType = Enum.UserInputType.Gamepad1,
			UserInputState = Enum.UserInputState.End
		}
	end)
end

function MockEngineModule:simulateSelectionChanged(p1)
	self.__mockSelected = p1
	self.__selectionChangedSignal:fire()
end

function MockEngineModule:simulateInput(p1)
	-- upvalues: CryoModule (copy), config (copy), config1 (copy)
	local JoinResult = CryoModule.Dictionary.join({
		Delta = Vector3.new(),
		Position = Vector3.new(),
		UserInputType = Enum.UserInputType.Gamepad1
	}, p1)
	assert(typeof(JoinResult.KeyCode) == "EnumItem" and JoinResult.KeyCode.EnumType == Enum.KeyCode, "Invalid inputObject.KeyCode: expected a member of Enum.KeyCode")
	assert(config[JoinResult.UserInputType], "Invalid inputObject.UserInputType")
	local KeyCode = JoinResult.KeyCode
	local Entry = config1[KeyCode]
	
	if Entry ~= nil and self.__interface.getSelection() ~= nil then
		self.__interface.setSelection(self.__interface.getSelection()[Entry])
	end
	if JoinResult.UserInputType ~= Enum.UserInputType.Keyboard then
		local UserInputType = JoinResult.UserInputType
		
		if not self.__connectedGamepads[UserInputType] then
			self:connectGamepad(UserInputType)
		end
		local GamepadState = self.__gamepadStates[UserInputType]
		local Where = CryoModule.List.findWhere(GamepadState, function(Input): boolean
			-- upvalues: KeyCode (copy)
			return Input.KeyCode == KeyCode
		end)
		
		if Where == nil then
			error(("Invalid InputObject: KeyCode %s is not possible on %s"):format(tostring(KeyCode), (tostring(UserInputType))), 2)
		end
		for i, value in pairs(JoinResult) do
			GamepadState[Where][i] = value
		end
	end
	self.__inputSignal:fire(JoinResult)
end

function MockEngineModule:renderStep(p2: number)
	if p2 == nil then
		p2 = 0.03333333333333333
	end
	self.__renderStepped:fire(p2)
end

function MockEngineModule:connectGamepad(UserInputType)
	assert(typeof(UserInputType) == "EnumItem" and UserInputType.EnumType == Enum.UserInputType, "Invalid argument #1: expected a member of Enum.UserInputType")
	self.__connectedGamepads[UserInputType] = true
	self:__initializeGamepadState(UserInputType)
	self.__gamepadConnected:fire(UserInputType)
end

function MockEngineModule:disconnectGamepad(p2)
	assert(typeof(p2) == "EnumItem" and p2.EnumType == Enum.UserInputType, "Invalid argument #1: expected a member of Enum.UserInputType")
	self.__connectedGamepads[p2] = nil
	self.__gamepadDisconnected:fire(p2)
end

return MockEngineModule
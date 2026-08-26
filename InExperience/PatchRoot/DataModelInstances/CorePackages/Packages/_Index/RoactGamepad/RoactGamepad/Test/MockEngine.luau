local cryoModule = require(script.Parent.Parent.Parent.Cryo)
local createSignalModule = require(script.Parent.Parent.createSignal)
local t = {}
t.__index = t
local t_1 = {
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
local t_2 = {
	[Enum.KeyCode.DPadUp] = "NextSelectionUp",
	[Enum.KeyCode.Up] = "NextSelectionUp",
	[Enum.KeyCode.DPadDown] = "NextSelectionDown",
	[Enum.KeyCode.Down] = "NextSelectionDown",
	[Enum.KeyCode.DPadLeft] = "NextSelectionLeft",
	[Enum.KeyCode.Left] = "NextSelectionLeft",
	[Enum.KeyCode.DPadRight] = "NextSelectionRight",
	[Enum.KeyCode.Right] = "NextSelectionRight"
}

local function _(p1)
	return {
		KeyCode = p1,
		Delta = Vector3.new(),
		Position = Vector3.new(),
		UserInputType = Enum.UserInputType.Gamepad1,
		UserInputState = Enum.UserInputState.End
	}
end

local _ = function(p1)
	return { Disconnect = p1 }
end

function t.new()
	-- upvalues: createSignalModule (ref), t (ref), cryoModule (ref)
	local tbl = setmetatable({
		__mockSelected = nil,
		__interface = nil,
		__connectedGamepads = {},
		__gamepadStates = {},
		__selectionChangedSignal = createSignalModule(),
		__inputSignal = createSignalModule(),
		__renderStepped = createSignalModule(),
		__gamepadConnected = createSignalModule(),
		__gamepadDisconnected = createSignalModule()
	}, t)
	local t_1 = {
		getSelection = function()
			-- upvalues: tbl (ref)
			return tbl.__mockSelected
		end,
		setSelection = function(value)
			-- upvalues: tbl (ref)
			tbl.__mockSelected = value
			tbl.__selectionChangedSignal:fire()
		end,
		getGamepadConnected = function(p1)
			-- upvalues: tbl (ref)
			return tbl.__connectedGamepads[p1] or false
		end,
		getGamepadState = function(p1)
			-- upvalues: tbl (ref)
			if tbl.__gamepadStates[p1] == nil then
				tbl:__initializeGamepadState(p1)
			end
			return tbl.__gamepadStates[p1]
		end,
		getNavigationGamepads = function(_)
			-- upvalues: cryoModule (copy), tbl (ref)
			return cryoModule.Dictionary.keys(tbl.__connectedGamepads)
		end,
		subscribeToSelectionChanged = function(p1)
			-- upvalues: tbl (ref)
			return { Disconnect = tbl.__selectionChangedSignal:subscribe(p1) }
		end,
		subscribeToInputBegan = function(p1)
			-- upvalues: tbl (ref)
			return { Disconnect = tbl.__inputSignal:subscribe(p1) }
		end,
		subscribeToInputChanged = function(p1)
			-- upvalues: tbl (ref)
			return { Disconnect = tbl.__inputSignal:subscribe(p1) }
		end,
		subscribeToInputEnded = function(p1)
			-- upvalues: tbl (ref)
			return { Disconnect = tbl.__inputSignal:subscribe(p1) }
		end,
		subscribeToRenderStepped = function(p1)
			-- upvalues: tbl (ref)
			return { Disconnect = tbl.__renderStepped:subscribe(p1) }
		end,
		subscribeToGamepadConnected = function(p1)
			-- upvalues: tbl (ref)
			return { Disconnect = tbl.__gamepadConnected:subscribe(p1) }
		end,
		subscribeToGamepadDisconnected = function(p1)
			-- upvalues: tbl (ref)
			return { Disconnect = tbl.__gamepadDisconnected:subscribe(p1) }
		end
	}
	tbl.__interface = t_1
	
	return tbl, t_1
end

function t:__initializeGamepadState(p1)
	-- upvalues: cryoModule (ref), list (ref)
	self.__gamepadStates[p1] = cryoModule.List.map(list, function(p2)
		return {
			KeyCode = p2,
			Delta = Vector3.new(),
			Position = Vector3.new(),
			UserInputType = Enum.UserInputType.Gamepad1,
			UserInputState = Enum.UserInputState.End
		}
	end)
end

function t:simulateSelectionChanged(p1)
	self.__mockSelected = p1
	self.__selectionChangedSignal:fire()
end

function t:simulateInput(p1)
	-- upvalues: cryoModule (ref), t_1 (ref), t_2 (ref)
	local var1 = cryoModule.Dictionary.join({
		Delta = Vector3.new(),
		Position = Vector3.new(),
		UserInputType = Enum.UserInputType.Gamepad1
	}, p1)
	assert(typeof(var1.KeyCode) == "EnumItem" and var1.KeyCode.EnumType == Enum.KeyCode, "Invalid inputObject.KeyCode: expected a member of Enum.KeyCode")
	assert(t_1[var1.UserInputType], "Invalid inputObject.UserInputType")
	var1 = var1.KeyCode
	local var2 = t_2[var1]
	
	if var2 ~= nil and self.__interface.getSelection() ~= nil then
		self.__interface.setSelection(self.__interface.getSelection()[var2])
	end
	if var1.UserInputType ~= Enum.UserInputType.Keyboard then
		local userInputType = var1.UserInputType
		
		if not self.__connectedGamepads[userInputType] then
			self:connectGamepad(userInputType)
		end
		local var3 = self.__gamepadStates[userInputType]
		local var4 = cryoModule.List.findWhere(var3, function(p2)
			-- upvalues: var1 (ref)
			return p2.KeyCode == var1
		end)
		
		if var4 == nil then
			error(("Invalid InputObject: KeyCode %s is not possible on %s"):format(tostring(var1), tostring(userInputType)), 2)
		end
		for i, v in pairs(var1) do
			var3[var4][i] = v
		end
	end
	self.__inputSignal:fire(var1)
end

function t:renderStep(p2)
	if p2 == nil then
		p2 = 0.033333333333
	end
	self.__renderStepped:fire(p2)
end

function t:connectGamepad(p2)
	assert(typeof(p2) == "EnumItem" and p2.EnumType == Enum.UserInputType, "Invalid argument #1: expected a member of Enum.UserInputType")
	self.__connectedGamepads[p2] = true
	self:__initializeGamepadState(p2)
	self.__gamepadConnected:fire(p2)
end

function t:disconnectGamepad(p2)
	assert(typeof(p2) == "EnumItem" and p2.EnumType == Enum.UserInputType, "Invalid argument #1: expected a member of Enum.UserInputType")
	self.__connectedGamepads[p2] = nil
	self.__gamepadDisconnected:fire(p2)
end

return t
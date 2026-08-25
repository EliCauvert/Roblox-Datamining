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

local function _(p0)
	return {
		KeyCode = p0,
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
		getGamepadConnected = function(p2)
			-- upvalues: tbl (ref)
			return tbl.__connectedGamepads[p2] or false
		end,
		getGamepadState = function(p3)
			-- upvalues: tbl (ref)
			if tbl.__gamepadStates[p3] == nil then
				tbl:__initializeGamepadState(p3)
			end
			return tbl.__gamepadStates[p3]
		end,
		getNavigationGamepads = function(_)
			-- upvalues: cryoModule (copy), tbl (ref)
			return cryoModule.Dictionary.keys(tbl.__connectedGamepads)
		end,
		subscribeToSelectionChanged = function(p4)
			-- upvalues: tbl (ref)
			return { Disconnect = tbl.__selectionChangedSignal:subscribe(p4) }
		end,
		subscribeToInputBegan = function(p5)
			-- upvalues: tbl (ref)
			return { Disconnect = tbl.__inputSignal:subscribe(p5) }
		end,
		subscribeToInputChanged = function(p6)
			-- upvalues: tbl (ref)
			return { Disconnect = tbl.__inputSignal:subscribe(p6) }
		end,
		subscribeToInputEnded = function(p7)
			-- upvalues: tbl (ref)
			return { Disconnect = tbl.__inputSignal:subscribe(p7) }
		end,
		subscribeToRenderStepped = function(p8)
			-- upvalues: tbl (ref)
			return { Disconnect = tbl.__renderStepped:subscribe(p8) }
		end,
		subscribeToGamepadConnected = function(p9)
			-- upvalues: tbl (ref)
			return { Disconnect = tbl.__gamepadConnected:subscribe(p9) }
		end,
		subscribeToGamepadDisconnected = function(p10)
			-- upvalues: tbl (ref)
			return { Disconnect = tbl.__gamepadDisconnected:subscribe(p10) }
		end
	}
	tbl.__interface = t_1
	
	return tbl, t_1
end

function t:__initializeGamepadState(p11)
	-- upvalues: cryoModule (ref), list (ref)
	self.__gamepadStates[p11] = cryoModule.List.map(list, function(p12)
		return {
			KeyCode = p12,
			Delta = Vector3.new(),
			Position = Vector3.new(),
			UserInputType = Enum.UserInputType.Gamepad1,
			UserInputState = Enum.UserInputState.End
		}
	end)
end

function t:simulateSelectionChanged(p13)
	self.__mockSelected = p13
	self.__selectionChangedSignal:fire()
end

function t:simulateInput(p14)
	-- upvalues: cryoModule (ref), t_1 (ref), t_2 (ref)
	local var8 = cryoModule.Dictionary.join({
		Delta = Vector3.new(),
		Position = Vector3.new(),
		UserInputType = Enum.UserInputType.Gamepad1
	}, p14)
	assert(typeof(var8.KeyCode) == "EnumItem" and var8.KeyCode.EnumType == Enum.KeyCode, "Invalid inputObject.KeyCode: expected a member of Enum.KeyCode")
	assert(t_1[var8.UserInputType], "Invalid inputObject.UserInputType")
	var8 = var8.KeyCode
	local var9 = t_2[var8]
	
	if var9 ~= nil and self.__interface.getSelection() ~= nil then
		self.__interface.setSelection(self.__interface.getSelection()[var9])
	end
	if var8.UserInputType ~= Enum.UserInputType.Keyboard then
		local userInputType = var8.UserInputType
		
		if not self.__connectedGamepads[userInputType] then
			self:connectGamepad(userInputType)
		end
		local var10 = self.__gamepadStates[userInputType]
		local var11 = cryoModule.List.findWhere(var10, function(p15)
			-- upvalues: var8 (ref)
			return p15.KeyCode == var8
		end)
		
		if var11 == nil then
			error(("Invalid InputObject: KeyCode %s is not possible on %s"):format(tostring(var8), tostring(userInputType)), 2)
		end
		for i, v in pairs(var8) do
			var10[var11][i] = v
		end
	end
	self.__inputSignal:fire(var8)
end

function t:renderStep(p16)
	if p16 == nil then
		p16 = 0.033333333333
	end
	self.__renderStepped:fire(p16)
end

function t:connectGamepad(p17)
	assert(typeof(p17) == "EnumItem" and p17.EnumType == Enum.UserInputType, "Invalid argument #1: expected a member of Enum.UserInputType")
	self.__connectedGamepads[p17] = true
	self:__initializeGamepadState(p17)
	self.__gamepadConnected:fire(p17)
end

function t:disconnectGamepad(p18)
	assert(typeof(p18) == "EnumItem" and p18.EnumType == Enum.UserInputType, "Invalid argument #1: expected a member of Enum.UserInputType")
	self.__connectedGamepads[p18] = nil
	self.__gamepadDisconnected:fire(p18)
end

return t
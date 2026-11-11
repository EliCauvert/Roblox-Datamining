local DebugPrintModule = require(script.Parent.debugPrint)
local InputBindingKindModule = require(script.Parent.InputBindingKind)
local ConfigModule = require(script.Parent.Config)
local config = {
	[Enum.UserInputType.Keyboard] = true,
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local t = {}

local function _()
	return {
		gamepadConnectedConnection = nil,
		gamepadDisconnectedConnection = nil,
		onStepConnections = 0,
		primaryGamepadState = {}
	}
end

local _ = function(Key)
	-- upvalues: t (copy)
	if t[Key] == nil then
		t[Key] = {
			gamepadConnectedConnection = nil,
			gamepadDisconnectedConnection = nil,
			onStepConnections = 0,
			primaryGamepadState = {}
		}
	end
	return t[Key]
end

local function updatePrimaryGamepad(Key)
	-- upvalues: t (copy)
	if t[Key] == nil then
		t[Key] = {
			gamepadConnectedConnection = nil,
			gamepadDisconnectedConnection = nil,
			onStepConnections = 0,
			primaryGamepadState = {}
		}
	end
	local Entry = t[Key]
	local Gamepad1 = Enum.UserInputType.Gamepad1
	
	for _, value in ipairs(Key.getNavigationGamepads()) do
		if Key.getGamepadConnected(value) then
			Gamepad1 = value
			break
		end
	end
	local GamepadState = Key.getGamepadState(Gamepad1)
	Entry.primaryGamepadState = {}
	
	for _, Input in ipairs(GamepadState) do
		Entry.primaryGamepadState[Input.KeyCode] = Input
	end
end

local _ = function(p1, p2)
	-- upvalues: DebugPrintModule (copy)
	return function(Input)
		-- upvalues: p2 (copy), DebugPrintModule (upval), p1 (copy)
		if p2(Input) then
			DebugPrintModule("[EVENT] Process input: ", Input.KeyCode, "-", Input.UserInputState)
			p1(Input)
		end
	end
end

local function wrapWithGamepadStateListener(Key, Connection)
	-- upvalues: t (copy), updatePrimaryGamepad (copy)
	if t[Key] == nil then
		t[Key] = {
			gamepadConnectedConnection = nil,
			gamepadDisconnectedConnection = nil,
			onStepConnections = 0,
			primaryGamepadState = {}
		}
	end
	local Entry = t[Key]
	
	if Entry.onStepConnections == 0 then
		updatePrimaryGamepad(Key)
		Entry.gamepadConnectedConnection = Key.subscribeToGamepadConnected(function()
			-- upvalues: updatePrimaryGamepad (upval), Key (copy)
			updatePrimaryGamepad(Key)
		end)
		Entry.gamepadDisconnectedConnection = Key.subscribeToGamepadDisconnected(function()
			-- upvalues: updatePrimaryGamepad (upval), Key (copy)
			updatePrimaryGamepad(Key)
		end)
	end
	Entry.onStepConnections += 1
	
	return function()
		-- upvalues: Connection (copy), Entry (copy)
		Connection:Disconnect()
		Entry.onStepConnections -= 1
		
		if Entry.onStepConnections == 0 then
			Entry.gamepadConnectedConnection:Disconnect()
			Entry.gamepadConnectedConnection = nil
			Entry.gamepadDisconnectedConnection:Disconnect()
			Entry.gamepadDisconnectedConnection = nil
		end
	end
end

local _ = function(Kind)
	return function(KeyCode, Action, Meta)
		-- upvalues: Kind (copy)
		assert(typeof(KeyCode) == "EnumItem" and KeyCode.EnumType == Enum.KeyCode, "Invalid argument #1: expected a member of Enum.KeyCode")
		assert(typeof(Action) == "function", "Invalid argument #2: expected a function")
		
		return {
			kind = Kind,
			keyCode = KeyCode,
			action = Action,
			meta = Meta
		}
	end
end

local Begin = InputBindingKindModule.Begin

local function OnBegin(KeyCode, Action, Meta)
	-- upvalues: Begin (copy)
	assert(typeof(KeyCode) == "EnumItem" and KeyCode.EnumType == Enum.KeyCode, "Invalid argument #1: expected a member of Enum.KeyCode")
	assert(typeof(Action) == "function", "Invalid argument #2: expected a function")
	
	return {
		kind = Begin,
		keyCode = KeyCode,
		action = Action,
		meta = Meta
	}
end

local End = InputBindingKindModule.End

local function OnEnd(KeyCode, Action, Meta)
	-- upvalues: End (copy)
	assert(typeof(KeyCode) == "EnumItem" and KeyCode.EnumType == Enum.KeyCode, "Invalid argument #1: expected a member of Enum.KeyCode")
	assert(typeof(Action) == "function", "Invalid argument #2: expected a function")
	
	return {
		kind = End,
		keyCode = KeyCode,
		action = Action,
		meta = Meta
	}
end

local Step = InputBindingKindModule.Step

return {
	getUniqueKey = function(p1): string
		return if p1.keyCode then tostring(p1.kind) .. "-" .. tostring(p1.keyCode) else tostring(p1.kind)
	end,
	connectToEvent = function(p1, Key)
		-- upvalues: ConfigModule (copy), InputBindingKindModule (copy), config (copy), DebugPrintModule (copy), t (copy), wrapWithGamepadStateListener (copy)
		local function _(Input): boolean
			-- upvalues: ConfigModule (upval), p1 (copy)
			if ConfigModule.DebugKeyboardBindings and table.find(ConfigModule.DebugKeyboardBindings[p1.keyCode] or {}, Input.KeyCode) then
				return true
			else
				return Input.KeyCode == p1.keyCode
			end
		end
		
		if p1.kind == InputBindingKindModule.Begin then
			local function matchInput(Input)
				-- upvalues: config (upval), ConfigModule (upval), p1 (copy)
				local Entry = config[Input.UserInputType]
				
				if Entry then
					Entry = false
					
					if Input.UserInputState == Enum.UserInputState.Begin then
						if ConfigModule.DebugKeyboardBindings and table.find(ConfigModule.DebugKeyboardBindings[p1.keyCode] or {}, Input.KeyCode) then
							return true
						end
						Entry = Input.KeyCode == p1.keyCode
					end
				end
				return Entry
			end
			
			local Action = p1.action
			local SubscribeToInputBeganResult = Key.subscribeToInputBegan(function(Input)
				-- upvalues: matchInput (copy), DebugPrintModule (upval), Action (copy)
				if matchInput(Input) then
					DebugPrintModule("[EVENT] Process input: ", Input.KeyCode, "-", Input.UserInputState)
					Action(Input)
				end
			end)
			
			return function()
				-- upvalues: SubscribeToInputBeganResult (copy)
				SubscribeToInputBeganResult:Disconnect()
			end
		end
		if p1.kind == InputBindingKindModule.End then
			local function matchInput1(Input)
				-- upvalues: config (upval), ConfigModule (upval), p1 (copy)
				local Entry = config[Input.UserInputType]
				
				if Entry then
					Entry = false
					
					if Input.UserInputState == Enum.UserInputState.End then
						if ConfigModule.DebugKeyboardBindings and table.find(ConfigModule.DebugKeyboardBindings[p1.keyCode] or {}, Input.KeyCode) then
							return true
						end
						Entry = Input.KeyCode == p1.keyCode
					end
				end
				return Entry
			end
			
			local ActionFunction = p1.action
			local SubscribeToInputEndedResult = Key.subscribeToInputEnded(function(Input)
				-- upvalues: matchInput1 (copy), DebugPrintModule (upval), ActionFunction (copy)
				if matchInput1(Input) then
					DebugPrintModule("[EVENT] Process input: ", Input.KeyCode, "-", Input.UserInputState)
					ActionFunction(Input)
				end
			end)
			
			return function()
				-- upvalues: SubscribeToInputEndedResult (copy)
				SubscribeToInputEndedResult:Disconnect()
			end
		end
		if p1.kind == InputBindingKindModule.Step then
			if t[Key] == nil then
				t[Key] = {
					gamepadConnectedConnection = nil,
					gamepadDisconnectedConnection = nil,
					onStepConnections = 0,
					primaryGamepadState = {}
				}
			end
			local Entry = t[Key]
			
			return (wrapWithGamepadStateListener(Key, (Key.subscribeToRenderStepped(function(p2)
				-- upvalues: p1 (copy), Entry (copy)
				p1.action(Entry.primaryGamepadState[p1.keyCode], p2)
			end))))
		else
			if p1.kind ~= InputBindingKindModule.MoveStep then
				return nil
			end
			if t[Key] == nil then
				t[Key] = {
					gamepadConnectedConnection = nil,
					gamepadDisconnectedConnection = nil,
					onStepConnections = 0,
					primaryGamepadState = {}
				}
			end
			local Entry1 = t[Key]
			
			return (wrapWithGamepadStateListener(Key, (Key.subscribeToRenderStepped(function(p2)
				-- upvalues: Entry1 (copy), p1 (copy)
				p1.action({
					[Enum.KeyCode.Thumbstick1] = Entry1.primaryGamepadState[Enum.KeyCode.Thumbstick1],
					[Enum.KeyCode.DPadUp] = Entry1.primaryGamepadState[Enum.KeyCode.DPadUp],
					[Enum.KeyCode.DPadDown] = Entry1.primaryGamepadState[Enum.KeyCode.DPadDown],
					[Enum.KeyCode.DPadLeft] = Entry1.primaryGamepadState[Enum.KeyCode.DPadLeft],
					[Enum.KeyCode.DPadRight] = Entry1.primaryGamepadState[Enum.KeyCode.DPadRight]
				}, p2)
			end))))
		end
	end,
	PublicInterface = {
		onBegin = OnBegin,
		onEnd = OnEnd,
		onStep = function(KeyCode, Action, Meta)
			-- upvalues: Step (copy)
			assert(typeof(KeyCode) == "EnumItem" and KeyCode.EnumType == Enum.KeyCode, "Invalid argument #1: expected a member of Enum.KeyCode")
			assert(typeof(Action) == "function", "Invalid argument #2: expected a function")
			
			return {
				kind = Step,
				keyCode = KeyCode,
				action = Action,
				meta = Meta
			}
		end,
		onMoveStep = function(Action)
			-- upvalues: InputBindingKindModule (copy)
			return { kind = InputBindingKindModule.MoveStep, action = Action }
		end
	}
}
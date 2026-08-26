local debugPrintModule = require(script.Parent.debugPrint)
local inputBindingKindModule = require(script.Parent.InputBindingKind)
local configModule = require(script.Parent.Config)
local t = {
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
local t_1 = {}

local function _()
	return {
		gamepadConnectedConnection = nil,
		gamepadDisconnectedConnection = nil,
		onStepConnections = 0,
		primaryGamepadState = {}
	}
end

local _ = function(p1)
	-- upvalues: t_1 (ref)
	if t_1[p1] == nil then
		t_1[p1] = {
			gamepadConnectedConnection = nil,
			gamepadDisconnectedConnection = nil,
			onStepConnections = 0,
			primaryGamepadState = {}
		}
	end
	return t_1[p1]
end

local function updatePrimaryGamepad(p1)
	-- upvalues: t_1 (ref)
	if t_1[p1] == nil then
		t_1[p1] = {
			gamepadConnectedConnection = nil,
			gamepadDisconnectedConnection = nil,
			onStepConnections = 0,
			primaryGamepadState = {}
		}
	end
	local var1 = t_1[p1]
	local gamepad1 = Enum.UserInputType.Gamepad1
	
	for i, v in ipairs(p1.getNavigationGamepads()) do
		if p1.getGamepadConnected(v) then
			gamepad1 = v
			break
		end
	end
	local gamepadState = p1.getGamepadState(gamepad1)
	var1.primaryGamepadState = {}
	
	for v, v_1 in ipairs(gamepadState) do
		var1.primaryGamepadState[v_1.KeyCode] = v_1
	end
end

local _ = function(p2, p3)
	-- upvalues: debugPrintModule (ref)
	return function(p4)
		-- upvalues: p3 (ref), debugPrintModule (copy), p2 (ref)
		if p3(p4) then
			debugPrintModule("[EVENT] Process input: ", p4.KeyCode, "-", p4.UserInputState)
			p2(p4)
		end
	end
end

local function wrapWithGamepadStateListener(p2, p3)
	-- upvalues: t_1 (ref), updatePrimaryGamepad (ref)
	if t_1[p2] == nil then
		t_1[p2] = {
			gamepadConnectedConnection = nil,
			gamepadDisconnectedConnection = nil,
			onStepConnections = 0,
			primaryGamepadState = {}
		}
	end
	local var2 = t_1[p2]
	
	if var2.onStepConnections == 0 then
		updatePrimaryGamepad(p2)
		var2.gamepadConnectedConnection = p2.subscribeToGamepadConnected(function()
			-- upvalues: updatePrimaryGamepad (copy), p2 (ref)
			updatePrimaryGamepad(p2)
		end)
		var2.gamepadDisconnectedConnection = p2.subscribeToGamepadDisconnected(function()
			-- upvalues: updatePrimaryGamepad (copy), p2 (ref)
			updatePrimaryGamepad(p2)
		end)
	end
	var2.onStepConnections += 1
	
	return function()
		-- upvalues: p3 (ref), var2 (ref)
		p3:Disconnect()
		var2.onStepConnections -= 1
		
		if var2.onStepConnections == 0 then
			var2.gamepadConnectedConnection:Disconnect()
			var2.gamepadConnectedConnection = nil
			var2.gamepadDisconnectedConnection:Disconnect()
			var2.gamepadDisconnectedConnection = nil
		end
	end
end

local function connectToEvent(p2, p3)
	-- upvalues: configModule (ref), inputBindingKindModule (ref), t (ref), debugPrintModule (ref), t_1 (ref), wrapWithGamepadStateListener (ref)
	local function _(p4)
		-- upvalues: configModule (copy), p2 (ref)
		return if configModule.DebugKeyboardBindings and table.find(configModule.DebugKeyboardBindings[p2.keyCode] or {}, p4.KeyCode) then true else p4.KeyCode == p2.keyCode
	end
	
	if p2.kind == inputBindingKindModule.Begin then
		local function matchInput(p4)
			-- upvalues: t (copy), configModule (copy), p2 (ref)
			local userInputType = t[p4.UserInputType]
			
			if userInputType then
				userInputType = false
				
				if p4.UserInputState == Enum.UserInputState.Begin then
					if configModule.DebugKeyboardBindings and table.find(configModule.DebugKeyboardBindings[p2.keyCode] or {}, p4.KeyCode) then
						return true
					end
					userInputType = p4.KeyCode == p2.keyCode
				end
			end
			return userInputType
		end
		
		local action = p2.action
		local var2 = p3.subscribeToInputBegan(function(p4)
			-- upvalues: matchInput (ref), debugPrintModule (copy), action (ref)
			if matchInput(p4) then
				debugPrintModule("[EVENT] Process input: ", p4.KeyCode, "-", p4.UserInputState)
				action(p4)
			end
		end)
		
		return function()
			-- upvalues: var2 (ref)
			var2:Disconnect()
		end
	elseif p2.kind == inputBindingKindModule.End then
		local function matchInput(p4)
			-- upvalues: t (copy), configModule (copy), p2 (ref)
			local userInputType = t[p4.UserInputType]
			
			if userInputType then
				userInputType = false
				
				if p4.UserInputState == Enum.UserInputState.End then
					if configModule.DebugKeyboardBindings and table.find(configModule.DebugKeyboardBindings[p2.keyCode] or {}, p4.KeyCode) then
						return true
					end
					userInputType = p4.KeyCode == p2.keyCode
				end
			end
			return userInputType
		end
		
		local action = p2.action
		local var3 = p3.subscribeToInputEnded(function(p4)
			-- upvalues: matchInput (ref), debugPrintModule (copy), action (ref)
			if matchInput(p4) then
				debugPrintModule("[EVENT] Process input: ", p4.KeyCode, "-", p4.UserInputState)
				action(p4)
			end
		end)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	elseif p2.kind == inputBindingKindModule.Step then
		if t_1[p3] == nil then
			t_1[p3] = {
				gamepadConnectedConnection = nil,
				gamepadDisconnectedConnection = nil,
				onStepConnections = 0,
				primaryGamepadState = {}
			}
		end
		local var4 = t_1[p3]
		
		return wrapWithGamepadStateListener(p3, p3.subscribeToRenderStepped(function(p4)
			-- upvalues: p2 (ref), var4 (ref)
			p2.action(var4.primaryGamepadState[p2.keyCode], p4)
		end))
	elseif p2.kind ~= inputBindingKindModule.MoveStep then
		return nil
	elseif t_1[p3] == nil then
		t_1[p3] = {
			gamepadConnectedConnection = nil,
			gamepadDisconnectedConnection = nil,
			onStepConnections = 0,
			primaryGamepadState = {}
		}
	end
	local var5 = t_1[p3]
	
	return wrapWithGamepadStateListener(p3, p3.subscribeToRenderStepped(function(p4)
		-- upvalues: var5 (ref), p2 (ref)
		p2.action({
			[Enum.KeyCode.Thumbstick1] = var5.primaryGamepadState[Enum.KeyCode.Thumbstick1],
			[Enum.KeyCode.DPadUp] = var5.primaryGamepadState[Enum.KeyCode.DPadUp],
			[Enum.KeyCode.DPadDown] = var5.primaryGamepadState[Enum.KeyCode.DPadDown],
			[Enum.KeyCode.DPadLeft] = var5.primaryGamepadState[Enum.KeyCode.DPadLeft],
			[Enum.KeyCode.DPadRight] = var5.primaryGamepadState[Enum.KeyCode.DPadRight]
		}, p4)
	end))
end

local _ = function(p2)
	return function(p3, p4, p5)
		-- upvalues: p2 (ref)
		assert(typeof(p3) == "EnumItem" and p3.EnumType == Enum.KeyCode, "Invalid argument #1: expected a member of Enum.KeyCode")
		assert(typeof(p4) == "function", "Invalid argument #2: expected a function")
		
		return { kind = p2, keyCode = p3, action = p4, meta = p5 }
	end
end

local function onMoveStepInputBinding(p2)
	-- upvalues: inputBindingKindModule (ref)
	return { kind = inputBindingKindModule.MoveStep, action = p2 }
end

local t_2 = {
	getUniqueKey = function(p2)
		return if p2.keyCode then tostring(p2.kind) .. "-" .. tostring(p2.keyCode) else tostring(p2.kind)
	end,
	connectToEvent = connectToEvent
}
local t_3 = {}
local begin = inputBindingKindModule.Begin

function t_3.onBegin(p2, p3, p4)
	-- upvalues: begin (ref)
	assert(typeof(p2) == "EnumItem" and p2.EnumType == Enum.KeyCode, "Invalid argument #1: expected a member of Enum.KeyCode")
	assert(typeof(p3) == "function", "Invalid argument #2: expected a function")
	
	return { kind = begin, keyCode = p2, action = p3, meta = p4 }
end

local _end = inputBindingKindModule.End

function t_3.onEnd(p2, p3, p4)
	-- upvalues: _end (ref)
	assert(typeof(p2) == "EnumItem" and p2.EnumType == Enum.KeyCode, "Invalid argument #1: expected a member of Enum.KeyCode")
	assert(typeof(p3) == "function", "Invalid argument #2: expected a function")
	
	return { kind = _end, keyCode = p2, action = p3, meta = p4 }
end

local step = inputBindingKindModule.Step

function t_3.onStep(p2, p3, p4)
	-- upvalues: step (ref)
	assert(typeof(p2) == "EnumItem" and p2.EnumType == Enum.KeyCode, "Invalid argument #1: expected a member of Enum.KeyCode")
	assert(typeof(p3) == "function", "Invalid argument #2: expected a function")
	
	return { kind = step, keyCode = p2, action = p3, meta = p4 }
end

t_3.onMoveStep = onMoveStepInputBinding
t_2.PublicInterface = t_3

return t_2
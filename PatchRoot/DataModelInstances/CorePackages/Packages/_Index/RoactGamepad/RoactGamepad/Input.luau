-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

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

local function _() --[[ line: 26 | named "initializeEngineGamepadState" ]]
	return {
		gamepadConnectedConnection = nil,
		gamepadDisconnectedConnection = nil,
		onStepConnections = 0,
		primaryGamepadState = {}
	}
end

local _ = function(p0) --[[ line: 35 | named "getEngineState" ]]
	-- upvalues: t_1 (ref)
	if t_1[p0] == nil then
		t_1[p0] = {
			gamepadConnectedConnection = nil,
			gamepadDisconnectedConnection = nil,
			onStepConnections = 0,
			primaryGamepadState = {}
		}
	end
	return t_1[p0]
end

local function updatePrimaryGamepad(p1) --[[ line: 43 ]]
	-- upvalues: t_1 (ref)
	if t_1[p1] == nil then
		t_1[p1] = {
			gamepadConnectedConnection = nil,
			gamepadDisconnectedConnection = nil,
			onStepConnections = 0,
			primaryGamepadState = {}
		}
	end
	local var11 = t_1[p1]
	local gamepad1 = Enum.UserInputType.Gamepad1
	
	for i, v in ipairs(p1.getNavigationGamepads()) do
		if p1.getGamepadConnected(v) then
			gamepad1 = v
			break
		end
	end
	local gamepadState = p1.getGamepadState(gamepad1)
	var11.primaryGamepadState = {}
	
	for v, v_1 in ipairs(gamepadState) do
		var11.primaryGamepadState[v_1.KeyCode] = v_1
	end
end

local _ = function(p2, p3) --[[ line: 64 | named "getInputEvent" ]]
	-- upvalues: debugPrintModule (ref)
	return function(p4) --[[ line: 65 ]]
		-- upvalues: p3 (ref), debugPrintModule (copy), p2 (ref)
		if p3(p4) then
			debugPrintModule("[EVENT] Process input: ", p4.KeyCode, "-", p4.UserInputState)
			p2(p4)
		end
	end
end

local function wrapWithGamepadStateListener(p5, p6) --[[ line: 73 ]]
	-- upvalues: t_1 (ref), updatePrimaryGamepad (ref)
	if t_1[p5] == nil then
		t_1[p5] = {
			gamepadConnectedConnection = nil,
			gamepadDisconnectedConnection = nil,
			onStepConnections = 0,
			primaryGamepadState = {}
		}
	end
	local var13 = t_1[p5]
	
	if var13.onStepConnections == 0 then
		updatePrimaryGamepad(p5)
		var13.gamepadConnectedConnection = p5.subscribeToGamepadConnected(function() --[[ line: 78 ]]
			-- upvalues: updatePrimaryGamepad (copy), p5 (ref)
			updatePrimaryGamepad(p5)
		end)
		var13.gamepadDisconnectedConnection = p5.subscribeToGamepadDisconnected(function() --[[ line: 81 ]]
			-- upvalues: updatePrimaryGamepad (copy), p5 (ref)
			updatePrimaryGamepad(p5)
		end)
	end
	var13.onStepConnections += 1
	
	return function() --[[ line: 87 ]]
		-- upvalues: p6 (ref), var13 (ref)
		p6:Disconnect()
		var13.onStepConnections -= 1
		
		if var13.onStepConnections == 0 then
			var13.gamepadConnectedConnection:Disconnect()
			var13.gamepadConnectedConnection = nil
			var13.gamepadDisconnectedConnection:Disconnect()
			var13.gamepadDisconnectedConnection = nil
		end
	end
end

local function connectToEvent(p7, p8) --[[ line: 101 ]]
	-- upvalues: configModule (ref), inputBindingKindModule (ref), t (ref), debugPrintModule (ref), t_1 (ref), wrapWithGamepadStateListener (ref)
	local function _(p9) --[[ line: 102 | named "matchesBindingKeyCode" ]]
		-- upvalues: configModule (copy), p7 (ref)
		return if configModule.DebugKeyboardBindings and table.find(configModule.DebugKeyboardBindings[p7.keyCode] or {}, p9.KeyCode) then true else p9.KeyCode == p7.keyCode
	end
	
	if p7.kind == inputBindingKindModule.Begin then
		local function matchInput(p10) --[[ line: 114 ]]
			-- upvalues: t (copy), configModule (copy), p7 (ref)
			local userInputType = t[p10.UserInputType]
			
			if userInputType then
				userInputType = false
				
				if p10.UserInputState == Enum.UserInputState.Begin then
					if configModule.DebugKeyboardBindings and table.find(configModule.DebugKeyboardBindings[p7.keyCode] or {}, p10.KeyCode) then
						return true
					end
					userInputType = p10.KeyCode == p7.keyCode
				end
			end
			return userInputType
		end
		
		local action = p7.action
		local var15 = p8.subscribeToInputBegan(function(p11) --[[ line: 65 ]]
			-- upvalues: matchInput (ref), debugPrintModule (copy), action (ref)
			if matchInput(p11) then
				debugPrintModule("[EVENT] Process input: ", p11.KeyCode, "-", p11.UserInputState)
				action(p11)
			end
		end)
		
		return function() --[[ line: 122 ]]
			-- upvalues: var15 (ref)
			var15:Disconnect()
		end
	elseif p7.kind == inputBindingKindModule.End then
		local function matchInput(p12) --[[ line: 126 ]]
			-- upvalues: t (copy), configModule (copy), p7 (ref)
			local userInputType = t[p12.UserInputType]
			
			if userInputType then
				userInputType = false
				
				if p12.UserInputState == Enum.UserInputState.End then
					if configModule.DebugKeyboardBindings and table.find(configModule.DebugKeyboardBindings[p7.keyCode] or {}, p12.KeyCode) then
						return true
					end
					userInputType = p12.KeyCode == p7.keyCode
				end
			end
			return userInputType
		end
		
		local action = p7.action
		local var17 = p8.subscribeToInputEnded(function(p13) --[[ line: 65 ]]
			-- upvalues: matchInput (ref), debugPrintModule (copy), action (ref)
			if matchInput(p13) then
				debugPrintModule("[EVENT] Process input: ", p13.KeyCode, "-", p13.UserInputState)
				action(p13)
			end
		end)
		
		return function() --[[ line: 134 ]]
			-- upvalues: var17 (ref)
			var17:Disconnect()
		end
	elseif p7.kind == inputBindingKindModule.Step then
		if t_1[p8] == nil then
			t_1[p8] = {
				gamepadConnectedConnection = nil,
				gamepadDisconnectedConnection = nil,
				onStepConnections = 0,
				primaryGamepadState = {}
			}
		end
		local var18 = t_1[p8]
		
		return wrapWithGamepadStateListener(p8, p8.subscribeToRenderStepped(function(p14) --[[ line: 140 ]]
			-- upvalues: p7 (ref), var18 (ref)
			p7.action(var18.primaryGamepadState[p7.keyCode], p14)
		end))
	elseif p7.kind ~= inputBindingKindModule.MoveStep then
		return nil
	elseif t_1[p8] == nil then
		t_1[p8] = {
			gamepadConnectedConnection = nil,
			gamepadDisconnectedConnection = nil,
			onStepConnections = 0,
			primaryGamepadState = {}
		}
	end
	local var19 = t_1[p8]
	
	return wrapWithGamepadStateListener(p8, p8.subscribeToRenderStepped(function(p15) --[[ line: 149 ]]
		-- upvalues: var19 (ref), p7 (ref)
		p7.action({
			[Enum.KeyCode.Thumbstick1] = var19.primaryGamepadState[Enum.KeyCode.Thumbstick1],
			[Enum.KeyCode.DPadUp] = var19.primaryGamepadState[Enum.KeyCode.DPadUp],
			[Enum.KeyCode.DPadDown] = var19.primaryGamepadState[Enum.KeyCode.DPadDown],
			[Enum.KeyCode.DPadLeft] = var19.primaryGamepadState[Enum.KeyCode.DPadLeft],
			[Enum.KeyCode.DPadRight] = var19.primaryGamepadState[Enum.KeyCode.DPadRight]
		}, p15)
	end))
end

local _ = function(p16) --[[ line: 167 | named "makeInputBinding" ]]
	return function(p17, p18, p19) --[[ line: 168 ]]
		-- upvalues: p16 (ref)
		assert(typeof(p17) == "EnumItem" and p17.EnumType == Enum.KeyCode, "Invalid argument #1: expected a member of Enum.KeyCode")
		assert(typeof(p18) == "function", "Invalid argument #2: expected a function")
		
		return { kind = p16, keyCode = p17, action = p18, meta = p19 }
	end
end

local function onMoveStepInputBinding(p20) --[[ line: 184 ]]
	-- upvalues: inputBindingKindModule (ref)
	return { kind = inputBindingKindModule.MoveStep, action = p20 }
end

local t_2 = {
	getUniqueKey = function(p21) --[[ line: 191 ]]
		return if p21.keyCode then tostring(p21.kind) .. "-" .. tostring(p21.keyCode) else tostring(p21.kind)
	end,
	connectToEvent = connectToEvent
}
local t_3 = {}
local begin = inputBindingKindModule.Begin

function t_3.onBegin(p22, p23, p24) --[[ line: 168 ]]
	-- upvalues: begin (ref)
	assert(typeof(p22) == "EnumItem" and p22.EnumType == Enum.KeyCode, "Invalid argument #1: expected a member of Enum.KeyCode")
	assert(typeof(p23) == "function", "Invalid argument #2: expected a function")
	
	return { kind = begin, keyCode = p22, action = p23, meta = p24 }
end

local _end = inputBindingKindModule.End

function t_3.onEnd(p25, p26, p27) --[[ line: 168 ]]
	-- upvalues: _end (ref)
	assert(typeof(p25) == "EnumItem" and p25.EnumType == Enum.KeyCode, "Invalid argument #1: expected a member of Enum.KeyCode")
	assert(typeof(p26) == "function", "Invalid argument #2: expected a function")
	
	return { kind = _end, keyCode = p25, action = p26, meta = p27 }
end

local step = inputBindingKindModule.Step

function t_3.onStep(p28, p29, p30) --[[ line: 168 ]]
	-- upvalues: step (ref)
	assert(typeof(p28) == "EnumItem" and p28.EnumType == Enum.KeyCode, "Invalid argument #1: expected a member of Enum.KeyCode")
	assert(typeof(p29) == "function", "Invalid argument #2: expected a function")
	
	return { kind = step, keyCode = p28, action = p29, meta = p30 }
end

t_3.onMoveStep = onMoveStepInputBinding
t_2.PublicInterface = t_3

return t_2
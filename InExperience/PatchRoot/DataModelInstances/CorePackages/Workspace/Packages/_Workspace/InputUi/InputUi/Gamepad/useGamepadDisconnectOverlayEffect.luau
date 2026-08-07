local parent = script:FindFirstAncestor("InputUi").Parent
local reactModule = require(parent.React)
local useInputType = require(parent.RoactUtils).Hooks.useInputType
local inputTypeConstants = require(parent.InputType).InputTypeConstants
local useIsGamepad = require(parent.RoactUtils).Hooks.useIsGamepad
local useGamepadConnectedEventModule = require(script.Parent.useGamepadConnectedEvent)
local enableGamepadHookForCorescriptGlobalEffects = game:DefineFastFlag("EnableGamepadHookForCorescriptGlobalEffects", false)

return function(p0, p1, p2, p3) --[[ line: 11 | named "useGamepadDisconnectOverlayEffect" ]]
	-- upvalues: enableGamepadHookForCorescriptGlobalEffects (ref), useIsGamepad (ref), useInputType (ref), inputTypeConstants (ref), reactModule (ref), useGamepadConnectedEventModule (ref)
	local var3 = if enableGamepadHookForCorescriptGlobalEffects then useIsGamepad() else useInputType() == inputTypeConstants.Gamepad
	local var4 = reactModule.useRef(false)
	useGamepadConnectedEventModule(reactModule.useCallback(function() --[[ line: 26 ]]
		-- upvalues: var4 (ref), p2 (ref), p3 (ref), p1 (ref)
		if var4.current then
			p2:sendEventDeferred(p3 or "", "gamepadConnectionEvent", { connectionEvent = "gamepadReconnected" })
			var4.current = false
			p1()
		end
	end, { p1 }), reactModule.useCallback(function() --[[ line: 38 ]]
		-- upvalues: var3 (write), var4 (ref), p2 (ref), p3 (ref), p0 (ref)
		if not var3 then return end
		if not var4.current then
			p2:sendEventDeferred(p3 or "", "gamepadConnectionEvent", { connectionEvent = "gamepadDisconnected" })
			var4.current = true
			p0()
		end
	end, { var3, p0 }))
end
local parent = script:FindFirstAncestor("InputUi").Parent
local reactModule = require(parent.React)
local useInputType = require(parent.RoactUtils).Hooks.useInputType
local inputTypeConstants = require(parent.InputType).InputTypeConstants
local useIsGamepad = require(parent.RoactUtils).Hooks.useIsGamepad
local useGamepadConnectedEventModule = require(script.Parent.useGamepadConnectedEvent)
local enableGamepadHookForCorescriptGlobalEffects = game:DefineFastFlag("EnableGamepadHookForCorescriptGlobalEffects", false)

return function(p1, p2, p3, p4)
	-- upvalues: enableGamepadHookForCorescriptGlobalEffects (ref), useIsGamepad (ref), useInputType (ref), inputTypeConstants (ref), reactModule (ref), useGamepadConnectedEventModule (ref)
	local var1 = if enableGamepadHookForCorescriptGlobalEffects then useIsGamepad() else useInputType() == inputTypeConstants.Gamepad
	local var2 = reactModule.useRef(false)
	useGamepadConnectedEventModule(reactModule.useCallback(function()
		-- upvalues: var2 (ref), p3 (ref), p4 (ref), p2 (ref)
		if var2.current then
			p3:sendEventDeferred(p4 or "", "gamepadConnectionEvent", { connectionEvent = "gamepadReconnected" })
			var2.current = false
			p2()
		end
	end, { p2 }), reactModule.useCallback(function()
		-- upvalues: var1 (write), var2 (ref), p3 (ref), p4 (ref), p1 (ref)
		if not var1 then return end
		if not var2.current then
			p3:sendEventDeferred(p4 or "", "gamepadConnectionEvent", { connectionEvent = "gamepadDisconnected" })
			var2.current = true
			p1()
		end
	end, { var1, p1 }))
end
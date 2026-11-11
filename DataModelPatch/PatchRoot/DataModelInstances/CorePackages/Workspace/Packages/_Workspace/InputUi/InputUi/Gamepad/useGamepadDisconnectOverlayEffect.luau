local Parent = script:FindFirstAncestor("InputUi").Parent
local ReactModule = require(Parent.React)
local UseInputTypeFunction = require(Parent.RoactUtils).Hooks.useInputType
local InputTypeConstants = require(Parent.InputType).InputTypeConstants
local UseIsGamepadFunction = require(Parent.RoactUtils).Hooks.useIsGamepad
local UseGamepadConnectedEventModule = require(script.Parent.useGamepadConnectedEvent)
local EnableGamepadHookForCorescriptGlobalEffects = game:DefineFastFlag("EnableGamepadHookForCorescriptGlobalEffects", false)

return function(Callback1, Callback, p1, p2)
	-- upvalues: EnableGamepadHookForCorescriptGlobalEffects (copy), UseIsGamepadFunction (copy), UseInputTypeFunction (copy), InputTypeConstants (copy), ReactModule (copy), UseGamepadConnectedEventModule (copy)
	local UseIsGamepadResult = nil
	UseIsGamepadResult = if EnableGamepadHookForCorescriptGlobalEffects then UseIsGamepadFunction() else UseInputTypeFunction() == InputTypeConstants.Gamepad
	local UseRefResult = ReactModule.useRef(false)
	UseGamepadConnectedEventModule(ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), p1 (copy), p2 (copy), Callback (copy)
		if UseRefResult.current then
			p1:sendEventDeferred(p2 or "", "gamepadConnectionEvent", { connectionEvent = "gamepadReconnected" })
			UseRefResult.current = false
			Callback()
		end
	end, { Callback }), (ReactModule.useCallback(function()
		-- upvalues: UseIsGamepadResult (ref), UseRefResult (copy), p1 (copy), p2 (copy), Callback1 (copy)
		if not UseIsGamepadResult then return end
		if not UseRefResult.current then
			p1:sendEventDeferred(p2 or "", "gamepadConnectionEvent", { connectionEvent = "gamepadDisconnected" })
			UseRefResult.current = true
			Callback1()
		end
	end, { UseIsGamepadResult, Callback1 })))
end
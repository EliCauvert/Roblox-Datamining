local contextActionService = game:GetService("ContextActionService")
local useEffect = require(script:FindFirstAncestor("AppChat").Parent.React).useEffect
local list = {
	Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward,
	Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight,
	Enum.PlayerActions.CharacterJump, Enum.KeyCode.LeftShift,
	Enum.KeyCode.RightShift, Enum.KeyCode.Tab, Enum.UserInputType.Gamepad1,
	Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3,
	Enum.UserInputType.Gamepad4, Enum.UserInputType.Touch,
	Enum.UserInputType.Keyboard, Enum.UserInputType.MouseButton1,
	Enum.UserInputType.MouseButton2
}

return function(p1)
	-- upvalues: useEffect (ref), contextActionService (ref), list (ref)
	useEffect(function()
		-- upvalues: p1 (ref), contextActionService (copy), list (copy)
		if p1 then
			contextActionService:BindCoreActionAtPriority("AppChatDisableGameControls", function(_, _, p2)
				return if p2.KeyCode == Enum.KeyCode.Escape then Enum.ContextActionResult.Pass else Enum.ContextActionResult.Sink
			end, false, Enum.ContextActionPriority.Low.Value, unpack(list))
		end
		return function()
			-- upvalues: p1 (copy), contextActionService (copy)
			if p1 then
				contextActionService:UnbindCoreAction("AppChatDisableGameControls")
			end
		end
	end, { p1 })
end
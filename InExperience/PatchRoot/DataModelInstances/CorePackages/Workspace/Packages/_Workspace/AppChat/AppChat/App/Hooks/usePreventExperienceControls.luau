local ContextActionService = game:GetService("ContextActionService")
local UseEffectFunction = require(script:FindFirstAncestor("AppChat").Parent.React).useEffect
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

return function(p1) --[[ Line: 31 ]]
	-- upvalues: UseEffectFunction (copy), ContextActionService (copy), list (copy)
	UseEffectFunction(function() --[[ Line: 32 ]]
		-- upvalues: p1 (copy), ContextActionService (upval), list (upval)
		if p1 then
			ContextActionService:BindCoreActionAtPriority("AppChatDisableGameControls", function(_, _, Input) --[[ Line: 34 ]]
				return if Input.KeyCode == Enum.KeyCode.Escape then Enum.ContextActionResult.Pass else Enum.ContextActionResult.Sink
			end, false, Enum.ContextActionPriority.Low.Value, unpack(list))
		end
		return function() --[[ Line: 43 ]]
			-- upvalues: p1 (upval), ContextActionService (upval)
			if p1 then
				ContextActionService:UnbindCoreAction("AppChatDisableGameControls")
			end
		end
	end, { p1 })
end
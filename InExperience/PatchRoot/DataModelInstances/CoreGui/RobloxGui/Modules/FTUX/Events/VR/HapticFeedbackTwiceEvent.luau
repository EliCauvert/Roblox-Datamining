local HapticsService = game:GetService("HapticService")
local _ = require(script.Parent.Parent.EventType)

return {
	Name = "HapticFeedbackTwiceEvent",
	StartEvent = function()
		-- upvalues: HapticsService (copy)
		local Gamepad1 = Enum.UserInputType.Gamepad1
		local Gamepad2 = Enum.UserInputType.Gamepad2
		
		for _ = 1, 2 do
			HapticsService:SetMotor(Gamepad1, Enum.VibrationMotor.Large, 5)
			HapticsService:SetMotor(Gamepad2, Enum.VibrationMotor.Large, 5)
			task.wait(0.5)
			HapticsService:SetMotor(Gamepad1, Enum.VibrationMotor.Large, 0)
			HapticsService:SetMotor(Gamepad2, Enum.VibrationMotor.Large, 0)
			task.wait(0.125)
		end
	end
}
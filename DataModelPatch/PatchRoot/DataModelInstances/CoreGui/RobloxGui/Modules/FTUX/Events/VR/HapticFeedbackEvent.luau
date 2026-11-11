local HapticsService = game:GetService("HapticService")
local _ = require(script.Parent.Parent.EventType)

return {
	Name = "HapticFeedbackEvent",
	StartEvent = function()
		-- upvalues: HapticsService (copy)
		local Gamepad1 = Enum.UserInputType.Gamepad1
		local Gamepad2 = Enum.UserInputType.Gamepad2
		HapticsService:SetMotor(Gamepad1, Enum.VibrationMotor.Large, 10)
		HapticsService:SetMotor(Gamepad2, Enum.VibrationMotor.Large, 10)
		task.wait(1)
		HapticsService:SetMotor(Gamepad1, Enum.VibrationMotor.Large, 0)
		HapticsService:SetMotor(Gamepad2, Enum.VibrationMotor.Large, 0)
	end
}
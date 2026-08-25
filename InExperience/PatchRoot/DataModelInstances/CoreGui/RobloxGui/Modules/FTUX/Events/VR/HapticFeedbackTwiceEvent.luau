local hapticService = game:GetService("HapticService")
local _ = require(script.Parent.Parent.EventType)

return {
	Name = "HapticFeedbackTwiceEvent",
	StartEvent = function()
		-- upvalues: hapticService (ref)
		local gamepad1 = Enum.UserInputType.Gamepad1
		local gamepad2 = Enum.UserInputType.Gamepad2
		
		for _ = 1, 2 do
			hapticService:SetMotor(gamepad1, Enum.VibrationMotor.Large, 5)
			hapticService:SetMotor(gamepad2, Enum.VibrationMotor.Large, 5)
			task.wait(0.5)
			hapticService:SetMotor(gamepad1, Enum.VibrationMotor.Large, 0)
			hapticService:SetMotor(gamepad2, Enum.VibrationMotor.Large, 0)
			task.wait(0.125)
		end
	end
}
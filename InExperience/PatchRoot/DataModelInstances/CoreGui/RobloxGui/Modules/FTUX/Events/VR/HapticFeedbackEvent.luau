local hapticService = game:GetService("HapticService")
local _ = require(script.Parent.Parent.EventType)

return {
	Name = "HapticFeedbackEvent",
	StartEvent = function() --[[ line: 10 ]]
		-- upvalues: hapticService (ref)
		local gamepad1 = Enum.UserInputType.Gamepad1
		local gamepad2 = Enum.UserInputType.Gamepad2
		hapticService:SetMotor(gamepad1, Enum.VibrationMotor.Large, 10)
		hapticService:SetMotor(gamepad2, Enum.VibrationMotor.Large, 10)
		task.wait(1)
		hapticService:SetMotor(gamepad1, Enum.VibrationMotor.Large, 0)
		hapticService:SetMotor(gamepad2, Enum.VibrationMotor.Large, 0)
	end
}
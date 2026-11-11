local LoadSlicesModule = require(script.Parent.LoadSlices)
local UserInputService = game:GetService("UserInputService")
local ExperienceStateRecordingService = game:GetService("ExperienceStateRecordingService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

function computePercentX(p1, p2, p3)
	local X = p1.X
	
	return (p3 - X) / (X + p2.X - X)
end

local ControlScrubberModule = {
	jumpTo = function(p1)
		-- upvalues: Mouse (copy), LoadSlicesModule (copy), ExperienceStateRecordingService (copy)
		local PercentX: number = computePercentX(p1.ScrubberLoadProgress.AbsolutePosition, p1.ScrubberLoadProgress.AbsoluteSize, Mouse.X)
		
		if PercentX < 0 or PercentX > 1 then
			LoadSlicesModule.loadNoncontiguousSlice(p1, (computePercentX(p1.ScrubberButton.AbsolutePosition, p1.ScrubberButton.AbsoluteSize, Mouse.X)))
			
			return
		else
			ExperienceStateRecordingService:SetPlaybackPercentage(PercentX)
		end
	end
}

function ControlScrubberModule.setupControl(p1)
	-- upvalues: UserInputService (copy), ControlScrubberModule (copy)
	p1.ScrubberButton.MouseMoved:Connect(function()
		-- upvalues: UserInputService (upval), ControlScrubberModule (upval), p1 (copy)
		if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
			ControlScrubberModule.jumpTo(p1)
			
			return
		end
	end)
	p1.ScrubberButton.MouseButton1Down:Connect(function()
		-- upvalues: ControlScrubberModule (upval), p1 (copy)
		ControlScrubberModule.jumpTo(p1)
	end)
end

return ControlScrubberModule
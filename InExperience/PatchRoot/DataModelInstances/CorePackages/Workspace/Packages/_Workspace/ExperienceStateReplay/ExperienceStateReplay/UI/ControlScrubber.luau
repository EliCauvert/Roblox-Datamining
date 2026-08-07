local loadSlicesModule = require(script.Parent.LoadSlices)
local userInputService = game:GetService("UserInputService")
local experienceStateRecordingService = game:GetService("ExperienceStateRecordingService")
local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local t = {
	jumpTo = function(p0) --[[ line: 19 ]]
		-- upvalues: mouse (ref), loadSlicesModule (ref), experienceStateRecordingService (ref)
		local var5 = computePercentX(p0.ScrubberLoadProgress.AbsolutePosition, p0.ScrubberLoadProgress.AbsoluteSize, mouse.X)
		
		if var5 < 0 or var5 > 1 then
			loadSlicesModule.loadNoncontiguousSlice(p0, computePercentX(p0.ScrubberButton.AbsolutePosition, p0.ScrubberButton.AbsoluteSize, mouse.X))
			
			return
		end
		experienceStateRecordingService:SetPlaybackPercentage(var5)
	end
}

function computePercentX(p1, p2, p3) --[[ line: 13 ]]
	local x = p1.X
	
	return (p3 - x) / (x + p2.X - x)
end

function t.setupControl(value) --[[ line: 39 ]]
	-- upvalues: userInputService (ref), t (ref)
	value.ScrubberButton.MouseMoved:Connect(function() --[[ line: 40 ]]
		-- upvalues: userInputService (copy), t (copy), value (ref)
		if userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
			t.jumpTo(value)
			
			return
		end
	end)
	value.ScrubberButton.MouseButton1Down:Connect(function() --[[ line: 48 ]]
		-- upvalues: t (copy), value (ref)
		t.jumpTo(value)
	end)
end

return t
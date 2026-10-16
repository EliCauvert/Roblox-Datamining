local ExperienceStateRecordingService = game:GetService("ExperienceStateRecordingService")
local SecondsToTimeStrModule = require(script.Parent.SecondsToTimeStr)

return {
	setupListener = function(p1) --[[ Line: 9 ]]
		-- upvalues: ExperienceStateRecordingService (copy), SecondsToTimeStrModule (copy)
		ExperienceStateRecordingService.PlaybackStatusUpdated:Connect(function(XScale, _) --[[ Line: 10 ]]
			-- upvalues: p1 (copy), SecondsToTimeStrModule (upval)
			p1.ScrubberPlayProgress.Size = UDim2.new(XScale, 0, 1, 0)
			
			if p1.loadedLengthSeconds and p1.replayToLoadedStartSeconds then
				p1.CurrentTimeLabel.Text = SecondsToTimeStrModule.convertSecondsToTimeStr(XScale * p1.loadedLengthSeconds + p1.replayToLoadedStartSeconds)
			end
		end)
	end
}
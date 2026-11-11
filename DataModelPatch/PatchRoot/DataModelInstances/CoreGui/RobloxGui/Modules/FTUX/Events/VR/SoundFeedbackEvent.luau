local _ = require(script.Parent.Parent.EventType)

return {
	Name = "SoundFeedbackEvent",
	StartEvent = function()
		local Sound = Instance.new("Sound")
		Sound.Parent = game.Workspace
		Sound.SoundId = "rbxassetid://10066947742"
		Sound.Volume = 1
		Sound:Play()
	end
}
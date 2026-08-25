local _ = require(script.Parent.Parent.EventType)

return {
	Name = "SoundFeedbackEvent",
	StartEvent = function()
		local sound = Instance.new("Sound")
		sound.Parent = game.Workspace
		sound.SoundId = "rbxassetid://10066947742"
		sound.Volume = 1
		sound:Play()
	end
}
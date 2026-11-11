local _ = require(script:FindFirstAncestor("MusicTestingUtils").Parent.Songbird)

return function(p1, AudioType)
	local Sound = Instance.new("Sound")
	Sound.SoundId = `rbxassetid://{p1}`
	
	return {
		sound = Sound,
		metadata = {
			Title = "Sample Title",
			Artist = "Sample Artist",
			Duration = 120,
			AssetId = `{p1}`,
			RecordingCode = `recording-code-{p1}`,
			AudioType = AudioType
		}
	}
end
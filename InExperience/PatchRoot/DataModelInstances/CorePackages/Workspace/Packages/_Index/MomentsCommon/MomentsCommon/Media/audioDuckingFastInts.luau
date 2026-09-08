game:DefineFastInt("MomentsTTSVolumePercent", 100)
game:DefineFastInt("MomentsAudioDuckThresholdDb", -19)
game:DefineFastInt("MomentsAudioDuckAttackMs", 50)
game:DefineFastInt("MomentsAudioDuckReleaseMs", 200)
game:DefineFastInt("MomentsAudioDuckRatio", 4)
game:DefineFastInt("MomentsAudioDuckMakeupGainDb", 0)

return {
	getTtsVolume = function()
		return game:GetFastInt("MomentsTTSVolumePercent") / 100
	end,
	getCompressorParams = function()
		return {
			threshold = game:GetFastInt("MomentsAudioDuckThresholdDb"),
			ratio = game:GetFastInt("MomentsAudioDuckRatio"),
			attack = game:GetFastInt("MomentsAudioDuckAttackMs") / 1000,
			release = game:GetFastInt("MomentsAudioDuckReleaseMs") / 1000,
			makeupGain = game:GetFastInt("MomentsAudioDuckMakeupGainDb")
		}
	end
}
local AudioDuckingFastInts = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsCommon).Media.audioDuckingFastInts

return function(): number
	-- upvalues: AudioDuckingFastInts (copy)
	local CompressorParams = AudioDuckingFastInts.getCompressorParams()
	
	return if CompressorParams.ratio <= 0 then 1 else math.clamp(10 ^ ((CompressorParams.makeupGain - -CompressorParams.threshold * (1 - 1 / CompressorParams.ratio)) / 20), 0, 1)
end
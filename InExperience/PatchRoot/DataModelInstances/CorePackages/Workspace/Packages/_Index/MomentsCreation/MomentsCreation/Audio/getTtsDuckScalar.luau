local audioDuckingFastInts = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsCommon).Media.audioDuckingFastInts

return function()
	-- upvalues: audioDuckingFastInts (ref)
	local compressorParams = audioDuckingFastInts.getCompressorParams()
	
	return if compressorParams.ratio <= 0 then 1 else math.clamp(10 ^ ((compressorParams.makeupGain - -compressorParams.threshold * (1 - 1 / compressorParams.ratio)) / 20), 0, 1)
end
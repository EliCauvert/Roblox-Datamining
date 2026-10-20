local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local PreloadConstantsModule = require(MomentsCommon.Media.Preload.preloadConstants)
local PreloadFastIntsModule = require(MomentsCommon.Media.Preload.preloadFastInts)

return function(_)
	-- upvalues: PreloadFastIntsModule (copy), PreloadConstantsModule (copy)
	return {
		downloadWindow = PreloadFastIntsModule.getDownloadWindow(),
		decodeWindow = PreloadFastIntsModule.getDecodeWindow(),
		usePoster = PreloadConstantsModule.usePoster,
		decodeRetryDelayMs = PreloadFastIntsModule.getDecodeRetryDelayMs(),
		maxDecodeRetries = PreloadFastIntsModule.getMaxDecodeRetries()
	}
end
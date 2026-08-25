local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local preloadConstantsModule = require(momentsCommon.Media.Preload.preloadConstants)
local preloadFastIntsModule = require(momentsCommon.Media.Preload.preloadFastInts)

return function(_)
	-- upvalues: preloadFastIntsModule (ref), preloadConstantsModule (ref)
	return {
		downloadWindow = preloadFastIntsModule.getDownloadWindow(),
		decodeWindow = preloadFastIntsModule.getDecodeWindow(),
		usePoster = preloadConstantsModule.usePoster,
		decodeRetryDelayMs = preloadFastIntsModule.getDecodeRetryDelayMs(),
		maxDecodeRetries = preloadFastIntsModule.getMaxDecodeRetries()
	}
end
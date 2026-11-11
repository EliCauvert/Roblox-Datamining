local PreloadConstantsModule = require(script:FindFirstAncestor("MomentsCommon").Media.Preload.preloadConstants)

return function(_)
	-- upvalues: PreloadConstantsModule (copy)
	return {
		downloadWindow = PreloadConstantsModule.downloadWindow,
		decodeWindow = PreloadConstantsModule.decodeWindow,
		usePoster = PreloadConstantsModule.usePoster
	}
end
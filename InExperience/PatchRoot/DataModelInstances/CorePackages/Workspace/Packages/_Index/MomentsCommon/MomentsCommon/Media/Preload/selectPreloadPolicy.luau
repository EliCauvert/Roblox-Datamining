local preloadConstantsModule = require(script:FindFirstAncestor("MomentsCommon").Media.Preload.preloadConstants)

return function(_) --[[ line: 28 | named "selectPreloadPolicy" ]]
	-- upvalues: preloadConstantsModule (ref)
	return {
		downloadWindow = preloadConstantsModule.downloadWindow,
		decodeWindow = preloadConstantsModule.decodeWindow,
		usePoster = preloadConstantsModule.usePoster
	}
end
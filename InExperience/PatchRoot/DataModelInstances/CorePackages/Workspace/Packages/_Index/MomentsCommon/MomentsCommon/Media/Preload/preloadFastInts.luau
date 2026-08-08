local preloadConstantsModule = require(script:FindFirstAncestor("MomentsCommon").Media.Preload.preloadConstants)
game:DefineFastInt("MomentsPreloadDownloadWindowForward", preloadConstantsModule.downloadWindow.forward)
game:DefineFastInt("MomentsPreloadDownloadWindowBack", preloadConstantsModule.downloadWindow.back)
game:DefineFastInt("MomentsPreloadDecodeWindowForward", preloadConstantsModule.decodeWindow.forward)
game:DefineFastInt("MomentsPreloadDecodeWindowBack", preloadConstantsModule.decodeWindow.back)
game:DefineFastInt("MomentsPreloadDecodeRetryDelayMs", 2000)
game:DefineFastInt("MomentsPreloadMaxDecodeRetries", 2)
game:DefineFastInt("MomentsScreenshotDurationSeconds", preloadConstantsModule.screenshotDurationSeconds)

return {
	getDownloadWindow = function() --[[ line: 25 ]]
		return {
			forward = game:GetFastInt("MomentsPreloadDownloadWindowForward"),
			back = game:GetFastInt("MomentsPreloadDownloadWindowBack")
		}
	end,
	getDecodeWindow = function() --[[ line: 32 ]]
		return {
			forward = game:GetFastInt("MomentsPreloadDecodeWindowForward"),
			back = game:GetFastInt("MomentsPreloadDecodeWindowBack")
		}
	end,
	getDecodeRetryDelayMs = function() --[[ line: 39 ]]
		return game:GetFastInt("MomentsPreloadDecodeRetryDelayMs")
	end,
	getMaxDecodeRetries = function() --[[ line: 43 ]]
		return game:GetFastInt("MomentsPreloadMaxDecodeRetries")
	end,
	getScreenshotDurationSeconds = function() --[[ line: 47 ]]
		return game:GetFastInt("MomentsScreenshotDurationSeconds")
	end
}
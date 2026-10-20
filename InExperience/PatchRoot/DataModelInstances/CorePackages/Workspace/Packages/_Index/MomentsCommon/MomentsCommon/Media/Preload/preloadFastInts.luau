local PreloadConstantsModule = require(script:FindFirstAncestor("MomentsCommon").Media.Preload.preloadConstants)
game:DefineFastInt("MomentsPreloadDownloadWindowForward", PreloadConstantsModule.downloadWindow.forward)
game:DefineFastInt("MomentsPreloadDownloadWindowBack", PreloadConstantsModule.downloadWindow.back)
game:DefineFastInt("MomentsPreloadDecodeWindowForward", PreloadConstantsModule.decodeWindow.forward)
game:DefineFastInt("MomentsPreloadDecodeWindowBack", PreloadConstantsModule.decodeWindow.back)
game:DefineFastInt("MomentsPreloadDecodeRetryDelayMs", 2000)
game:DefineFastInt("MomentsPreloadMaxDecodeRetries", 2)
game:DefineFastInt("MomentsScreenshotDurationSeconds", PreloadConstantsModule.screenshotDurationSeconds)

return {
	getDownloadWindow = function()
		return {
			forward = game:GetFastInt("MomentsPreloadDownloadWindowForward"),
			back = game:GetFastInt("MomentsPreloadDownloadWindowBack")
		}
	end,
	getDecodeWindow = function()
		return {
			forward = game:GetFastInt("MomentsPreloadDecodeWindowForward"),
			back = game:GetFastInt("MomentsPreloadDecodeWindowBack")
		}
	end,
	getDecodeRetryDelayMs = function()
		return game:GetFastInt("MomentsPreloadDecodeRetryDelayMs")
	end,
	getMaxDecodeRetries = function()
		return game:GetFastInt("MomentsPreloadMaxDecodeRetries")
	end,
	getScreenshotDurationSeconds = function()
		return game:GetFastInt("MomentsScreenshotDurationSeconds")
	end
}
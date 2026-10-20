local config = {
	preScreenshot = function() end,
	postScreenshot = function() end
}

return {
	setPreScreenshotHook = function(PreScreenshot)
		-- upvalues: config (copy)
		config.preScreenshot = PreScreenshot
	end,
	setPostScreenshotHook = function(PostScreenshot)
		-- upvalues: config (copy)
		config.postScreenshot = PostScreenshot
	end,
	doPreScreenshot = function()
		-- upvalues: config (copy)
		config.preScreenshot()
	end,
	doPostScreenshot = function()
		-- upvalues: config (copy)
		config.postScreenshot()
	end
}
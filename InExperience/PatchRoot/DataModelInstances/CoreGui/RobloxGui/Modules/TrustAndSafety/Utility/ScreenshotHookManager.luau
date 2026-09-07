local t = {
	preScreenshot = function() end,
	postScreenshot = function() end
}

return {
	setPreScreenshotHook = function(value)
		-- upvalues: t (ref)
		t.preScreenshot = value
	end,
	setPostScreenshotHook = function(value)
		-- upvalues: t (ref)
		t.postScreenshot = value
	end,
	doPreScreenshot = function()
		-- upvalues: t (ref)
		t.preScreenshot()
	end,
	doPostScreenshot = function()
		-- upvalues: t (ref)
		t.postScreenshot()
	end
}
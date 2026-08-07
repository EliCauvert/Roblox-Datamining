local t = {
	preScreenshot = function() --[[ line: 2 ]] end,
	postScreenshot = function() --[[ line: 3 ]] end
}

return {
	setPreScreenshotHook = function(value) --[[ line: 7 ]]
		-- upvalues: t (ref)
		t.preScreenshot = value
	end,
	setPostScreenshotHook = function(value) --[[ line: 10 ]]
		-- upvalues: t (ref)
		t.postScreenshot = value
	end,
	doPreScreenshot = function() --[[ line: 13 ]]
		-- upvalues: t (ref)
		t.preScreenshot()
	end,
	doPostScreenshot = function() --[[ line: 16 ]]
		-- upvalues: t (ref)
		t.postScreenshot()
	end
}
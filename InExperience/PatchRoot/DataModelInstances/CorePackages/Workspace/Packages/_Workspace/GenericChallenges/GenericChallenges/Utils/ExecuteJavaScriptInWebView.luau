local browserService = game:GetService("BrowserService")

return {
	Execute = function(p0, p1) --[[ line: 5 ]]
		-- upvalues: browserService (ref)
		browserService:ExecuteJavaScript("(function() { CoreRobloxUtilities.hybridResponseService.injectNativeResponse(" .. p0 .. ", " .. p1 .. "); })();")
	end
}
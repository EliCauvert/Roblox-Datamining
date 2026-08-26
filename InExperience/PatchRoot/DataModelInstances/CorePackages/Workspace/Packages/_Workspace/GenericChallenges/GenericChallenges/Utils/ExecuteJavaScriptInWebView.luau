local browserService = game:GetService("BrowserService")

return {
	Execute = function(p1, p2)
		-- upvalues: browserService (ref)
		browserService:ExecuteJavaScript("(function() { CoreRobloxUtilities.hybridResponseService.injectNativeResponse(" .. p0 .. ", " .. p1 .. "); })();")
	end
}
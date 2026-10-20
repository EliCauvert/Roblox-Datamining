local BrowserService = game:GetService("BrowserService")

return {
	Execute = function(Text, Text1)
		-- upvalues: BrowserService (copy)
		BrowserService:ExecuteJavaScript("(function() { CoreRobloxUtilities.hybridResponseService.injectNativeResponse(" .. Text .. ", " .. Text1 .. "); })();")
	end
}
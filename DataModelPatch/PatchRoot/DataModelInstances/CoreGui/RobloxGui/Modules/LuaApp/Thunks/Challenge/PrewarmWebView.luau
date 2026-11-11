local Modules = game:GetService("CoreGui").RobloxGui.Modules
local BrowserService = game:GetService("BrowserService")
local WebViewService = game:GetService("WebViewService")
local HttpService = game:GetService("HttpService")
local UrlModule = require(Modules.LuaApp.Http.Url)
local GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebViewModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebView)
local GetFFlagEnableUnifiedStaticWebViewsModule = require(Modules.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews)
local List = {}

local function cleanup()
	-- upvalues: List (copy), GetFFlagEnableUnifiedStaticWebViewsModule (copy), WebViewService (copy), BrowserService (copy)
	for _, Connection in ipairs(List) do
		Connection:Disconnect()
	end
	table.clear(List)
	
	if GetFFlagEnableUnifiedStaticWebViewsModule() then
		WebViewService:CloseWindow()
		
		return
	else
		BrowserService:CloseBrowserWindow()
	end
end

return {
	init = function()
		-- upvalues: GetFFlagEnableUnifiedStaticWebViewsModule (copy), List (copy), WebViewService (copy), cleanup (copy), BrowserService (copy), GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebViewModule (copy), UrlModule (copy), HttpService (copy)
		if GetFFlagEnableUnifiedStaticWebViewsModule() then
			table.insert(List, WebViewService.OnWindowClosed:Connect(cleanup))
			table.insert(List, WebViewService.OnJavaScriptCall:Connect(cleanup))
		else
			table.insert(List, BrowserService.BrowserWindowClosed:Connect(function() end))
			table.insert(List, BrowserService.JavaScriptCallback:Connect(cleanup))
		end
		local Text = (GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebViewModule() and UrlModule.STATIC_CDN_URL or UrlModule.WWW_URL) .. "challenge/cdn/hybrid"
		
		if GetFFlagEnableUnifiedStaticWebViewsModule() then
			WebViewService:OpenWindow(Text, "Prewarm WebView", false)
			
			return
		else
			BrowserService:SendCommand((HttpService:JSONEncode({
				command = "open",
				title = "Prewarm WebView",
				visible = false,
				modal = true,
				isGenericWebview = true,
				enableOverlayReplacement = false,
				displayOrder = -2000,
				url = Text
			})))
		end
	end,
	cleanup = cleanup
}
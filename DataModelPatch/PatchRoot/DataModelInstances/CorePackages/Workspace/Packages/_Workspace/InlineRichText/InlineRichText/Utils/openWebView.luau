local WebViewService = game:GetService("WebViewService")
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local GetFFlagEnableUnifiedWebViewsFunction = require(script:FindFirstAncestor("InlineRichText").Parent.SharedFlags).GetFFlagEnableUnifiedWebViews

return function(Url)
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy), WebViewService (copy), BrowserService (copy), HttpService (copy)
	if GetFFlagEnableUnifiedWebViewsFunction() then
		local Connection = nil
		Connection = WebViewService.OnWindowClosed:Connect(function()
			-- upvalues: WebViewService (upval), Connection (ref)
			WebViewService:CloseWindow()
			
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end)
		WebViewService:OpenWindow(Url, "", true)
		
		return
	else
		local Connection = BrowserService
		Connection:SendCommand(HttpService:JSONEncode({
			command = "open",
			title = "",
			visible = true,
			isGenericWebview = true,
			enableOverlayReplacement = true,
			url = Url
		}))
	end
end
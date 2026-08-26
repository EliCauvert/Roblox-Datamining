local parent = script:FindFirstAncestor("InlineRichText").Parent
local webViewService = game:GetService("WebViewService")
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local getFFlagEnableUnifiedWebViews = require(parent.SharedFlags).GetFFlagEnableUnifiedWebViews

return function(p1)
	-- upvalues: getFFlagEnableUnifiedWebViews (ref), webViewService (ref), browserService (ref), httpService (ref)
	if getFFlagEnableUnifiedWebViews() then
		local onWindowClosedConnection = nil
		onWindowClosedConnection = webViewService.OnWindowClosed:Connect(function()
			-- upvalues: webViewService (copy), onWindowClosedConnection (write)
			webViewService:CloseWindow()
			
			if onWindowClosedConnection then
				onWindowClosedConnection:Disconnect()
				onWindowClosedConnection = nil
			end
		end)
		webViewService:OpenWindow(p1, "", true)
		
		return
	end
	browserService:SendCommand(httpService:JSONEncode({
		command = "open",
		title = "",
		visible = true,
		isGenericWebview = true,
		enableOverlayReplacement = true,
		url = p1
	}))
end
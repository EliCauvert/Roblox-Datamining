local Parent = script:FindFirstAncestor("InterventionShared").Parent
local ReactModule = require(Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseCallbackFunction = ReactModule.useCallback
local UseRefFunction = ReactModule.useRef
local GetFFlagEnableUnifiedWebViewsFunction = require(Parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local WebViewService = game:GetService("WebViewService")

return function(Url, Title)
	-- upvalues: UseRefFunction (copy), UseCallbackFunction (copy), GetFFlagEnableUnifiedWebViewsFunction (copy), WebViewService (copy), BrowserService (copy), HttpService (copy), UseEffectFunction (copy)
	local UseRefResult = UseRefFunction(nil)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
	end, { UseRefResult })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (upval), UseCallbackResult (copy), UseRefResult (copy), WebViewService (upval), Url (copy), Title (copy), BrowserService (upval), HttpService (upval)
		if GetFFlagEnableUnifiedWebViewsFunction() then
			UseCallbackResult()
			UseRefResult.current = WebViewService.OnWindowClosed:Connect(function()
				-- upvalues: WebViewService (upval), UseCallbackResult (upval)
				WebViewService:CloseWindow()
				UseCallbackResult()
			end)
			WebViewService:OpenWindow(Url, Title, true)
			
			return
		else
			BrowserService:SendCommand(HttpService:JSONEncode({
				command = "open",
				visible = true,
				isGenericWebview = true,
				enableOverlayReplacement = true,
				url = Url,
				title = Title
			}))
		end
	end, { Url, Title, UseCallbackResult })
	UseEffectFunction(function()
		-- upvalues: UseCallbackResult (copy)
		return function()
			-- upvalues: UseCallbackResult (upval)
			UseCallbackResult()
		end
	end, { UseCallbackResult })
	
	return UseCallbackResult1
end
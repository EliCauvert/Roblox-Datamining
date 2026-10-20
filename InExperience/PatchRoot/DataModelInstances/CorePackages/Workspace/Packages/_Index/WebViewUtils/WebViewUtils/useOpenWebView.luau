local Parent = script:FindFirstAncestor("WebViewUtils").Parent
local ReactModule = require(Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseCallbackFunction = ReactModule.useCallback
local UseRefFunction = ReactModule.useRef
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagEnableUnifiedWebViewsFunction = SharedFlagsModule.GetFFlagEnableUnifiedWebViews
local FFlagAppNavMyStatsTab = SharedFlagsModule.FFlagAppNavMyStatsTab
local FFlagUseWebViewSessionInOpenWebViewModule = require(script.Parent.Flags.FFlagUseWebViewSessionInOpenWebView)
local OpenWebViewSessionModule = require(script.Parent.openWebViewSession)
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local WebViewService = game:GetService("WebViewService")

return function()
	-- upvalues: UseRefFunction (copy), UseCallbackFunction (copy), FFlagUseWebViewSessionInOpenWebViewModule (copy), OpenWebViewSessionModule (copy), FFlagAppNavMyStatsTab (copy), GetFFlagEnableUnifiedWebViewsFunction (copy), WebViewService (copy), BrowserService (copy), HttpService (copy), UseEffectFunction (copy)
	local UseRefResult = UseRefFunction(nil)
	local UseRefResult1 = UseRefFunction(nil)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		if UseRefResult.current then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
		if UseRefResult1.current then
			UseRefResult1.current()
			UseRefResult1.current = nil
		end
	end, { UseRefResult, UseRefResult1 })
	local UseCallbackResult1 = UseCallbackFunction(function(Url, Title, Callback)
		-- upvalues: FFlagUseWebViewSessionInOpenWebViewModule (upval), UseCallbackResult (copy), OpenWebViewSessionModule (upval), FFlagAppNavMyStatsTab (upval), UseRefResult1 (copy), GetFFlagEnableUnifiedWebViewsFunction (upval), UseRefResult (copy), WebViewService (upval), BrowserService (upval), HttpService (upval)
		if FFlagUseWebViewSessionInOpenWebViewModule then
			UseCallbackResult()
			local _, OpenWebViewSessionModuleResult2 = OpenWebViewSessionModule(Url, Title, if FFlagAppNavMyStatsTab then Callback else nil)
			UseRefResult1.current = OpenWebViewSessionModuleResult2
			
			return
		end
		if GetFFlagEnableUnifiedWebViewsFunction() then
			UseCallbackResult()
			UseRefResult.current = WebViewService.OnWindowClosed:Connect(function()
				-- upvalues: WebViewService (upval), UseCallbackResult (upval), FFlagAppNavMyStatsTab (upval), Callback (copy)
				WebViewService:CloseWindow()
				UseCallbackResult()
				
				if FFlagAppNavMyStatsTab and Callback then
					Callback()
				end
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
	end, { UseCallbackResult })
	UseEffectFunction(function()
		-- upvalues: UseCallbackResult (copy)
		return function()
			-- upvalues: UseCallbackResult (upval)
			UseCallbackResult()
		end
	end, { UseCallbackResult })
	
	return UseCallbackResult1
end
local parent = script:FindFirstAncestor("WebViewUtils").Parent
local reactModule = require(parent.React)
local useEffect = reactModule.useEffect
local useCallback = reactModule.useCallback
local useRef = reactModule.useRef
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagEnableUnifiedWebViews = sharedFlagsModule.GetFFlagEnableUnifiedWebViews
local fFlagAppNavMyStatsTab = sharedFlagsModule.FFlagAppNavMyStatsTab
local fFlagUseWebViewSessionInOpenWebViewModule = require(script.Parent.Flags.FFlagUseWebViewSessionInOpenWebView)
local openWebViewSessionModule = require(script.Parent.openWebViewSession)
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local webViewService = game:GetService("WebViewService")

return function()
	-- upvalues: useRef (ref), useCallback (ref), fFlagUseWebViewSessionInOpenWebViewModule (ref), openWebViewSessionModule (ref), fFlagAppNavMyStatsTab (ref), getFFlagEnableUnifiedWebViews (ref), webViewService (ref), browserService (ref), httpService (ref), useEffect (ref)
	local var1 = useRef(nil)
	local var2 = useRef(nil)
	local var3 = useCallback(function()
		-- upvalues: var1 (ref), var2 (ref)
		if var1.current then
			var1.current:Disconnect()
			var1.current = nil
		end
		if var2.current then
			var2.current()
			var2.current = nil
		end
	end, { var1, var2 })
	local var4 = useCallback(function(p1, p2, p3)
		-- upvalues: fFlagUseWebViewSessionInOpenWebViewModule (copy), var3 (ref), openWebViewSessionModule (copy), fFlagAppNavMyStatsTab (copy), var2 (ref), getFFlagEnableUnifiedWebViews (copy), var1 (ref), webViewService (copy), browserService (copy), httpService (copy)
		if fFlagUseWebViewSessionInOpenWebViewModule then
			var3()
			local _, var5 = openWebViewSessionModule(p1, p2, if fFlagAppNavMyStatsTab then p3 else nil)
			var2.current = var5
			
			return
		elseif getFFlagEnableUnifiedWebViews() then
			var3()
			var1.current = webViewService.OnWindowClosed:Connect(function()
				-- upvalues: webViewService (copy), var3 (copy), fFlagAppNavMyStatsTab (copy), p3 (ref)
				webViewService:CloseWindow()
				var3()
				
				if fFlagAppNavMyStatsTab and p3 then
					p3()
				end
			end)
			webViewService:OpenWindow(p1, p2, true)
			
			return
		end
		browserService:SendCommand(httpService:JSONEncode({
			command = "open",
			visible = true,
			isGenericWebview = true,
			enableOverlayReplacement = true,
			url = p1,
			title = p2
		}))
	end, { var3 })
	useEffect(function()
		-- upvalues: var3 (ref)
		return function()
			-- upvalues: var3 (copy)
			var3()
		end
	end, { var3 })
	
	return var4
end
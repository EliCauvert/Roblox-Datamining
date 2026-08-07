local parent = script:FindFirstAncestor("WebViewUtils").Parent
local reactModule = require(parent.React)
local useEffect = reactModule.useEffect
local useCallback = reactModule.useCallback
local useRef = reactModule.useRef
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagEnableUnifiedWebViews = sharedFlagsModule.GetFFlagEnableUnifiedWebViews
local fFlagAppNavMyStatsTab = sharedFlagsModule.FFlagAppNavMyStatsTab
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local webViewService = game:GetService("WebViewService")

return function() --[[ line: 25 | named "useOpenWebView" ]]
	-- upvalues: useRef (ref), useCallback (ref), getFFlagEnableUnifiedWebViews (ref), webViewService (ref), fFlagAppNavMyStatsTab (ref), browserService (ref), httpService (ref), useEffect (ref)
	local var5 = useRef(nil)
	local var6 = useCallback(function() --[[ line: 28 ]]
		-- upvalues: var5 (ref)
		if var5.current then
			var5.current:Disconnect()
			var5.current = nil
		end
	end, { var5 })
	local var7 = useCallback(function(p0, p1, p2) --[[ line: 35 ]]
		-- upvalues: getFFlagEnableUnifiedWebViews (copy), var6 (ref), var5 (ref), webViewService (copy), fFlagAppNavMyStatsTab (copy), browserService (copy), httpService (copy)
		if getFFlagEnableUnifiedWebViews() then
			var6()
			var5.current = webViewService.OnWindowClosed:Connect(function() --[[ line: 41 ]]
				-- upvalues: webViewService (copy), var6 (copy), fFlagAppNavMyStatsTab (copy), p2 (ref)
				webViewService:CloseWindow()
				var6()
				
				if fFlagAppNavMyStatsTab and p2 then
					p2()
				end
			end)
			webViewService:OpenWindow(p0, p1, true)
			
			return
		end
		browserService:SendCommand(httpService:JSONEncode({
			command = "open",
			visible = true,
			isGenericWebview = true,
			enableOverlayReplacement = true,
			url = p0,
			title = p1
		}))
	end, { var6 })
	useEffect(function() --[[ line: 63 ]]
		-- upvalues: var6 (ref)
		return function() --[[ line: 64 ]]
			-- upvalues: var6 (copy)
			var6()
		end
	end, { var6 })
	
	return var7
end
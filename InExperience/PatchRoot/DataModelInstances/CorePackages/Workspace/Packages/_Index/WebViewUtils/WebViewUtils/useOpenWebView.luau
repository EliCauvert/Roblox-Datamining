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

return function()
	-- upvalues: useRef (ref), useCallback (ref), getFFlagEnableUnifiedWebViews (ref), webViewService (ref), fFlagAppNavMyStatsTab (ref), browserService (ref), httpService (ref), useEffect (ref)
	local var1 = useRef(nil)
	local var2 = useCallback(function()
		-- upvalues: var1 (ref)
		if var1.current then
			var1.current:Disconnect()
			var1.current = nil
		end
	end, { var1 })
	local var3 = useCallback(function(p1, p2, p3)
		-- upvalues: getFFlagEnableUnifiedWebViews (copy), var2 (ref), var1 (ref), webViewService (copy), fFlagAppNavMyStatsTab (copy), browserService (copy), httpService (copy)
		if getFFlagEnableUnifiedWebViews() then
			var2()
			var1.current = webViewService.OnWindowClosed:Connect(function()
				-- upvalues: webViewService (copy), var2 (copy), fFlagAppNavMyStatsTab (copy), p3 (ref)
				webViewService:CloseWindow()
				var2()
				
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
	end, { var2 })
	useEffect(function()
		-- upvalues: var2 (ref)
		return function()
			-- upvalues: var2 (copy)
			var2()
		end
	end, { var2 })
	
	return var3
end
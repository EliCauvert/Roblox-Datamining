local parent = script:FindFirstAncestor("InterventionShared").Parent
local reactModule = require(parent.React)
local useEffect = reactModule.useEffect
local useCallback = reactModule.useCallback
local useRef = reactModule.useRef
local getFFlagEnableUnifiedWebViews = require(parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local webViewService = game:GetService("WebViewService")

return function(p0, p1) --[[ line: 20 | named "useWebView" ]]
	-- upvalues: useRef (ref), useCallback (ref), getFFlagEnableUnifiedWebViews (ref), webViewService (ref), browserService (ref), httpService (ref), useEffect (ref)
	local var4 = useRef(nil)
	local var5 = useCallback(function() --[[ line: 23 ]]
		-- upvalues: var4 (ref)
		if var4.current then
			var4.current:Disconnect()
			var4.current = nil
		end
	end, { var4 })
	local var6 = useCallback(function() --[[ line: 30 ]]
		-- upvalues: getFFlagEnableUnifiedWebViews (copy), var5 (ref), var4 (ref), webViewService (copy), p0 (ref), p1 (ref), browserService (copy), httpService (copy)
		if getFFlagEnableUnifiedWebViews() then
			var5()
			var4.current = webViewService.OnWindowClosed:Connect(function() --[[ line: 36 ]]
				-- upvalues: webViewService (copy), var5 (copy)
				webViewService:CloseWindow()
				var5()
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
	end, { p0, p1, var5 })
	useEffect(function() --[[ line: 55 ]]
		-- upvalues: var5 (ref)
		return function() --[[ line: 56 ]]
			-- upvalues: var5 (copy)
			var5()
		end
	end, { var5 })
	
	return var6
end
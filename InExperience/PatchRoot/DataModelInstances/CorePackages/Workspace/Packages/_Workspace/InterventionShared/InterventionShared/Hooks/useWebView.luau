local parent = script:FindFirstAncestor("InterventionShared").Parent
local reactModule = require(parent.React)
local useEffect = reactModule.useEffect
local useCallback = reactModule.useCallback
local useRef = reactModule.useRef
local getFFlagEnableUnifiedWebViews = require(parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local webViewService = game:GetService("WebViewService")

return function(p1, p2)
	-- upvalues: useRef (ref), useCallback (ref), getFFlagEnableUnifiedWebViews (ref), webViewService (ref), browserService (ref), httpService (ref), useEffect (ref)
	local var1 = useRef(nil)
	local var2 = useCallback(function()
		-- upvalues: var1 (ref)
		if var1.current then
			var1.current:Disconnect()
			var1.current = nil
		end
	end, { var1 })
	local var3 = useCallback(function()
		-- upvalues: getFFlagEnableUnifiedWebViews (copy), var2 (ref), var1 (ref), webViewService (copy), p1 (ref), p2 (ref), browserService (copy), httpService (copy)
		if getFFlagEnableUnifiedWebViews() then
			var2()
			var1.current = webViewService.OnWindowClosed:Connect(function()
				-- upvalues: webViewService (copy), var2 (copy)
				webViewService:CloseWindow()
				var2()
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
	end, { p1, p2, var2 })
	useEffect(function()
		-- upvalues: var2 (ref)
		return function()
			-- upvalues: var2 (copy)
			var2()
		end
	end, { var2 })
	
	return var3
end
local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView

return function(p1, p2, p3, p4)
	-- upvalues: useOpenWebView (ref), reactModule (ref), appLifecycleObserverService (ref)
	local var1 = useOpenWebView()
	local var2 = reactModule.useRef(false)
	local var3 = reactModule.useRef(false)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), p3 (ref)
		if not var2.current then return end
		var2.current = false
		
		if p3 ~= nil then
			p3()
		end
	end, { p3 })
	local var5 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var2 (ref), p3 (ref)
		if not var3.current then return end
		var3.current = false
		var2.current = false
		
		if p3 ~= nil then
			p3()
		end
	end, { p3 })
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), p4 (ref), appLifecycleObserverService (copy), var4 (ref), var2 (ref), var3 (ref)
		if p3 == nil then
			return function() end
		end
		local onUnhideConnection = (p4 or appLifecycleObserverService).OnUnhide:Connect(var4)
		
		return function()
			-- upvalues: var2 (copy), var3 (copy), onUnhideConnection (ref)
			var2.current = false
			var3.current = false
			onUnhideConnection:Disconnect()
		end
	end, { p4, var4, p3 })
	
	return reactModule.useCallback(function()
		-- upvalues: var2 (ref), p3 (ref), var3 (ref), var1 (ref), p1 (ref), p2 (ref), var5 (ref)
		var2.current = p3 ~= nil
		var3.current = p3 ~= nil
		var1(p1, p2, if p3 ~= nil then nil else var5)
	end, {
		var5,
		p3,
		var1,
		p2,
		p1
	})
end
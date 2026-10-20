local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView

return function(p1, p2, Callback, p3)
	-- upvalues: UseOpenWebViewFunction (copy), ReactModule (copy), AppLifecycleObserverService (copy)
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), Callback (copy)
		if not UseRefResult.current then return end
		UseRefResult.current = false
		
		if Callback ~= nil then
			Callback()
		end
	end, { Callback })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), Callback (copy)
		if not UseRefResult1.current then return end
		UseRefResult1.current = false
		UseRefResult.current = false
		
		if Callback ~= nil then
			Callback()
		end
	end, { Callback })
	ReactModule.useEffect(function()
		-- upvalues: Callback (copy), p3 (copy), AppLifecycleObserverService (upval), UseResult (copy), UseRefResult (copy), UseRefResult1 (copy)
		if Callback == nil then
			return function() end
		else
			local OnUnhideConnection = (p3 or AppLifecycleObserverService).OnUnhide:Connect(UseResult)
			
			return function()
				-- upvalues: UseRefResult (upval), UseRefResult1 (upval), OnUnhideConnection (copy)
				UseRefResult.current = false
				UseRefResult1.current = false
				OnUnhideConnection:Disconnect()
			end
		end
	end, { p3, UseResult, Callback })
	
	return ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), Callback (copy), UseRefResult1 (copy), UseOpenWebViewResult (copy), p1 (copy), p2 (copy), UseResult1 (copy)
		UseRefResult.current = Callback ~= nil
		UseRefResult1.current = Callback ~= nil
		UseOpenWebViewResult(p1, p2, if Callback == nil then nil else UseResult1)
	end, {
		UseResult1,
		Callback,
		UseOpenWebViewResult,
		p2,
		p1
	})
end
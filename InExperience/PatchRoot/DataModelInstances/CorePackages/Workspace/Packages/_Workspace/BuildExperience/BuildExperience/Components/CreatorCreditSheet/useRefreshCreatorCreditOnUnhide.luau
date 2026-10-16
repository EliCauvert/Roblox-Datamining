local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function(Callback, p1) --[[ Line: 12 | Named "useRefreshCreatorCreditOnUnhide" ]]
	-- upvalues: ReactModule (copy), AppLifecycleObserverService (copy)
	ReactModule.useEffect(function() --[[ Line: 16 ]]
		-- upvalues: Callback (copy), p1 (copy), AppLifecycleObserverService (upval)
		if Callback == nil then
			return function() --[[ Line: 18 ]] end
		else
			local OnUnhideConnection = (p1 or AppLifecycleObserverService).OnUnhide:Connect(Callback)
			
			return function() --[[ Line: 22 ]]
				-- upvalues: OnUnhideConnection (copy)
				OnUnhideConnection:Disconnect()
			end
		end
	end, { p1, Callback })
end
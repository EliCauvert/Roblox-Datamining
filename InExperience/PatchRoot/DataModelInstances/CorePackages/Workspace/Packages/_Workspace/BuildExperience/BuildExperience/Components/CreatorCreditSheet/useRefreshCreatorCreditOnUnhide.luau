local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function(Callback, p1)
	-- upvalues: ReactModule (copy), AppLifecycleObserverService (copy)
	ReactModule.useEffect(function()
		-- upvalues: Callback (copy), p1 (copy), AppLifecycleObserverService (upval)
		if Callback == nil then
			return function() end
		else
			local OnUnhideConnection = (p1 or AppLifecycleObserverService).OnUnhide:Connect(Callback)
			
			return function()
				-- upvalues: OnUnhideConnection (copy)
				OnUnhideConnection:Disconnect()
			end
		end
	end, { p1, Callback })
end
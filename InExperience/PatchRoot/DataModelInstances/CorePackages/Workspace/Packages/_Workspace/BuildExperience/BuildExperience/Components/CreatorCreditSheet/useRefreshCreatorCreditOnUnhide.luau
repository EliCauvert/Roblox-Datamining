local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref), appLifecycleObserverService (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), appLifecycleObserverService (copy)
		if p1 == nil then
			return function() end
		end
		local onUnhideConnection = (p2 or appLifecycleObserverService).OnUnhide:Connect(p1)
		
		return function()
			-- upvalues: onUnhideConnection (ref)
			onUnhideConnection:Disconnect()
		end
	end, { p2, p1 })
end
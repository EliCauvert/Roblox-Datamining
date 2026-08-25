local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref), appLifecycleObserverService (ref)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), p1 (ref), appLifecycleObserverService (copy)
		if p0 == nil then
			return function() end
		end
		local onUnhideConnection = (p1 or appLifecycleObserverService).OnUnhide:Connect(p0)
		
		return function()
			-- upvalues: onUnhideConnection (ref)
			onUnhideConnection:Disconnect()
		end
	end, { p1, p0 })
end
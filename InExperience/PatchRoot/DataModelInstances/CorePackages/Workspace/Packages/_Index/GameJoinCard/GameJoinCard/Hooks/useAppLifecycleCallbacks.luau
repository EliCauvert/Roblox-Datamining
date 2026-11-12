local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local ReactModule = require(script:FindFirstAncestor("GameJoinCard").Parent.React)

return function(Callback, Callback1, p1)
	-- upvalues: AppLifecycleObserverService (copy), ReactModule (copy)
	local P2 = p1 or AppLifecycleObserverService
	ReactModule.useEffect(function()
		-- upvalues: Callback (copy), P2 (copy)
		if Callback == nil then
			return nil
		else
			local OnHideConnection = P2.OnHide:Connect(Callback)
			
			return function()
				-- upvalues: OnHideConnection (copy)
				OnHideConnection:Disconnect()
			end
		end
	end, { Callback, P2 })
	ReactModule.useEffect(function()
		-- upvalues: Callback1 (copy), P2 (copy)
		if Callback1 == nil then
			return nil
		else
			local OnUnhideConnection = P2.OnUnhide:Connect(Callback1)
			
			return function()
				-- upvalues: OnUnhideConnection (copy)
				OnUnhideConnection:Disconnect()
			end
		end
	end, { Callback1, P2 })
end
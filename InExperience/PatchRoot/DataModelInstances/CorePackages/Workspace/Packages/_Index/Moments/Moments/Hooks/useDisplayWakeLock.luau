local moments = script:FindFirstAncestor("Moments")
local reactModule = require(moments.Parent.React)
local getDeviceDisplayServiceModule = require(moments.Utils.getDeviceDisplayService)
local isDisplayWakeLockSupportedModule = require(moments.Utils.isDisplayWakeLockSupported)

return function(p1)
	-- upvalues: reactModule (ref), isDisplayWakeLockSupportedModule (ref), getDeviceDisplayServiceModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), isDisplayWakeLockSupportedModule (copy), getDeviceDisplayServiceModule (copy)
		if p1 and isDisplayWakeLockSupportedModule() then
			local var1 = getDeviceDisplayServiceModule():AcquireWakeLock("Moments.WatchFeed")
			
			return function()
				-- upvalues: var1 (ref)
				var1:Destroy()
			end
		end
	end, { p1 })
end
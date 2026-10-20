local Moments = script:FindFirstAncestor("Moments")
local ReactModule = require(Moments.Parent.React)
local GetDeviceDisplayServiceModule = require(Moments.Utils.getDeviceDisplayService)
local IsDisplayWakeLockSupportedModule = require(Moments.Utils.isDisplayWakeLockSupported)

return function(p1)
	-- upvalues: ReactModule (copy), IsDisplayWakeLockSupportedModule (copy), GetDeviceDisplayServiceModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), IsDisplayWakeLockSupportedModule (upval), GetDeviceDisplayServiceModule (upval)
		if not p1 or not IsDisplayWakeLockSupportedModule() then return end
		local MomentsWatchFeed = GetDeviceDisplayServiceModule():AcquireWakeLock("Moments.WatchFeed")
		
		return function()
			-- upvalues: MomentsWatchFeed (copy)
			MomentsWatchFeed:Destroy()
		end
	end, { p1 })
end
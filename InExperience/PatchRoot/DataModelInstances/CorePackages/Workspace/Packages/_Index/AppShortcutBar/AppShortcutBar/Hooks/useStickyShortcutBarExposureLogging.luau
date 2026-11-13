local AppShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local Parent = AppShortcutBar.Parent
local ReactModule = require(Parent.React)
local IXPServiceWrapper = require(Parent.IxpServiceWrapper).IXPServiceWrapper
local LogUnifyShortcutBarExposureLoggedModule = require(AppShortcutBar.Telemetry.logUnifyShortcutBarExposureLogged)
local FFlagEnableStickyShortcutBarOnAllPlatforms = require(Parent.SharedFlags).FFlagEnableStickyShortcutBarOnAllPlatforms
local FStringEnableStickyShortcutBarOnAllPlatformsIxpLayer = require(AppShortcutBar.Flags).FStringEnableStickyShortcutBarOnAllPlatformsIxpLayer
local FFlagUnifyShortcutBarExposureTelemetry = require(AppShortcutBar.Flags).FFlagUnifyShortcutBarExposureTelemetry
local Flag = false

return function(p1)
	-- upvalues: ReactModule (copy), Flag (ref), FFlagUnifyShortcutBarExposureTelemetry (copy), LogUnifyShortcutBarExposureLoggedModule (copy), FFlagEnableStickyShortcutBarOnAllPlatforms (copy), IXPServiceWrapper (copy), FStringEnableStickyShortcutBarOnAllPlatformsIxpLayer (copy)
	ReactModule.useEffect(function()
		-- upvalues: Flag (upval), p1 (copy), FFlagUnifyShortcutBarExposureTelemetry (upval), LogUnifyShortcutBarExposureLoggedModule (upval), FFlagEnableStickyShortcutBarOnAllPlatforms (upval), IXPServiceWrapper (upval), FStringEnableStickyShortcutBarOnAllPlatformsIxpLayer (upval)
		if not Flag and p1 then
			Flag = true
			
			if FFlagUnifyShortcutBarExposureTelemetry then
				LogUnifyShortcutBarExposureLoggedModule(FFlagEnableStickyShortcutBarOnAllPlatforms)
			end
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringEnableStickyShortcutBarOnAllPlatformsIxpLayer)
		end
	end, { p1 })
end
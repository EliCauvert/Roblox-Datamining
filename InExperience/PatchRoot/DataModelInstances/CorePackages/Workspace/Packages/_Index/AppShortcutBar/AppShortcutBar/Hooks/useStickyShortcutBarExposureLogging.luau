local AppShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local Parent = AppShortcutBar.Parent
local ReactModule = require(Parent.React)
local IXPServiceWrapper = require(Parent.IxpServiceWrapper).IXPServiceWrapper
local FStringEnableStickyShortcutBarOnAllPlatformsIxpLayer = require(AppShortcutBar.Flags).FStringEnableStickyShortcutBarOnAllPlatformsIxpLayer
local Flag = false

return function(p1) --[[ Line: 12 | Named "useStickyShortcutBarExposureLogging" ]]
	-- upvalues: ReactModule (copy), Flag (ref), IXPServiceWrapper (copy), FStringEnableStickyShortcutBarOnAllPlatformsIxpLayer (copy)
	ReactModule.useEffect(function() --[[ Line: 13 ]]
		-- upvalues: Flag (upval), p1 (copy), IXPServiceWrapper (upval), FStringEnableStickyShortcutBarOnAllPlatformsIxpLayer (upval)
		if not Flag and p1 then
			Flag = true
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringEnableStickyShortcutBarOnAllPlatformsIxpLayer)
		end
	end, { p1 })
end
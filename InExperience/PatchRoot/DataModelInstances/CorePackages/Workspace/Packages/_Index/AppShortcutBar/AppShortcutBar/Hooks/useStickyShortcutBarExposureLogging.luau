local appShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local parent = appShortcutBar.Parent
local reactModule = require(parent.React)
local IXPServiceWrapper = require(parent.IxpServiceWrapper).IXPServiceWrapper
local fStringEnableStickyShortcutBarOnAllPlatformsIxpLayer = require(appShortcutBar.Flags).FStringEnableStickyShortcutBarOnAllPlatformsIxpLayer
local var1 = false

return function(p1)
	-- upvalues: reactModule (ref), var1 (write), IXPServiceWrapper (ref), fStringEnableStickyShortcutBarOnAllPlatformsIxpLayer (ref)
	reactModule.useEffect(function()
		-- upvalues: var1 (copy), p1 (ref), IXPServiceWrapper (copy), fStringEnableStickyShortcutBarOnAllPlatformsIxpLayer (copy)
		if not var1 and p1 then
			var1 = true
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(fStringEnableStickyShortcutBarOnAllPlatformsIxpLayer)
		end
	end, { p1 })
end
local AppShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local UseIsStickyShortcutBarEnabledModule = require(AppShortcutBar.Hooks.useIsStickyShortcutBarEnabled)
local UseStickyShortcutBarExposureLoggingModule = require(AppShortcutBar.Hooks.useStickyShortcutBarExposureLogging)

return function(p1)
	-- upvalues: UseIsStickyShortcutBarEnabledModule (copy), UseStickyShortcutBarExposureLoggingModule (copy)
	UseStickyShortcutBarExposureLoggingModule((UseIsStickyShortcutBarEnabledModule(p1.currentPage)))
	
	return nil
end
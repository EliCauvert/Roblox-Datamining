local _ = require("./types")
local _ = require("./navigation_types")
local NavSurfaceKitModule = require("./nav_surface_kit")
local NavOverlayPresenceModule = require("./nav_overlay_presence")
local NavPopoverPlacementModule = require("./nav_popover_placement")
local NavModalStackModule = require("./nav_modal_stack")
local NavOverlayPortalModule = require("./nav_overlay_portal")
local NavHelpModule = require("./nav_help")

return function(p1)
	-- upvalues: NavSurfaceKitModule (copy), NavOverlayPresenceModule (copy), NavPopoverPlacementModule (copy), NavModalStackModule (copy), NavOverlayPortalModule (copy), NavHelpModule (copy)
	local Runtime = p1.runtime
	
	local function attach(p2, p3)
		-- upvalues: Runtime (copy)
		Runtime.mountFragment(function()
			-- upvalues: p3 (copy)
			return p3
		end, p2)
	end
	
	local NavSurfaceKitModuleResult = NavSurfaceKitModule(p1, attach)
	local NavOverlayPresenceModuleResult = NavOverlayPresenceModule(p1)
	local NavPopoverPlacementModuleResult = NavPopoverPlacementModule(p1)
	local NavModalStackModuleResult = NavModalStackModule(p1, NavSurfaceKitModuleResult)
	local NavOverlayPortalModuleResult = NavOverlayPortalModule(p1, NavOverlayPresenceModuleResult)
	NavHelpModule(p1, NavSurfaceKitModuleResult, NavOverlayPresenceModuleResult, NavOverlayPortalModuleResult, NavPopoverPlacementModuleResult)
	
	return {
		sheetModal = nil,
		modal = NavModalStackModuleResult,
		skin = NavSurfaceKitModuleResult.skin,
		inset = NavSurfaceKitModuleResult.inset,
		centered = NavSurfaceKitModuleResult.centered,
		attach = attach,
		service = NavSurfaceKitModuleResult.service,
		within = NavSurfaceKitModuleResult.within,
		keep = NavSurfaceKitModuleResult.keep,
		firstSelectable = NavSurfaceKitModuleResult.firstSelectable,
		displayed = NavSurfaceKitModuleResult.displayed,
		preference = NavSurfaceKitModuleResult.preference,
		selecting = NavSurfaceKitModuleResult.selecting,
		overlay = NavOverlayPortalModuleResult.overlay,
		parent = NavOverlayPortalModuleResult.parent,
		available = NavOverlayPortalModuleResult.available,
		appearance = NavOverlayPresenceModuleResult.appearance,
		atRest = NavOverlayPresenceModuleResult.atRest,
		popover = NavPopoverPlacementModuleResult
	}
end
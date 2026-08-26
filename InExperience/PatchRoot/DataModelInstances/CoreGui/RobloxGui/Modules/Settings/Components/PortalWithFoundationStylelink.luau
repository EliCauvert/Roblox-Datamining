local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local view = foundationModule.View
local useStyleSheet = foundationModule.Hooks.useStyleSheet

return function(p1)
	-- upvalues: useStyleSheet (ref), cryoModule (ref), reactModule (ref), reactRobloxModule (ref), view (ref)
	return reactRobloxModule.createPortal(reactModule.createElement(view, { tag = "auto-xy" }, cryoModule.Dictionary.join({
		StyleLink = reactModule.createElement("StyleLink", { StyleSheet = useStyleSheet() })
	}, p1.children)), p1.parent)
end
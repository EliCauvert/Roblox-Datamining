local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local View = FoundationModule.View
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet

return function(p1) --[[ Line: 16 | Named "PortalWithFoundationStylelink" ]]
	-- upvalues: UseStyleSheetFunction (copy), CryoModule (copy), ReactModule (copy), ReactRobloxModule (copy), View (copy)
	return ReactRobloxModule.createPortal(ReactModule.createElement(View, { tag = "auto-xy" }, (CryoModule.Dictionary.join({
		StyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetFunction() })
	}, p1.children))), p1.parent)
end
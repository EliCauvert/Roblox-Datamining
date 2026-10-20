local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local OverlayFocusHandlerModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.OverlayFocusHandler)

return function(OverlayComponent)
	-- upvalues: RoactModule (copy), OverlayFocusHandlerModule (copy)
	return function(Arguments)
		-- upvalues: RoactModule (upval), OverlayFocusHandlerModule (upval), OverlayComponent (copy)
		return RoactModule.createElement(OverlayFocusHandlerModule, {
			overlayComponent = OverlayComponent,
			arguments = Arguments
		})
	end
end
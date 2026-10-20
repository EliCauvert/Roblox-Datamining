local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local LogOnOverlayClosedFunction = AvatarExperienceNavigationModule.Debug.logOnOverlayClosed
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseLastInputMethodFunction = require(CorePackages.Workspace.Packages.FocusNavigationUtils).useLastInputMethod
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus

return function(p1)
	-- upvalues: UseAvatarRouteFunction (copy), UseLastInputMethodFunction (copy), ReactModule (copy), LogOnOverlayClosedFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	local Name = UseAvatarRouteFunction().opaque.name
	local IsGamepad = UseLastInputMethodFunction() == "Gamepad"
	
	return (ReactModule.useCallback(function()
		-- upvalues: IsGamepad (copy), LogOnOverlayClosedFunction (upval), Name (copy), FFlagAXMigrateAXToGlobalAutofocus (upval), p1 (copy)
		LogOnOverlayClosedFunction(Name, IsGamepad)
		
		if not FFlagAXMigrateAXToGlobalAutofocus and IsGamepad and p1 then
			p1.captureFocus()
		end
	end, {
		IsGamepad,
		Name,
		if FFlagAXMigrateAXToGlobalAutofocus then nil else p1
	}))
end
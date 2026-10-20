local UserInputService = game:GetService("UserInputService")
local CorePackages = game:GetService("CorePackages")
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local SystemBarVisibilityModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.SystemBarVisibility)
local FFlagLuaAppEdpKeepFullPageOnPortraitRotation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpKeepFullPageOnPortraitRotation

return function(p1)
	-- upvalues: UserInputService (copy), FFlagLuaAppEdpKeepFullPageOnPortraitRotation (copy), DeviceOrientationMode (copy), SystemBarVisibilityModule (copy), FormFactor (copy)
	local None = Enum.Platform.None
	pcall(function()
		-- upvalues: None (ref), UserInputService (upval)
		None = UserInputService:GetPlatform()
	end)
	
	if None == Enum.Platform.IOS or None == Enum.Platform.Android then
		if FFlagLuaAppEdpKeepFullPageOnPortraitRotation then
			return if p1.deviceOrientation == DeviceOrientationMode.Landscape then SystemBarVisibilityModule.Visible else SystemBarVisibilityModule.Hidden
		elseif p1.FormFactor == FormFactor.WIDE then
			return SystemBarVisibilityModule.Visible
		end
	end
	return SystemBarVisibilityModule.PolicyDependent
end
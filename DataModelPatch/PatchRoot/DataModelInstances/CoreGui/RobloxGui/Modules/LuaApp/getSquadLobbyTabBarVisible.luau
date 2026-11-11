local UserInputService = game:GetService("UserInputService")
local FormFactor = require(game:GetService("CorePackages").Workspace.Packages.FormFactor).Enums.FormFactor
local SystemBarVisibilityModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.SystemBarVisibility)

return function(p1)
	-- upvalues: UserInputService (copy), FormFactor (copy), SystemBarVisibilityModule (copy)
	local None = Enum.Platform.None
	pcall(function()
		-- upvalues: None (ref), UserInputService (upval)
		None = UserInputService:GetPlatform()
	end)
	
	return if None == Enum.Platform.IOS or None == Enum.Platform.Android then if p1.FormFactor == FormFactor.WIDE then SystemBarVisibilityModule.Visible else SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
end
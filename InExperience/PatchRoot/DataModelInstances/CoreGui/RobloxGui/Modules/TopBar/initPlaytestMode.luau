local playersService = game:GetService("Players")
local getPlaytestModeStoreModule = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsRoactCommon.GetPlaytestModeStore)
local playerPermissionsModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.PlayerPermissionsModule)

return function()
	-- upvalues: getPlaytestModeStoreModule (ref), playerPermissionsModule (ref), playersService (ref)
	local var1 = getPlaytestModeStoreModule(false)
	task.spawn(function()
		-- upvalues: var1 (ref), playerPermissionsModule (copy), playersService (copy)
		var1.setHasEditAccess(playerPermissionsModule.CanPlayerManagePlaceAsync(playersService.LocalPlayer))
	end)
end
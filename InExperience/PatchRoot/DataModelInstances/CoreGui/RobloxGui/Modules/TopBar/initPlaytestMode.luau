local Players = game:GetService("Players")
local GetPlaytestModeStoreModule = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsRoactCommon.GetPlaytestModeStore)
local PlayerPermissionsModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.PlayerPermissionsModule)

return function()
	-- upvalues: GetPlaytestModeStoreModule (copy), PlayerPermissionsModule (copy), Players (copy)
	local PlaytestModeStoreModule = GetPlaytestModeStoreModule(false)
	task.spawn(function()
		-- upvalues: PlaytestModeStoreModule (copy), PlayerPermissionsModule (upval), Players (upval)
		PlaytestModeStoreModule.setHasEditAccess(PlayerPermissionsModule.CanPlayerManagePlaceAsync(Players.LocalPlayer))
	end)
end
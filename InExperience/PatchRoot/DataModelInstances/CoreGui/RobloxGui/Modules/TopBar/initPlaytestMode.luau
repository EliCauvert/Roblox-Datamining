local playersService = game:GetService("Players")
local getPlaytestModeStoreModule = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsRoactCommon.GetPlaytestModeStore)
local playerPermissionsModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.PlayerPermissionsModule)

return function() --[[ line: 10 | named "initPlaytestMode" ]]
	-- upvalues: getPlaytestModeStoreModule (ref), playerPermissionsModule (ref), playersService (ref)
	local var3 = getPlaytestModeStoreModule(false)
	task.spawn(function() --[[ line: 13 ]]
		-- upvalues: var3 (ref), playerPermissionsModule (copy), playersService (copy)
		var3.setHasEditAccess(playerPermissionsModule.CanPlayerManagePlaceAsync(playersService.LocalPlayer))
	end)
end
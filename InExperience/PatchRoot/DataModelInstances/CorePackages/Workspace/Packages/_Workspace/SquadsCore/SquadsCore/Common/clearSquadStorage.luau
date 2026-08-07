local squadsCore = script:FindFirstAncestor("SquadsCore")
local appStorageService = game:GetService("AppStorageService")
local constantsModule = require(squadsCore.Common.Constants)
local roduxSquadsModule = require(squadsCore.RoduxSquads)

return function() --[[ line: 8 ]]
	-- upvalues: appStorageService (ref), constantsModule (ref), roduxSquadsModule (ref)
	appStorageService:SetItem(constantsModule.ACTIVE_SQUAD_APP_STORAGE_KEY, "")
	appStorageService:Flush()
	roduxSquadsModule.PersistManagers.currentSquadPersistManager.reset()
end
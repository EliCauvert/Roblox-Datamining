local SquadsCore = script:FindFirstAncestor("SquadsCore")
local AppStorageService = game:GetService("AppStorageService")
local ConstantsModule = require(SquadsCore.Common.Constants)
local RoduxSquadsModule = require(SquadsCore.RoduxSquads)

return function() --[[ Line: 8 ]]
	-- upvalues: AppStorageService (copy), ConstantsModule (copy), RoduxSquadsModule (copy)
	AppStorageService:SetItem(ConstantsModule.ACTIVE_SQUAD_APP_STORAGE_KEY, "")
	AppStorageService:Flush()
	RoduxSquadsModule.PersistManagers.currentSquadPersistManager.reset()
end
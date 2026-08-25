local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local appStorageService = game:GetService("AppStorageService")
local roduxSquadsModule = require(squadsCore.RoduxSquads)
local constantsModule = require(squadsCore.Common.Constants)
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local fetchActiveSquadModule = require(squadsCore.Thunks.fetchActiveSquad)
local useCurrentSquadIdModule = require(squadsCore.Hooks.useCurrentSquadId)
local validateSquadIdModule = require(squadsCore.Common.validateSquadId)
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect

return function()
	-- upvalues: useDispatch (ref), useCurrentSquadIdModule (ref), reactModule (ref), squadExternalContractContextModule (ref), appStorageService (ref), constantsModule (ref), useEffect (ref), validateSquadIdModule (ref), fetchActiveSquadModule (ref), roduxSquadsModule (ref)
	local var9 = useDispatch()
	local var10 = useCurrentSquadIdModule() or ""
	local var11, var12 = reactModule.useState(false)
	local var13 = reactModule.useContext(squadExternalContractContextModule).useIsChatEnabled()
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), appStorageService (copy), constantsModule (copy), var10 (ref)
		if var11 then
			appStorageService:SetItem(constantsModule.ACTIVE_SQUAD_APP_STORAGE_KEY, var10)
			appStorageService:Flush()
		end
	end, { var10, var11 })
	useEffect(function()
		-- upvalues: var13 (ref), appStorageService (copy), constantsModule (copy), validateSquadIdModule (copy), var10 (ref), var9 (ref), fetchActiveSquadModule (copy), roduxSquadsModule (copy), var12 (ref)
		if not var13 then return end
		local active_squad_app_storage_keyItem = appStorageService:GetItem(constantsModule.ACTIVE_SQUAD_APP_STORAGE_KEY)
		local var15 = validateSquadIdModule(active_squad_app_storage_keyItem)
		
		if var15 and var10 == "" then
			var9(fetchActiveSquadModule())
		elseif active_squad_app_storage_keyItem ~= "" and not var15 or var10 ~= "" and var10 ~= active_squad_app_storage_keyItem then
			var9(roduxSquadsModule.Actions.CurrentSquadUpdated(nil))
			appStorageService:SetItem(constantsModule.ACTIVE_SQUAD_APP_STORAGE_KEY, "")
			appStorageService:Flush()
		end
		var12(true)
	end, { var13 })
	
	return nil
end
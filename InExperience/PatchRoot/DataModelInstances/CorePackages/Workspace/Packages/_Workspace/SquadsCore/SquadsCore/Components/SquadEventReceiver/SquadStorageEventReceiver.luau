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
	local var1 = useDispatch()
	local var2 = useCurrentSquadIdModule() or ""
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useContext(squadExternalContractContextModule).useIsChatEnabled()
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), appStorageService (copy), constantsModule (copy), var2 (ref)
		if var3 then
			appStorageService:SetItem(constantsModule.ACTIVE_SQUAD_APP_STORAGE_KEY, var2)
			appStorageService:Flush()
		end
	end, { var2, var3 })
	useEffect(function()
		-- upvalues: var5 (ref), appStorageService (copy), constantsModule (copy), validateSquadIdModule (copy), var2 (ref), var1 (ref), fetchActiveSquadModule (copy), roduxSquadsModule (copy), var4 (ref)
		if not var5 then return end
		local active_squad_app_storage_keyItem = appStorageService:GetItem(constantsModule.ACTIVE_SQUAD_APP_STORAGE_KEY)
		local var6 = validateSquadIdModule(active_squad_app_storage_keyItem)
		
		if var6 and var2 == "" then
			var1(fetchActiveSquadModule())
		elseif active_squad_app_storage_keyItem ~= "" and not var6 or var2 ~= "" and var2 ~= active_squad_app_storage_keyItem then
			var1(roduxSquadsModule.Actions.CurrentSquadUpdated(nil))
			appStorageService:SetItem(constantsModule.ACTIVE_SQUAD_APP_STORAGE_KEY, "")
			appStorageService:Flush()
		end
		var4(true)
	end, { var5 })
	
	return nil
end
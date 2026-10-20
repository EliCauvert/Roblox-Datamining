local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local AppStorageService = game:GetService("AppStorageService")
local RoduxSquadsModule = require(SquadsCore.RoduxSquads)
local ConstantsModule = require(SquadsCore.Common.Constants)
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local FetchActiveSquadModule = require(SquadsCore.Thunks.fetchActiveSquad)
local UseCurrentSquadIdModule = require(SquadsCore.Hooks.useCurrentSquadId)
local ValidateSquadIdModule = require(SquadsCore.Common.validateSquadId)
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect

return function()
	-- upvalues: UseDispatchFunction (copy), UseCurrentSquadIdModule (copy), ReactModule (copy), SquadExternalContractContextModule (copy), AppStorageService (copy), ConstantsModule (copy), UseEffectFunction (copy), ValidateSquadIdModule (copy), FetchActiveSquadModule (copy), RoduxSquadsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseCurrentSquadIdModuleResult = UseCurrentSquadIdModule() or ""
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseIsChatEnabledResult = ReactModule.useContext(SquadExternalContractContextModule).useIsChatEnabled()
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), AppStorageService (upval), ConstantsModule (upval), UseCurrentSquadIdModuleResult (copy)
		if UseStateResult then
			AppStorageService:SetItem(ConstantsModule.ACTIVE_SQUAD_APP_STORAGE_KEY, UseCurrentSquadIdModuleResult)
			AppStorageService:Flush()
		end
	end, { UseCurrentSquadIdModuleResult, UseStateResult })
	UseEffectFunction(function()
		-- upvalues: UseIsChatEnabledResult (copy), AppStorageService (upval), ConstantsModule (upval), ValidateSquadIdModule (upval), UseCurrentSquadIdModuleResult (copy), UseDispatchResult (copy), FetchActiveSquadModule (upval), RoduxSquadsModule (upval), UseStateResult2 (copy)
		if not UseIsChatEnabledResult then return end
		local Item = AppStorageService:GetItem(ConstantsModule.ACTIVE_SQUAD_APP_STORAGE_KEY)
		local ValidateSquadIdModuleResult = ValidateSquadIdModule(Item)
		
		if ValidateSquadIdModuleResult and UseCurrentSquadIdModuleResult == "" then
			UseDispatchResult(FetchActiveSquadModule())
		elseif Item ~= "" and not ValidateSquadIdModuleResult or UseCurrentSquadIdModuleResult ~= "" and UseCurrentSquadIdModuleResult ~= Item then
			UseDispatchResult(RoduxSquadsModule.Actions.CurrentSquadUpdated(nil))
			AppStorageService:SetItem(ConstantsModule.ACTIVE_SQUAD_APP_STORAGE_KEY, "")
			AppStorageService:Flush()
		end
		UseStateResult2(true)
	end, { UseIsChatEnabledResult })
	
	return nil
end
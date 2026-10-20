local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RobloxSubscriptionPurchaseAppModule = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp)

return function()
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), RobloxSubscriptionPurchaseAppModule (copy), UseSignalStateFunction (copy), ReactModule (copy), Modules (copy)
	if game:GetEngineFeature("ReadHasRobloxSubscriptionLua") then
		local UseDispatchResult = UseDispatchFunction()
		local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
		local UseSignalStateResult = UseSignalStateFunction(RobloxSubscriptionPurchaseAppModule.RobloxSubscriptionSignals.get().getHasRobloxSubscription)
		local UseRefResult = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (copy), UseSignalStateResult (copy), Modules (upval), UseDispatchResult (copy), UseRoactServiceModuleResult (copy)
			UseRefResult.current = UseSignalStateResult
			
			if UseRefResult.current == false and UseSignalStateResult == true then
				UseDispatchResult(require(Modules.LuaApp.Thunks.Economy.FetchAllExperienceStoreProducts)(UseRoactServiceModuleResult))
			end
		end, {
			UseSignalStateResult,
			UseDispatchResult,
			UseRoactServiceModuleResult
		})
		
		return nil
	else
		return nil
	end
end
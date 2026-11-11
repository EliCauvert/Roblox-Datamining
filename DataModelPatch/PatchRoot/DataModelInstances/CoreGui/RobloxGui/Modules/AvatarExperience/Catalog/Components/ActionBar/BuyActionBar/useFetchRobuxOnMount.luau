local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local ApiFetchEconomyCurrencyModule = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals

local function selectRobuxFetchInfo(p1)
	return {
		localUserId = p1.LocalUserId,
		userRobux = p1.UserRobux[p1.LocalUserId]
	}
end

return function()
	-- upvalues: UseSelectorFunction (copy), selectRobuxFetchInfo (copy), GetUseSelectorDeepEqualsFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), UseDispatchFunction (copy), ReactModule (copy), ApiFetchEconomyCurrencyModule (copy)
	local UseSelectorResult = UseSelectorFunction(selectRobuxFetchInfo, GetUseSelectorDeepEqualsFunction())
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseDispatchResult (copy), ApiFetchEconomyCurrencyModule (upval), UseRoactServiceModuleResult (copy)
		if UseSelectorResult.userRobux == nil then
			UseDispatchResult(ApiFetchEconomyCurrencyModule(UseRoactServiceModuleResult, UseSelectorResult.localUserId, false))
		end
	end, {})
end
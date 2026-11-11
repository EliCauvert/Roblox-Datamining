local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RecommendedGamesModule = require(Modules.LuaApp.Thunks.Games.RecommendedGames)
local ApiFetchExperienceDetailsPageModule = require(Modules.LuaApp.Thunks.Games.ApiFetchExperienceDetailsPage)
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local t = {}

return function(p1, p2)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseSelectorFunction (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ApiFetchExperienceDetailsPageModule (copy), RecommendedGamesModule (copy), t (copy), ReactModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseSelectorResult = UseSelectorFunction(function(p3)
		-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p2 (copy), p1 (copy), ApiFetchExperienceDetailsPageModule (upval), RecommendedGamesModule (upval)
		return (if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p2 then p1 and ApiFetchExperienceDetailsPageModule.GetFetchingStatus(p3, p1) else p1 and RecommendedGamesModule.GetFetchingStatus(p3, p1)) or nil
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p3)
		-- upvalues: p1 (copy), t (upval)
		local RecommendedGameEntry = p3.RecommendedGameEntries and p3.RecommendedGameEntries[p1] or nil
		
		return if RecommendedGameEntry then RecommendedGameEntry else t
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p2 (copy), UseDispatchResult (copy), RecommendedGamesModule (upval), UseRoactServiceResult (copy), p1 (copy)
		if not FFlagLuaAppEdpBackendV2HydrateLegacyDefault and (not FFlagLuaAppEdpBackendV2HydrateLegacyIxp or not p2) then
			UseDispatchResult(RecommendedGamesModule.Fetch(UseRoactServiceResult, p1, { maxRows = 6 }))
			
			return
		end
	end, { UseDispatchResult, UseRoactServiceResult, p1, p2 })
	ReactModule.useEffect(function()
		-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p2 (copy), UseResult (copy)
		if not FFlagLuaAppEdpBackendV2HydrateLegacyDefault and (not FFlagLuaAppEdpBackendV2HydrateLegacyIxp or not p2) then
			UseResult()
			
			return
		end
	end, { UseResult, p2 })
	
	return {
		fetchStatus = UseSelectorResult,
		refetchRecommendedGames = UseResult,
		recommendedGames = UseSelectorResult1
	}
end
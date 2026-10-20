local CorePackages = game:GetService("CorePackages")
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local ReactModule = require(CorePackages.Packages.React)
local FetchGameDetailsPageDataModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.Games.FetchGameDetailsPageData)
local ServerDrivenUiModule = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local EdpSduiUtilsModule = require(script.Parent.EdpSduiUtils)
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault

return function(p1, p2, p3)
	-- upvalues: UseDispatchFunction (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ReactModule (copy), ServerDrivenUiModule (copy), EdpSduiUtilsModule (copy), SignalsReactModule (copy), FetchGameDetailsPageDataModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSignalStateResult = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), p3 (copy), p1 (copy), ServerDrivenUiModule (upval), EdpSduiUtilsModule (upval)
		return function(p4)
			-- upvalues: FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), p3 (upval), p1 (upval), ServerDrivenUiModule (upval), EdpSduiUtilsModule (upval)
			return if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p3) and p1 then ServerDrivenUiModule.getSduiFeedStore(EdpSduiUtilsModule.getEdpStoreKey((tostring(p1)))).getDataUpdatedTimestamp(p4) else nil
		end
	end, { p1, p3 }))) else nil
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseDispatchResult (copy), FetchGameDetailsPageDataModule (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p2 (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), p3 (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), UseSignalStateResult (ref)
		return {
			fetchGameDetailsPageData = function(p4, p5, p6)
				-- upvalues: UseDispatchResult (upval), FetchGameDetailsPageDataModule (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p2 (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), p3 (upval), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), UseSignalStateResult (upval)
				return UseDispatchResult(FetchGameDetailsPageDataModule(p4, p5, p6, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p2 else nil, if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then p3 else nil, if FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p3 then UseSignalStateResult elseif FFlagLuaAppEdpBackendV2SduiInterleaveDefault then UseSignalStateResult else nil))
			end
		}
	end, {
		UseDispatchResult,
		UseSignalStateResult,
		if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then p3 else nil,
		if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p2 else nil
	}))
end
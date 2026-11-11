local IXPService = game:GetService("IXPService")
local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local CentralOverlayType = require(CorePackages.Workspace.Packages.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay
local UseUserExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local FFlagSignalsNavP3hMisc = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3hMisc
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GetCurrentPageModule = require(Modules.LuaApp.getCurrentPage)
local WaitUntilIXPUserInitModule = require(Modules.LuaApp.Thunks.WaitUntilIXPUserInit)
local LuaAppVngAppIxpUserLayer = game:DefineFastString("LuaAppVngAppIxpUserLayer", "PlayerApp.HomePageUpsell.VNGApp")
local LuaAppVngIxpFrequency = game:DefineFastString("LuaAppVngIxpFrequency", "frequency")
local LuaAppVngIxpDismissable = game:DefineFastString("LuaAppVngIxpDismissable", "dismissable")
local LuaAppVngIxpEnabled = game:DefineFastString("LuaAppVngIxpEnabled", "enabled")
local LuaAppVngUpsellNagFrequencySec = game:DefineFastInt("LuaAppVngUpsellNagFrequencySec", 86400)
local LuaAppVngUpsellAlwaysEnabled = game:DefineFastFlag("LuaAppVngUpsellAlwaysEnabled", false)
local LuaAppVngUpsellAlwaysCanClose = game:DefineFastFlag("LuaAppVngUpsellAlwaysCanClose", false)
local NewUnixTimestampMillis = nil

return function(_)
	-- upvalues: ReactModule (copy), FFlagSignalsNavP3hMisc (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), GetCurrentPageModule (copy), UseDispatchFunction (copy), LuaAppVngUpsellAlwaysEnabled (copy), UseUserExperimentFunction (copy), LuaAppVngAppIxpUserLayer (copy), LuaAppVngIxpEnabled (copy), LuaAppVngIxpDismissable (copy), LuaAppVngIxpFrequency (copy), Players (copy), WaitUntilIXPUserInitModule (copy), IXPService (copy), NewUnixTimestampMillis (ref), LuaAppVngUpsellNagFrequencySec (copy), LuaAppVngUpsellAlwaysCanClose (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Name = if FFlagSignalsNavP3hMisc then UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentPage).name else UseSelectorFunction(GetCurrentPageModule)
	local UseDispatchResult = UseDispatchFunction()
	local t = {}
	
	if not LuaAppVngUpsellAlwaysEnabled then
		t = UseUserExperimentFunction({ LuaAppVngAppIxpUserLayer }, function(p1)
			-- upvalues: LuaAppVngAppIxpUserLayer (upval), LuaAppVngIxpEnabled (upval), LuaAppVngIxpDismissable (upval), LuaAppVngIxpFrequency (upval)
			local v1 = p1[LuaAppVngAppIxpUserLayer] or {}
			local Text = tostring(v1[LuaAppVngIxpEnabled])
			local Text1 = tostring(v1[LuaAppVngIxpDismissable])
			
			return {
				upsellEnabled = if Text then Text == "true" else false,
				upsellFrequency = v1[LuaAppVngIxpFrequency],
				upsellDismissable = if Text1 then Text1 == "true" else false
			}
		end)
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult (copy), Players (upval), UseDispatchResult (copy), WaitUntilIXPUserInitModule (upval), IXPService (upval), UseStateResult2 (copy)
			if not UseStateResult then
				UseDispatchResult(WaitUntilIXPUserInitModule(IXPService, Players.LocalPlayer and Players.LocalPlayer.UserId or 0)):andThen(function()
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(true)
				end)
			end
		end, { UseStateResult })
	end
	ReactModule.useEffect(function()
		-- upvalues: LuaAppVngUpsellAlwaysEnabled (upval), UseStateResult (copy), t (ref), NewUnixTimestampMillis (upval), LuaAppVngUpsellNagFrequencySec (upval), LuaAppVngUpsellAlwaysCanClose (upval), UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
		if (LuaAppVngUpsellAlwaysEnabled or UseStateResult and t.upsellEnabled) and (not NewUnixTimestampMillis or NewUnixTimestampMillis < DateTime.now().UnixTimestampMillis) then
			NewUnixTimestampMillis = DateTime.now().UnixTimestampMillis + (if t.upsellFrequency then tonumber(t.upsellFrequency) else LuaAppVngUpsellNagFrequencySec) * 1000
			UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.VngAppUpsell, {
				isDismissable = if t.upsellDismissable then t.upsellDismissable else LuaAppVngUpsellAlwaysCanClose
			}))
		end
	end, { NewUnixTimestampMillis, Name, t, UseStateResult })
	
	return nil
end
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppStorageService = game:GetService("AppStorageService")
local EnableSystemTrayEngineFeature = game:GetEngineFeature("EnableSystemTray")
local FFlagEnableSystemTrayModals = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSystemTrayModals
local FFlagDebugAlwaysShowSystemTrayModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagDebugAlwaysShowSystemTrayModal
local LocalStorageKey = require(CorePackages.Workspace.Packages.LocalStorage).Enums.LocalStorageKey
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)

return function()
	-- upvalues: FFlagEnableSystemTrayModals (copy), EnableSystemTrayEngineFeature (copy), AppStorageService (copy), LocalStorageKey (copy), FFlagDebugAlwaysShowSystemTrayModal (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return function(p1): boolean
		-- upvalues: FFlagEnableSystemTrayModals (upval), EnableSystemTrayEngineFeature (upval), AppStorageService (upval), LocalStorageKey (upval), FFlagDebugAlwaysShowSystemTrayModal (upval), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
		if not FFlagEnableSystemTrayModals then
			return false
		end
		if not EnableSystemTrayEngineFeature then
			return false
		end
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval), LocalStorageKey (upval)
			return AppStorageService:GetItem(LocalStorageKey.MinimizeToTray)
		end)
		
		if not Success or Result == "false" then
			return false
		end
		if FFlagDebugAlwaysShowSystemTrayModal then
			AppStorageService:SetItem("SystemTrayModalShown", "false")
			AppStorageService:Flush()
		end
		local Success1, Result1 = pcall(function()
			-- upvalues: AppStorageService (upval)
			return AppStorageService:GetItem("SystemTrayModalShown")
		end)
		
		if Success1 and Result1 == "true" or false then
			return false
		else
			pcall(function()
				-- upvalues: AppStorageService (upval)
				AppStorageService:SetItem("SystemTrayModalShown", "true")
				AppStorageService:Flush()
			end)
			p1:dispatch(SetCentralOverlayModule(OverlayTypeModule.SystemTrayModal, {}))
			
			return true
		end
	end
end
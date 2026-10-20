local Parent = script:FindFirstAncestor("PreHomePage").Parent
local Logger = require(Parent.Loggers).Logger
local LinkingProtocol = require(Parent.LinkingProtocol).LinkingProtocol
local PromiseModule = require(Parent.Promise)
local FFlagDebugAlwaysShowSystemTrayModal = require(Parent.SharedFlags).FFlagDebugAlwaysShowSystemTrayModal
local EnableSystemTrayEngineFeature = game:GetEngineFeature("EnableSystemTray")
local Players = game:GetService("Players")
local AppStorageService = game:GetService("AppStorageService")
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType

return function(_, p1, _)
	-- upvalues: LinkingProtocol (copy), Logger (copy), PromiseModule (copy), EnableSystemTrayEngineFeature (copy), Players (copy), FFlagDebugAlwaysShowSystemTrayModal (copy), AppStorageService (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	if LinkingProtocol:getLastLuaURL() ~= nil and LinkingProtocol:getLastLuaURL() ~= "" then
		Logger:info("Skipping notifications upsell due to deep link")
		
		return PromiseModule.resolve(false)
	end
	if not EnableSystemTrayEngineFeature then
		return PromiseModule.resolve(false)
	end
	local LocalPlayer = Players.LocalPlayer
	
	if not LocalPlayer or not LocalPlayer:GetUnder13() then
		return PromiseModule.resolve(false)
	end
	if FFlagDebugAlwaysShowSystemTrayModal then
		AppStorageService:SetItem("DesktopNotificationsModalShown", "false")
		AppStorageService:Flush()
	end
	local Success, Result = pcall(function()
		-- upvalues: AppStorageService (upval)
		return AppStorageService:GetItem("DesktopNotificationsModalShown")
	end)
	
	if Success and Result == "true" or false then
		return PromiseModule.resolve(false)
	else
		pcall(function()
			-- upvalues: AppStorageService (upval)
			AppStorageService:SetItem("DesktopNotificationsModalShown", "true")
			AppStorageService:Flush()
		end)
		p1:dispatch(SetCentralOverlayFunction(CentralOverlayType.NotificationsModal, {}))
		
		return PromiseModule.resolve(false)
	end
end
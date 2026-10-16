local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local CaptureService = game:GetService("CaptureService")
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local GetAvatarAssetsModule = require(Parent.Utils.getAvatarAssets)
local GetScreenshotHudModule = require(Parent.Utils.getScreenshotHud)
local GetUserMetadataModule = require(Parent.Utils.getUserMetadata)
local IXPServiceWrapper = require(Parent1.IXPServiceWrapper).IXPServiceWrapper
local OverlayActivatedModule = require(Parent.Actions.OverlayActivated)
local OverlayDeactivatedModule = require(Parent.Actions.OverlayDeactivated)
local OverlayFlashActivatedModule = require(Parent.Actions.OverlayFlashActivated)
local OverlayFlashDeactivatedModule = require(Parent.Actions.OverlayFlashDeactivated)
local PendingCaptureToastActionModule = require(Parent.Utils.pendingCaptureToastAction)
local RemoveCoreUIModule = require(Parent.Utils.removeCoreUI)
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)
local _ = require(Parent.Types)
local FStringSocialCaptureTakenIXPLayer = require(Parent1.SharedFlags).FStringSocialCaptureTakenIXPLayer
local FFlagBuildExperienceInGameCaptureToChat = require(Parent1.SharedFlags).FFlagBuildExperienceInGameCaptureToChat
local DebugAPPEXP4747B = game:DefineFastFlag("DebugAPPEXP4747B", false)

local function _(GuiType) --[[ Line: 28 | Named "hideGui" ]]
	-- upvalues: GuiService (copy)
	if GuiService:GetGuiIsVisible(GuiType) then
		GuiService:ToggleGuiIsVisibleForCaptures(GuiType)
	end
end

local _ = function(GuiType) --[[ Line: 34 | Named "showGui" ]]
	-- upvalues: GuiService (copy)
	if not GuiService:GetGuiIsVisible(GuiType) then
		GuiService:ToggleGuiIsVisibleForCaptures(GuiType)
	end
end

local _ = function() --[[ Line: 40 | Named "hidePlayerGui" ]]
	-- upvalues: GuiService (copy)
	if GuiService:GetGuiIsVisible(Enum.GuiType.Custom) then
		GuiService:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom)
	end
end

local _ = function() --[[ Line: 46 | Named "showPlayerGui" ]]
	-- upvalues: GuiService (copy)
	if not GuiService:GetGuiIsVisible(Enum.GuiType.Custom) then
		GuiService:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom)
	end
end

return function(p1) --[[ Line: 52 ]]
	-- upvalues: FFlagBuildExperienceInGameCaptureToChat (copy), PendingCaptureToastActionModule (copy), ToastTriggeredModule (copy), CapturesToastTypeModule (copy), UserInputService (copy), GetScreenshotHudModule (copy), DebugAPPEXP4747B (copy), GuiService (copy), RemoveCoreUIModule (copy), OverlayActivatedModule (copy), CaptureService (copy), GetAvatarAssetsModule (copy), GetUserMetadataModule (copy), HttpService (copy), OverlayFlashActivatedModule (copy), OverlayFlashDeactivatedModule (copy), OverlayDeactivatedModule (copy), IXPServiceWrapper (copy), FStringSocialCaptureTakenIXPLayer (copy)
	return function(p2) --[[ Line: 53 ]]
		-- upvalues: FFlagBuildExperienceInGameCaptureToChat (upval), PendingCaptureToastActionModule (upval), p1 (copy), ToastTriggeredModule (upval), CapturesToastTypeModule (upval), UserInputService (upval), GetScreenshotHudModule (upval), DebugAPPEXP4747B (upval), GuiService (upval), RemoveCoreUIModule (upval), OverlayActivatedModule (upval), CaptureService (upval), GetAvatarAssetsModule (upval), GetUserMetadataModule (upval), HttpService (upval), OverlayFlashActivatedModule (upval), OverlayFlashDeactivatedModule (upval), OverlayDeactivatedModule (upval), IXPServiceWrapper (upval), FStringSocialCaptureTakenIXPLayer (upval)
		local Flag = false
		local Flag1 = false
		
		if FFlagBuildExperienceInGameCaptureToChat then
			PendingCaptureToastActionModule.set(if p1 then p1.toastAction else nil)
		end
		p2:dispatch(ToastTriggeredModule(CapturesToastTypeModule.None))
		local OverrideMouseIconBehavior = UserInputService.OverrideMouseIconBehavior
		UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
		local ScreenshotHudModule = GetScreenshotHudModule()
		
		if not DebugAPPEXP4747B and (not ScreenshotHudModule or ScreenshotHudModule.HidePlayerGuiForCaptures) then
			if GuiService:GetGuiIsVisible(Enum.GuiType.Custom) then
				GuiService:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom)
			end
			Flag1 = true
		end
		local Callback: () -> () = nil
		
		if not DebugAPPEXP4747B then
			if not ScreenshotHudModule or ScreenshotHudModule.HideCoreGuiForCaptures then
				Callback = RemoveCoreUIModule()
				Flag = true
			end
			local CustomBillboards = Enum.GuiType.CustomBillboards
			
			if GuiService:GetGuiIsVisible(CustomBillboards) then
				GuiService:ToggleGuiIsVisibleForCaptures(CustomBillboards)
			end
			local PlayerNameplates = Enum.GuiType.PlayerNameplates
			
			if GuiService:GetGuiIsVisible(PlayerNameplates) then
				GuiService:ToggleGuiIsVisibleForCaptures(PlayerNameplates)
			end
		end
		p2:dispatch(OverlayActivatedModule())
		CaptureService:OnCaptureBegan()
		task.wait(0.1)
		local AvatarAssetsModule = GetAvatarAssetsModule()
		local UserMetadataModule = GetUserMetadataModule()
		
		if next(AvatarAssetsModule) == nil and next(UserMetadataModule) == nil then
			CaptureService:SaveScreenshotCapture()
		else
			CaptureService:SaveScreenshotCapture(HttpService:JSONEncode({
				avatarItems = if next(AvatarAssetsModule) == nil then nil else AvatarAssetsModule,
				userMetadata = if next(UserMetadataModule) == nil then nil else UserMetadataModule
			}))
		end
		task.wait()
		p2:dispatch(OverlayFlashActivatedModule())
		task.wait(0.5)
		CaptureService:OnCaptureEnded()
		p2:dispatch(OverlayFlashDeactivatedModule())
		p2:dispatch(OverlayDeactivatedModule())
		UserInputService.OverrideMouseIconBehavior = OverrideMouseIconBehavior
		
		if Flag1 and not GuiService:GetGuiIsVisible(Enum.GuiType.Custom) then
			GuiService:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom)
		end
		if Flag then
			Callback()
		end
		local CustomBillboards = Enum.GuiType.CustomBillboards
		
		if not GuiService:GetGuiIsVisible(CustomBillboards) then
			GuiService:ToggleGuiIsVisibleForCaptures(CustomBillboards)
		end
		local PlayerNameplates = Enum.GuiType.PlayerNameplates
		
		if not GuiService:GetGuiIsVisible(PlayerNameplates) then
			GuiService:ToggleGuiIsVisibleForCaptures(PlayerNameplates)
		end
		IXPServiceWrapper:LogUserLayerExposure(FStringSocialCaptureTakenIXPLayer)
	end
end
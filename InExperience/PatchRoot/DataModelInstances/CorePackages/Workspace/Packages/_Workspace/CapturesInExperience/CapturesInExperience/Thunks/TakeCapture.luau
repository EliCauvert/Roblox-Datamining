local parent = script.Parent.Parent
local parent_1 = parent.Parent
local captureService = game:GetService("CaptureService")
local guiService = game:GetService("GuiService")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local getAvatarAssetsModule = require(parent.Utils.getAvatarAssets)
local getScreenshotHudModule = require(parent.Utils.getScreenshotHud)
local getUserMetadataModule = require(parent.Utils.getUserMetadata)
local IXPServiceWrapper = require(parent_1.IXPServiceWrapper).IXPServiceWrapper
local overlayActivatedModule = require(parent.Actions.OverlayActivated)
local overlayDeactivatedModule = require(parent.Actions.OverlayDeactivated)
local overlayFlashActivatedModule = require(parent.Actions.OverlayFlashActivated)
local overlayFlashDeactivatedModule = require(parent.Actions.OverlayFlashDeactivated)
local removeCoreUIModule = require(parent.Utils.removeCoreUI)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)
local fStringSocialCaptureTakenIXPLayer = require(parent_1.SharedFlags).FStringSocialCaptureTakenIXPLayer
local debugAPPEXP4747B = game:DefineFastFlag("DebugAPPEXP4747B", false)

local function _(p0)
	-- upvalues: guiService (ref)
	if guiService:GetGuiIsVisible(p0) then
		guiService:ToggleGuiIsVisibleForCaptures(p0)
	end
end

local _ = function(p1)
	-- upvalues: guiService (ref)
	if not guiService:GetGuiIsVisible(p1) then
		guiService:ToggleGuiIsVisibleForCaptures(p1)
	end
end

local _ = function()
	-- upvalues: guiService (ref)
	if guiService:GetGuiIsVisible(Enum.GuiType.Custom) then
		guiService:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom)
	end
end

local _ = function()
	-- upvalues: guiService (ref)
	if not guiService:GetGuiIsVisible(Enum.GuiType.Custom) then
		guiService:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom)
	end
end

return function()
	-- upvalues: toastTriggeredModule (ref), capturesToastTypeModule (ref), userInputService (ref), getScreenshotHudModule (ref), debugAPPEXP4747B (ref), guiService (ref), removeCoreUIModule (ref), overlayActivatedModule (ref), captureService (ref), getAvatarAssetsModule (ref), getUserMetadataModule (ref), httpService (ref), overlayFlashActivatedModule (ref), overlayFlashDeactivatedModule (ref), overlayDeactivatedModule (ref), IXPServiceWrapper (ref), fStringSocialCaptureTakenIXPLayer (ref)
	return function(p2)
		-- upvalues: toastTriggeredModule (copy), capturesToastTypeModule (copy), userInputService (copy), getScreenshotHudModule (copy), debugAPPEXP4747B (copy), guiService (copy), removeCoreUIModule (copy), overlayActivatedModule (copy), captureService (copy), getAvatarAssetsModule (copy), getUserMetadataModule (copy), httpService (copy), overlayFlashActivatedModule (copy), overlayFlashDeactivatedModule (copy), overlayDeactivatedModule (copy), IXPServiceWrapper (copy), fStringSocialCaptureTakenIXPLayer (copy)
		local var15 = false
		local var16 = false
		p2:dispatch(toastTriggeredModule(capturesToastTypeModule.None))
		local overrideMouseIconBehavior = userInputService.OverrideMouseIconBehavior
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
		local var17 = getScreenshotHudModule()
		
		if not debugAPPEXP4747B and (not var17 or var17.HidePlayerGuiForCaptures) then
			if guiService:GetGuiIsVisible(Enum.GuiType.Custom) then
				guiService:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom)
			end
			var16 = true
		end
		local var18 = nil
		
		if not debugAPPEXP4747B then
			if not var17 or var17.HideCoreGuiForCaptures then
				var18 = removeCoreUIModule()
				var15 = true
			end
			local customBillboards = Enum.GuiType.CustomBillboards
			
			if guiService:GetGuiIsVisible(customBillboards) then
				guiService:ToggleGuiIsVisibleForCaptures(customBillboards)
			end
			local playerNameplates = Enum.GuiType.PlayerNameplates
			
			if guiService:GetGuiIsVisible(playerNameplates) then
				guiService:ToggleGuiIsVisibleForCaptures(playerNameplates)
			end
		end
		p2:dispatch(overlayActivatedModule())
		captureService:OnCaptureBegan()
		task.wait(0.1)
		local var19 = getAvatarAssetsModule()
		local var20 = getUserMetadataModule()
		
		if next(var19) == nil and next(var20) == nil then
			captureService:SaveScreenshotCapture()
		else
			captureService:SaveScreenshotCapture(httpService:JSONEncode({
				avatarItems = if next(var19) ~= nil then nil else var19,
				userMetadata = if next(var20) ~= nil then nil else var20
			}))
		end
		task.wait()
		p2:dispatch(overlayFlashActivatedModule())
		task.wait(0.5)
		captureService:OnCaptureEnded()
		p2:dispatch(overlayFlashDeactivatedModule())
		p2:dispatch(overlayDeactivatedModule())
		userInputService.OverrideMouseIconBehavior = overrideMouseIconBehavior
		
		if var16 and not guiService:GetGuiIsVisible(Enum.GuiType.Custom) then
			guiService:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom)
		end
		if var15 then
			var18()
		end
		local customBillboards = Enum.GuiType.CustomBillboards
		
		if not guiService:GetGuiIsVisible(customBillboards) then
			guiService:ToggleGuiIsVisibleForCaptures(customBillboards)
		end
		local playerNameplates = Enum.GuiType.PlayerNameplates
		
		if not guiService:GetGuiIsVisible(playerNameplates) then
			guiService:ToggleGuiIsVisibleForCaptures(playerNameplates)
		end
		IXPServiceWrapper:LogUserLayerExposure(fStringSocialCaptureTakenIXPLayer)
	end
end
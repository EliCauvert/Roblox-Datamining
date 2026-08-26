local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local serviceModule = require(chrome.Service)
local chromeUtilsModule = require(chrome.ChromeShared.Service.ChromeUtils)
local videoCaptureService = game:GetService("VideoCaptureService")
local faceAnimatorService = game:GetService("FaceAnimatorService")
local socialService = game:GetService("SocialService")
local starterGuiService = game:GetService("StarterGui")
local commonIconModule = require(chrome.Integrations.CommonIcon)
local mappedSignal = chromeUtilsModule.MappedSignal
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local constantsModule = require(robloxGui.Modules.TopBar.Constants)
local var1 = constantsModule.ApplyDisplayScale(constantsModule.TopBarHeight)
local selfieView = chrome.Parent.SelfieView
local getFFlagChromeSelfViewIgnoreCoreGuiModule = require(chrome.Flags.GetFFlagChromeSelfViewIgnoreCoreGui)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local fFlagEnableConsoleExpControls = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local unknownModule = require(selfieView)
local faceChatUtilsModule = require(selfieView.Utils.FaceChatUtils)
local sizingUtilsModule = require(selfieView.Utils.SizingUtils)
local selfieViewPolicyModule = require(selfieView.Utils.SelfieViewPolicy)
local availabilitySignalState = require(chrome.ChromeShared.Service.ChromeUtils).AvailabilitySignalState
local windowSizeSignalModule = require(chrome.ChromeShared.Service.WindowSizeSignal)
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local viewportUtilModule = require(chrome.ChromeShared.Service.ViewportUtil)
local size = sizingUtilsModule.getSize(viewportUtilModule.screenSize:get(), false)
local var2 = windowSizeSignalModule.new(size.X, size.Y)
local constantsModule_1 = require(chrome.ChromeShared.Unibar.Constants)
local var3 = require(robloxGui.Modules.SelfView.Analytics).new()
local SELFIE_VIEW_ID = constantsModule_1.SELFIE_VIEW_ID
local var4 = mappedSignal.new(serviceModule:onIntegrationStatusChanged(), function()
	-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref)
	return serviceModule:isWindowOpen(SELFIE_VIEW_ID)
end)
local var5 = nil
local var6 = nil
local var7 = serviceModule:register({
	label = "CoreScripts.TopBar.SelfViewLabel",
	windowDefaultOpen = false,
	persistWindowState = true,
	draggable = true,
	cachePosition = true,
	id = SELFIE_VIEW_ID,
	sideSheetPlacement = sideSheetPlacement.Page,
	windowSize = var2,
	initialAvailability = availabilitySignalState.Unavailable,
	activated = function()
		-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref)
		serviceModule:toggleWindow(SELFIE_VIEW_ID)
	end,
	isActivated = var4,
	components = {
		Icon = function(_)
			-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule_1 (ref), reactModule (ref), commonIconModule (ref), var4 (ref), unknownModule (ref), serviceModule (ref), SELFIE_VIEW_ID (ref)
			local _ = nil
			local var8 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else constantsModule_1.ICON_SIZE
			
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var8, 0, var8)
			}, {
				commonIconModule("icons/controls/selfieOff", "icons/controls/selfie", var4),
				CameraStatusDot = if unknownModule.useCameraOn() and not serviceModule:isWindowOpen(SELFIE_VIEW_ID) then reactModule.createElement(unknownModule.CameraStatusDot, { ZIndex = 2, Position = UDim2.fromScale(0.8, 0.7) }) else nil
			}, {})
		end,
		Window = function(_)
			-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref), reactModule (ref), unknownModule (ref), var2 (ref)
			local var8 = serviceModule:dragConnection(SELFIE_VIEW_ID)
			
			return reactModule.createElement(unknownModule.Window, {
				id = SELFIE_VIEW_ID,
				windowSize = var2,
				isDraggedOut = var8 ~= nil and var8.connection ~= nil
			}, {})
		end
	}
})
viewportUtilModule.screenSize:connect(function(p1)
	-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref), sizingUtilsModule (ref), var2 (ref)
	if not serviceModule:isWindowOpen(SELFIE_VIEW_ID) then
		local size = sizingUtilsModule.getSize(p1, var2:getIsLarge())
		var2:requestSize(size.X, size.Y)
	end
end, true)

local var8 = function()
	-- upvalues: starterGuiService (ref), getFFlagChromeSelfViewIgnoreCoreGuiModule (ref), faceChatUtilsModule (ref), var7 (ref)
	if getFFlagChromeSelfViewIgnoreCoreGuiModule() or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView) then
		local permissions = faceChatUtilsModule.getPermissions()
		
		if (permissions.placeCamEnabled or permissions.placeMicEnabled) and (permissions.userCamEligible or permissions.userMicEligible) then
			var7.availability:available()
			
			return
		end
		var7.availability:unavailable()
		
		return
	elseif faceChatUtilsModule.isCameraOn() then
		faceChatUtilsModule.toggleVideoAnimation()
	end
	var7.availability:unavailable()
end

local _ = function()
	-- upvalues: faceChatUtilsModule (ref), var3 (ref)
	local permissions = faceChatUtilsModule.getPermissions()
	var3:reportExperienceSettings(true, permissions.placeCamEnabled, permissions.placeMicEnabled)
	var3:reportUserAccountSettings(permissions.userCamEnabled, permissions.userMicEnabled)
end

if fFlagEnableConsoleExpControls then
	local var9 = selfieViewPolicyModule.PolicyImplementation.read()
	
	if not (if var9 then selfieViewPolicyModule.Mapper(var9).eligibleForSelfieViewFeature() else false) then
		var7.availability:forceUnavailable()
	end
end
if game:GetEngineFeature("VideoCaptureService") then
	var8()
	videoCaptureService.Started:Connect(var8)
	videoCaptureService.Stopped:Connect(var8)
	videoCaptureService.DevicesChanged:Connect(var8)
	faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(var8)
	faceAnimatorService:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(var8)
	local permissions = faceChatUtilsModule.getPermissions()
	var3:reportExperienceSettings(true, permissions.placeCamEnabled, permissions.placeMicEnabled)
	var3:reportUserAccountSettings(permissions.userCamEnabled, permissions.userMicEnabled)
end
starterGuiService.CoreGuiChangedSignal:Connect(var8)

if game:GetEngineFeature("EnableSelfViewToggleApi") then
	local _ = socialService.SelfViewVisible:Connect(function(p1)
		-- upvalues: constantsModule (ref), serviceModule (ref), SELFIE_VIEW_ID (ref), var2 (ref), viewportUtilModule (ref), constantsModule_1 (ref), var1 (ref)
		local var10 = constantsModule.ApplyDisplayScale(constantsModule.ScreenSideOffset)
		
		if not serviceModule:isWindowOpen(SELFIE_VIEW_ID) then
			local var11 = var2:get()
			local var12 = viewportUtilModule.screenSize:get()
			local uDim2 = nil
			
			if p1 == Enum.SelfViewPosition.TopLeft then
				uDim2 = UDim2.fromOffset(var10, constantsModule_1.WINDOW_DEFAULT_PADDING)
			elseif p1 == Enum.SelfViewPosition.TopRight then
				uDim2 = UDim2.fromOffset(var12.X - (var11.X.Offset + var10), constantsModule_1.WINDOW_DEFAULT_PADDING)
			elseif p1 == Enum.SelfViewPosition.BottomLeft then
				uDim2 = UDim2.fromOffset(var10, var12.Y - (var1 + var11.Y.Offset + constantsModule_1.WINDOW_DEFAULT_PADDING))
			elseif p1 == Enum.SelfViewPosition.BottomRight then
				uDim2 = UDim2.fromOffset(var12.X - (var11.X.Offset + var10), var12.Y - (var1 + var11.Y.Offset + constantsModule_1.WINDOW_DEFAULT_PADDING))
			end
			serviceModule:toggleWindow(SELFIE_VIEW_ID)
			
			if uDim2 then
				serviceModule:updateWindowPosition(SELFIE_VIEW_ID, uDim2)
			end
		end
	end)
	local _ = socialService.SelfViewHidden:Connect(function()
		-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref)
		if serviceModule:isWindowOpen(SELFIE_VIEW_ID) then
			serviceModule:toggleWindow(SELFIE_VIEW_ID)
		end
	end)
end
return var7
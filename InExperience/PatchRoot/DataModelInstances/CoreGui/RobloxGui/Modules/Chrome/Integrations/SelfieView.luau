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
local var12 = constantsModule.ApplyDisplayScale(constantsModule.TopBarHeight)
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
local var21 = windowSizeSignalModule.new(size.X, size.Y)
local constantsModule_1 = require(chrome.ChromeShared.Unibar.Constants)
local var23 = require(robloxGui.Modules.SelfView.Analytics).new()
local SELFIE_VIEW_ID = constantsModule_1.SELFIE_VIEW_ID
local var24 = mappedSignal.new(serviceModule:onIntegrationStatusChanged(), function() --[[ line: 52 ]]
	-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref)
	return serviceModule:isWindowOpen(SELFIE_VIEW_ID)
end)
local var25 = nil
local var26 = nil
local var27 = serviceModule:register({
	label = "CoreScripts.TopBar.SelfViewLabel",
	windowDefaultOpen = false,
	persistWindowState = true,
	draggable = true,
	cachePosition = true,
	id = SELFIE_VIEW_ID,
	sideSheetPlacement = sideSheetPlacement.Page,
	windowSize = var21,
	initialAvailability = availabilitySignalState.Unavailable,
	activated = function() --[[ line: 71 ]]
		-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref)
		serviceModule:toggleWindow(SELFIE_VIEW_ID)
	end,
	isActivated = var24,
	components = {
		Icon = function(_) --[[ line: 78 ]]
			-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule_1 (ref), reactModule (ref), commonIconModule (ref), var24 (ref), unknownModule (ref), serviceModule (ref), SELFIE_VIEW_ID (ref)
			local _ = nil
			local var31 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else constantsModule_1.ICON_SIZE
			
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var31, 0, var31)
			}, {
				commonIconModule("icons/controls/selfieOff", "icons/controls/selfie", var24),
				CameraStatusDot = if unknownModule.useCameraOn() and not serviceModule:isWindowOpen(SELFIE_VIEW_ID) then reactModule.createElement(unknownModule.CameraStatusDot, { ZIndex = 2, Position = UDim2.fromScale(0.8, 0.7) }) else nil
			}, {})
		end,
		Window = function(_) --[[ line: 100 ]]
			-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref), reactModule (ref), unknownModule (ref), var21 (ref)
			local var32 = serviceModule:dragConnection(SELFIE_VIEW_ID)
			
			return reactModule.createElement(unknownModule.Window, {
				id = SELFIE_VIEW_ID,
				windowSize = var21,
				isDraggedOut = var32 ~= nil and var32.connection ~= nil
			}, {})
		end
	}
})
viewportUtilModule.screenSize:connect(function(p0) --[[ line: 112 ]]
	-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref), sizingUtilsModule (ref), var21 (ref)
	if not serviceModule:isWindowOpen(SELFIE_VIEW_ID) then
		local size = sizingUtilsModule.getSize(p0, var21:getIsLarge())
		var21:requestSize(size.X, size.Y)
	end
end, true)

local var28 = function() --[[ line: 119 ]]
	-- upvalues: starterGuiService (ref), getFFlagChromeSelfViewIgnoreCoreGuiModule (ref), faceChatUtilsModule (ref), var27 (ref)
	if getFFlagChromeSelfViewIgnoreCoreGuiModule() or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView) then
		local permissions = faceChatUtilsModule.getPermissions()
		
		if (permissions.placeCamEnabled or permissions.placeMicEnabled) and (permissions.userCamEligible or permissions.userMicEligible) then
			var27.availability:available()
			
			return
		end
		var27.availability:unavailable()
		
		return
	elseif faceChatUtilsModule.isCameraOn() then
		faceChatUtilsModule.toggleVideoAnimation()
	end
	var27.availability:unavailable()
end

local _ = function() --[[ line: 147 ]]
	-- upvalues: faceChatUtilsModule (ref), var23 (ref)
	local permissions = faceChatUtilsModule.getPermissions()
	var23:reportExperienceSettings(true, permissions.placeCamEnabled, permissions.placeMicEnabled)
	var23:reportUserAccountSettings(permissions.userCamEnabled, permissions.userMicEnabled)
end

if fFlagEnableConsoleExpControls then
	local var29 = selfieViewPolicyModule.PolicyImplementation.read()
	
	if not (if var29 then selfieViewPolicyModule.Mapper(var29).eligibleForSelfieViewFeature() else false) then
		var27.availability:forceUnavailable()
	end
end
if game:GetEngineFeature("VideoCaptureService") then
	var28()
	videoCaptureService.Started:Connect(var28)
	videoCaptureService.Stopped:Connect(var28)
	videoCaptureService.DevicesChanged:Connect(var28)
	faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(var28)
	faceAnimatorService:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(var28)
	local permissions = faceChatUtilsModule.getPermissions()
	var23:reportExperienceSettings(true, permissions.placeCamEnabled, permissions.placeMicEnabled)
	var23:reportUserAccountSettings(permissions.userCamEnabled, permissions.userMicEnabled)
end
starterGuiService.CoreGuiChangedSignal:Connect(var28)

if game:GetEngineFeature("EnableSelfViewToggleApi") then
	local _ = socialService.SelfViewVisible:Connect(function(p1) --[[ line: 185 ]]
		-- upvalues: constantsModule (ref), serviceModule (ref), SELFIE_VIEW_ID (ref), var21 (ref), viewportUtilModule (ref), constantsModule_1 (ref), var12 (ref)
		local var36 = constantsModule.ApplyDisplayScale(constantsModule.ScreenSideOffset)
		
		if not serviceModule:isWindowOpen(SELFIE_VIEW_ID) then
			local var37 = var21:get()
			local var38 = viewportUtilModule.screenSize:get()
			local uDim2 = nil
			
			if p1 == Enum.SelfViewPosition.TopLeft then
				uDim2 = UDim2.fromOffset(var36, constantsModule_1.WINDOW_DEFAULT_PADDING)
			elseif p1 == Enum.SelfViewPosition.TopRight then
				uDim2 = UDim2.fromOffset(var38.X - (var37.X.Offset + var36), constantsModule_1.WINDOW_DEFAULT_PADDING)
			elseif p1 == Enum.SelfViewPosition.BottomLeft then
				uDim2 = UDim2.fromOffset(var36, var38.Y - (var12 + var37.Y.Offset + constantsModule_1.WINDOW_DEFAULT_PADDING))
			elseif p1 == Enum.SelfViewPosition.BottomRight then
				uDim2 = UDim2.fromOffset(var38.X - (var37.X.Offset + var36), var38.Y - (var12 + var37.Y.Offset + constantsModule_1.WINDOW_DEFAULT_PADDING))
			end
			serviceModule:toggleWindow(SELFIE_VIEW_ID)
			
			if uDim2 then
				serviceModule:updateWindowPosition(SELFIE_VIEW_ID, uDim2)
			end
		end
	end)
	local _ = socialService.SelfViewHidden:Connect(function() --[[ line: 219 ]]
		-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref)
		if serviceModule:isWindowOpen(SELFIE_VIEW_ID) then
			serviceModule:toggleWindow(SELFIE_VIEW_ID)
		end
	end)
end
return var27
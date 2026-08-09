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
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagChromeActivatedMappedSignal = sharedFlagsModule.FFlagChromeActivatedMappedSignal
local unknownModule = require(selfieView)
local faceChatUtilsModule = require(selfieView.Utils.FaceChatUtils)
local sizingUtilsModule = require(selfieView.Utils.SizingUtils)
local selfieViewPolicyModule = require(selfieView.Utils.SelfieViewPolicy)
local availabilitySignalState = require(chrome.ChromeShared.Service.ChromeUtils).AvailabilitySignalState
local windowSizeSignalModule = require(chrome.ChromeShared.Service.WindowSizeSignal)
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local viewportUtilModule = require(chrome.ChromeShared.Service.ViewportUtil)
local size = sizingUtilsModule.getSize(viewportUtilModule.screenSize:get(), false)
local var22 = windowSizeSignalModule.new(size.X, size.Y)
local constantsModule_1 = require(chrome.ChromeShared.Unibar.Constants)
local var24 = require(robloxGui.Modules.SelfView.Analytics).new()
local SELFIE_VIEW_ID = constantsModule_1.SELFIE_VIEW_ID
local var25 = mappedSignal.new(serviceModule:onIntegrationStatusChanged(), function() --[[ line: 53 ]]
	-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref)
	return serviceModule:isWindowOpen(SELFIE_VIEW_ID)
end)
local var26 = nil
local var27 = nil
local var28 = serviceModule:register({
	label = "CoreScripts.TopBar.SelfViewLabel",
	windowDefaultOpen = false,
	persistWindowState = true,
	draggable = true,
	cachePosition = true,
	id = SELFIE_VIEW_ID,
	sideSheetPlacement = sideSheetPlacement.Vertical,
	windowSize = var22,
	initialAvailability = availabilitySignalState.Unavailable,
	activated = function() --[[ line: 72 ]]
		-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref)
		serviceModule:toggleWindow(SELFIE_VIEW_ID)
	end,
	isActivated = if fFlagChromeActivatedMappedSignal then var25 else function() --[[ line: 77 ]]
		-- upvalues: var25 (ref)
		return var25:get()
	end,
	components = {
		Icon = function(_) --[[ line: 83 ]]
			-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule_1 (ref), reactModule (ref), commonIconModule (ref), var25 (ref), unknownModule (ref), serviceModule (ref), SELFIE_VIEW_ID (ref)
			local _ = nil
			local var32 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else constantsModule_1.ICON_SIZE
			
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var32, 0, var32)
			}, {
				commonIconModule("icons/controls/selfieOff", "icons/controls/selfie", var25),
				CameraStatusDot = if unknownModule.useCameraOn() and not serviceModule:isWindowOpen(SELFIE_VIEW_ID) then reactModule.createElement(unknownModule.CameraStatusDot, { ZIndex = 2, Position = UDim2.fromScale(0.8, 0.7) }) else nil
			}, {})
		end,
		Window = function(_) --[[ line: 105 ]]
			-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref), reactModule (ref), unknownModule (ref), var22 (ref)
			local var33 = serviceModule:dragConnection(SELFIE_VIEW_ID)
			
			return reactModule.createElement(unknownModule.Window, {
				id = SELFIE_VIEW_ID,
				windowSize = var22,
				isDraggedOut = var33 ~= nil and var33.connection ~= nil
			}, {})
		end
	}
})
viewportUtilModule.screenSize:connect(function(p0) --[[ line: 117 ]]
	-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref), sizingUtilsModule (ref), var22 (ref)
	if not serviceModule:isWindowOpen(SELFIE_VIEW_ID) then
		local size = sizingUtilsModule.getSize(p0, var22:getIsLarge())
		var22:requestSize(size.X, size.Y)
	end
end, true)

local var29 = function() --[[ line: 124 ]]
	-- upvalues: starterGuiService (ref), getFFlagChromeSelfViewIgnoreCoreGuiModule (ref), faceChatUtilsModule (ref), var28 (ref)
	if getFFlagChromeSelfViewIgnoreCoreGuiModule() or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView) then
		local permissions = faceChatUtilsModule.getPermissions()
		
		if (permissions.placeCamEnabled or permissions.placeMicEnabled) and (permissions.userCamEligible or permissions.userMicEligible) then
			var28.availability:available()
			
			return
		end
		var28.availability:unavailable()
		
		return
	elseif faceChatUtilsModule.isCameraOn() then
		faceChatUtilsModule.toggleVideoAnimation()
	end
	var28.availability:unavailable()
end

local _ = function() --[[ line: 152 ]]
	-- upvalues: faceChatUtilsModule (ref), var24 (ref)
	local permissions = faceChatUtilsModule.getPermissions()
	var24:reportExperienceSettings(true, permissions.placeCamEnabled, permissions.placeMicEnabled)
	var24:reportUserAccountSettings(permissions.userCamEnabled, permissions.userMicEnabled)
end

if fFlagEnableConsoleExpControls then
	local var30 = selfieViewPolicyModule.PolicyImplementation.read()
	
	if not (if var30 then selfieViewPolicyModule.Mapper(var30).eligibleForSelfieViewFeature() else false) then
		var28.availability:forceUnavailable()
	end
end
if game:GetEngineFeature("VideoCaptureService") then
	var29()
	videoCaptureService.Started:Connect(var29)
	videoCaptureService.Stopped:Connect(var29)
	videoCaptureService.DevicesChanged:Connect(var29)
	faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(var29)
	faceAnimatorService:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(var29)
	local permissions = faceChatUtilsModule.getPermissions()
	var24:reportExperienceSettings(true, permissions.placeCamEnabled, permissions.placeMicEnabled)
	var24:reportUserAccountSettings(permissions.userCamEnabled, permissions.userMicEnabled)
end
starterGuiService.CoreGuiChangedSignal:Connect(var29)

if game:GetEngineFeature("EnableSelfViewToggleApi") then
	local _ = socialService.SelfViewVisible:Connect(function(p1) --[[ line: 190 ]]
		-- upvalues: constantsModule (ref), serviceModule (ref), SELFIE_VIEW_ID (ref), var22 (ref), viewportUtilModule (ref), constantsModule_1 (ref), var12 (ref)
		local var37 = constantsModule.ApplyDisplayScale(constantsModule.ScreenSideOffset)
		
		if not serviceModule:isWindowOpen(SELFIE_VIEW_ID) then
			local var38 = var22:get()
			local var39 = viewportUtilModule.screenSize:get()
			local uDim2 = nil
			
			if p1 == Enum.SelfViewPosition.TopLeft then
				uDim2 = UDim2.fromOffset(var37, constantsModule_1.WINDOW_DEFAULT_PADDING)
			elseif p1 == Enum.SelfViewPosition.TopRight then
				uDim2 = UDim2.fromOffset(var39.X - (var38.X.Offset + var37), constantsModule_1.WINDOW_DEFAULT_PADDING)
			elseif p1 == Enum.SelfViewPosition.BottomLeft then
				uDim2 = UDim2.fromOffset(var37, var39.Y - (var12 + var38.Y.Offset + constantsModule_1.WINDOW_DEFAULT_PADDING))
			elseif p1 == Enum.SelfViewPosition.BottomRight then
				uDim2 = UDim2.fromOffset(var39.X - (var38.X.Offset + var37), var39.Y - (var12 + var38.Y.Offset + constantsModule_1.WINDOW_DEFAULT_PADDING))
			end
			serviceModule:toggleWindow(SELFIE_VIEW_ID)
			
			if uDim2 then
				serviceModule:updateWindowPosition(SELFIE_VIEW_ID, uDim2)
			end
		end
	end)
	local _ = socialService.SelfViewHidden:Connect(function() --[[ line: 224 ]]
		-- upvalues: serviceModule (ref), SELFIE_VIEW_ID (ref)
		if serviceModule:isWindowOpen(SELFIE_VIEW_ID) then
			serviceModule:toggleWindow(SELFIE_VIEW_ID)
		end
	end)
end
return var28
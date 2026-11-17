local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ServiceModule = require(Chrome.Service)
local VideoCaptureService = game:GetService("VideoCaptureService")
local FaceAnimatorService = game:GetService("FaceAnimatorService")
local SocialService = game:GetService("SocialService")
local StarterGui = game:GetService("StarterGui")
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local MappedSignal = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ConstantsModule = require(RobloxGui.Modules.TopBar.Constants)
local ApplyDisplayScaleResult = ConstantsModule.ApplyDisplayScale(ConstantsModule.TopBarHeight)
local SelfieView = Chrome.Parent.SelfieView
local GetFFlagChromeSelfViewIgnoreCoreGuiModule = require(Chrome.Flags.GetFFlagChromeSelfViewIgnoreCoreGui)
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local SideSheetOpenBehavior = ChromeModule.Enums.SideSheetOpenBehavior
local SideSheetPlacement = ChromeModule.Enums.SideSheetPlacement
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(Chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagUseUIOverlayForCloudPlay = SharedFlagsModule.FFlagUseUIOverlayForCloudPlay
local FFlagAllowGrayUnsupportedFeatures = SharedFlagsModule.FFlagAllowGrayUnsupportedFeatures
local InExperienceCloudPlayModule = require(CorePackages.Workspace.Packages.InExperienceCloudPlay)
local FFlagKeepSideSheetOpenBesideMenu = SharedFlagsModule.FFlagKeepSideSheetOpenBesideMenu
local Module = require(SelfieView)
local FaceChatUtilsModule = require(SelfieView.Utils.FaceChatUtils)
local SizingUtilsModule = require(SelfieView.Utils.SizingUtils)
local SelfieViewPolicyModule = require(SelfieView.Utils.SelfieViewPolicy)
local AvailabilitySignalState = require(Chrome.ChromeShared.Service.ChromeUtils).AvailabilitySignalState
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local ViewportUtilModule = require(Chrome.ChromeShared.Service.ViewportUtil)
local Size = SizingUtilsModule.getSize(ViewportUtilModule.screenSize:get(), false)
local NewResult = require(Chrome.ChromeShared.Service.WindowSizeSignal).new(Size.X, Size.Y)
local ConstantsModule1 = require(Chrome.ChromeShared.Unibar.Constants)
local NewResult1 = require(RobloxGui.Modules.SelfView.Analytics).new()
local SELFIEVIEWID = ConstantsModule1.SELFIE_VIEW_ID
local CloudClientService = if FFlagUseUIOverlayForCloudPlay and FFlagAllowGrayUnsupportedFeatures then InExperienceCloudPlayModule.getCloudClientService() else nil
local IsCloudClient = CloudClientService ~= nil and CloudClientService.IsCloudClient

local function showUnsupportedSnackbar()
	-- upvalues: InExperienceCloudPlayModule (copy)
	InExperienceCloudPlayModule.showUnsupportedFeatureSnackbar("SelfView")
end

local NewMappedSignal = MappedSignal.new(ServiceModule:onIntegrationStatusChanged(), function()
	-- upvalues: ServiceModule (copy), SELFIEVIEWID (copy)
	return ServiceModule:isWindowOpen(SELFIEVIEWID)
end)
local Connection = nil
local Connection1 = nil
local RegisterResult = ServiceModule:register({
	label = "CoreScripts.TopBar.SelfViewLabel",
	windowDefaultOpen = false,
	draggable = true,
	cachePosition = true,
	id = SELFIEVIEWID,
	sideSheetPlacement = SideSheetPlacement.BelowFold,
	sideSheetOpenBehavior = if FFlagKeepSideSheetOpenBesideMenu then SideSheetOpenBehavior.CloseSheet else nil,
	windowSize = NewResult,
	initialAvailability = AvailabilitySignalState.Unavailable,
	persistWindowState = not IsCloudClient,
	activated = function()
		-- upvalues: ServiceModule (copy), SELFIEVIEWID (copy)
		ServiceModule:toggleWindow(SELFIEVIEWID)
	end,
	disabledActivated = if IsCloudClient then showUnsupportedSnackbar else nil,
	isActivated = NewMappedSignal,
	isDisabled = if IsCloudClient then true else nil,
	components = {
		Icon = function(_)
			-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule1 (copy), ReactModule (copy), CommonIconModule (copy), NewMappedSignal (copy), Module (copy), ServiceModule (copy), SELFIEVIEWID (copy)
			local ICONSIZE = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().ICON_SIZE else ConstantsModule1.ICON_SIZE
			
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, ICONSIZE, 0, ICONSIZE)
			}, {
				CommonIconModule("icons/controls/selfieOff", "icons/controls/selfie", NewMappedSignal),
				CameraStatusDot = if Module.useCameraOn() and not ServiceModule:isWindowOpen(SELFIEVIEWID) then ReactModule.createElement(Module.CameraStatusDot, { ZIndex = 2, Position = UDim2.fromScale(0.8, 0.7) }) else nil
			}, {})
		end,
		Window = function(_)
			-- upvalues: ServiceModule (copy), SELFIEVIEWID (copy), ReactModule (copy), Module (copy), NewResult (copy)
			local DragConnectionResult = ServiceModule:dragConnection(SELFIEVIEWID)
			
			return ReactModule.createElement(Module.Window, {
				id = SELFIEVIEWID,
				windowSize = NewResult,
				isDraggedOut = DragConnectionResult ~= nil and DragConnectionResult.connection ~= nil
			}, {})
		end
	}
})
ViewportUtilModule.screenSize:connect(function(p1)
	-- upvalues: ServiceModule (copy), SELFIEVIEWID (copy), SizingUtilsModule (copy), NewResult (copy)
	if not ServiceModule:isWindowOpen(SELFIEVIEWID) then
		local Size = SizingUtilsModule.getSize(p1, NewResult:getIsLarge())
		NewResult:requestSize(Size.X, Size.Y)
	end
end, true)

local function Callback()
	-- upvalues: StarterGui (copy), GetFFlagChromeSelfViewIgnoreCoreGuiModule (copy), FaceChatUtilsModule (copy), RegisterResult (copy), IsCloudClient (copy)
	local CoreGuiEnabled = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView)
	
	if not GetFFlagChromeSelfViewIgnoreCoreGuiModule() and not CoreGuiEnabled then
		if FaceChatUtilsModule.isCameraOn() then
			FaceChatUtilsModule.toggleVideoAnimation()
		end
		RegisterResult.availability:unavailable()
		
		return
	elseif IsCloudClient then
		RegisterResult.availability:available()
		
		return
	else
		local Permissions = FaceChatUtilsModule.getPermissions()
		local UserCamEligible = Permissions.userCamEligible or Permissions.userMicEligible
		
		if (Permissions.placeCamEnabled or Permissions.placeMicEnabled) and UserCamEligible then
			RegisterResult.availability:available()
			
			return
		else
			RegisterResult.availability:unavailable()
		end
	end
end

local function _()
	-- upvalues: FaceChatUtilsModule (copy), NewResult1 (copy)
	local Permissions = FaceChatUtilsModule.getPermissions()
	NewResult1:reportExperienceSettings(true, Permissions.placeCamEnabled, Permissions.placeMicEnabled)
	NewResult1:reportUserAccountSettings(Permissions.userCamEnabled, Permissions.userMicEnabled)
end

if FFlagEnableConsoleExpControls and not IsCloudClient then
	local ReadResult = SelfieViewPolicyModule.PolicyImplementation.read()
	
	if not (if ReadResult then SelfieViewPolicyModule.Mapper(ReadResult).eligibleForSelfieViewFeature() else false) then
		RegisterResult.availability:forceUnavailable()
	end
end
if game:GetEngineFeature("VideoCaptureService") then
	Callback()
	VideoCaptureService.Started:Connect(Callback)
	VideoCaptureService.Stopped:Connect(Callback)
	VideoCaptureService.DevicesChanged:Connect(Callback)
	FaceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(Callback)
	FaceAnimatorService:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(Callback)
	local Permissions = FaceChatUtilsModule.getPermissions()
	NewResult1:reportExperienceSettings(true, Permissions.placeCamEnabled, Permissions.placeMicEnabled)
	NewResult1:reportUserAccountSettings(Permissions.userCamEnabled, Permissions.userMicEnabled)
end
StarterGui.CoreGuiChangedSignal:Connect(Callback)

if game:GetEngineFeature("EnableSelfViewToggleApi") then
	if Connection then
		Connection:Disconnect()
	end
	if Connection1 then
		Connection1:Disconnect()
	end
	local _ = SocialService.SelfViewVisible:Connect(function(SelfViewPosition)
		-- upvalues: IsCloudClient (copy), ConstantsModule (copy), ServiceModule (copy), SELFIEVIEWID (copy), NewResult (copy), ViewportUtilModule (copy), ConstantsModule1 (copy), ApplyDisplayScaleResult (copy)
		if IsCloudClient then return end
		local ApplyDisplayScaleResult1 = ConstantsModule.ApplyDisplayScale(ConstantsModule.ScreenSideOffset)
		
		if not ServiceModule:isWindowOpen(SELFIEVIEWID) then
			local GetResult = NewResult:get()
			local GetResult1 = ViewportUtilModule.screenSize:get()
			local _UDim2 = if SelfViewPosition == Enum.SelfViewPosition.TopLeft then UDim2.fromOffset(ApplyDisplayScaleResult1, ConstantsModule1.WINDOW_DEFAULT_PADDING) elseif SelfViewPosition == Enum.SelfViewPosition.TopRight then UDim2.fromOffset(GetResult1.X - (GetResult.X.Offset + ApplyDisplayScaleResult1), ConstantsModule1.WINDOW_DEFAULT_PADDING) elseif SelfViewPosition == Enum.SelfViewPosition.BottomLeft then UDim2.fromOffset(ApplyDisplayScaleResult1, GetResult1.Y - (ApplyDisplayScaleResult + GetResult.Y.Offset + ConstantsModule1.WINDOW_DEFAULT_PADDING)) elseif SelfViewPosition == Enum.SelfViewPosition.BottomRight then UDim2.fromOffset(GetResult1.X - (GetResult.X.Offset + ApplyDisplayScaleResult1), GetResult1.Y - (ApplyDisplayScaleResult + GetResult.Y.Offset + ConstantsModule1.WINDOW_DEFAULT_PADDING)) else nil
			ServiceModule:toggleWindow(SELFIEVIEWID)
			
			if _UDim2 then
				ServiceModule:updateWindowPosition(SELFIEVIEWID, _UDim2)
			end
		end
	end)
	local _ = SocialService.SelfViewHidden:Connect(function()
		-- upvalues: ServiceModule (copy), SELFIEVIEWID (copy)
		if ServiceModule:isWindowOpen(SELFIEVIEWID) then
			ServiceModule:toggleWindow(SELFIEVIEWID)
		end
	end)
end
return RegisterResult
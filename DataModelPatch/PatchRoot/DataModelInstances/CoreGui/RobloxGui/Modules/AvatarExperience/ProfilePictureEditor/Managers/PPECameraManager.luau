local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local OtterModule = require(CorePackages.Packages.Otter)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Constants)
local PPEThumbnailTypeModule = require(Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType)
local UtilsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Utils)
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local CFrameUtility = require(CorePackages.Packages.Thumbnailing).CFrameUtility
local CameraUtility = require(CorePackages.Packages.Thumbnailing).CameraUtility
local CharacterUtility = require(CorePackages.Packages.Thumbnailing).CharacterUtility
local SetFieldOfViewDegModule = require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetFieldOfViewDeg)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local config = {
	dampingRatio = 1,
	frequency = 1 / ConstantsModule.FullscreenTweenTimeSeconds
}
local PPECameraManager = {}
PPECameraManager.__index = PPECameraManager

function PPECameraManager.new(Store, AvatarRoute)
	-- upvalues: PPECameraManager (copy)
	local t = {}
	setmetatable(t, PPECameraManager)
	t.started = false
	t.store = Store
	t.avatarRoute = AvatarRoute
	t.updateConnection = nil
	t.camera = game.Workspace.CurrentCamera
	t.toFullscreenFraction = 0
	t.prevShowFullBodyPicture = t:_showFullBodyPicture()
	t.prevPage = t.avatarRoute.opaque.name
	
	return t
end

function PPECameraManager:_calculateCameraDetails(_)
	-- upvalues: ConstantsModule (copy), SetFieldOfViewDegModule (copy)
	local ScreenHeightPixRatio = self.screenHeightPix / 2 / math.tan(math.rad(ConstantsModule.CameraFieldOfViewDeg) / 2)
	self.pixToCamera = ScreenHeightPixRatio
	self.focusAngleAboveCenterRad = math.atan2(self.screenHeightPix / 2 - (self.topYPix + self.viewportSizePix / 2), ScreenHeightPixRatio)
	local ScreenHeightPixDelta = self.screenHeightPix / 2 - self.topYPix
	self.fieldOfViewForDistanceScale = math.deg(math.atan2(ScreenHeightPixDelta, ScreenHeightPixRatio) - math.atan2(ScreenHeightPixDelta - self.viewportSizePix, ScreenHeightPixRatio))
	self.store:dispatch(SetFieldOfViewDegModule(self.fieldOfViewForDistanceScale))
end

function PPECameraManager:_handleCameraChange()
	-- upvalues: CFrameUtility (copy), CharacterUtility (copy), UtilsModule (copy), CameraUtility (copy), OtterModule (copy), config (copy)
	self.showFullBodyPicture = self:_showFullBodyPicture()
	
	if self.prevShowFullBodyPicture ~= self.showFullBodyPicture then
		self.prevFieldOfViewForDistanceScale = self.fieldOfViewForDistanceScale
		self.prevXRotDeg = self.xRotDeg
		self.prevYRotDeg = self.yRotDeg
		self.prevCameraDistanceScale = self.cameraDistanceScale
		self.prevTargetCFrame = self.targetCFrame
		self.prevMinExtent = self.minExtent
		self.prevMaxExtent = self.maxExtent
		self.prevExtentScale = self.extentScale
		self.prevCameraCFrame = self.camera.CFrame
	end
	local State = self.store:getState()
	self.finalPageViewMode = State.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode
	self.characterModelVersion = State.AvatarExperience.AvatarScene.Character.CharacterModelVersion
	self.lastSuccessfulPoseEmoteAssetId = State.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId
	local CurrentCharacter = State.AvatarExperience.AvatarScene.Character.CurrentCharacter
	
	if not CurrentCharacter then return end
	local Head = CurrentCharacter:FindFirstChild("Head")
	
	if not Head then return end
	local PeekabooLayoutDetail = State.AvatarExperience.ProfilePictureEditor.PeekabooLayoutDetails[self.avatarRoute.opaque.name]
	
	if not PeekabooLayoutDetail then return end
	self.screenHeightPix = PeekabooLayoutDetail.screenHeightPix
	self.topYPix = PeekabooLayoutDetail.topYPix
	self.viewportSizePix = PeekabooLayoutDetail.viewportSizePix
	self:_calculateCameraDetails(CurrentCharacter)
	
	if not self.focusAngleAboveCenterRad then return end
	if self.showFullBodyPicture then
		local TargetCFrame = CFrameUtility.CalculateTargetCFrame(Head.CFrame)
		self.targetCFrame = TargetCFrame - TargetCFrame.Position + CurrentCharacter:GetPrimaryPartCFrame().Position
		self.minExtent, self.maxExtent = CharacterUtility.CalculateModelExtents(CurrentCharacter, self.targetCFrame)
	else
		self.targetCFrame = CFrameUtility.CalculateTargetCFrame(Head.CFrame)
		self.minExtent, self.maxExtent = CharacterUtility.CalculateHeadExtents(CurrentCharacter, self.targetCFrame)
	end
	local CameraSliders = State.AvatarExperience.ProfilePictureEditor.CameraSliders
	self.yRotDeg = 0
	self.xRotDeg = 0
	self.cameraDistanceScale = 1
	
	if CameraSliders then
		self.zoomSliderValue = CameraSliders.zoomSliderValue
		self.rotateSliderValue = CameraSliders.rotateSliderValue
		self.yRotDeg = UtilsModule.getYRotDegFromSliderValue(self.rotateSliderValue)
		
		if self.showFullBodyPicture then
			self.xRotDeg = CameraUtility.XRotForFullBody
			self.cameraDistanceScale = CameraUtility.DistanceScaleForFullBody
		else
			self.cameraDistanceScale = UtilsModule.getCameraDistanceScaleFromSliderValue(self.zoomSliderValue)
		end
	end
	self.extentScale = self.showFullBodyPicture and CameraUtility.DefaultBodyMarginScale or CameraUtility.DefaultHeadMarginScale
	
	if self.prevPage == self.avatarRoute.opaque.name then
		if self.prevShowFullBodyPicture ~= self.showFullBodyPicture then
			local v1: number = if self.showFullBodyPicture then 1 else 0
			self.prevShowFullBodyPicture = self.showFullBodyPicture
			self.fullscreenTweenMotor:stop()
			self.fullscreenTweenMotor:setGoal(OtterModule.spring(v1, config))
			self.fullscreenTweenMotor:start()
		end
	else
		self.prevShowFullBodyPicture = false
		self.prevPage = self.avatarRoute.opaque.name
		self.fullscreenTweenMotor:stop()
		self.toFullscreenFraction = 0
	end
	self:onUpdateFullscreenFraction()
end

local function _(p1: number, p2, p3)
	return if p3 then p2 * (1 - p1) + p3 * p1 else p2
end

local _ = function(Alpha, p1, Goal)
	return if Goal then p1:Lerp(Goal, Alpha) else p1
end

function PPECameraManager:onUpdateFullscreenFraction()
	-- upvalues: CameraUtility (copy), GetSafeAreaSizeFunction (copy), FFlagEnableLeftNavOnConsole (copy), DisplayModule (copy)
	local Magnitude = math.abs((if self.showFullBodyPicture then 1 else 0) - self.toFullscreenFraction)
	local FieldOfViewForDistanceScale = self.fieldOfViewForDistanceScale
	local PrevFieldOfViewForDistanceScale = self.prevFieldOfViewForDistanceScale
	local NewFieldOfViewForDistanceScale = if PrevFieldOfViewForDistanceScale then FieldOfViewForDistanceScale * (1 - Magnitude) + PrevFieldOfViewForDistanceScale * Magnitude else FieldOfViewForDistanceScale
	local XRotDeg = self.xRotDeg
	local PrevXRotDeg = self.prevXRotDeg
	local NewXRotDeg = if PrevXRotDeg then XRotDeg * (1 - Magnitude) + PrevXRotDeg * Magnitude else XRotDeg
	local YRotDeg = self.yRotDeg
	local PrevYRotDeg = self.prevYRotDeg
	local NewYRotDeg = if PrevYRotDeg then YRotDeg * (1 - Magnitude) + PrevYRotDeg * Magnitude else YRotDeg
	local CameraDistanceScale = self.cameraDistanceScale
	local PrevCameraDistanceScale = self.prevCameraDistanceScale
	local NewCameraDistanceScale = if PrevCameraDistanceScale then CameraDistanceScale * (1 - Magnitude) + PrevCameraDistanceScale * Magnitude else CameraDistanceScale
	local TargetCFrame = self.targetCFrame
	local PrevTargetCFrame = self.prevTargetCFrame
	local Interpolated = if PrevTargetCFrame then TargetCFrame:Lerp(PrevTargetCFrame, Magnitude) else TargetCFrame
	local MinExtent = self.minExtent
	local PrevMinExtent = self.prevMinExtent
	local NewMinExtent = if PrevMinExtent then MinExtent * (1 - Magnitude) + PrevMinExtent * Magnitude else MinExtent
	local MaxExtent = self.maxExtent
	local PrevMaxExtent = self.prevMaxExtent
	local NewMaxExtent = if PrevMaxExtent then MaxExtent * (1 - Magnitude) + PrevMaxExtent * Magnitude else MaxExtent
	local ExtentScale = self.extentScale
	local PrevExtentScale = self.prevExtentScale
	local config = {
		optFieldOfViewForDistanceScale = NewFieldOfViewForDistanceScale,
		optCameraXRot = NewXRotDeg,
		optCameraYRot = NewYRotDeg,
		optCameraDistanceScale = NewCameraDistanceScale,
		targetCFrame = Interpolated,
		minExtent = NewMinExtent,
		maxExtent = NewMaxExtent,
		extentScale = if PrevExtentScale then ExtentScale * (1 - Magnitude) + PrevExtentScale * Magnitude else ExtentScale
	}
	CameraUtility.SetupCamera(self.camera, config)
	local CF = self.camera.CFrame * CFrame.fromEulerAnglesXYZ(-self.focusAngleAboveCenterRad, 0, 0)
	local GlobalGuiInset = self.store:getState().GlobalGuiInset
	local ScreenSize = self.store:getState().ScreenSize
	local SafeAreaSize = GetSafeAreaSizeFunction(ScreenSize, GlobalGuiInset)
	local LeftDelta = nil
	
	if FFlagEnableLeftNavOnConsole then
		local DeviceSafePadding = DisplayModule.GetDisplayStore().getDeviceSafePadding()
		LeftDelta = GlobalGuiInset.left + DeviceSafePadding.left - GlobalGuiInset.right - DeviceSafePadding.right
	else
		LeftDelta = ScreenSize.X - SafeAreaSize.X.Offset
	end
	if LeftDelta > 0 then
		local ScaledMagnitude = -CF.RightVector * ((CF.Position - config.targetCFrame.Position).Magnitude * LeftDelta / (2 * self.pixToCamera))
		CF = CFrame.new(ScaledMagnitude.X, ScaledMagnitude.Y, ScaledMagnitude.Z) * CF
	end
	local PrevCameraCFrame = self.prevCameraCFrame
	self.camera.CFrame = if PrevCameraCFrame then CF:Lerp(PrevCameraCFrame, Magnitude) else CF
end

function PPECameraManager:_peekabooLayoutDetailsChanged(p1): boolean
	local PeekabooLayoutDetail = p1.AvatarExperience.ProfilePictureEditor.PeekabooLayoutDetails[self.avatarRoute.opaque.name]
	
	return if PeekabooLayoutDetail then self.screenHeightPix ~= PeekabooLayoutDetail.screenHeightPix or self.topYPix ~= PeekabooLayoutDetail.topYPix or self.viewportSizePix ~= PeekabooLayoutDetail.viewportSizePix else false
end

function PPECameraManager:_cameraSliderDetailsChanged(p1): boolean
	local CameraSliders = p1.AvatarExperience.ProfilePictureEditor.CameraSliders
	
	return self.zoomSliderValue ~= CameraSliders.zoomSliderValue or self.rotateSliderValue ~= CameraSliders.rotateSliderValue
end

function PPECameraManager:_finalPageViewModeChanged(p1): boolean
	return self.finalPageViewMode ~= p1.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode
end

function PPECameraManager:_lastSuccessfulPoseEmoteAssetIdChanged(p1): boolean
	return self.lastSuccessfulPoseEmoteAssetId ~= p1.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId
end

function PPECameraManager:_characterModelVersionChanged(p1): boolean
	return self.characterModelVersion ~= p1.AvatarExperience.AvatarScene.Character.CharacterModelVersion
end

function PPECameraManager:_update(State)
	if self:_peekabooLayoutDetailsChanged(State) or self:_cameraSliderDetailsChanged(State) or self:_characterModelVersionChanged(State) or self:_finalPageViewModeChanged(State) or self:_lastSuccessfulPoseEmoteAssetIdChanged(State) then
		self:_handleCameraChange()
	end
end

function PPECameraManager:_updateState(p1, _)
	self:_update(p1)
end

function PPECameraManager:_showFullBodyPicture(): boolean
	-- upvalues: PPEThumbnailTypeModule (copy), AvatarScreen (copy)
	return self.store:getState().AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode == PPEThumbnailTypeModule.FullBody and self.avatarRoute.opaque.name == AvatarScreen.ProfilePictureEditorFinal
end

function PPECameraManager:updateAvatarRoute(AvatarRoute, _)
	self.avatarRoute = AvatarRoute
	
	if self.started then
		self:_update((self.store:getState()))
	end
end

function PPECameraManager:watchCharacterToAdjustCamera(CurrentCharacter)
	-- upvalues: RunService (copy)
	if CurrentCharacter then
		self.watchCharacterToolConnection = CurrentCharacter.DescendantAdded:Connect(function(Descendant: Tool)
			-- upvalues: RunService (upval), self (copy)
			if Descendant:IsA("Tool") then
				RunService.Heartbeat:Wait()
				self:_handleCameraChange()
			end
		end)
	end
end

function PPECameraManager:onPPEPoseChanged()
	-- upvalues: RunService (copy)
	RunService.Heartbeat:Wait()
	self:_handleCameraChange()
end

function PPECameraManager:stopWatchingCharacter()
	if self.watchCharacterToolConnection then
		self.watchCharacterToolConnection:Disconnect()
		self.watchCharacterToolConnection = nil
	end
end

function PPECameraManager:start()
	-- upvalues: OtterModule (copy), ConstantsModule (copy)
	if self.started then return end
	self.started = true
	local State = self.store:getState()
	self.fullscreenTweenMotor = OtterModule.createSingleMotor(0)
	self.fullscreenTweenMotor:onStep(function(ToFullscreenFraction)
		-- upvalues: self (copy)
		self.toFullscreenFraction = ToFullscreenFraction
		self:onUpdateFullscreenFraction()
	end)
	self.updateConnection = self.store.changed:connect(function(...)
		-- upvalues: self (copy)
		self:_updateState(...)
	end)
	self.camera.CameraType = Enum.CameraType.Scriptable
	self.camera.FieldOfView = ConstantsModule.CameraFieldOfViewDeg
	local CurrentCharacter = State.AvatarExperience.AvatarScene.Character.CurrentCharacter
	
	if CurrentCharacter then
		self:_handleCameraChange()
		self:watchCharacterToAdjustCamera(CurrentCharacter)
	end
end

function PPECameraManager:stop()
	if not self.started then return end
	self.started = false
	self:stopWatchingCharacter()
	
	if self.fullscreenTweenMotor then
		self.fullscreenTweenMotor:destroy()
		self.fullscreenTweenMotor = nil
	end
	if self.updateConnection then
		self.updateConnection:disconnect()
		self.updateConnection = nil
	end
end

function PPECameraManager:onDestroy() end

return PPECameraManager
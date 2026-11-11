local TweenService = game:GetService("TweenService")
local CorePackages = game:GetService("CorePackages")
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local HardwareSafeAreaInsets = require(CorePackages.Workspace.Packages.Responsive).HardwareSafeAreaInsets
local GetFFlagLuaAppFixStudioNotchSupportModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport)
local GetAXCameraManagerErrorsEnabledModule = require(Modules.AvatarExperience.Flags.GetAXCameraManagerErrorsEnabled)
local AXFixCameraManagerInitialization = game:DefineFastFlag("AXFixCameraManagerInitialization", false)
local FFlagAXIncreaseDefaultPeekViewHeight = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXIncreaseDefaultPeekViewHeight
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local FFlagAXCustomizeMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport
local Fix10ftCameraSwitchRace = game:DefineFastFlag("Fix10ftCameraSwitchRace", false)
local AXCameraDownwardTilt = game:DefineFastFlag("AXCameraDownwardTilt", false)
local AXCameraLevelHorizon = game:DefineFastFlag("AXCameraLevelHorizon", false)
local FFlagIncreaseMarketplaceContentHeight = require(CorePackages.Workspace.Packages.SharedFlags).FFlagIncreaseMarketplaceContentHeight
local _TweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0)
local _CFrame = CFrame.new(vector.create(-3, 2.5, 1.5), vector.create(-2, 2.5, 1.5))
local config = {
	[DeviceOrientationMode.Portrait] = {
		landingPageZoomToFocusHeightRatio = 6.188,
		fullViewZoomToFocusHeightRatio = 4.5,
		defaultVerticalFocusScale = 0.4,
		minZoomRadius = 5,
		cameraCenterScreenPosition = UDim2.new(0, 0, -0.5, if FFlagIncreaseMarketplaceContentHeight then if FFlagAXIncreaseDefaultPeekViewHeight then -7 else 8 elseif FFlagAXIncreaseDefaultPeekViewHeight then 25 else 40),
		baseCameraOrigin = Vector3.new(19.24339867, 0, if AXCameraLevelHorizon then 0 else 0.594265997),
		landingPageCameraCenterScreenPosition = UDim2.new(0, 0, -0.4, 40),
		landingPageZoomAdjustmentForFocusPart = if FFlagAXIncreaseDefaultPeekViewHeight then 1 else nil,
		zoomToFocusHeightRatio = if FFlagIncreaseMarketplaceContentHeight then 10.9 elseif FFlagAXIncreaseDefaultPeekViewHeight then 9.7 else 8.704,
		zoomAdjustmentForFocusPart = if FFlagIncreaseMarketplaceContentHeight then 1.35 elseif FFlagAXIncreaseDefaultPeekViewHeight then 1.2 else nil,
		maxZoomRadius = if FFlagIncreaseMarketplaceContentHeight then 40 elseif FFlagAXIncreaseDefaultPeekViewHeight then 35 else 30
	},
	[DeviceOrientationMode.Landscape] = {
		zoomToFocusHeightRatio = 3.84,
		fullViewZoomToFocusHeightRatio = 3.6,
		defaultVerticalFocusScale = 0.5,
		minZoomRadius = 3,
		maxZoomRadius = 20,
		cameraCenterScreenPosition = UDim2.new(ConstantsModule.LandscapeNavWidth, 0, 0, if FFlagAXRootSlotBasedEditorFlag then -30 else 10),
		baseCameraOrigin = Vector3.new(9.24339867, 0, if AXCameraLevelHorizon then 0 else 0.594265997),
		zoomAdjustmentForFocusPart = if FFlagAXIncreaseDefaultPeekViewHeight then 1 else nil,
		landingPageZoomAdjustmentForFocusPart = if FFlagAXIncreaseDefaultPeekViewHeight then 1 else nil
	}
}

local function _(p1, p2: number): UDim2
	return p1 - UDim2.new(0, 0, 0, 64 - p2)
end

local function calculateRotationCFrame(Y, p1, p2): CFrame
	-- upvalues: AXCameraLevelHorizon (copy)
	return if AXCameraLevelHorizon then CFrame.new(Vector3.new(), (CFrame.new(Vector3.new(), Y) * CFrame.Angles(0, p1, 0) * CFrame.Angles(p2, 0, 0)).LookVector) else CFrame.new(Vector3.new(), Y) * CFrame.Angles(p2, p1, 0)
end

local _ = function(p1): boolean
	-- upvalues: ConstantsModule (copy)
	local LastToggledItem = p1.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {}
	
	return not LastToggledItem.isUnequipped and LastToggledItem.itemSubType == ConstantsModule.BundleTypeIdStrings.Animations
end

local function calculateFocusPointOfCharacterParts(CurrentCharacter, AvatarTypeFocusGroupEntry)
	-- upvalues: ConstantsModule (copy), UtilsModule (copy)
	local CountAvatarTypeFocusGroupEntry = #AvatarTypeFocusGroupEntry
	
	if CountAvatarTypeFocusGroupEntry == 0 then
		return ConstantsModule.DefaultRigPosition
	end
	local _Vector3 = Vector3.new()
	
	for _, value in AvatarTypeFocusGroupEntry do
		if not value.Attachment then
			_Vector3 += UtilsModule.getPartCFrame(CurrentCharacter, value.Part).Position
			continue
		end
		local AttachmentCFrame = UtilsModule.getAttachmentCFrame(CurrentCharacter, value.Part, value.Attachment)
		
		if AttachmentCFrame == nil then
			AttachmentCFrame = UtilsModule.getPartCFrame(CurrentCharacter, value.Part)
		end
		_Vector3 += AttachmentCFrame.Position
	end
	return _Vector3 / CountAvatarTypeFocusGroupEntry
end

local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(List): string
	local v1 = " equippedAssets="
	local List1 = {}
	
	for _, value in List do
		for i, _ in value do
			table.insert(List1, i)
		end
	end
	return v1 .. table.concat(List1, ", ")
end)

local function calculateModel2DBoundingSizeRelativeToCFrame(Model: Model, CF, EquippedAssets): Vector2
	-- upvalues: UtilsModule (copy), GetAXCameraManagerErrorsEnabledModule (copy), MemoizeResult (copy), MutedErrorModule (copy), _CFrame (copy)
	local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
	
	if not UtilsModule.isBoundingBoxVectorSane(BoundingSize) then
		if GetAXCameraManagerErrorsEnabledModule() then
			MutedErrorModule("(Avatar Experience) size = " .. BoundingSize.X .. ", " .. BoundingSize.Y .. ", " .. BoundingSize.Z .. MemoizeResult(EquippedAssets))
		end
		BoundingSize = vector.create(4, 6, 2)
	end
	if not UtilsModule.isBoundingBoxCFrameSane(BoundingCFrame) then
		if GetAXCameraManagerErrorsEnabledModule() then
			MutedErrorModule("(Avatar Experience) orientation = " .. BoundingCFrame.X .. ", " .. BoundingCFrame.Y .. ", " .. BoundingCFrame.Z .. MemoizeResult(EquippedAssets))
		end
		BoundingCFrame = _CFrame
	end
	if GetAXCameraManagerErrorsEnabledModule() and not UtilsModule.isBoundingBoxCFrameSane(CF) then
		MutedErrorModule("(Avatar Experience) cframe = " .. CF.X .. ", " .. CF.Y .. ", " .. CF.Z .. MemoizeResult(EquippedAssets))
	end
	local BoundingSizeRatio = BoundingSize / 2
	local list = {
		Vector3.new(-BoundingSizeRatio.X, -BoundingSizeRatio.Y, -BoundingSizeRatio.Z),
		Vector3.new(BoundingSizeRatio.X, -BoundingSizeRatio.Y, -BoundingSizeRatio.Z),
		Vector3.new(BoundingSizeRatio.X, BoundingSizeRatio.Y, -BoundingSizeRatio.Z),
		Vector3.new(-BoundingSizeRatio.X, BoundingSizeRatio.Y, -BoundingSizeRatio.Z),
		Vector3.new(-BoundingSizeRatio.X, -BoundingSizeRatio.Y, BoundingSizeRatio.Z),
		Vector3.new(BoundingSizeRatio.X, -BoundingSizeRatio.Y, BoundingSizeRatio.Z),
		Vector3.new(BoundingSizeRatio.X, BoundingSizeRatio.Y, BoundingSizeRatio.Z),
		(Vector3.new(-BoundingSizeRatio.X, BoundingSizeRatio.Y, BoundingSizeRatio.Z))
	}
	local Smallest = 1e999
	local Smallest1 = 1e999
	local Largest = -1e999
	local Largest1 = -1e999
	
	for i = 1, #list do
		local Vector = CF:PointToObjectSpace(BoundingCFrame:PointToWorldSpace(list[i]))
		Smallest = math.min(Smallest, Vector.X)
		Smallest1 = math.min(Smallest1, Vector.Y)
		Largest = math.max(Largest, Vector.X)
		Largest1 = math.max(Largest1, Vector.Y)
		
		if GetAXCameraManagerErrorsEnabledModule() then
			if Largest < Smallest then
				MutedErrorModule("(Avatar Experience) maxX = " .. Largest .. ", minX = " .. Smallest)
			end
			if Largest1 < Smallest1 then
				MutedErrorModule("(Avatar Experience) maxY = " .. Largest1 .. ", minY = " .. Smallest1)
			end
		end
	end
	return Vector2.new(Largest - Smallest, Largest1 - Smallest1)
end

local _ = function(AvatarExperienceLandingPage): boolean
	-- upvalues: AvatarScreen (copy), UtilsModule (copy)
	return AvatarExperienceLandingPage ~= AvatarScreen.AvatarExperienceLandingPage and not UtilsModule.isAvatarBackground(AvatarExperienceLandingPage)
end

local CameraManager = {}
CameraManager.__index = CameraManager

function CameraManager:calculateFocusPoint()
	-- upvalues: UtilsModule (copy), ConstantsModule (copy), calculateFocusPointOfCharacterParts (copy), config (copy), FFlagAXCustomizeMakeupSupport (copy)
	local State = self.store:getState()
	local UseCenteredSceneViewResult = self:useCenteredSceneView(State, self.avatarRoute)
	local CategoryInfoFromState = UtilsModule.getCategoryInfoFromState(State, self.avatarRoute)
	local CurrentCharacter = State.AvatarExperience.AvatarScene.Character.CurrentCharacter
	local DeviceOrientation = State.DeviceOrientation
	local AvatarTypeFocusGroupEntry = ConstantsModule.AvatarTypeFocusGroups[State.AvatarExperience.AvatarEditor.Character.AvatarType][CategoryInfoFromState.CameraFocus]
	
	if AvatarTypeFocusGroupEntry and not UseCenteredSceneViewResult then
		return (calculateFocusPointOfCharacterParts(CurrentCharacter, AvatarTypeFocusGroupEntry))
	end
	local FocusPointOfCharacterParts = calculateFocusPointOfCharacterParts(CurrentCharacter, { { Part = "HumanoidRootPart" } })
	local Y = (CurrentCharacter:GetExtentsSize() * config[DeviceOrientation].defaultVerticalFocusScale).Y
	local Head = CurrentCharacter:FindFirstChild("Head")
	
	if Head then
		if FFlagAXCustomizeMakeupSupport and CategoryInfoFromState.CameraFocus == ConstantsModule.PartName.Makeup then
			Y = Head.Position.Y
		else
			Y = math.min(Head.Position.Y, Y)
		end
	end
	return (Vector3.new(FocusPointOfCharacterParts.X, Y, FocusPointOfCharacterParts.Z))
end

function CameraManager:calculateBaseZoomRadius(CachedFocusPoint)
	-- upvalues: config (copy), UtilsModule (copy), AvatarScreen (copy), ConstantsModule (copy), FFlagAXIncreaseDefaultPeekViewHeight (copy)
	local State = self.store:getState()
	local DeviceOrientation = State.DeviceOrientation
	
	if self:useCenteredSceneView(State, self.avatarRoute) then
		return (State.AvatarExperience.AvatarScene.Character.CurrentCharacter:GetExtentsSize() * 0.5).Y * config[DeviceOrientation].fullViewZoomToFocusHeightRatio
	end
	local CategoryInfoFromState = UtilsModule.getCategoryInfoFromState(State, self.avatarRoute)
	local IsNameMatch = self.avatarRoute.current.name == AvatarScreen.AvatarExperienceLandingPage
	local AvatarTypeFocusGroupEntry = ConstantsModule.AvatarTypeFocusGroups[State.AvatarExperience.AvatarEditor.Character.AvatarType][CategoryInfoFromState.CameraFocus] or nil
	local LastToggledItem = State.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {}
	local IsItemSubTypeMatch: boolean = not LastToggledItem.isUnequipped and LastToggledItem.itemSubType == ConstantsModule.BundleTypeIdStrings.Animations
	local AnimationCategoryCameraZoomRadius = if IsItemSubTypeMatch then ConstantsModule.AnimationCategoryCameraZoomRadius else CategoryInfoFromState.CameraZoomRadius or 0
	
	if not AvatarTypeFocusGroupEntry then
		AnimationCategoryCameraZoomRadius += CachedFocusPoint.Y * (IsNameMatch and config[DeviceOrientation].landingPageZoomToFocusHeightRatio or config[DeviceOrientation].zoomToFocusHeightRatio)
	end
	if FFlagAXIncreaseDefaultPeekViewHeight and AvatarTypeFocusGroupEntry then
		AnimationCategoryCameraZoomRadius *= if IsNameMatch then config[DeviceOrientation].landingPageZoomAdjustmentForFocusPart else config[DeviceOrientation].zoomAdjustmentForFocusPart
	end
	return AnimationCategoryCameraZoomRadius
end

function CameraManager:calculateZoomRadius()
	return self.cachedBaseZoomRadius + self.zoomOffset
end

function CameraManager:calculateCameraOrigin(CachedFocusPoint, ZoomRadius)
	-- upvalues: config (copy), AXCameraDownwardTilt (copy)
	local DeviceOrientation = self.store:getState().DeviceOrientation
	local BaseCameraOriginDelta = config[DeviceOrientation].baseCameraOrigin - CachedFocusPoint
	local NewCachedFocusPoint = CachedFocusPoint + Vector3.new(BaseCameraOriginDelta.x, 0, BaseCameraOriginDelta.z).Unit * ZoomRadius
	
	if AXCameraDownwardTilt then
		local Entry = config[DeviceOrientation]
		local MinZoomRadius = Entry.minZoomRadius
		local MaxZoomRadius = Entry.maxZoomRadius
		NewCachedFocusPoint += Vector3.new(0, ZoomRadius * math.tan((if MinZoomRadius < MaxZoomRadius then math.clamp((ZoomRadius - MinZoomRadius) / (MaxZoomRadius - MinZoomRadius), 0, 1) else 0) * 0.11344640137963143 + 0), 0)
	end
	return NewCachedFocusPoint
end

function CameraManager.calculateHalfFieldsOfView(p1)
	-- upvalues: GetFFlagLuaAppFixStudioNotchSupportModule (copy), HardwareSafeAreaInsets (copy)
	local AbsoluteSize = if GetFFlagLuaAppFixStudioNotchSupportModule() then HardwareSafeAreaInsets.fullscreenGui().AbsoluteSize else p1.camera.ViewportSize
	
	return math.atan(0.4663076581549986 * AbsoluteSize.X / AbsoluteSize.Y), 0.4363323129985824
end

function CameraManager:useCenteredSceneView(State, AvatarRoute)
	-- upvalues: AvatarScreen (copy), UtilsModule (copy)
	return AvatarRoute.opaque.name == AvatarScreen.TryOnItem or UtilsModule.getIsSceneFullViewFromState(State, AvatarRoute)
end

function CameraManager:getPeekViewHeight()
	-- upvalues: PeekViewState (copy)
	local ItemDetailsPeekView = self.store:getState().AvatarExperience.Common.ItemDetailsPeekView
	
	return if ItemDetailsPeekView.viewState == PeekViewState.Brief and ItemDetailsPeekView.briefViewHeight then ItemDetailsPeekView.briefViewHeight else 0
end

function CameraManager:calculateCameraOffsetAngles()
	-- upvalues: UtilsModule (copy), AvatarScreen (copy), config (copy), GetFFlagLuaAppFixStudioNotchSupportModule (copy), HardwareSafeAreaInsets (copy)
	local State = self.store:getState()
	
	if self:useCenteredSceneView(State, self.avatarRoute) then
		return 0, 0
	else
		local DeviceOrientation = State.DeviceOrientation
		local Vector = (self.avatarRoute.current.name == AvatarScreen.AvatarExperienceLandingPage and config[DeviceOrientation].landingPageCameraCenterScreenPosition or config[DeviceOrientation].cameraCenterScreenPosition) - UDim2.new(0, 0, 0, 64 - UtilsModule.getTopBarHeightAvatarScene(State))
		local HalfFieldsOfView, HalfFieldsOfView2 = self:calculateHalfFieldsOfView()
		local AbsoluteSize = if GetFFlagLuaAppFixStudioNotchSupportModule() then HardwareSafeAreaInsets.fullscreenGui().AbsoluteSize else self.camera.ViewportSize
		
		return math.atan(math.tan(HalfFieldsOfView) * (Vector.X.Scale + 2 * Vector.X.Offset / AbsoluteSize.X)), (math.atan(math.tan(HalfFieldsOfView2) * (Vector.Y.Scale + 2 * Vector.Y.Offset / AbsoluteSize.Y)))
	end
end

function CameraManager:pixelOffsetToPositionOffset(ScaledVector): Vector2
	-- upvalues: calculateRotationCFrame (copy), GetFFlagLuaAppFixStudioNotchSupportModule (copy), HardwareSafeAreaInsets (copy)
	local CameraOffsetAngles, CameraOffsetAngles2 = self:calculateCameraOffsetAngles()
	local HalfFieldsOfView, HalfFieldsOfView2 = self:calculateHalfFieldsOfView()
	local CachedFocusPoint = self.cachedFocusPoint
	local CachedFocusPointDelta = CachedFocusPoint - self:calculateCameraOrigin(CachedFocusPoint, (self:calculateZoomRadius()))
	
	return ScaledVector / (if GetFFlagLuaAppFixStudioNotchSupportModule() then HardwareSafeAreaInsets.fullscreenGui().AbsoluteSize else self.camera.ViewportSize) * Vector2.new(math.tan(HalfFieldsOfView), (math.tan(HalfFieldsOfView2))) * -calculateRotationCFrame(CachedFocusPointDelta, CameraOffsetAngles, CameraOffsetAngles2):VectorToObjectSpace(CachedFocusPointDelta).Z * 2
end

function CameraManager:tweenCameraIntoPlace(CameraOrigin, CachedFocusPoint, p1)
	-- upvalues: calculateRotationCFrame (copy), TweenService (copy), _TweenInfo (copy)
	local CameraOffsetAngles, CameraOffsetAngles2 = self:calculateCameraOffsetAngles()
	local RotationCFrame = calculateRotationCFrame(CachedFocusPoint - CameraOrigin, CameraOffsetAngles, CameraOffsetAngles2)
	local PanOffset = self.panOffset
	local ScaledRotationCFrame = CFrame.new(CameraOrigin + (RotationCFrame.LookVector:Cross(vector.create(0, 1, 0)).Unit * PanOffset.X + vector.create(0, 1, 0) * PanOffset.Y)) * RotationCFrame
	self:cancelTween()
	
	if p1 then
		self.camera.CFrame = ScaledRotationCFrame
		
		return
	else
		self.isTweening = true
		local Tween = TweenService:Create(self.camera, _TweenInfo, { CFrame = ScaledRotationCFrame })
		Tween.Completed:Connect(function()
			-- upvalues: self (copy)
			self.isTweening = false
			self.tween = nil
		end)
		Tween:Play()
		self.tween = Tween
	end
end

function CameraManager:boundPanOffset(): boolean?
	-- upvalues: calculateRotationCFrame (copy), calculateModel2DBoundingSizeRelativeToCFrame (copy), GetAXCameraManagerErrorsEnabledModule (copy), MutedErrorModule (copy)
	local State = self.store:getState()
	local CurrentCharacter = State.AvatarExperience.AvatarScene.Character.CurrentCharacter
	
	if not CurrentCharacter then return end
	local _, HalfFieldsOfView2 = self:calculateHalfFieldsOfView()
	local CameraOffsetAngles, CameraOffsetAngles2 = self:calculateCameraOffsetAngles()
	local CachedFocusPoint = self.cachedFocusPoint
	local CameraOrigin = self:calculateCameraOrigin(CachedFocusPoint, (self:calculateZoomRadius()))
	local Negated = -self.camera.NearPlaneZ
	local ScaledTangent = math.tan(HalfFieldsOfView2) * Negated
	local NewSine = math.sin(HalfFieldsOfView2 + CameraOffsetAngles2) * math.sqrt(ScaledTangent * ScaledTangent + Negated * Negated) - CameraOrigin.Y + 0.01
	local Model2DBoundingSizeRelativeToCFrameRatio = calculateModel2DBoundingSizeRelativeToCFrame(CurrentCharacter, CFrame.new(CameraOrigin) * calculateRotationCFrame(CachedFocusPoint - CameraOrigin, CameraOffsetAngles, CameraOffsetAngles2), State.AvatarExperience.AvatarEditor.Character.EquippedAssets) / 2
	
	if GetAXCameraManagerErrorsEnabledModule() then
		if Model2DBoundingSizeRelativeToCFrameRatio.X < 0 then
			MutedErrorModule("(Avatar Experience) characterHalf2DBoundingSize.X = " .. Model2DBoundingSizeRelativeToCFrameRatio.X)
		end
		if Model2DBoundingSizeRelativeToCFrameRatio.Y < 0 then
			MutedErrorModule("(Avatar Experience) characterHalf2DBoundingSize.Y = " .. Model2DBoundingSizeRelativeToCFrameRatio.Y)
		end
	end
	local _Vector2 = Vector2.new(math.max(0, Model2DBoundingSizeRelativeToCFrameRatio.X), (math.max(0, Model2DBoundingSizeRelativeToCFrameRatio.Y)))
	local PanOffset = self.panOffset
	self.panOffset = Vector3.new(math.clamp(self.panOffset.X, -_Vector2.X, _Vector2.X), math.clamp(self.panOffset.Y, math.max(NewSine, -_Vector2.Y), (math.max(NewSine, _Vector2.Y))), self.panOffset.Z)
	
	return PanOffset ~= self.panOffset
end

function CameraManager:calculateZoomOffsetBounds()
	-- upvalues: config (copy)
	local Entry = config[self.store:getState().DeviceOrientation]
	local CachedBaseZoomRadius = self.cachedBaseZoomRadius
	
	return Entry.minZoomRadius - CachedBaseZoomRadius, Entry.maxZoomRadius - CachedBaseZoomRadius
end

function CameraManager:boundZoomOffset(MinValue: number, MaxValue: number): boolean
	if not MinValue or not MaxValue then
		MinValue, MaxValue = self:calculateZoomOffsetBounds()
	end
	local ZoomOffset = self.zoomOffset
	self.zoomOffset = math.clamp(self.zoomOffset, MinValue, MaxValue)
	
	return ZoomOffset ~= self.zoomOffset
end

function CameraManager:handleCameraChange(p1)
	if self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter then
		local CachedFocusPoint = self.cachedFocusPoint
		self:tweenCameraIntoPlace(self:calculateCameraOrigin(CachedFocusPoint, (self:calculateZoomRadius())), CachedFocusPoint, p1)
		
		return
	end
end

function CameraManager:panByDistance(PixelOffsetToPositionOffsetResult)
	self.panOffset = Vector3.new(self.panOffset.X + PixelOffsetToPositionOffsetResult.X, self.panOffset.Y + PixelOffsetToPositionOffsetResult.Y, 0)
	self:boundPanOffset()
	self:handleCameraChange(true)
end

function CameraManager:panByPixels(p1)
	self:panByDistance((self:pixelOffsetToPositionOffset(p1)))
end

function CameraManager:zoomStraight(p1)
	self.zoomOffset += p1
	self:boundZoomOffset()
	self:handleCameraChange(true)
end

function CameraManager:zoomToPoint(p1, p2)
	-- upvalues: calculateRotationCFrame (copy), GetFFlagLuaAppFixStudioNotchSupportModule (copy), HardwareSafeAreaInsets (copy)
	local CameraOffsetAngles, CameraOffsetAngles2 = self:calculateCameraOffsetAngles()
	local CachedFocusPoint = self.cachedFocusPoint
	local CachedFocusPointDelta = CachedFocusPoint - self:calculateCameraOrigin(CachedFocusPoint, (self:calculateZoomRadius()))
	local RotationCFrame = calculateRotationCFrame(CachedFocusPointDelta, CameraOffsetAngles, CameraOffsetAngles2)
	local Vector = RotationCFrame:VectorToObjectSpace(CachedFocusPointDelta)
	local ScaledVector = (p2 - (if GetFFlagLuaAppFixStudioNotchSupportModule() then HardwareSafeAreaInsets.fullscreenGui().AbsoluteSize else self.camera.ViewportSize) / 2) * Vector2.new(1, -1)
	local PixelOffsetToPositionOffsetResult = self:pixelOffsetToPositionOffset(ScaledVector)
	local VectorDelta = Vector3.new(PixelOffsetToPositionOffsetResult.X, PixelOffsetToPositionOffsetResult.Y, Vector.Z) - Vector
	local ZoomOffsetBounds, ZoomOffsetBounds2 = self:calculateZoomOffsetBounds()
	self.zoomOffset += p1
	self:boundZoomOffset(ZoomOffsetBounds, ZoomOffsetBounds2)
	local PixelOffsetToPositionOffsetResult1 = self:pixelOffsetToPositionOffset(ScaledVector)
	self.panOffset = self.panOffset + VectorDelta - (Vector3.new(PixelOffsetToPositionOffsetResult1.X, PixelOffsetToPositionOffsetResult1.Y, Vector.Z) - RotationCFrame:VectorToObjectSpace(CachedFocusPoint - self:calculateCameraOrigin(CachedFocusPoint, (self:calculateZoomRadius()))))
	self:boundPanOffset()
	self:handleCameraChange(true)
end

function CameraManager:update(State, State1, AvatarRoute, AvatarRoute1)
	-- upvalues: AvatarScreen (copy), UtilsModule (copy), ConstantsModule (copy), FFlagAXCustomizeMakeupSupport (copy)
	local Name = AvatarRoute.current.name
	local Name1 = AvatarRoute1.current.name
	local Inverted: boolean = Name ~= AvatarScreen.AvatarExperienceLandingPage and not UtilsModule.isAvatarBackground(Name)
	local Inverted1: boolean = Name1 ~= AvatarScreen.AvatarExperienceLandingPage and not UtilsModule.isAvatarBackground(Name1)
	local NoInverted1: boolean = Inverted and not Inverted1
	
	if not Inverted and Inverted1 then
		if #self.interactionConnections > 0 then
			self:disconnectInteractionEvents()
		end
	elseif NoInverted1 and #self.interactionConnections == 0 then
		self:connectInteractionEvents()
	end
	local CurrentCharacter = State.AvatarExperience.AvatarScene.Character.CurrentCharacter
	local CategoryInfoFromState = UtilsModule.getCategoryInfoFromState(State, AvatarRoute)
	
	if not CurrentCharacter or not CategoryInfoFromState then return end
	local CategoryInfoFromState1 = UtilsModule.getCategoryInfoFromState(State1, AvatarRoute1)
	local TryOnCharacterModelVersion = State.AvatarExperience.AvatarScene.Character.TryOnCharacterModelVersion
	local TryOnCharacterModelVersion1 = State1.AvatarExperience.AvatarScene.Character.TryOnCharacterModelVersion
	local IsNotCharacterModelVersionMatch: boolean = State.AvatarExperience.AvatarScene.Character.CharacterModelVersion ~= State1.AvatarExperience.AvatarScene.Character.CharacterModelVersion or TryOnCharacterModelVersion ~= TryOnCharacterModelVersion1
	local CurrentCharacter1 = State1.AvatarExperience.AvatarScene.Character.CurrentCharacter
	local TopBarHeightAvatarScene = UtilsModule.getTopBarHeightAvatarScene(State)
	local TopBarHeightAvatarScene1 = UtilsModule.getTopBarHeightAvatarScene(State1)
	local IsNotDeviceOrientationMatch = State.DeviceOrientation ~= State1.DeviceOrientation
	local IsNotScreenSizeMatch = State.ScreenSize ~= State1.ScreenSize
	local IsNameMatch = AvatarRoute.opaque.name == AvatarScreen.TryOnItem
	local IsNameMatch1: boolean = not (AvatarRoute1.opaque.name == AvatarScreen.TryOnItem) and IsNameMatch
	local AvatarTypeFocusGroupEntry = ConstantsModule.AvatarTypeFocusGroups[State.AvatarExperience.AvatarEditor.Character.AvatarType][CategoryInfoFromState.CameraFocus]
	local IsNotLastSuccessfulPoseEmoteAssetIdMatch = State1.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId ~= State.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId
	local IsNotCategoryInfoFromStateMatch: boolean = self.lastCategoryInfo ~= nil and CategoryInfoFromState ~= self.lastCategoryInfo
	local IsNotUseCenteredSceneViewResultMatch: boolean = self:useCenteredSceneView(State, AvatarRoute) ~= self:useCenteredSceneView(State1, AvatarRoute1) or (CategoryInfoFromState ~= CategoryInfoFromState1 or IsNotCategoryInfoFromStateMatch)
	
	if IsNotUseCenteredSceneViewResultMatch then
		self.panOffset = Vector3.new()
		self.zoomOffset = 0
	end
	local IsNotLastSuccessfulPoseEmoteAssetIdMatch1: boolean = IsNotLastSuccessfulPoseEmoteAssetIdMatch or (IsNotUseCenteredSceneViewResultMatch or (CurrentCharacter ~= CurrentCharacter1 or not AvatarTypeFocusGroupEntry and IsNotCharacterModelVersionMatch))
	
	if IsNotLastSuccessfulPoseEmoteAssetIdMatch1 then
		local CachedFocusPoint = self.cachedFocusPoint
		self.cachedFocusPoint = self:calculateFocusPoint()
		local CachedBaseZoomRadius = self.cachedBaseZoomRadius
		self.cachedBaseZoomRadius = self:calculateBaseZoomRadius(self.cachedFocusPoint)
		
		if FFlagAXCustomizeMakeupSupport and CategoryInfoFromState.CameraFocus == ConstantsModule.PartName.Makeup then
			self.cachedBaseZoomRadius = CategoryInfoFromState.CameraZoomRadius
		end
		if not IsNotUseCenteredSceneViewResultMatch then
			if self.panOffset ~= Vector3.new() then
				self.panOffset -= self.cachedFocusPoint - CachedFocusPoint
			end
			if self.zoomOffset ~= 0 then
				self.zoomOffset -= self.cachedBaseZoomRadius - CachedBaseZoomRadius
			end
		end
	end
	if IsNotLastSuccessfulPoseEmoteAssetIdMatch1 or IsNotDeviceOrientationMatch or IsNotScreenSizeMatch or TopBarHeightAvatarScene ~= TopBarHeightAvatarScene1 then
		self:boundPanOffset()
		self:boundZoomOffset()
		self:handleCameraChange(IsNotDeviceOrientationMatch or IsNameMatch1)
	end
	self.lastCategoryInfo = CategoryInfoFromState
end

function CameraManager:updateState(p1, p2)
	local AvatarRoute = self.avatarRoute
	self:update(p1, p2, AvatarRoute, AvatarRoute)
end

function CameraManager:updateAvatarRoute(AvatarRoute, p1)
	self.avatarRoute = AvatarRoute
	
	if self.started then
		local State = self.store:getState()
		self:update(State, State, AvatarRoute, p1)
	end
end

function CameraManager:updateCategorySelection()
	local State = self.store:getState()
	self:update(State, State, self.avatarRoute, self.avatarRoute)
end

function CameraManager:connectInteractionEvents()
	table.insert(self.interactionConnections, self.events.panByDistance:Connect(function(...)
		-- upvalues: self (copy)
		self:panByDistance(...)
	end))
	table.insert(self.interactionConnections, self.events.panByPixels:Connect(function(...)
		-- upvalues: self (copy)
		self:panByPixels(...)
	end))
	table.insert(self.interactionConnections, self.events.zoomStraight:Connect(function(...)
		-- upvalues: self (copy)
		self:zoomStraight(...)
	end))
	table.insert(self.interactionConnections, self.events.zoomToPoint:Connect(function(...)
		-- upvalues: self (copy)
		self:zoomToPoint(...)
	end))
end

function CameraManager:disconnectInteractionEvents()
	for _, interactionConnection in self.interactionConnections do
		interactionConnection:Disconnect()
	end
	self.interactionConnections = {}
end

function CameraManager.new(Store, AvatarRoute, Events)
	-- upvalues: CameraManager (copy), AXFixCameraManagerInitialization (copy)
	local t = {}
	setmetatable(t, CameraManager)
	t.store = Store
	t.avatarRoute = AvatarRoute
	t.events = Events
	t.updateConnection = nil
	t.interactionConnections = {}
	t.camera = game.Workspace.CurrentCamera
	t.isTweening = false
	t.panOffset = Vector3.new()
	t.zoomOffset = 0
	t.cachedFocusPoint = if AXFixCameraManagerInitialization then Vector3.new() else nil
	t.cachedBaseZoomRadius = if AXFixCameraManagerInitialization then 0 else nil
	t.started = false
	t.lastCategoryInfo = nil
	
	return t
end

function CameraManager:start()
	-- upvalues: Fix10ftCameraSwitchRace (copy), UtilsModule (copy), AvatarScreen (copy)
	if self.started then return end
	self.started = true
	
	if Fix10ftCameraSwitchRace then
		self.previousCFrame = self.camera.CFrame
	end
	self.cachedFocusPoint = self:calculateFocusPoint()
	self.cachedBaseZoomRadius = self:calculateBaseZoomRadius(self.cachedFocusPoint)
	local State = self.store:getState()
	self.lastCategoryInfo = UtilsModule.getCategoryInfoFromState(State, self.avatarRoute)
	local Name = self.avatarRoute.current.name
	
	if Name ~= AvatarScreen.AvatarExperienceLandingPage and not UtilsModule.isAvatarBackground(Name) then
		self:connectInteractionEvents()
	end
	self.updateConnection = self.store.changed:connect(function(...)
		-- upvalues: self (copy)
		self:updateState(...)
	end)
	self.camera.CameraType = Enum.CameraType.Scriptable
	self.camera.FieldOfView = 50
	
	if State.AvatarExperience.AvatarScene.Character.CurrentCharacter then
		self.cachedBaseZoomRadius = self:calculateBaseZoomRadius(self.cachedFocusPoint)
		self:handleCameraChange(true)
	end
end

function CameraManager:cancelTween()
	if self.tween then
		self.tween:Cancel()
		self.tween = nil
		self.isTweening = false
	end
end

function CameraManager:stop()
	-- upvalues: Fix10ftCameraSwitchRace (copy)
	if not self.started then return end
	self.started = false
	self:cancelTween()
	self.updateConnection:disconnect()
	self:disconnectInteractionEvents()
	
	if Fix10ftCameraSwitchRace then
		self.camera.CFrame = self.previousCFrame
	end
end

function CameraManager:onDestroy() end

return CameraManager
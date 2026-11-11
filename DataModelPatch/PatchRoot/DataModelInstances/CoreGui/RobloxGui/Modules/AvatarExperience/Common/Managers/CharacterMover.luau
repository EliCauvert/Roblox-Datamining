local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local _ = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceNavigation)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local PPECameraManagerModule = require(Modules.AvatarExperience.ProfilePictureEditor.Managers.PPECameraManager)
local UtilsModule1 = require(Modules.AvatarExperience.ProfilePictureEditor.Utils)
local CameraManagerModule = require(Modules.AvatarExperience.Common.Managers.CameraManager)
local _TweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)

local function _(Value: number, Value1: number): number
	return if math.abs(Value) < math.abs(Value1) then Value else Value1
end

local _ = function(p1: number): number
	return (p1 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793
end

local CharacterMoverModule = {}
CharacterMoverModule.__index = CharacterMoverModule

local _ = function(p1: number): number
	return (p1 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793
end

function CharacterMoverModule:resetRotation(p1)
	local CurrentCharacter = self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter
	
	if CurrentCharacter then
		local NoP3 = not p1
		local Rx, Ry, _ = CurrentCharacter.HumanoidRootPart.CFrame:ToOrientation()
		self:rotateByRadians(-((Ry + 3.141592653589793) % 6.283185307179586 - 3.141592653589793 + 1.5707963267948966), -((Rx + 3.141592653589793) % 6.283185307179586 - 3.141592653589793), NoP3)
		
		return
	end
end

function CharacterMoverModule:cancelCurrentTween()
	if self.currentTween then
		self.currentTween:Cancel()
		self.currentTween = nil
	end
end

function CharacterMoverModule:rotateByRadiansPreservingY(p1, p2, p3: boolean)
	-- upvalues: _TweenInfo (copy), TweenService (copy)
	local P6 = p1 or 0
	local P7 = p2 or 0
	local CurrentCharacter = self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter
	
	if not CurrentCharacter then return end
	local HumanoidRootPart = CurrentCharacter.HumanoidRootPart
	
	if not HumanoidRootPart then return end
	local Rx, Ry, _ = HumanoidRootPart.CFrame:ToEulerAnglesYXZ()
	local RyDelta = (Ry + 3.141592653589793) % 6.283185307179586 - 3.141592653589793
	local RxDelta = (Rx + 3.141592653589793) % 6.283185307179586 - 3.141592653589793
	local _Vector2 = Vector2.new((RyDelta + P6 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793, (RxDelta + P7 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793)
	
	if not self.angleTweenValues then
		self.angleTweenValues = Instance.new("NumberValue")
	end
	self.angleTweenValues.Value = RyDelta
	
	if math.abs(RyDelta - _Vector2.X) < 0.001 then
		p3 = false
	end
	if p3 then
		self.yAngularVelocity = 0
		self:cancelCurrentTween()
		local Tween = TweenService:Create(self.angleTweenValues, _TweenInfo, { Value = _Vector2.X })
		self.currentTween = Tween
		Tween:Play()
		task.spawn(function()
			-- upvalues: Tween (copy), HumanoidRootPart (copy), self (copy), RxDelta (copy)
			while Tween.PlaybackState == Enum.PlaybackState.Playing do
				if not HumanoidRootPart or not HumanoidRootPart.Parent then break end
				HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position) * CFrame.fromEulerAnglesYXZ(RxDelta, self.angleTweenValues.Value, 0)
				task.wait()
			end
		end)
	else
		HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position.X, HumanoidRootPart.Position.Y, HumanoidRootPart.Position.Z) * CFrame.fromEulerAnglesYXZ(RxDelta, _Vector2.X, 0)
	end
	if self.cameraManager and self.cameraManager:boundPanOffset() and not self.cameraManager.isTweening then
		self.cameraManager:handleCameraChange(true)
	end
end

function CharacterMoverModule:rotateByRadians(ScaledX, p4, p5)
	self:rotateByRadiansPreservingY(ScaledX, p4, p5)
end

function CharacterMoverModule:rotateByPixels(X)
	if self.cameraManager then
		self:rotateByRadians(self.cameraManager:pixelOffsetToPositionOffset(Vector2.new(X, 0)).X * 0.436)
	end
end

function CharacterMoverModule:setAngularVelocityByPixels(X)
	-- upvalues: RunService (copy)
	if self.cameraManager then
		self.yAngularVelocity = math.clamp(self.cameraManager:pixelOffsetToPositionOffset(Vector2.new(X, 0)).X * 0.436, -14.835298641951802, 14.835298641951802)
		
		if self.yAngularVelocity ~= 0 and not self.renderSteppedConnection then
			self.renderSteppedConnection = RunService.RenderStepped:Connect(function(...)
				-- upvalues: self (copy)
				self:onRenderStepped(...)
			end)
		end
	end
end

function CharacterMoverModule:onRenderStepped(p4: number)
	local ScaledYAngularVelocity = p4 * self.yAngularVelocity
	self.yAngularVelocity *= math.pow(0.010000000000000009, p4)
	
	if math.abs(self.yAngularVelocity) < 0.0001 then
		self.yAngularVelocity = 0
	end
	local XDelta = ((if self.store:getState().AvatarExperience.AvatarScene.Character.PlayingSwimAnimation then -1.0471975511965976 else 0) - self.angleOffset.X + 3.141592653589793) % 6.283185307179586 - 3.141592653589793
	local ScaledSign = 2.0943951023931953 * p4 * math.sign(XDelta)
	local XDelta1 = if math.abs(XDelta) < math.abs(ScaledSign) then XDelta else ScaledSign
	
	if XDelta1 ~= 0 or ScaledYAngularVelocity ~= 0 then
		self:rotateByRadians(ScaledYAngularVelocity, XDelta1)
	end
	if self.yAngularVelocity == 0 and math.abs(XDelta) < 0.0001 then
		self.renderSteppedConnection:Disconnect()
		self.renderSteppedConnection = nil
	end
end

function CharacterMoverModule:update(State, State1, AvatarRoute, AvatarRoute1, _)
	-- upvalues: RunService (copy), UtilsModule (copy)
	if State.AvatarExperience.AvatarScene.Character.PlayingSwimAnimation ~= State1.AvatarExperience.AvatarScene.Character.PlayingSwimAnimation and not self.renderSteppedConnection then
		self.renderSteppedConnection = RunService.RenderStepped:Connect(function(...)
			-- upvalues: self (copy)
			self:onRenderStepped(...)
		end)
	end
	if UtilsModule.getCategoryInfoFromState(State, AvatarRoute) ~= UtilsModule.getCategoryInfoFromState(State1, AvatarRoute1) then
		self:resetRotation()
	end
end

function CharacterMoverModule:updateState(p4, p5)
	local AvatarRoute = self.avatarRoute
	self:update(p4, p5, AvatarRoute, AvatarRoute)
end

function CharacterMoverModule:updateAvatarRoute(AvatarRoute, p4)
	-- upvalues: UtilsModule1 (copy)
	if self.ppeCameraManager or self.cameraManager then
		self.ppeCameraManager:updateAvatarRoute(AvatarRoute, p4)
		self.cameraManager:updateAvatarRoute(AvatarRoute, p4)
		local IsPPEScreenUsingPeekabooWidget = UtilsModule1.isPPEScreenUsingPeekabooWidget(AvatarRoute.opaque.name)
		local IsPPEScreenUsingPeekabooWidget1 = UtilsModule1.isPPEScreenUsingPeekabooWidget(p4.opaque.name)
		
		if IsPPEScreenUsingPeekabooWidget and not IsPPEScreenUsingPeekabooWidget1 then
			self:resetRotation(true)
			self.cameraManager:stop()
			self.ppeCameraManager:start()
		elseif not IsPPEScreenUsingPeekabooWidget and IsPPEScreenUsingPeekabooWidget1 then
			self.cameraManager:start()
			self.ppeCameraManager:stop()
		end
	end
	self.avatarRoute = AvatarRoute
	local State = self.store:getState()
	self:update(State, State, AvatarRoute, p4)
end

function CharacterMoverModule:updateCategorySelection()
	local State = self.store:getState()
	self:update(State, State, self.avatarRoute, self.avatarRoute)
end

function CharacterMoverModule:onPPEPoseChanged()
	if self.ppeCameraManager then
		self.ppeCameraManager:onPPEPoseChanged()
	end
end

function CharacterMoverModule.new(Store, AvatarExperienceAnalytics, AvatarExperienceAnalytics1, Events, p4)
	-- upvalues: CharacterMoverModule (copy), CameraManagerModule (copy), PPECameraManagerModule (copy)
	local t = {}
	setmetatable(t, CharacterMoverModule)
	t.cameraManager = nil
	t.ppeCameraManager = nil
	
	if p4 then
		t.cameraManager = CameraManagerModule.new(Store, AvatarExperienceAnalytics1, Events)
		t.ppeCameraManager = PPECameraManagerModule.new(Store, AvatarExperienceAnalytics1)
	end
	t.store = Store
	t.avatarExperienceAnalytics = AvatarExperienceAnalytics
	t.avatarRoute = AvatarExperienceAnalytics1
	t.events = Events
	t.bulkConnections = {}
	t.camera = game.Workspace.CurrentCamera
	t.initialAngles = nil
	t.angleOffset = Vector2.new()
	t.yAngularVelocity = 0
	t.currentTween = nil
	
	return t
end

function CharacterMoverModule:shouldUsePPECameraManager()
	-- upvalues: UtilsModule (copy)
	return UtilsModule.routeIsPPEStaticImagePage(self.avatarRoute)
end

function CharacterMoverModule:start()
	if self:shouldUsePPECameraManager() then
		if self.ppeCameraManager then
			self.ppeCameraManager:start()
		end
	elseif self.cameraManager then
		self.cameraManager:start()
	end
	table.insert(self.bulkConnections, self.store.changed:connect(function(...)
		-- upvalues: self (copy)
		self:updateState(...)
	end))
	table.insert(self.bulkConnections, self.events.rotateByRadians:Connect(function(...)
		-- upvalues: self (copy)
		self:rotateByRadians(...)
	end))
	table.insert(self.bulkConnections, self.events.rotateByPixels:Connect(function(...)
		-- upvalues: self (copy)
		self:rotateByPixels(...)
	end))
	table.insert(self.bulkConnections, self.events.setAngularVelocityByPixels:Connect(function(...)
		-- upvalues: self (copy)
		self:setAngularVelocityByPixels(...)
	end))
	self:resetRotation()
end

function CharacterMoverModule:stop()
	for _, bulkConnection in self.bulkConnections do
		bulkConnection:disconnect()
	end
	self.bulkConnections = {}
	
	if self.renderSteppedConnection then
		self.renderSteppedConnection:Disconnect()
		self.renderSteppedConnection = nil
	end
	if self.cameraManager then
		self.cameraManager:stop()
	end
	if self.ppeCameraManager then
		self.ppeCameraManager:stop()
	end
	self:cancelCurrentTween()
end

function CharacterMoverModule:onDestroy()
	if self.cameraManager then
		self.cameraManager:onDestroy()
	end
end

return CharacterMoverModule
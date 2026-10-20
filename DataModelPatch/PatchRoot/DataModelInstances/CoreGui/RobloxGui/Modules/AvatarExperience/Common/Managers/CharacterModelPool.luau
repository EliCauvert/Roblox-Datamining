local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CorePackages = game:GetService("CorePackages")
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local PromiseModule = require(CorePackages.Packages.Promise)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ReportAvatarStatModule = require(Modules.AvatarExperience.Common.Analytics.reportAvatarStat)
local StartedApplyingLayeredClothingModule = require(Modules.AvatarExperience.Common.Actions.StartedApplyingLayeredClothing)
local FinishedApplyingLayeredClothingModule = require(Modules.AvatarExperience.Common.Actions.FinishedApplyingLayeredClothing)
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local GetMakeupDescriptionsFromHumanoidDescriptionFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getMakeupDescriptionsFromHumanoidDescription
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXAvatarLoadWithRetry = AvatarExperienceFlagsModule.FFlagAXAvatarLoadWithRetry
local FFlagAXMakeupEquipping = AvatarExperienceFlagsModule.FFlagAXMakeupEquipping
local FFlagAXRefetchAvatarOnTimeout = AvatarExperienceFlagsModule.FFlagAXRefetchAvatarOnTimeout
local _CFrame: CFrame = if AvatarExperienceFlagsModule.FFlagAXBackgroundSceneManagerRevamp then CFrame.new(0, 3, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0) else CFrame.new(-3.3, 3, 0.2, 0, 0, -1, 0, 1, 0, 1, 0, 0)
local _CFrame1 = CFrame.new(0, 150, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
local FixVRAvatarPlacement = game:DefineFastFlag("FixVRAvatarPlacement", false)

if IsVRAppBuildFunction() then
	_CFrame = if FixVRAvatarPlacement then CFrame.lookAt(vector.create(0, 3, -6), vector.create(0, 3, 0)) else CFrame.lookAt(vector.create(0, 0, -6), vector.create(0, 0, 0))
	_CFrame1 = CFrame.lookAt(vector.create(6, 1, 100), vector.create(0, 1, 100))
end
local AXClusterCompositionTimeoutMs = game:DefineFastInt("AXClusterCompositionTimeoutMs", 3000)
local CharacterModelPoolModule = {}
CharacterModelPoolModule.__index = CharacterModelPoolModule

local function setupCharacterModels(p1)
	-- upvalues: FFlagAXAvatarLoadWithRetry (copy), Players (copy), ReplicatedStorage (copy), _CFrame1 (ref)
	local R6 = nil
	local R15 = nil
	if FFlagAXAvatarLoadWithRetry then
		R6 = p1.r6
		R15 = p1.r15
	elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
		R6 = Players:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6)
		R15 = Players:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	else
		R6 = Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6)
		R15 = Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	end
	R6.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	R15.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	R6.HumanoidRootPart.Anchored = true
	R15.HumanoidRootPart.Anchored = true
	R6.Parent = ReplicatedStorage
	R15.Parent = ReplicatedStorage
	R6.HumanoidRootPart.CFrame = _CFrame1
	R15:SetPrimaryPartCFrame(_CFrame1)
	
	return R6, R15
end

function CharacterModelPoolModule.new(Store, Analytics, CharacterMover, p1, MockApplyDescription)
	-- upvalues: CharacterModelPoolModule (copy), setupCharacterModels (copy), ReplicatedStorage (copy), ConstantsModule (copy)
	local t = {}
	setmetatable(t, CharacterModelPoolModule)
	t.store = Store
	t.analytics = Analytics
	t.characterMover = CharacterMover
	t.mockApplyDescription = MockApplyDescription
	local SetupCharacterModelsResult2
	t.r6, SetupCharacterModelsResult2 = setupCharacterModels(p1)
	t.r6IsOffscreen = true
	t.r15current = SetupCharacterModelsResult2
	t.r15offScreen = SetupCharacterModelsResult2:Clone()
	t.r15offScreen.Parent = ReplicatedStorage
	t.avatarType = ConstantsModule.AvatarType.R15
	t.inProgressPromise = nil
	t.waitingPromise = nil
	t.r6Promise = nil
	t.destroyed = false
	
	return t
end

function CharacterModelPoolModule:setupAnimations(p1, Object)
	p1.Parent = self.r6
	Object.Parent = self.r15current
	Object.Archivable = true
	local ObjectClone = Object:Clone()
	ObjectClone.Parent = self.r15offScreen
	ObjectClone.Archivable = false
	Object.Archivable = false
end

function CharacterModelPoolModule.getCurrentCharacter(p1)
	-- upvalues: ConstantsModule (copy)
	return if p1.avatarType == ConstantsModule.AvatarType.R15 then p1.r15current else p1.r6
end

function CharacterModelPoolModule:isR15(): boolean
	-- upvalues: ConstantsModule (copy)
	return self.avatarType == ConstantsModule.AvatarType.R15
end

function CharacterModelPoolModule:syncRotation(Character, Character1)
	local _, _, _, ComponentsResult4, ComponentsResult5, ComponentsResult6, ComponentsResult7, ComponentsResult8, ComponentsResult9, ComponentsResult10, ComponentsResult11, ComponentsResult12 = Character.HumanoidRootPart.CFrame:components()
	local P = Character1.HumanoidRootPart.CFrame.p
	Character1.HumanoidRootPart.CFrame = CFrame.new(P.X, P.Y, P.Z, ComponentsResult4, ComponentsResult5, ComponentsResult6, ComponentsResult7, ComponentsResult8, ComponentsResult9, ComponentsResult10, ComponentsResult11, ComponentsResult12)
end

local function hasLayeredAccessoryUpdates(AppliedDescription: Humanoid, Humanoid: Humanoid): boolean
	local Accessories = AppliedDescription:GetAccessories(false)
	local Accessories1 = Humanoid:GetAccessories(false)
	
	if #Accessories1 == 0 then
		return false
	end
	if #Accessories ~= #Accessories1 then
		return true
	end
	local t = {}
	
	for _, accessory in Accessories do
		t[accessory.AssetId] = true
	end
	for _, value in Accessories1 do
		if not t[value.AssetId] then
			return true
		end
	end
	return false
end

local Callback = if FFlagAXMakeupEquipping then function(p1, p2): boolean
	-- upvalues: GetMakeupDescriptionsFromHumanoidDescriptionFunction (copy)
	local MakeupDescriptionsFromHumanoidDescription = GetMakeupDescriptionsFromHumanoidDescriptionFunction(p1)
	local MakeupDescriptionsFromHumanoidDescription1 = GetMakeupDescriptionsFromHumanoidDescriptionFunction(p2)
	
	if #MakeupDescriptionsFromHumanoidDescription1 == 0 then
		return false
	end
	if #MakeupDescriptionsFromHumanoidDescription ~= #MakeupDescriptionsFromHumanoidDescription1 then
		return true
	end
	local t = {}
	
	for _, value in MakeupDescriptionsFromHumanoidDescription do
		t[value.AssetId] = true
	end
	for _, value1 in MakeupDescriptionsFromHumanoidDescription1 do
		if not t[value1.AssetId] then
			return true
		end
	end
	return false
end else nil

local function _(Object): boolean
	return Object:FindFirstChildWhichIsA("WrapLayer", true) ~= nil
end

function CharacterModelPoolModule:_doUpdateR6(QueuedHumanoidDescription)
	-- upvalues: FixVRAvatarPlacement (copy), IsSpatialFunction (copy), _CFrame (ref), PromiseModule (copy)
	if not FixVRAvatarPlacement or not IsSpatialFunction() then
		return PromiseModule.new(function(Callback: (any, any) -> (), _)
			-- upvalues: self (copy), QueuedHumanoidDescription (copy), _CFrame (upval)
			if self.mockApplyDescription then
				self.mockApplyDescription(self.r6, QueuedHumanoidDescription)
			elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
				self.r6.Humanoid:ApplyDescriptionAsync(QueuedHumanoidDescription)
			else
				self.r6.Humanoid:ApplyDescription(QueuedHumanoidDescription)
			end
			if self.r6IsOffscreen then
				self.r6.HumanoidRootPart.CFrame = _CFrame
				self.r6IsOffscreen = false
			end
			Callback(self:getCurrentCharacter(), self:_stillWaitingOnLCUpdates())
		end)
	end
	if self.r6IsOffscreen then
		self.r6.HumanoidRootPart.CFrame = _CFrame
		self.r6IsOffscreen = false
	end
	return PromiseModule.new(function(Callback: (any, any) -> (), _)
		-- upvalues: self (copy), QueuedHumanoidDescription (copy)
		if self.mockApplyDescription then
			self.mockApplyDescription(self.r6, QueuedHumanoidDescription)
		elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
			self.r6.Humanoid:ApplyDescriptionAsync(QueuedHumanoidDescription)
		else
			self.r6.Humanoid:ApplyDescription(QueuedHumanoidDescription)
		end
		Callback(self:getCurrentCharacter(), self:_stillWaitingOnLCUpdates())
	end)
end

function CharacterModelPoolModule._doSimpleUpdateR15(p3, Humanoid)
	-- upvalues: PromiseModule (copy), ReportAvatarStatModule (copy)
	return PromiseModule.new(function(Callback: (any, any) -> (), _)
		-- upvalues: p3 (copy), Humanoid (copy), ReportAvatarStatModule (upval)
		local CurrentTime = tick()
		
		if p3.mockApplyDescription then
			p3.mockApplyDescription(p3.r15current, Humanoid)
		elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
			p3.r15current.Humanoid:ApplyDescriptionAsync(Humanoid)
		else
			p3.r15current.Humanoid:ApplyDescription(Humanoid)
		end
		ReportAvatarStatModule(p3.analytics, "AXCharacterStandardUpdateTimer", (tick() - CurrentTime) * 1000)
		Callback(p3.r15current, p3:_stillWaitingOnLCUpdates())
	end)
end

function CharacterModelPoolModule:_updateOffscreenR15(Humanoid)
	-- upvalues: StartedApplyingLayeredClothingModule (copy), PromiseModule (copy), _CFrame1 (ref)
	self.store:dispatch(StartedApplyingLayeredClothingModule())
	
	return PromiseModule.new(function(Callback: (any) -> (), _)
		-- upvalues: self (copy), _CFrame1 (upval), Humanoid (copy)
		self.r15offScreen.HumanoidRootPart.CFrame = _CFrame1
		self.r15offScreen.Parent = workspace
		
		if self.mockApplyDescription then
			self.mockApplyDescription(self.r15offScreen, Humanoid)
		elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
			self.r15offScreen.Humanoid:ApplyDescriptionAsync(Humanoid)
		else
			self.r15offScreen.Humanoid:ApplyDescription(Humanoid)
		end
		Callback(self.r15offScreen)
	end)
end

local function waitForClusterCompositionFinished(Result)
	-- upvalues: PromiseModule (copy), AXClusterCompositionTimeoutMs (copy)
	return if Result:FindFirstChildWhichIsA("WrapLayer", true) ~= nil then PromiseModule.race({
		PromiseModule.fromEvent(Result.Humanoid.ClusterCompositionFinished),
		PromiseModule.delay(AXClusterCompositionTimeoutMs * 0.001)
	}):andThen(function(): boolean
		return true
	end) else PromiseModule.resolve(false)
end

function CharacterModelPoolModule:_stillWaitingOnLCUpdates(): boolean
	-- upvalues: ConstantsModule (copy), hasLayeredAccessoryUpdates (copy)
	return self.avatarType ~= ConstantsModule.AvatarType.R6 and (if self.avatarType == ConstantsModule.AvatarType.R15 and self.queuedHumanoidDescription and hasLayeredAccessoryUpdates(self.r15current.Humanoid.HumanoidDescription, self.queuedHumanoidDescription) then true else false)
end

function CharacterModelPoolModule:_completeUpdate(CurrentTime, p3)
	-- upvalues: _CFrame1 (ref), ReplicatedStorage (copy), FinishedApplyingLayeredClothingModule (copy), ReportAvatarStatModule (copy)
	self.r15offScreen.HumanoidRootPart.CFrame = self.r15current.HumanoidRootPart.CFrame
	self.characterMover:cancelCurrentTween()
	self.r15current.HumanoidRootPart.CFrame = _CFrame1
	self.r15current.Parent = ReplicatedStorage
	local R15offScreen = self.r15offScreen
	self.r15offScreen = self.r15current
	self.r15current = R15offScreen
	self.store:dispatch(FinishedApplyingLayeredClothingModule())
	local ScaledCurrentTime = (tick() - CurrentTime) * 1000
	
	if p3 then
		ReportAvatarStatModule(self.analytics, "AXCharacterLayeredUpdateTimer", ScaledCurrentTime)
	else
		ReportAvatarStatModule(self.analytics, "AXCharacterStandardUpdateTimer", ScaledCurrentTime)
	end
	return self.r15current, self:_stillWaitingOnLCUpdates()
end

function CharacterModelPoolModule:_doUpdateR15(Humanoid: Humanoid)
	-- upvalues: FFlagAXMakeupEquipping (copy), hasLayeredAccessoryUpdates (copy), Callback (ref), waitForClusterCompositionFinished (copy)
	local AppliedDescription = self.r15current.Humanoid:GetAppliedDescription()
	
	if FFlagAXMakeupEquipping then
		if not hasLayeredAccessoryUpdates(AppliedDescription, Humanoid) and not Callback(AppliedDescription, Humanoid) then
			return self:_doSimpleUpdateR15(Humanoid)
		end
	elseif not hasLayeredAccessoryUpdates(AppliedDescription, Humanoid) then
		return self:_doSimpleUpdateR15(Humanoid)
	end
	local CurrentTime = tick()
	self.inProgressPromise = self:_updateOffscreenR15(Humanoid):andThen(waitForClusterCompositionFinished):andThen(function(Result)
		-- upvalues: self (copy), CurrentTime (copy)
		return self:_completeUpdate(CurrentTime, Result)
	end)
	
	return self.inProgressPromise
end

function CharacterModelPoolModule:maybeUpdateCharacter(Humanoid: Humanoid)
	-- upvalues: ConstantsModule (copy), PromiseModule (copy)
	if self.avatarType == ConstantsModule.AvatarType.R6 then
		self.r6Promise = self:_doUpdateR6(Humanoid)
		
		return self.r6Promise
	end
	if not self.inProgressPromise or self.inProgressPromise:getStatus() ~= PromiseModule.Status.Started then
		return self:_doUpdateR15(Humanoid)
	end
	if self.waitingPromise then
		self.waitingPromise:cancel()
	end
	self.queuedHumanoidDescription = Humanoid
	self.waitingPromise = self.inProgressPromise:andThen(function()
		-- upvalues: self (copy), Humanoid (copy)
		self.inProgressPromise = self.waitingPromise
		self.waitingPromise = nil
		self.queuedHumanoidDescription = nil
		
		return self:_doUpdateR15(Humanoid)
	end)
	
	return self.waitingPromise
end

function CharacterModelPoolModule:switchAvatarType(AvatarType)
	-- upvalues: ConstantsModule (copy), ReplicatedStorage (copy)
	if AvatarType == self.avatarType then
		return self:getCurrentCharacter()
	end
	self:_cancelPromises()
	self.avatarType = AvatarType
	local R6 = nil
	local R15current = nil
	
	if AvatarType == ConstantsModule.AvatarType.R6 then
		R6 = self.r6
		R15current = self.r15current
	else
		R6 = self.r15current
		R15current = self.r6
	end
	R15current.Parent = ReplicatedStorage
	R15current.Humanoid:UnequipTools()
	self:syncRotation(R15current, R6)
	
	return R6
end

function CharacterModelPoolModule:start()
	-- upvalues: IsVRAppBuildFunction (copy), _CFrame (ref)
	if IsVRAppBuildFunction() then
		self.r15current.HumanoidRootPart.CFrame = _CFrame
	end
end

local _ = function(p3)
	if p3 then
		p3:cancel()
	end
end

function CharacterModelPoolModule:_cancelPromises()
	local InProgressPromise = self.inProgressPromise
	
	if InProgressPromise then
		InProgressPromise:cancel()
	end
	local WaitingPromise = self.waitingPromise
	
	if WaitingPromise then
		WaitingPromise:cancel()
	end
	local R6Promise = self.r6Promise
	
	if R6Promise then
		R6Promise:cancel()
	end
	self.inProgressPromise = nil
	self.waitingPromise = nil
	self.r6Promise = nil
end

function CharacterModelPoolModule:stop()
	-- upvalues: FFlagAXRefetchAvatarOnTimeout (copy), FinishedApplyingLayeredClothingModule (copy), ReplicatedStorage (copy)
	if FFlagAXRefetchAvatarOnTimeout then
		self.store:dispatch(FinishedApplyingLayeredClothingModule())
	end
	self.r6.Parent = ReplicatedStorage
	self.r15current.Parent = ReplicatedStorage
	self.r15offScreen.Parent = ReplicatedStorage
	self:_cancelPromises()
end

function CharacterModelPoolModule:onDestroy()
	-- upvalues: FFlagAXRefetchAvatarOnTimeout (copy), FinishedApplyingLayeredClothingModule (copy)
	if FFlagAXRefetchAvatarOnTimeout then
		self.store:dispatch(FinishedApplyingLayeredClothingModule())
	end
	self:_cancelPromises()
	self.r6:Destroy()
	self.r15current:Destroy()
	self.r15offScreen:Destroy()
end

return CharacterModelPoolModule
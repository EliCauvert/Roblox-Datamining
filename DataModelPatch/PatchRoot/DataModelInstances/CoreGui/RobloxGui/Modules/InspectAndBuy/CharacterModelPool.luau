local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local PromiseModule = require(game:GetService("CorePackages").Packages.Promise)
local _CFrame = CFrame.new(vector.create(0, 150, 0))
local InspectAndBuyClusterCompositionTimeoutMs = game:DefineFastInt("InspectAndBuyClusterCompositionTimeoutMs", 3000)
local CharacterModelPoolModule = {}
CharacterModelPoolModule.__index = CharacterModelPoolModule

local function setupCharacterModels(X)
	-- upvalues: Players (copy), RobloxReplicatedStorage (copy)
	local HumanoidModelFromDescriptionAsync = nil
	local HumanoidModelFromDescriptionAsync1 = nil
	if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
		HumanoidModelFromDescriptionAsync = Players:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6)
		HumanoidModelFromDescriptionAsync1 = Players:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	else
		HumanoidModelFromDescriptionAsync = Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6)
		HumanoidModelFromDescriptionAsync1 = Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	end
	HumanoidModelFromDescriptionAsync.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	HumanoidModelFromDescriptionAsync1.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	HumanoidModelFromDescriptionAsync.HumanoidRootPart.Anchored = true
	HumanoidModelFromDescriptionAsync1.HumanoidRootPart.Anchored = true
	HumanoidModelFromDescriptionAsync.Parent = RobloxReplicatedStorage
	HumanoidModelFromDescriptionAsync1.Parent = RobloxReplicatedStorage
	HumanoidModelFromDescriptionAsync.HumanoidRootPart.CFrame = CFrame.new(X)
	HumanoidModelFromDescriptionAsync1:SetPrimaryPartCFrame(HumanoidModelFromDescriptionAsync.HumanoidRootPart.CFrame)
	
	return HumanoidModelFromDescriptionAsync, HumanoidModelFromDescriptionAsync1
end

function CharacterModelPoolModule.new(WorldModelRef, p1, AvatarType, MockApplyDescription)
	-- upvalues: CharacterModelPoolModule (copy), setupCharacterModels (copy), RobloxReplicatedStorage (copy)
	local t = {}
	setmetatable(t, CharacterModelPoolModule)
	t.mockApplyDescription = MockApplyDescription
	local SetupCharacterModelsResult2
	t.r6, SetupCharacterModelsResult2 = setupCharacterModels(p1)
	t.r15current = SetupCharacterModelsResult2
	t.r15offScreen = SetupCharacterModelsResult2:Clone()
	t.r15offScreen.Parent = RobloxReplicatedStorage
	t.avatarType = AvatarType
	t.worldModelRef = WorldModelRef
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
	return if p1.avatarType == Enum.HumanoidRigType.R15 then p1.r15current else p1.r6
end

function CharacterModelPoolModule:isR15(): boolean
	return self.avatarType == Enum.HumanoidRigType.R15
end

function CharacterModelPoolModule:syncRotation(Character, Character1)
	local _, _, _, ComponentsResult4, ComponentsResult5, ComponentsResult6, ComponentsResult7, ComponentsResult8, ComponentsResult9, ComponentsResult10, ComponentsResult11, ComponentsResult12 = Character.HumanoidRootPart.CFrame:components()
	local P = Character1.HumanoidRootPart.CFrame.p
	Character1.HumanoidRootPart.CFrame = CFrame.new(P.X, P.Y, P.Z, ComponentsResult4, ComponentsResult5, ComponentsResult6, ComponentsResult7, ComponentsResult8, ComponentsResult9, ComponentsResult10, ComponentsResult11, ComponentsResult12)
end

local function hasLayeredAccessoryUpdates(Humanoid: Humanoid, Humanoid1: Humanoid): boolean
	local Accessories = Humanoid:GetAccessories(false)
	local Accessories1 = Humanoid1:GetAccessories(false)
	
	if #Accessories1 == 0 then
		return false
	end
	if #Accessories ~= #Accessories1 then
		return true
	end
	local t = {}
	
	for _, accessory in ipairs(Accessories) do
		t[accessory.AssetId] = true
	end
	for _, value in ipairs(Accessories1) do
		if not t[value.AssetId] then
			return true
		end
	end
	return false
end

local function _(Object): boolean
	return Object:FindFirstChildWhichIsA("WrapLayer", true) ~= nil
end

function CharacterModelPoolModule._doUpdateR6(p1, HumanoidDescription)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback: (any) -> (), _)
		-- upvalues: p1 (copy), HumanoidDescription (copy)
		p1.r6.Parent = p1.worldModelRef:getValue()
		
		if p1.mockApplyDescription then
			p1.mockApplyDescription(p1.r6, HumanoidDescription)
		elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
			p1.r6.Humanoid:ApplyDescriptionAsync(HumanoidDescription)
		else
			p1.r6.Humanoid:ApplyDescription(HumanoidDescription)
		end
		Callback(p1:getCurrentCharacter())
	end)
end

function CharacterModelPoolModule._doSimpleUpdateR15(p1, Humanoid)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback: (any) -> (), _)
		-- upvalues: p1 (copy), Humanoid (copy)
		p1.r15current.Parent = p1.worldModelRef:getValue()
		
		if p1.mockApplyDescription then
			p1.mockApplyDescription(p1.r15current, Humanoid)
		elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
			p1.r15current.Humanoid:ApplyDescriptionAsync(Humanoid)
		else
			p1.r15current.Humanoid:ApplyDescription(Humanoid)
		end
		Callback(p1.r15current)
	end)
end

function CharacterModelPoolModule._updateOffscreenR15(p1, Humanoid)
	-- upvalues: PromiseModule (copy), _CFrame (copy)
	return PromiseModule.new(function(Callback: (any) -> (), _)
		-- upvalues: p1 (copy), _CFrame (upval), Humanoid (copy)
		p1.r15offScreen.HumanoidRootPart.CFrame = _CFrame
		p1.r15offScreen.Parent = p1.worldModelRef:getValue()
		
		if p1.mockApplyDescription then
			p1.mockApplyDescription(p1.r15offScreen, Humanoid)
		elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
			p1.r15offScreen.Humanoid:ApplyDescriptionAsync(Humanoid)
		else
			p1.r15offScreen.Humanoid:ApplyDescription(Humanoid)
		end
		Callback(p1.r15offScreen)
	end)
end

local function waitForClusterCompositionFinished(Result)
	-- upvalues: PromiseModule (copy), InspectAndBuyClusterCompositionTimeoutMs (copy)
	return if Result:FindFirstChildWhichIsA("WrapLayer", true) ~= nil then PromiseModule.race({
		PromiseModule.fromEvent(Result.Humanoid.ClusterCompositionFinished),
		PromiseModule.delay(InspectAndBuyClusterCompositionTimeoutMs * 0.001)
	}):andThen(function(): boolean
		return true
	end) else PromiseModule.resolve(false)
end

function CharacterModelPoolModule:_completeUpdate()
	-- upvalues: _CFrame (copy), RobloxReplicatedStorage (copy)
	self.r15offScreen.HumanoidRootPart.CFrame = self.r15current.HumanoidRootPart.CFrame
	self.r15current.HumanoidRootPart.CFrame = _CFrame
	self.r15current.Parent = RobloxReplicatedStorage
	local R15offScreen = self.r15offScreen
	self.r15offScreen = self.r15current
	self.r15current = R15offScreen
	
	return self.r15current
end

function CharacterModelPoolModule:_doUpdateR15(Humanoid)
	-- upvalues: hasLayeredAccessoryUpdates (copy), waitForClusterCompositionFinished (copy)
	if hasLayeredAccessoryUpdates(self.r15current.Humanoid:GetAppliedDescription(), Humanoid) then
		self.inProgressPromise = self:_updateOffscreenR15(Humanoid):andThen(waitForClusterCompositionFinished):andThen(function()
			-- upvalues: self (copy)
			return self:_completeUpdate()
		end)
		
		return self.inProgressPromise
	else
		return self:_doSimpleUpdateR15(Humanoid)
	end
end

function CharacterModelPoolModule:maybeUpdateCharacter(p1)
	-- upvalues: PromiseModule (copy)
	if self.avatarType == Enum.HumanoidRigType.R6 then
		self.r6Promise = self:_doUpdateR6(p1)
		
		return self.r6Promise
	end
	if not self.inProgressPromise or self.inProgressPromise:getStatus() ~= PromiseModule.Status.Started then
		return self:_doUpdateR15(p1)
	end
	local WaitingPromise = self.waitingPromise
	self.waitingPromise = self.inProgressPromise:andThen(function()
		-- upvalues: self (copy), p1 (copy)
		return self:_doUpdateR15(p1)
	end)
	
	if WaitingPromise then
		WaitingPromise:cancel()
	end
	return self.waitingPromise
end

function CharacterModelPoolModule:switchAvatarType(AvatarType)
	-- upvalues: RobloxReplicatedStorage (copy)
	if AvatarType == self.avatarType then
		return self:getCurrentCharacter()
	end
	self:_cancelPromises()
	self.avatarType = AvatarType
	local R6 = nil
	local R15current = nil
	
	if AvatarType == Enum.HumanoidRigType.R6 then
		R6 = self.r6
		R15current = self.r15current
	else
		R6 = self.r15current
		R15current = self.r6
	end
	R15current.Parent = RobloxReplicatedStorage
	R15current.Humanoid:UnequipTools()
	self:syncRotation(R15current, R6)
	
	return R6
end

function CharacterModelPoolModule:start() end

local _ = function(p1)
	if p1 then
		p1:cancel()
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
	-- upvalues: RobloxReplicatedStorage (copy)
	self.r6.Parent = RobloxReplicatedStorage
	self.r15current.Parent = RobloxReplicatedStorage
	self.r15offScreen.Parent = RobloxReplicatedStorage
	self:_cancelPromises()
end

function CharacterModelPoolModule:onDestroy()
	self:_cancelPromises()
	self.r6:Destroy()
	self.r15current:Destroy()
	self.r15offScreen:Destroy()
end

return CharacterModelPoolModule
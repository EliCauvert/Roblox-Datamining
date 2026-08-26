local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local promiseModule = require(game:GetService("CorePackages").Packages.Promise)
local cFrame = CFrame.new(Vector3.new(0, 150, 0))
local inspectAndBuyClusterCompositionTimeoutMs = game:DefineFastInt("InspectAndBuyClusterCompositionTimeoutMs", 3000)
local t = {}
t.__index = t

local function setupCharacterModels(value)
	-- upvalues: playersService (ref), robloxReplicatedStorageService (ref)
	local humanoidDescription = playersService:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6)
	local humanoidDescription_1 = playersService:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	humanoidDescription.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	humanoidDescription_1.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	humanoidDescription.HumanoidRootPart.Anchored = true
	humanoidDescription_1.HumanoidRootPart.Anchored = true
	humanoidDescription.Parent = robloxReplicatedStorageService
	humanoidDescription_1.Parent = robloxReplicatedStorageService
	humanoidDescription.HumanoidRootPart.CFrame = CFrame.new(value)
	humanoidDescription_1:SetPrimaryPartCFrame(humanoidDescription.HumanoidRootPart.CFrame)
	
	return humanoidDescription, humanoidDescription_1
end

function t.new(p1, p2, p3, p4)
	-- upvalues: t (ref), setupCharacterModels (ref), robloxReplicatedStorageService (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.mockApplyDescription = p4
	local var1, var2 = setupCharacterModels(p2)
	t_1.r6 = var1
	t_1.r15current = var2
	t_1.r15offScreen = var2:Clone()
	t_1.r15offScreen.Parent = robloxReplicatedStorageService
	t_1.avatarType = p3
	t_1.worldModelRef = p1
	t_1.inProgressPromise = nil
	t_1.waitingPromise = nil
	t_1.r6Promise = nil
	t_1.destroyed = false
	
	return t_1
end

function t:setupAnimations(p1, p2)
	p1.Parent = self.r6
	p2.Parent = self.r15current
	p2.Archivable = true
	local var1 = p2:Clone()
	var1.Parent = self.r15offScreen
	var1.Archivable = false
	p2.Archivable = false
end

function t:getCurrentCharacter()
	return if self.avatarType == Enum.HumanoidRigType.R15 then self.r15current else self.r6
end

function t:isR15()
	return self.avatarType == Enum.HumanoidRigType.R15
end

function t.syncRotation(_, p1, p2)
	local _, _, _, var1, var2, var3, var4, var5, var6, var7, var8, var9 = p1.HumanoidRootPart.CFrame:components()
	local p = p2.HumanoidRootPart.CFrame.p
	p2.HumanoidRootPart.CFrame = CFrame.new(p.X, p.Y, p.Z, var1, var2, var3, var4, var5, var6, var7, var8, var9)
end

local function hasLayeredAccessoryUpdates(p1, p2)
	local var1 = p1:GetAccessories(false)
	local var2 = p2:GetAccessories(false)
	
	if #var2 == 0 then
		return false
	elseif #var1 ~= #var2 then
		return true
	end
	local t = {}
	
	for i, v in ipairs(var1) do
		t[v.AssetId] = true
	end
	for i, v_1 in ipairs(var2) do
		if not t[v_1.AssetId] then
			return true
		end
	end
	return false
end

local function _(p3)
	return p3:FindFirstChildWhichIsA("WrapLayer", true) ~= nil
end

function t._doUpdateR6(p3, p4)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p5, _)
		-- upvalues: p3 (ref), p4 (ref)
		p3.r6.Parent = p3.worldModelRef:getValue()
		
		if p3.mockApplyDescription then
			p3.mockApplyDescription(p3.r6, p4)
		else
			p3.r6.Humanoid:ApplyDescriptionAsync(p4)
		end
		p5(p3:getCurrentCharacter())
	end)
end

function t._doSimpleUpdateR15(p3, p4)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p5, _)
		-- upvalues: p3 (ref), p4 (ref)
		p3.r15current.Parent = p3.worldModelRef:getValue()
		
		if p3.mockApplyDescription then
			p3.mockApplyDescription(p3.r15current, p4)
		else
			p3.r15current.Humanoid:ApplyDescriptionAsync(p4)
		end
		p5(p3.r15current)
	end)
end

function t._updateOffscreenR15(p3, p4)
	-- upvalues: promiseModule (ref), cFrame (ref)
	return promiseModule.new(function(p5, _)
		-- upvalues: p3 (ref), cFrame (copy), p4 (ref)
		p3.r15offScreen.HumanoidRootPart.CFrame = cFrame
		p3.r15offScreen.Parent = p3.worldModelRef:getValue()
		
		if p3.mockApplyDescription then
			p3.mockApplyDescription(p3.r15offScreen, p4)
		else
			p3.r15offScreen.Humanoid:ApplyDescriptionAsync(p4)
		end
		p5(p3.r15offScreen)
	end)
end

local function waitForClusterCompositionFinished(p3)
	-- upvalues: promiseModule (ref), inspectAndBuyClusterCompositionTimeoutMs (ref)
	return if p3:FindFirstChildWhichIsA("WrapLayer", true) ~= nil then promiseModule.race({
		promiseModule.fromEvent(p3.Humanoid.ClusterCompositionFinished),
		promiseModule.delay(inspectAndBuyClusterCompositionTimeoutMs * 0.001)
	}):andThen(function()
		return true
	end) else promiseModule.resolve(false)
end

function t:_completeUpdate()
	-- upvalues: cFrame (ref), robloxReplicatedStorageService (ref)
	self.r15offScreen.HumanoidRootPart.CFrame = self.r15current.HumanoidRootPart.CFrame
	self.r15current.HumanoidRootPart.CFrame = cFrame
	self.r15current.Parent = robloxReplicatedStorageService
	local r15offScreen = self.r15offScreen
	self.r15offScreen = self.r15current
	self.r15current = r15offScreen
	
	return self.r15current
end

function t:_doUpdateR15(p3)
	-- upvalues: hasLayeredAccessoryUpdates (ref), waitForClusterCompositionFinished (ref)
	if hasLayeredAccessoryUpdates(self.r15current.Humanoid:GetAppliedDescription(), p3) then
		self.inProgressPromise = self:_updateOffscreenR15(p3):andThen(waitForClusterCompositionFinished):andThen(function()
			-- upvalues: self (ref)
			return self:_completeUpdate()
		end)
		
		return self.inProgressPromise
	end
	return self:_doSimpleUpdateR15(p3)
end

function t:maybeUpdateCharacter(p3)
	-- upvalues: promiseModule (ref)
	if self.avatarType == Enum.HumanoidRigType.R6 then
		self.r6Promise = self:_doUpdateR6(p3)
		
		return self.r6Promise
	elseif not self.inProgressPromise or self.inProgressPromise:getStatus() ~= promiseModule.Status.Started then
		return self:_doUpdateR15(p3)
	end
	local waitingPromise = self.waitingPromise
	self.waitingPromise = self.inProgressPromise:andThen(function()
		-- upvalues: self (ref), p3 (ref)
		return self:_doUpdateR15(p3)
	end)
	
	if waitingPromise then
		waitingPromise:cancel()
	end
	return self.waitingPromise
end

function t:switchAvatarType(p3)
	-- upvalues: robloxReplicatedStorageService (ref)
	if p3 == self.avatarType then
		return self:getCurrentCharacter()
	end
	local r6, r15current
	self:_cancelPromises()
	self.avatarType = p3
	local _ = nil
	local _ = nil
	
	if p3 == Enum.HumanoidRigType.R6 then
		r6 = self.r6
		r15current = self.r15current
	else
		r6 = self.r15current
		r15current = self.r6
	end
	r15current.Parent = robloxReplicatedStorageService
	r15current.Humanoid:UnequipTools()
	self:syncRotation(r15current, r6)
	
	return r6
end

function t.start(_) end

local _ = function(p3)
	if p3 then
		p3:cancel()
	end
end

function t:_cancelPromises()
	local inProgressPromise = self.inProgressPromise
	
	if inProgressPromise then
		inProgressPromise:cancel()
	end
	local waitingPromise = self.waitingPromise
	
	if waitingPromise then
		waitingPromise:cancel()
	end
	local r6Promise = self.r6Promise
	
	if r6Promise then
		r6Promise:cancel()
	end
	self.inProgressPromise = nil
	self.waitingPromise = nil
	self.r6Promise = nil
end

function t:stop()
	-- upvalues: robloxReplicatedStorageService (ref)
	self.r6.Parent = robloxReplicatedStorageService
	self.r15current.Parent = robloxReplicatedStorageService
	self.r15offScreen.Parent = robloxReplicatedStorageService
	self:_cancelPromises()
end

function t:onDestroy()
	self:_cancelPromises()
	self.r6:Destroy()
	self.r15current:Destroy()
	self.r15offScreen:Destroy()
end

return t
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local promiseModule = require(game:GetService("CorePackages").Packages.Promise)
local cFrame = CFrame.new(Vector3.new(0, 150, 0))
local inspectAndBuyClusterCompositionTimeoutMs = game:DefineFastInt("InspectAndBuyClusterCompositionTimeoutMs", 3000)
local t = {}
t.__index = t

local function setupCharacterModels(value) --[[ line: 25 ]]
	-- upvalues: playersService (ref), robloxReplicatedStorageService (ref)
	local humanoidDescription, humanoidDescription_1
	local _ = nil
	local _ = nil
	
	if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
		humanoidDescription = playersService:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6)
		humanoidDescription_1 = playersService:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	else
		humanoidDescription = playersService:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6)
		humanoidDescription_1 = playersService:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	end
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

function t.new(p0, p1, p2, p3) --[[ line: 60 ]]
	-- upvalues: t (ref), setupCharacterModels (ref), robloxReplicatedStorageService (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.mockApplyDescription = p3
	local var12, var13 = setupCharacterModels(p1)
	t_1.r6 = var12
	t_1.r15current = var13
	t_1.r15offScreen = var13:Clone()
	t_1.r15offScreen.Parent = robloxReplicatedStorageService
	t_1.avatarType = p2
	t_1.worldModelRef = p0
	t_1.inProgressPromise = nil
	t_1.waitingPromise = nil
	t_1.r6Promise = nil
	t_1.destroyed = false
	
	return t_1
end

function t:setupAnimations(p4, p5) --[[ line: 92 ]]
	p4.Parent = self.r6
	p5.Parent = self.r15current
	p5.Archivable = true
	local var14 = p5:Clone()
	var14.Parent = self.r15offScreen
	var14.Archivable = false
	p5.Archivable = false
end

function t:getCurrentCharacter() --[[ line: 102 ]]
	return if self.avatarType == Enum.HumanoidRigType.R15 then self.r15current else self.r6
end

function t:isR15() --[[ line: 110 ]]
	return self.avatarType == Enum.HumanoidRigType.R15
end

function t.syncRotation(_, p6, p7) --[[ line: 114 ]]
	local _, _, _, var15, var16, var17, var18, var19, var20, var21, var22, var23 = p6.HumanoidRootPart.CFrame:components()
	local p = p7.HumanoidRootPart.CFrame.p
	p7.HumanoidRootPart.CFrame = CFrame.new(p.X, p.Y, p.Z, var15, var16, var17, var18, var19, var20, var21, var22, var23)
end

local function hasLayeredAccessoryUpdates(p8, p9) --[[ line: 122 ]]
	local var24 = p8:GetAccessories(false)
	local var25 = p9:GetAccessories(false)
	
	if #var25 == 0 then
		return false
	elseif #var24 ~= #var25 then
		return true
	end
	local t = {}
	
	for i, v in ipairs(var24) do
		t[v.AssetId] = true
	end
	for i, v_1 in ipairs(var25) do
		if not t[v_1.AssetId] then
			return true
		end
	end
	return false
end

local function _(p10) --[[ line: 148 | named "hasWrapLayer" ]]
	return p10:FindFirstChildWhichIsA("WrapLayer", true) ~= nil
end

function t._doUpdateR6(p11, p12) --[[ line: 152 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p13, _) --[[ line: 153 ]]
		-- upvalues: p11 (ref), p12 (ref)
		p11.r6.Parent = p11.worldModelRef:getValue()
		
		if p11.mockApplyDescription then
			p11.mockApplyDescription(p11.r6, p12)
		elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
			p11.r6.Humanoid:ApplyDescriptionAsync(p12)
		else
			p11.r6.Humanoid:ApplyDescription(p12)
		end
		p13(p11:getCurrentCharacter())
	end)
end

function t._doSimpleUpdateR15(p14, p15) --[[ line: 169 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p16, _) --[[ line: 170 ]]
		-- upvalues: p14 (ref), p15 (ref)
		p14.r15current.Parent = p14.worldModelRef:getValue()
		
		if p14.mockApplyDescription then
			p14.mockApplyDescription(p14.r15current, p15)
		elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
			p14.r15current.Humanoid:ApplyDescriptionAsync(p15)
		else
			p14.r15current.Humanoid:ApplyDescription(p15)
		end
		p16(p14.r15current)
	end)
end

function t._updateOffscreenR15(p17, p18) --[[ line: 186 ]]
	-- upvalues: promiseModule (ref), cFrame (ref)
	return promiseModule.new(function(p19, _) --[[ line: 187 ]]
		-- upvalues: p17 (ref), cFrame (copy), p18 (ref)
		p17.r15offScreen.HumanoidRootPart.CFrame = cFrame
		p17.r15offScreen.Parent = p17.worldModelRef:getValue()
		
		if p17.mockApplyDescription then
			p17.mockApplyDescription(p17.r15offScreen, p18)
		elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
			p17.r15offScreen.Humanoid:ApplyDescriptionAsync(p18)
		else
			p17.r15offScreen.Humanoid:ApplyDescription(p18)
		end
		p19(p17.r15offScreen)
	end)
end

local function waitForClusterCompositionFinished(p20) --[[ line: 207 ]]
	-- upvalues: promiseModule (ref), inspectAndBuyClusterCompositionTimeoutMs (ref)
	return if p20:FindFirstChildWhichIsA("WrapLayer", true) ~= nil then promiseModule.race({
		promiseModule.fromEvent(p20.Humanoid.ClusterCompositionFinished),
		promiseModule.delay(inspectAndBuyClusterCompositionTimeoutMs * 0.001)
	}):andThen(function() --[[ line: 214 ]]
		return true
	end) else promiseModule.resolve(false)
end

function t:_completeUpdate() --[[ line: 222 ]]
	-- upvalues: cFrame (ref), robloxReplicatedStorageService (ref)
	self.r15offScreen.HumanoidRootPart.CFrame = self.r15current.HumanoidRootPart.CFrame
	self.r15current.HumanoidRootPart.CFrame = cFrame
	self.r15current.Parent = robloxReplicatedStorageService
	local r15offScreen = self.r15offScreen
	self.r15offScreen = self.r15current
	self.r15current = r15offScreen
	
	return self.r15current
end

function t:_doUpdateR15(p21) --[[ line: 234 ]]
	-- upvalues: hasLayeredAccessoryUpdates (ref), waitForClusterCompositionFinished (ref)
	if hasLayeredAccessoryUpdates(self.r15current.Humanoid:GetAppliedDescription(), p21) then
		self.inProgressPromise = self:_updateOffscreenR15(p21):andThen(waitForClusterCompositionFinished):andThen(function() --[[ line: 242 ]]
			-- upvalues: self (ref)
			return self:_completeUpdate()
		end)
		
		return self.inProgressPromise
	end
	return self:_doSimpleUpdateR15(p21)
end

function t:maybeUpdateCharacter(p22) --[[ line: 255 ]]
	-- upvalues: promiseModule (ref)
	if self.avatarType == Enum.HumanoidRigType.R6 then
		self.r6Promise = self:_doUpdateR6(p22)
		
		return self.r6Promise
	elseif not self.inProgressPromise or self.inProgressPromise:getStatus() ~= promiseModule.Status.Started then
		return self:_doUpdateR15(p22)
	end
	local waitingPromise = self.waitingPromise
	self.waitingPromise = self.inProgressPromise:andThen(function() --[[ line: 266 ]]
		-- upvalues: self (ref), p22 (ref)
		return self:_doUpdateR15(p22)
	end)
	
	if waitingPromise then
		waitingPromise:cancel()
	end
	return self.waitingPromise
end

function t:switchAvatarType(p23) --[[ line: 281 ]]
	-- upvalues: robloxReplicatedStorageService (ref)
	if p23 == self.avatarType then
		return self:getCurrentCharacter()
	end
	local r6, r15current
	self:_cancelPromises()
	self.avatarType = p23
	local _ = nil
	local _ = nil
	
	if p23 == Enum.HumanoidRigType.R6 then
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

function t.start(_) --[[ line: 307 ]] end

local _ = function(p24) --[[ line: 309 | named "cancelPromise" ]]
	if p24 then
		p24:cancel()
	end
end

function t:_cancelPromises() --[[ line: 315 ]]
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

function t:stop() --[[ line: 324 ]]
	-- upvalues: robloxReplicatedStorageService (ref)
	self.r6.Parent = robloxReplicatedStorageService
	self.r15current.Parent = robloxReplicatedStorageService
	self.r15offScreen.Parent = robloxReplicatedStorageService
	self:_cancelPromises()
end

function t:onDestroy() --[[ line: 332 ]]
	self:_cancelPromises()
	self.r6:Destroy()
	self.r15current:Destroy()
	self.r15offScreen:Destroy()
end

return t
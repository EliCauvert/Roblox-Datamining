local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local UtilsModule1 = require(Modules.AvatarExperience.AvatarEditor.Utils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ParticleEffectManager = {}
ParticleEffectManager.__index = ParticleEffectManager

function ParticleEffectManager.new(Store, AvatarRoute)
	-- upvalues: ParticleEffectManager (copy), ReplicatedStorage (copy)
	local t = {}
	setmetatable(t, ParticleEffectManager)
	t.connections = {}
	t.store = Store
	t.avatarRoute = AvatarRoute
	t.avatarSwapPFX = {}
	
	for _ = 1, 4 do
		table.insert(t.avatarSwapPFX, ReplicatedStorage:WaitForChild("AvatarSwap-PFX"):Clone())
	end
	t.emissionId = 0
	t.destroyed = false
	
	return t
end

function ParticleEffectManager:setAvatarRoute(AvatarRoute)
	self.avatarRoute = AvatarRoute
end

function ParticleEffectManager:start()
	-- upvalues: Workspace (copy)
	for _, value in self.avatarSwapPFX do
		value.Parent = Workspace
		value.MainEmitter.Rate = 10
		value.MediumEmitter.MediumEmissions.Rate = 20
		value.SmallerEmitter.SmallerEmissions.Rate = 20
	end
	table.insert(self.connections, (self.store.changed:connect(function(Value, p1)
		-- upvalues: self (copy)
		self:update(Value, p1)
	end)))
	self.oldAccessories = {}
	self.changedAccessories = {}
	self.curCharacter = nil
	self.accessoryPositions = {}
end

function ParticleEffectManager:stop()
	-- upvalues: ReplicatedStorage (copy)
	for _, value in self.avatarSwapPFX do
		value.Parent = ReplicatedStorage
	end
	for _, connection in self.connections do
		connection:disconnect()
	end
	self.connections = {}
end

local Iterator = next

function ParticleEffectManager:getAttachmentOrPartPosition(ItemSubType)
	-- upvalues: ConstantsModule (copy), UtilsModule (copy)
	local AssetTypeIdToPartsAndAttachmentEntry = ConstantsModule.AssetTypeIdToPartsAndAttachments[self.store:getState().AvatarExperience.AvatarEditor.Character.AvatarType][ItemSubType]
	
	if AssetTypeIdToPartsAndAttachmentEntry == nil then
		return nil
	end
	local List = {}
	
	for _, value in AssetTypeIdToPartsAndAttachmentEntry do
		local AttachmentCFrame = value and (value.Attachment and UtilsModule.getAttachmentCFrame(self.curCharacter, value.Part, value.Attachment) or UtilsModule.getPartCFrame(self.curCharacter, value.Part)) or nil
		
		if AttachmentCFrame ~= nil and AttachmentCFrame.Position ~= nil then
			table.insert(List, AttachmentCFrame.Position)
		end
	end
	return List
end

function ParticleEffectManager:getChangedTryOnPart(p1, p2)
	local LastToggledItem = p2.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {}
	local LastToggledItem1 = p1.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {}
	
	if LastToggledItem1 == LastToggledItem then
		return nil, nil
	else
		return LastToggledItem1.itemId or LastToggledItem.itemId, self:getAttachmentOrPartPosition(LastToggledItem1.itemSubType or LastToggledItem.itemSubType)
	end
end

function ParticleEffectManager:getChangedEquippedPart(p1, p2)
	-- upvalues: UtilsModule1 (copy), Iterator (copy)
	local IteratorResult, IteratorResult2 = Iterator((UtilsModule1.getEquippedDiffs(p1.AvatarExperience.AvatarEditor.Character.EquippedAssets or {}, p2.AvatarExperience.AvatarEditor.Character.EquippedAssets or {})))
	
	if IteratorResult then
		return IteratorResult2[1], self:getAttachmentOrPartPosition(IteratorResult)
	else
		return nil, nil
	end
end

function ParticleEffectManager:setPositions(ChangedAttachmentPosition)
	for i, Position in ChangedAttachmentPosition do
		if i > 4 then break end
		self.avatarSwapPFX[i].Position = Position
		self.avatarSwapPFX[i].MediumEmitter.Position = Position
		self.avatarSwapPFX[i].SmallerEmitter.Position = Position
	end
end

function ParticleEffectManager:getChangedAttachmentPosition(p1, p2)
	-- upvalues: Iterator (copy)
	if Iterator(self.changedAccessories) then
		local AccessoryPositions = {}
		local ChangedAccessories = {}
		
		for _, changedAccessory in self.changedAccessories do
			local AccessoryPosition = self.accessoryPositions[changedAccessory.accessory.Name]
			
			if AccessoryPosition then
				table.insert(AccessoryPositions, AccessoryPosition)
				
				if changedAccessory.removed then
					self.accessoryPositions[changedAccessory.accessory.Name] = nil
				end
			elseif not changedAccessory.removed then
				table.insert(ChangedAccessories, changedAccessory)
			end
		end
		self.changedAccessories = ChangedAccessories
		
		return AccessoryPositions
	else
		local _, ChangedEquippedPart2 = self:getChangedEquippedPart(p1, p2)
		
		if not ChangedEquippedPart2 then
			local _
			_, ChangedEquippedPart2 = self:getChangedTryOnPart(p1, p2)
		end
		return ChangedEquippedPart2
	end
end

function ParticleEffectManager:getAccessories(_)
	return (self.curCharacter:FindFirstChildOfClass("Humanoid"):GetAccessories())
end

function ParticleEffectManager:cachePosition(Accessory)
	local BasePart = Accessory:FindFirstChildWhichIsA("BasePart")
	
	if BasePart then
		self.accessoryPositions[Accessory.Name] = BasePart.Position
	end
	return BasePart
end

function ParticleEffectManager:updateChangedAccessory(p3)
	-- upvalues: UtilsModule1 (copy), CryoModule (copy)
	local Accessories = self:getAccessories(p3)
	local OldAccessories = self.oldAccessories
	self.changedAccessories = CryoModule.List.join(self.changedAccessories, (CryoModule.List.map(UtilsModule1.diffList(Accessories, self.oldAccessories), function(Accessory: Accessory)
		-- upvalues: CryoModule (upval), OldAccessories (copy)
		return if CryoModule.List.find(OldAccessories, Accessory) then { removed = true, accessory = Accessory } else { removed = false, accessory = Accessory }
	end)))
	
	for _, changedAccessory in self.changedAccessories do
		if not self.accessoryPositions[changedAccessory.accessory.Name] then
			self:cachePosition(changedAccessory.accessory)
		end
	end
	self.oldAccessories = Accessories
end

function ParticleEffectManager:update(p4, p5)
	-- upvalues: Iterator (copy)
	if not p4.AvatarExperience.AvatarScene.Character.CurrentCharacter then return end
	self.curCharacter = p4.AvatarExperience.AvatarScene.Character.CurrentCharacter
	self:updateChangedAccessory(p4)
	local IsNotEquippedAssetsMatch = p4.AvatarExperience.AvatarEditor.Character.EquippedAssets ~= p5.AvatarExperience.AvatarEditor.Character.EquippedAssets
	local IsNotAvatarTypeMatch = p4.AvatarExperience.AvatarEditor.Character.AvatarType ~= p5.AvatarExperience.AvatarEditor.Character.AvatarType
	local IsNotBodyColorsMatch = p4.AvatarExperience.AvatarEditor.Character.BodyColors ~= p5.AvatarExperience.AvatarEditor.Character.BodyColors
	local IsNotTryOnItemsMatch = p4.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems ~= p5.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	local Name = self.avatarRoute.opaque.name
	
	if Name == "ProfilePictureEditorEmotes" or Name == "ProfilePictureEditorCamera" or Name == "ProfilePictureEditorFinal" then
		for i = 1, #self.avatarSwapPFX do
			self.avatarSwapPFX[i].MainEmitter.Enabled = false
			self.avatarSwapPFX[i].MediumEmitter.MediumEmissions.Enabled = false
			self.avatarSwapPFX[i].SmallerEmitter.SmallerEmissions.Enabled = false
		end
		return
	elseif IsNotEquippedAssetsMatch or IsNotAvatarTypeMatch or IsNotBodyColorsMatch or IsNotTryOnItemsMatch or Iterator(self.changedAccessories) then
		local ChangedAttachmentPosition = self:getChangedAttachmentPosition(p4, p5)
		
		if ChangedAttachmentPosition and Iterator(ChangedAttachmentPosition) then
			self:setPositions(ChangedAttachmentPosition)
			self:runParticleEmitter(#ChangedAttachmentPosition)
		end
	end
end

function ParticleEffectManager.runParticleEmitter(p6, Count)
	task.spawn(function()
		-- upvalues: Count (copy), p6 (copy)
		local Smallest = math.min(Count, 4)
		
		for i, value in p6.avatarSwapPFX do
			if Smallest < i then
				value.MainEmitter.Enabled = false
				value.MediumEmitter.MediumEmissions.Enabled = false
				value.SmallerEmitter.SmallerEmissions.Enabled = false
			else
				value.MainEmitter.Enabled = true
				value.MediumEmitter.MediumEmissions.Enabled = true
				value.SmallerEmitter.SmallerEmissions.Enabled = true
			end
		end
		p6.emissionId += 1
		local EmissionId = p6.emissionId
		task.wait(0.3)
		
		if p6.destroyed then return end
		if p6.emissionId == EmissionId then
			for i1 = 1, Smallest do
				p6.avatarSwapPFX[i1].MainEmitter.Enabled = false
				p6.avatarSwapPFX[i1].MediumEmitter.MediumEmissions.Enabled = false
				p6.avatarSwapPFX[i1].SmallerEmitter.SmallerEmissions.Enabled = false
			end
		end
	end)
end

function ParticleEffectManager:onDestroy()
	self.avatarSwapPFX[1]:Destroy()
	self.avatarSwapPFX[2]:Destroy()
	self.avatarSwapPFX[3]:Destroy()
	self.avatarSwapPFX[4]:Destroy()
	self.destroyed = true
end

return ParticleEffectManager
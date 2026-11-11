local InsertService = game:GetService("InsertService")
local AvatarScreen = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local IncrementCharacterModelVersionModule = require(Modules.AvatarExperience.AvatarEditor.Actions.IncrementCharacterModelVersion)
local IncrementTryOnCharacterModelVersionModule = require(Modules.AvatarExperience.Catalog.Actions.IncrementTryOnCharacterModelVersion)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local PPEThumbnailTypeModule = require(Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType)
local UtilsModule1 = require(Modules.AvatarExperience.Common.Utils)
local _ = require(Modules.AvatarExperience.Common.Types)
local ToolManager = {}
ToolManager.__index = ToolManager

local function _(Tool: Tool)
	return Tool:IsA("Tool")
end

local _ = function(ScriptObject)
	return ScriptObject:IsA("Script")
end

local function disableScripts(ScriptObject)
	-- upvalues: disableScripts (copy)
	for _, ScriptObject1 in ScriptObject:GetChildren() do
		if ScriptObject1:IsA("Script") then
			ScriptObject1.Disabled = true
		end
		disableScripts(ScriptObject1)
	end
end

local _ = function(p1)
	-- upvalues: ConstantsModule (copy)
	local Assets = p1.assets
	
	if not Assets then return end
	local Asset = Assets[ConstantsModule.AssetTypeIdStrings.Gear]
	
	if not Asset then return end
	return Asset[1]
end

function ToolManager.new(Store, AnimationManager, CharacterManager)
	-- upvalues: ToolManager (copy)
	local t = {}
	setmetatable(t, ToolManager)
	t.store = Store
	t.characterManager = CharacterManager
	t.animationManager = AnimationManager
	t.animationManager:setToolManager(t)
	t.equippedToolModel = nil
	t.isCurToolTryOn = false
	t.destroyed = false
	t.curToolId = nil
	
	return t
end

function ToolManager:getEquippedToolModel()
	return self.equippedToolModel
end

function ToolManager:checkAndEquipTool()
	-- upvalues: ConstantsModule (copy)
	local EquippedAssets = self.store:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets
	local EquippedAsset = EquippedAssets and EquippedAssets[ConstantsModule.AssetTypeIdStrings.Gear]
	
	if EquippedAsset and next(EquippedAsset) then
		self:loadAndEquipTool(next(EquippedAsset), false)
	end
end

function ToolManager:checkOutfitAndEquipTool(p1)
	-- upvalues: ConstantsModule (copy)
	if self.equippedToolModel then
		self:unequipTool()
	end
	local Assets = p1.assets
	local CurToolId = nil
	
	if Assets then
		local Asset = Assets[ConstantsModule.AssetTypeIdStrings.Gear]
		CurToolId = if Asset then Asset[1] else nil
	else
		CurToolId = nil
	end
	if CurToolId then
		self:loadAndEquipTool(CurToolId, true)
	end
end

local _ = function(p1, p2): boolean
	-- upvalues: UtilsModule (copy), AvatarScreen (copy), PPEThumbnailTypeModule (copy)
	return if p1 and p2 and UtilsModule.routeIsProfilePictureEditor(p1) then p1.opaque.name ~= AvatarScreen.ProfilePictureEditorFinal or p2.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode ~= PPEThumbnailTypeModule.FullBody else false
end

function ToolManager:updateAvatarRoute(CurrentAvatarRoute, p1)
	-- upvalues: AvatarScreen (copy), UtilsModule (copy)
	self.currentAvatarRoute = CurrentAvatarRoute
	local RouteIsProfilePictureEditorResult = UtilsModule.routeIsProfilePictureEditor(CurrentAvatarRoute)
	local RouteIsProfilePictureEditorResult1 = UtilsModule.routeIsProfilePictureEditor(p1)
	
	if CurrentAvatarRoute.opaque.name == AvatarScreen.ProfilePictureEditorFinal ~= (p1.opaque.name == AvatarScreen.ProfilePictureEditorFinal) or RouteIsProfilePictureEditorResult ~= RouteIsProfilePictureEditorResult1 then
		self:update(self.store:getState())
	end
end

function ToolManager:update(State)
	-- upvalues: ConstantsModule (copy), UtilsModule1 (copy), UtilsModule (copy), AvatarScreen (copy), PPEThumbnailTypeModule (copy)
	local CurToolId = self.curToolId
	local ItemId = nil
	
	for _, tryOnItem in State.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
		if tryOnItem.selectedInTryOnManager then
			if tryOnItem.itemType == ConstantsModule.ItemType.Asset and tryOnItem.itemSubType == ConstantsModule.AssetTypeIdStrings.Gear then
				ItemId = tryOnItem.itemId
			end
			if tryOnItem.itemType == ConstantsModule.ItemType.Bundle and tryOnItem.bundleInfo then
				for i, value in tryOnItem.bundleInfo do
					if value.assetType == ConstantsModule.AssetTypeIdStrings.Gear then
						ItemId = i
					end
				end
			end
		end
	end
	local EquippedToolId = UtilsModule1.getEquippedToolId(State)
	local CurrentAvatarRoute = self.currentAvatarRoute
	
	if if CurrentAvatarRoute and State and UtilsModule.routeIsProfilePictureEditor(CurrentAvatarRoute) then CurrentAvatarRoute.opaque.name ~= AvatarScreen.ProfilePictureEditorFinal or State.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode ~= PPEThumbnailTypeModule.FullBody else false then
		self:unequipTool(true)
	elseif ItemId then
		self:unequipTool()
		self:loadAndEquipTool(ItemId, true)
	elseif EquippedToolId then
		self:unequipTool(self.curToolIsTryOn)
		self:loadAndEquipTool(EquippedToolId, false)
	elseif self.equippedToolModel then
		self:unequipTool(true)
	else
		self.curToolId = nil
	end
	self.checkForChangedTool = self.curToolId ~= nil and self.curToolId ~= CurToolId
end

function ToolManager:loadAndEquipTool(CurToolId, p1)
	-- upvalues: InsertService (copy), disableScripts (copy), UtilsModule (copy), MutedErrorModule (copy), IncrementCharacterModelVersionModule (copy), IncrementTryOnCharacterModelVersionModule (copy)
	self.curToolId = CurToolId
	task.spawn(function()
		-- upvalues: InsertService (upval), CurToolId (copy), self (copy), disableScripts (upval), UtilsModule (upval), MutedErrorModule (upval), p1 (copy), IncrementCharacterModelVersionModule (upval), IncrementTryOnCharacterModelVersionModule (upval)
		local Asset = nil
		local _, Result = pcall(function()
			-- upvalues: Asset (ref), InsertService (upval), CurToolId (upval)
			Asset = InsertService:LoadAsset(CurToolId)
		end)
		
		if not self.destroyed then
			if Result or not Asset then
				warn("Error loading tool in CharacterManager: " .. Result)
				
				return
			end
			if CurToolId ~= self.curToolId then
				warn("Tool unequipped without getting a chance to get equipped.")
				Asset:Destroy()
				
				return
			end
			local _, Value = next(Asset:GetChildren())
			
			if Value and Value:IsA("Tool") then
				disableScripts(Value)
				self:equipTool(Value)
				
				if self.checkForChangedTool then
					self.checkForChangedTool = false
					local BoundingCFrame, BoundingSize = self.characterManager:getCurrentCharacter():GetBoundingBox()
					
					if not UtilsModule.isBoundingBoxVectorSane(BoundingSize) or not UtilsModule.isBoundingBoxCFrameSane(BoundingCFrame) then
						MutedErrorModule("(Avatar Experience) bad bounding box on adding tool: " .. CurToolId)
					end
				end
			end
			if p1 then
				self.curToolIsTryOn = true
				self.store:dispatch(IncrementTryOnCharacterModelVersionModule())
			else
				self.curToolIsTryOn = false
				self.store:dispatch(IncrementCharacterModelVersionModule())
			end
			return
		elseif Asset then
			Asset:Destroy()
		end
	end)
end

function ToolManager:equipTool(Tool)
	self.equippedToolModel = Tool
	self.characterManager:getCurrentCharacter().Humanoid:EquipTool(Tool)
end

function ToolManager:unequipTool(CurToolIsTryOn)
	-- upvalues: IncrementTryOnCharacterModelVersionModule (copy), IncrementCharacterModelVersionModule (copy)
	self.curToolId = nil
	local EquippedToolModel = self.equippedToolModel
	
	if EquippedToolModel then
		if CurToolIsTryOn then
			if self.curToolIsTryOn then
				self.store:dispatch(IncrementTryOnCharacterModelVersionModule())
			else
				self.store:dispatch(IncrementCharacterModelVersionModule())
			end
		end
		self.equippedToolModel = nil
		self.characterManager:getCurrentCharacter().Humanoid:UnequipTools()
		EquippedToolModel:Destroy()
	end
end

function ToolManager:notifySwitchedAvatarType()
	if self.equippedToolModel then
		self:equipTool(self.equippedToolModel)
	end
end

function ToolManager:start() end

function ToolManager:stop()
	-- upvalues: ConstantsModule (copy)
	local EquippedAssets = self.store:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets
	local EquippedAsset = EquippedAssets and EquippedAssets[ConstantsModule.AssetTypeIdStrings.Gear]
	
	if (not EquippedAsset or not next(EquippedAsset)) and self.equippedToolModel then
		self:unequipTool()
	end
	self:checkAndEquipTool()
end

function ToolManager:onDestroy()
	self.destroyed = true
end

return ToolManager
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarEditorService = game:GetService("AvatarEditorService")
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ToggleEquipAssetModule = require(Modules.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local RemoveSaveDelayFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.RemoveSaveDelay
local _ = require(Modules.AvatarExperience.Common.Types)
local UtilsModule1 = require(Modules.AvatarExperience.Common.Utils)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local TutilsModule = require(CorePackages.Packages.tutils)
local IncrementSavedCharacterModelVersionModule = require(Modules.AvatarExperience.Common.Actions.IncrementSavedCharacterModelVersion)
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local PreventSaveAvatarModule = require(Modules.AvatarExperience.AvatarEditor.Actions.PreventSaveAvatar)
local GetFFlagAXEnableAvatarDataRefreshModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableAvatarDataRefresh)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local FFlagAXRefreshThumbnailsOnLocalSaveModule = require(Modules.AvatarExperience.Flags.FFlagAXRefreshThumbnailsOnLocalSave)
local AXFixSaveManagerOnAXExit = game:DefineFastFlag("AXFixSaveManagerOnAXExit", false)
local FFlagAXAvatarTimeoutFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlow
local FFlagAXBackgroundsPersistence = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXBackgroundsPersistence
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local IsTenFootInterface = game:GetService("GuiService"):IsTenFootInterface()
local config = {
	toastMessage = "Feature.Avatar.Message.InvalidAssetsEquipped",
	isLocalized = false,
	toastType = require(Modules.LuaApp.Enum.ToastType).InformationMessage
}
local EventHubModule = if IsTenFootInterface then require(Modules.Shell.EventHub) else nil
local SaveManager = {}
SaveManager.__index = SaveManager
local AvatarEditorTimeBetweenSaves = game:DefineFastInt("AvatarEditorTimeBetweenSaves", 5)

local function _(p1)
	return p1.AvatarExperience.AvatarScene.ProfileConfiguration.BackgroundAssetId
end

function SaveManager:setLastSavedVariables()
	-- upvalues: FFlagAXBackgroundsPersistence (copy)
	local State = self.store:getState()
	self.lastSavedBodyColor3s = State.AvatarExperience.AvatarEditor.Character.BodyColor3s
	self.lastSavedAvatarType = State.AvatarExperience.AvatarEditor.Character.AvatarType
	self.lastSavedScales = State.AvatarExperience.AvatarEditor.Character.AvatarScales
	self.lastSavedAssets = State.AvatarExperience.AvatarEditor.Character.EquippedAssets
	self.lastSavedEmotes = State.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo
	
	if FFlagAXBackgroundsPersistence then
		self.lastSavedBackgroundAssetId = State.AvatarExperience.AvatarScene.ProfileConfiguration.BackgroundAssetId
	end
end

function SaveManager.new(Store, Networking, Analytics)
	-- upvalues: SaveManager (copy)
	local config = {
		store = Store,
		connections = {},
		networking = Networking,
		analytics = Analytics
	}
	setmetatable(config, SaveManager)
	config.timeOfLastSave = 0
	config:setLastSavedVariables()
	
	return config
end

function SaveManager:start()
	table.insert(self.connections, (self.store.changed:connect(function(Value, p1)
		-- upvalues: self (copy)
		self:update(Value, p1)
	end)))
	table.insert(self.connections, (game.Close:Connect(function()
		-- upvalues: self (copy)
		self:save(true)
	end)))
	self.timeOfLastSave = 0
	self.waitingForSave = false
	self.characterUpdated = false
	self.characterEquipped = false
	self:setLastSavedVariables()
end

function SaveManager:update(p1, _)
	-- upvalues: GetFFlagAXEnableAvatarDataRefreshModule (copy), PreventSaveAvatarModule (copy), FFlagAXAvatarTimeoutFlow (copy), AvatarExperienceCommonModule (copy), TutilsModule (copy), FFlagAXBackgroundsPersistence (copy)
	if GetFFlagAXEnableAvatarDataRefreshModule() and p1.AvatarExperience.AvatarEditor.PreventSaveAvatar then
		self.store:dispatch(PreventSaveAvatarModule(false))
		
		return
	end
	if FFlagAXAvatarTimeoutFlow then
		local TimeoutStatusStore = AvatarExperienceCommonModule.Stores.getTimeoutStatusStore()
		
		if TimeoutStatusStore and TimeoutStatusStore.getIsTimedOut and TimeoutStatusStore.getIsTimedOut(false) then return end
	end
	local BodyColor3s = p1.AvatarExperience.AvatarEditor.Character.BodyColor3s
	local AvatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType
	local AvatarScales = p1.AvatarExperience.AvatarEditor.Character.AvatarScales
	local EquippedAssets = p1.AvatarExperience.AvatarEditor.Character.EquippedAssets
	local SlotInfo = p1.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo
	local Flag = false
	local Inverted: boolean = if GetFFlagAXEnableAvatarDataRefreshModule() then not TutilsModule.deepEqual(BodyColor3s, self.lastSavedBodyColor3s) else BodyColor3s ~= self.lastSavedBodyColor3s
	
	if GetFFlagAXEnableAvatarDataRefreshModule() then
		if Inverted or not TutilsModule.deepEqual(AvatarType, self.lastSavedAvatarType) or not TutilsModule.deepEqual(AvatarScales, self.lastSavedScales) or not TutilsModule.deepEqual(EquippedAssets, self.lastSavedAssets) or not TutilsModule.deepEqual(SlotInfo, self.lastSavedEmotes) then
			Flag = true
		end
	elseif Inverted or AvatarType ~= self.lastSavedAvatarType or AvatarScales ~= self.lastSavedScales or EquippedAssets ~= self.lastSavedAssets or SlotInfo ~= self.lastSavedEmotes then
		Flag = true
	end
	if FFlagAXBackgroundsPersistence and p1.AvatarExperience.AvatarScene.ProfileConfiguration.BackgroundAssetId ~= self.lastSavedBackgroundAssetId then
		Flag = true
	end
	if Flag and not self.saving then
		self:save(false)
	end
end

function SaveManager:stop()
	-- upvalues: IsTenFootInterface (copy), EventHubModule (ref)
	self:save(true)
	
	for _, connection in self.connections do
		connection:disconnect()
	end
	self.connections = {}
	
	if IsTenFootInterface then
		spawn(function()
			-- upvalues: self (copy), EventHubModule (upval)
			if self.characterUpdated then
				EventHubModule:dispatchEvent(EventHubModule.Notifications.CharacterUpdated)
			end
			if self.characterEquipped then
				EventHubModule:dispatchEvent(EventHubModule.Notifications.CharacterEquipped, self.store:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets, self.characterUpdated)
			end
			self.characterUpdated = false
			self.characterEquipped = false
		end)
	end
end

local _ = function(p1)
	-- upvalues: SetCurrentToastMessageModule (copy), config (copy)
	p1:dispatch(SetCurrentToastMessageModule(config))
end

local function getAssetIdsFromDescription(Humanoid: Humanoid)
	-- upvalues: ConstantsModule (copy)
	local List = {}
	local AccessoryTypeEnumToAssetTypeIdEntries = {}
	
	for i, value in ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp do
		if ConstantsModule.AssetTypeIdToAccessoryTypeEnum[i] == nil then
			local HumanoidEntry = Humanoid[value]
			
			if typeof(HumanoidEntry) == "number" and HumanoidEntry > 0 then
				table.insert(List, HumanoidEntry)
				AccessoryTypeEnumToAssetTypeIdEntries[HumanoidEntry] = tostring(i)
			elseif typeof(HumanoidEntry) == "string" and HumanoidEntry ~= "" then
				for i1 in HumanoidEntry:gmatch("([%d]+),?") do
					table.insert(List, (tonumber(i1)))
					AccessoryTypeEnumToAssetTypeIdEntries[tonumber(i1)] = tostring(i)
				end
			end
		end
	end
	for _, accessory in Humanoid:GetAccessories(true) do
		table.insert(List, accessory.AssetId)
		AccessoryTypeEnumToAssetTypeIdEntries[accessory.AssetId] = ConstantsModule.AccessoryTypeEnumToAssetTypeId[accessory.AccessoryType]
	end
	return List, AccessoryTypeEnumToAssetTypeIdEntries
end

local function removeInvalidAssetsWithHumanoidDescription(Store, Humanoid, Humanoid1, EquippedAssets)
	-- upvalues: getAssetIdsFromDescription (copy), CryoModule (copy), UtilsModule (copy), ToggleEquipAssetModule (copy), SetCurrentToastMessageModule (copy), config (copy)
	local AssetIdsFromDescription, AssetIdsFromDescription2 = getAssetIdsFromDescription(Humanoid)
	local Set = CryoModule.List.toSet((getAssetIdsFromDescription(Humanoid1)))
	local FilterResult = CryoModule.List.filter(AssetIdsFromDescription, function(p1): boolean
		-- upvalues: Set (copy)
		return Set[p1] == nil
	end)
	
	for _, value in FilterResult do
		if UtilsModule.isAssetEquipped(tostring(value), AssetIdsFromDescription2[value], EquippedAssets) then
			Store:dispatch(ToggleEquipAssetModule(AssetIdsFromDescription2[value], (tostring(value))))
		end
	end
	if #FilterResult > 0 then
		Store:dispatch(SetCurrentToastMessageModule(config))
	end
end

function SaveManager:shouldDelaySaveManager()
	return self.store:getState().AvatarExperience.AvatarScene.Character.ShouldDelaySaveManager
end

function SaveManager:refreshAvatarThumbnails()
	-- upvalues: FFlagAXRefreshThumbnailsOnLocalSaveModule (copy), AvatarEditorService (copy)
	if FFlagAXRefreshThumbnailsOnLocalSaveModule and game:GetEngineFeature("AvatarEditorServiceRefreshAvatarThumbnailEnabled") then
		AvatarEditorService:refreshAvatarThumbnails({ "AvatarHeadShot", "AvatarBust", "Avatar" })
	end
end

function SaveManager:persistProfileConfiguration(BackgroundAssetId)
	-- upvalues: AvatarEditorService (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule1 (copy), FFlagAXRefreshThumbnailsOnLocalSaveModule (copy)
	local config = { BackgroundAssetId = BackgroundAssetId }
	local NoPromptApplyProfileConfigurationResult = AvatarEditorService:NoPromptApplyProfileConfiguration(config)
	while not NoPromptApplyProfileConfigurationResult do
		AvatarEditorService.PromptApplyProfileConfigurationCompleted:Wait()
		
		if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
			ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule1.Counter.AvatarEditorServiceErrors.NoPromptApplyProfileConfiguration)
		end
		NoPromptApplyProfileConfigurationResult = AvatarEditorService:NoPromptApplyProfileConfiguration(config)
	end
	if AvatarEditorService.PromptApplyProfileConfigurationCompleted:Wait() == Enum.AvatarPromptResult.Success then
		self.lastSavedBackgroundAssetId = BackgroundAssetId
		
		if FFlagAXRefreshThumbnailsOnLocalSaveModule then
			self:refreshAvatarThumbnails()
			
			return
		end
	elseif GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
		ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule1.Counter.AvatarEditorServiceErrors.PromptApplyProfileConfigurationCompleted)
	end
end

function SaveManager:save(p1)
	-- upvalues: SendAXCounterV2Function (copy), ConstantsModule (copy), AvatarEditorTimeBetweenSaves (copy), AXFixSaveManagerOnAXExit (copy), RemoveSaveDelayFunction (copy), GetFFlagAXEnableAvatarDataRefreshModule (copy), TutilsModule (copy), FFlagAXBackgroundsPersistence (copy), FFlagAXAvatarTimeoutFlow (copy), AvatarExperienceCommonModule (copy), UtilsModule (copy), AvatarEditorService (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule1 (copy), removeInvalidAssetsWithHumanoidDescription (copy), FFlagAXRefreshThumbnailsOnLocalSaveModule (copy), IncrementSavedCharacterModelVersionModule (copy)
	self.saving = true
	SendAXCounterV2Function(ConstantsModule.Counter.SaveManager.Attempt, {
		skipWait = tostring(p1),
		shouldDelay = tostring(self:shouldDelaySaveManager()),
		timeBetweenSaves = tostring(AvatarEditorTimeBetweenSaves)
	})
	task.spawn(function()
		-- upvalues: self (copy), AXFixSaveManagerOnAXExit (upval), p1 (copy), AvatarEditorTimeBetweenSaves (upval), RemoveSaveDelayFunction (upval), GetFFlagAXEnableAvatarDataRefreshModule (upval), TutilsModule (upval), FFlagAXBackgroundsPersistence (upval), FFlagAXAvatarTimeoutFlow (upval), AvatarExperienceCommonModule (upval), UtilsModule (upval), AvatarEditorService (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), removeInvalidAssetsWithHumanoidDescription (upval), FFlagAXRefreshThumbnailsOnLocalSaveModule (upval), IncrementSavedCharacterModelVersionModule (upval)
		local Elapsed = tick() - self.timeOfLastSave
		
		if AXFixSaveManagerOnAXExit then
			if p1 then
				if self:shouldDelaySaveManager() then
					self.store:dispatch(RemoveSaveDelayFunction())
				end
			elseif Elapsed < AvatarEditorTimeBetweenSaves then
				task.wait(AvatarEditorTimeBetweenSaves - Elapsed)
				
				if self:shouldDelaySaveManager() then
					self.store:dispatch(RemoveSaveDelayFunction())
				end
			elseif self:shouldDelaySaveManager() then
				wait(AvatarEditorTimeBetweenSaves)
				self.store:dispatch(RemoveSaveDelayFunction())
			end
		elseif p1 or Elapsed >= AvatarEditorTimeBetweenSaves then
			if self:shouldDelaySaveManager() then
				wait(AvatarEditorTimeBetweenSaves)
				self.store:dispatch(RemoveSaveDelayFunction())
			end
		else
			task.wait(AvatarEditorTimeBetweenSaves - Elapsed)
			
			if self:shouldDelaySaveManager() then
				self.store:dispatch(RemoveSaveDelayFunction())
			end
		end
		local BodyColor3s = self.store:getState().AvatarExperience.AvatarEditor.Character.BodyColor3s
		local AvatarType = self.store:getState().AvatarExperience.AvatarEditor.Character.AvatarType
		local AvatarScales = self.store:getState().AvatarExperience.AvatarEditor.Character.AvatarScales
		local EquippedAssets = self.store:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets
		local SlotInfo = self.store:getState().AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo
		local SaveDict = {}
		
		if GetFFlagAXEnableAvatarDataRefreshModule() then
			SaveDict.BodyColors = not TutilsModule.deepEqual(BodyColor3s, self.lastSavedBodyColor3s)
			SaveDict.AvatarType = not TutilsModule.deepEqual(self.lastSavedAvatarType, AvatarType)
			SaveDict.Scales = not TutilsModule.deepEqual(AvatarScales, self.lastSavedScales)
			SaveDict.Assets = EquippedAssets and not TutilsModule.deepEqual(EquippedAssets, self.lastSavedAssets)
			SaveDict.Emotes = not TutilsModule.deepEqual(SlotInfo, self.lastSavedEmotes)
		else
			SaveDict.BodyColors = BodyColor3s ~= self.lastSavedBodyColor3s
			SaveDict.AvatarType = AvatarType ~= self.lastSavedAvatarType
			SaveDict.Scales = AvatarScales ~= self.lastSavedScales
			SaveDict.Assets = EquippedAssets and EquippedAssets ~= self.lastSavedAssets
			SaveDict.Emotes = SlotInfo ~= self.lastSavedEmotes
		end
		local BodyColors = SaveDict.BodyColors or (SaveDict.AvatarType or (SaveDict.Scales or (SaveDict.Assets or SaveDict.Emotes)))
		local BackgroundAssetId = if FFlagAXBackgroundsPersistence then self.store:getState().AvatarExperience.AvatarScene.ProfileConfiguration.BackgroundAssetId else nil
		local IsNotBackgroundAssetIdMatch: boolean = FFlagAXBackgroundsPersistence and (BackgroundAssetId ~= nil and BackgroundAssetId ~= self.lastSavedBackgroundAssetId)
		
		if not BodyColors and not IsNotBackgroundAssetIdMatch then
			self.timeOfLastSave = tick()
			self.saving = false
			
			return
		end
		if FFlagAXAvatarTimeoutFlow then
			local TimeoutStatusStore = AvatarExperienceCommonModule.Stores.getTimeoutStatusStore()
			
			if TimeoutStatusStore and TimeoutStatusStore.getIsTimedOut and TimeoutStatusStore.getIsTimedOut(false) then
				self.saving = false
				
				return
			end
		end
		if IsNotBackgroundAssetIdMatch then
			task.spawn(function()
				-- upvalues: self (upval), BackgroundAssetId (copy), BodyColors (copy)
				self:persistProfileConfiguration(BackgroundAssetId)
				
				if not BodyColors then
					self.timeOfLastSave = tick()
					self.saving = false
				end
			end)
			
			if not BodyColors then return end
		end
		local HumanoidDescriptionFromState = UtilsModule.getHumanoidDescriptionFromState(self.store:getState().AvatarExperience)
		local HumanoidRigTypeEntry = Enum.HumanoidRigType[AvatarType]
		task.spawn(function()
			-- upvalues: SaveDict (copy), EquippedAssets (copy), AvatarEditorService (upval), HumanoidDescriptionFromState (copy), HumanoidRigTypeEntry (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), BodyColor3s (copy), self (upval), AvatarType (copy), AvatarScales (copy), removeInvalidAssetsWithHumanoidDescription (upval), SlotInfo (copy), FFlagAXRefreshThumbnailsOnLocalSaveModule (upval), FFlagAXAvatarTimeoutFlow (upval), AvatarExperienceCommonModule (upval), IncrementSavedCharacterModelVersionModule (upval)
			local Number: number? = 0
			
			if SaveDict.Assets then
				local EquippedAsset = EquippedAssets[tostring(Enum.AssetType.Gear.Value)]
				
				if EquippedAsset then
					local Key, _ = next(EquippedAsset)
					
					if Key then
						Number = tonumber(Key)
					end
				end
			end
			local NoPromptSaveAvatarResult = AvatarEditorService:NoPromptSaveAvatar(HumanoidDescriptionFromState, HumanoidRigTypeEntry, SaveDict, Number)
			local Count = 0
			while not NoPromptSaveAvatarResult do
				Count += 1
				AvatarEditorService.PromptSaveAvatarCompleted:Wait()
				NoPromptSaveAvatarResult = AvatarEditorService:NoPromptSaveAvatar(HumanoidDescriptionFromState, HumanoidRigTypeEntry, SaveDict)
				
				if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
					ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule1.Counter.AvatarEditorServiceErrors.NoPromptSaveAvatar)
				end
			end
			if Count > 0 then
				SendAXCounterV2Function(ConstantsModule.Counter.SaveManager.BlockedByOngoingSave, { blockedCount = tostring(Count) })
			end
			local Result, HumanoidDescription = AvatarEditorService.PromptSaveAvatarCompleted:Wait()
			
			if Result == Enum.AvatarPromptResult.Success then
				if BodyColor3s ~= self.lastSavedBodyColor3s then
					self.lastSavedBodyColor3s = BodyColor3s
					self.characterUpdated = true
				end
				if AvatarType ~= self.lastSavedAvatarType then
					self.lastSavedAvatarType = AvatarType
					self.characterUpdated = true
				end
				if AvatarScales ~= self.lastSavedScales then
					self.lastSavedScales = AvatarScales
					self.characterUpdated = true
				end
				if EquippedAssets and EquippedAssets ~= self.lastSavedAssets then
					self.lastSavedAssets = EquippedAssets
					self.characterUpdated = true
					self.characterEquipped = true
					removeInvalidAssetsWithHumanoidDescription(self.store, HumanoidDescriptionFromState, HumanoidDescription, EquippedAssets)
				end
				if SlotInfo ~= self.lastSavedEmotes then
					self.lastSavedEmotes = SlotInfo
					self.characterUpdated = true
					self.characterEquipped = true
				end
				if FFlagAXRefreshThumbnailsOnLocalSaveModule and self.characterUpdated then
					self:refreshAvatarThumbnails()
				end
				SendAXCounterV2Function(ConstantsModule.Counter.SaveManager.Success)
			else
				warn("Failure saving.")
				SendAXCounterV2Function(ConstantsModule.Counter.SaveManager.Failure)
				
				if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
					ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule1.Counter.AvatarEditorServiceErrors.PromptSaveAvatarCompleted)
				end
				if FFlagAXAvatarTimeoutFlow then
					local TimeoutStatusStore = AvatarExperienceCommonModule.Stores.getTimeoutStatusStore()
					
					if TimeoutStatusStore and TimeoutStatusStore.fetchStatus then
						TimeoutStatusStore.fetchStatus()
					end
				end
			end
			self.store:dispatch(IncrementSavedCharacterModelVersionModule())
			self.timeOfLastSave = tick()
			self.saving = false
		end)
	end)
end

function SaveManager:updateAvatarRoute(p2, p3)
	-- upvalues: UtilsModule1 (copy)
	if UtilsModule1.didLeaveAvatarEditor(p2, p3) then
		self:save(true)
	end
end

function SaveManager:onDestroy() end

return SaveManager
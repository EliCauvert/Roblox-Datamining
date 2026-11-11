local AvatarEditorService = game:GetService("AvatarEditorService")
local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local ParticleUtility = require(CorePackages.Packages.Thumbnailing).ParticleUtility
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXColorAdjustmentButtonShouldAccountForTryOns = AvatarExperienceFlagsModule.FFlagAXColorAdjustmentButtonShouldAccountForTryOns
local AXEnableAccessoryAdjustmentDuringTryOnIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local SelectHasBodyTryOn = if FFlagAXColorAdjustmentButtonShouldAccountForTryOns then AvatarExperienceCommonModule.State.Selectors.selectHasBodyTryOn else require(Modules.AvatarExperience.Common.Selectors.selectHasBodyTryOn)
local SelectAvatarPreviewColors = if FFlagAXColorAdjustmentButtonShouldAccountForTryOns then AvatarExperienceCommonModule.State.Selectors.selectAvatarPreviewColors else require(Modules.AvatarExperience.Common.Selectors.selectAvatarPreviewColors)
local SetMakeupDescriptionsFunction = AvatarExperienceCommonModule.Utils.setMakeupDescriptions
local IsMakeupAssetTypeFunction = AvatarExperienceCommonModule.Utils.isMakeupAssetType
local DestroyMakeupDescriptionsFunction = AvatarExperienceCommonModule.Utils.destroyMakeupDescriptions
local GetMakeupDescriptionsFromHumanoidDescriptionFunction = AvatarExperienceCommonModule.Utils.getMakeupDescriptionsFromHumanoidDescription
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local MAXMAKEUPLAYERS = AvatarExperienceCommonModule.Constants.MAX_MAKEUP_LAYERS
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local SetCurrentCharacterFunction = AvatarExperienceRoduxModule.Actions.SetCurrentCharacter
local AssetTypeToAssetCategory = AvatarExperienceRoduxModule.Constants.AssetTypeToAssetCategory
local SetAdjustableTryOnIdsModule = require(Modules.AvatarExperience.Common.Actions.SetAdjustableTryOnIds)
local UpdateCharacterModule = require(Modules.AvatarExperience.Common.Thunks.UpdateCharacter)
local IncrementCharacterVersionModule = require(Modules.AvatarExperience.Common.Actions.IncrementCharacterVersion)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local IncrementCharacterModelVersionModule = require(Modules.AvatarExperience.AvatarEditor.Actions.IncrementCharacterModelVersion)
local IncrementTryOnCharacterModelVersionModule = require(Modules.AvatarExperience.Catalog.Actions.IncrementTryOnCharacterModelVersion)
local FinishedWaitingOnLCUpdateModule = require(Modules.AvatarExperience.Common.Actions.FinishedWaitingOnLCUpdate)
local AnimationManagerModule = require(Modules.AvatarExperience.Common.Managers.AnimationManager)
local ToolManagerModule = require(Modules.AvatarExperience.Common.Managers.ToolManager)
local CharacterModelPoolModule = require(Modules.AvatarExperience.Common.Managers.CharacterModelPool)
local SelectHasAvatarDataModule = require(Modules.AvatarExperience.Common.Selectors.selectHasAvatarData)
local SelectLastTryOnClassicHeadShapeModule = require(Modules.AvatarExperience.AvatarRefinement.HeadRefinement.Selectors.selectLastTryOnClassicHeadShape)
local SelectDefaultTryOnBodyColorsToggledModule = require(Modules.AvatarExperience.Common.Selectors.selectDefaultTryOnBodyColorsToggled)
local SelectDefaultTryOnBodyColorsModule = require(Modules.AvatarExperience.Common.Selectors.selectDefaultTryOnBodyColors)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local CharacterManagerUtilsModule = require(Modules.AvatarExperience.Common.Util.CharacterManagerUtils)
local AvatarWidgetBlockyUtilsModule = require(Modules.AvatarExperience.Common.Util.AvatarWidgetBlockyUtils)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local AccessoryAdjustmentUtilsModule = require(Modules.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils)
local UtilsModule1 = require(Modules.AvatarExperience.AvatarEditor.Utils)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule2 = require(Modules.AvatarExperience.Common.Constants)
local ASSETTYPEIDSTRINGTOMAKEUPTYPE = AvatarExperienceCommonModule.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local GetFFlagFixCharacterManagerValueConversionWarningModule = require(Modules.AvatarExperience.Flags.GetFFlagFixCharacterManagerValueConversionWarning)
local FFlagAXFixBodyScaleReduxUpdatesModule = require(Modules.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates)
local FFlagAXNilGuardCharacterManagerModule = require(Modules.AvatarExperience.Flags.FFlagAXNilGuardCharacterManager)
local MutedErrorWithCounterModule = require(Modules.AvatarExperience.Common.Util.mutedErrorWithCounter)
local AXRemoveDynamicHeadAssetsFromTryOn = game:DefineFastFlag("AXRemoveDynamicHeadAssetsFromTryOn", false)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXMakeupEquipping = AvatarExperienceFlagsModule.FFlagAXMakeupEquipping
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local FFlagAXMakeupFixAvatarLooksTryOn = AvatarExperienceFlagsModule.FFlagAXMakeupFixAvatarLooksTryOn
local FFlagEnableHeadShapeForCharacterManager = AvatarExperienceFlagsModule.FFlagEnableHeadShapeForCharacterManager
local FFlagFixHeadShapeColorSlider = AvatarExperienceFlagsModule.FFlagFixHeadShapeColorSlider
local AXFixTryOnDefaultClothing = game:DefineFastFlag("AXFixTryOnDefaultClothing", false)
local AXCheckApplyDefaultClothingErrorGuards = game:DefineFastFlag("AXCheckApplyDefaultClothingErrorGuards", false)
local Text = settings():GetFVariable("LuaAppsDiagLoadTimeAvatarModel") .. "_" .. UtilsModule.getDeviceType()
local CharacterManager = {}
CharacterManager.__index = CharacterManager
local AssetTypeIdStringToHumanoidDescriptionProp = ConstantsModule1.AssetTypeIdStringToHumanoidDescriptionProp
local HumanoidDescriptionScaleToName = ConstantsModule1.HumanoidDescriptionScaleToName
local AssetTypeIdStrings = ConstantsModule1.AssetTypeIdStrings
local AxLoadtime = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.loadtime")
local config = {
	toastMessage = "Feature.Avatar.Message.FaceNotVisible",
	isLocalized = false,
	toastType = require(Modules.LuaApp.Enum.ToastType).InformationMessage
}

local function _(p1): boolean
	return p1 == "" or p1 == 0
end

local function isHumanoidDescriptionEmpty(Humanoid: Humanoid): boolean
	-- upvalues: AssetTypeIdStringToHumanoidDescriptionProp (copy)
	for _, value in AssetTypeIdStringToHumanoidDescriptionProp do
		local HumanoidEntry = Humanoid[value]
		
		if HumanoidEntry ~= "" and HumanoidEntry ~= 0 then
			return false
		end
	end
	return #Humanoid:GetAccessories(true) <= 0
end

function CharacterManager.new(Store, Networking, Analytics, Analytics1, Analytics2, CharacterManagerEvents, CharacterManagerCallbacks, CatalogAnalytics, p1)
	-- upvalues: CharacterManager (copy), CharacterModelPoolModule (copy), UpdateCharacterModule (copy), IncrementCharacterVersionModule (copy), AnimationManagerModule (copy), ToolManagerModule (copy), IsVRAppBuildFunction (copy)
	local Analytics3 = {}
	setmetatable(Analytics3, CharacterManager)
	Analytics3.startAvatarModelLoadTime = tick()
	Analytics3.connections = {}
	Analytics3.store = Store
	Analytics3.networking = Networking
	Analytics3.analytics = Analytics
	Analytics3.characterManagerEvents = CharacterManagerEvents
	Analytics3.characterManagerCallbacks = CharacterManagerCallbacks
	Analytics3.catalogAnalytics = CatalogAnalytics
	Analytics3.characterModelPool = CharacterModelPoolModule.new(Store, Analytics, Analytics2, p1)
	Analytics3._currentCharacter = Analytics3.characterModelPool:getCurrentCharacter()
	Analytics3.store:dispatch(UpdateCharacterModule(Analytics3._currentCharacter))
	Analytics3.store:dispatch(IncrementCharacterVersionModule())
	Analytics3.characterRoot = Instance.new("Folder")
	Analytics3.characterRoot.Name = "CharacterRoot"
	Analytics3.characterRoot.Parent = game.Workspace
	Analytics3.needsToEquipBundleTryOn = false
	Analytics3.initialHumanoidDescriptionApplied = false
	Analytics3.initialTryOnApplied = false
	Analytics3.destroyed = false
	Analytics3.checkBodyColors = true
	Analytics3.modelInitialized = false
	Analytics3.firstCallinPPE = true
	Analytics3.shouldUnequipAccessoriesAndMakeupBeforeTryOn = false
	Analytics3.animationManager = AnimationManagerModule.new(Store, Analytics3, Analytics1)
	Analytics3.toolManager = ToolManagerModule.new(Store, Analytics3.animationManager, Analytics3)
	Analytics3.humanoidDescriptionCurrentlyEquipped = Instance.new("HumanoidDescription")
	Analytics3.humanoidDescriptionTryOn = Instance.new("HumanoidDescription")
	Analytics3.lastHumanoidDescriptionApplied = Instance.new("HumanoidDescription")
	
	if not IsVRAppBuildFunction() then
		Analytics3:maybeInitializeModel(Analytics3.store:getState())
	end
	Analytics3.cachedRoduxState = Analytics3.store:getState()
	
	return Analytics3
end

function CharacterManager:maybeInitializeModel(State)
	-- upvalues: SelectHasAvatarDataModule (copy)
	if not self.modelInitialized and SelectHasAvatarDataModule(State) then
		self.modelInitialized = true
		self:initializeModel(State)
	end
end

function CharacterManager:setupAnimations(p1, p2)
	self.characterModelPool:setupAnimations(p1, p2)
end

function CharacterManager:initializeModel(p1)
	-- upvalues: ConstantsModule (copy)
	local AvatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType
	
	if AvatarType == ConstantsModule.AvatarType.R6 then
		self:switchAvatarType(AvatarType)
	end
	self._currentCharacter.Parent = self.characterRoot
	self:updateHumanoidDescriptionCurrentlyEquipped(p1)
	self:applyHumanoidDescription(true)
	self.toolManager:update(p1)
end

function CharacterManager:updateCharacterFromConnection(LastHumanoidDescriptionApplied)
	self.characterModelPool:maybeUpdateCharacter(LastHumanoidDescriptionApplied):andThen(function(_, _)
		-- upvalues: self (copy)
		self.characterManagerCallbacks.setAppliedDescription(self._currentCharacter.Humanoid.HumanoidDescription)
	end)
end

function CharacterManager:initAvatarScalesChangedConnection()
	-- upvalues: FFlagAXNilGuardCharacterManagerModule (copy), MutedErrorWithCounterModule (copy), HumanoidDescriptionScaleToName (copy)
	if FFlagAXNilGuardCharacterManagerModule and (self.characterManagerEvents == nil or self.characterManagerEvents.avatarScalesChangedEvent == nil) then
		MutedErrorWithCounterModule("CharacterManager_initAvatarScalesChangedConnection_characterManagerEvents")
		
		return
	else
		table.insert(self.connections, (self.characterManagerEvents.avatarScalesChangedEvent:Connect(function(List)
			-- upvalues: self (copy), HumanoidDescriptionScaleToName (upval)
			if not List then return end
			local LastHumanoidDescriptionApplied = self.lastHumanoidDescriptionApplied:Clone()
			
			for i, value in List do
				LastHumanoidDescriptionApplied[HumanoidDescriptionScaleToName[i]] = value
			end
			self:updateCharacterFromConnection(LastHumanoidDescriptionApplied)
			
			if self.characterModelPool:isR15() then
				self:adjustHeightToStandOnPlatform(self._currentCharacter)
			end
		end)))
	end
end

function CharacterManager:initBodyColorsChangedConnection()
	-- upvalues: FFlagAXNilGuardCharacterManagerModule (copy), MutedErrorWithCounterModule (copy), SelectDefaultTryOnBodyColorsToggledModule (copy), ConstantsModule (copy), SelectHasBodyTryOn (copy), UtilsModule1 (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), AvatarEditorService (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule2 (copy), AXCheckApplyDefaultClothingErrorGuards (copy), MutedErrorModule (copy)
	if FFlagAXNilGuardCharacterManagerModule and (self.characterManagerEvents == nil or self.characterManagerEvents.bodyColorsChangedEvent == nil) then
		MutedErrorWithCounterModule("CharacterManager_initBodyColorsChangedConnection_characterManagerEvents")
		
		return
	else
		table.insert(self.connections, (self.characterManagerEvents.bodyColorsChangedEvent:Connect(function(p1)
			-- upvalues: self (copy), SelectDefaultTryOnBodyColorsToggledModule (upval), ConstantsModule (upval), SelectHasBodyTryOn (upval), UtilsModule1 (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), AvatarEditorService (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule2 (upval), AXCheckApplyDefaultClothingErrorGuards (upval), MutedErrorModule (upval)
			if not p1 then
				self.overrideBodyColor3s = nil
				
				return
			end
			local State = self.store:getState()
			
			if SelectDefaultTryOnBodyColorsToggledModule(State) then
				self.overrideBodyColor3s = nil
				
				return
			end
			local OverrideBodyColor3s = {}
			
			for _, bodyPartForSkinColoringId in ConstantsModule.BodyPartButtonData[State.AvatarExperience.AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex].bodyPartForSkinColoringIds do
				OverrideBodyColor3s[bodyPartForSkinColoringId] = p1
			end
			local CombineOutfitTryOnAndEquippedHumanoidDescriptionsResult = nil
			
			if SelectHasBodyTryOn(State) then
				CombineOutfitTryOnAndEquippedHumanoidDescriptionsResult = self:combineOutfitTryOnAndEquippedHumanoidDescriptions()
				self:updateHumanoidDescriptionTryOnWithColors(State)
			else
				CombineOutfitTryOnAndEquippedHumanoidDescriptionsResult = self.humanoidDescriptionCurrentlyEquipped:Clone()
			end
			UtilsModule1.setHumanoidDescriptionColorsFromBodyColor3s(CombineOutfitTryOnAndEquippedHumanoidDescriptionsResult, OverrideBodyColor3s)
			local CheckApplyDefaultClothingAsyncResult = nil
			
			if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
				local Success, Result = pcall(function()
					-- upvalues: AvatarEditorService (upval), CombineOutfitTryOnAndEquippedHumanoidDescriptionsResult (ref)
					return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:CheckApplyDefaultClothingAsync(CombineOutfitTryOnAndEquippedHumanoidDescriptionsResult) else AvatarEditorService:CheckApplyDefaultClothing(CombineOutfitTryOnAndEquippedHumanoidDescriptionsResult)
				end)
				
				if Success then
					CheckApplyDefaultClothingAsyncResult = Result
				else
					ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule2.Counter.AvatarEditorServiceErrors.CheckApplyDefaultClothing)
					
					if AXCheckApplyDefaultClothingErrorGuards then
						MutedErrorModule(Result)
						CheckApplyDefaultClothingAsyncResult = nil
					else
						error(Result)
					end
				end
			else
				CheckApplyDefaultClothingAsyncResult = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:CheckApplyDefaultClothingAsync(CombineOutfitTryOnAndEquippedHumanoidDescriptionsResult) else AvatarEditorService:CheckApplyDefaultClothing(CombineOutfitTryOnAndEquippedHumanoidDescriptionsResult)
			end
			self.overrideBodyColor3s = OverrideBodyColor3s
			self:updateCharacterFromConnection(CheckApplyDefaultClothingAsyncResult or CombineOutfitTryOnAndEquippedHumanoidDescriptionsResult)
		end)))
	end
end

function CharacterManager:initAdjustmentChangedConnection()
	-- upvalues: FFlagAXNilGuardCharacterManagerModule (copy), MutedErrorWithCounterModule (copy), UtilsModule (copy)
	if FFlagAXNilGuardCharacterManagerModule and (self.characterManagerEvents == nil or self.characterManagerEvents.adjustmentChangedEvent == nil) then
		MutedErrorWithCounterModule("CharacterManager_initAdjustmentChangedConnection_characterManagerEvents")
		
		return
	else
		table.insert(self.connections, (self.characterManagerEvents.adjustmentChangedEvent:Connect(function(Position, Rotation, Scale)
			-- upvalues: self (copy), UtilsModule (upval)
			local LastHumanoidDescriptionApplied = self.lastHumanoidDescriptionApplied:Clone()
			local SelectedAccessoryDescription = UtilsModule.getSelectedAccessoryDescription(LastHumanoidDescriptionApplied, self.store:getState().AvatarExperience.AccessoryAdjustment.SelectedAccessory)
			
			if SelectedAccessoryDescription then
				if Position then
					SelectedAccessoryDescription.Position = Position
				end
				if Rotation then
					SelectedAccessoryDescription.Rotation = Rotation
				end
				if Scale then
					SelectedAccessoryDescription.Scale = Scale
				end
				self:updateCharacterFromConnection(LastHumanoidDescriptionApplied)
			end
		end)))
	end
end

function CharacterManager:start()
	-- upvalues: FFlagAXFixBodyScaleReduxUpdatesModule (copy)
	self:maybeInitializeModel(self.store:getState())
	self._currentCharacter.Parent = self.characterRoot
	table.insert(self.connections, (self.store.changed:connect(function(Value, p1)
		-- upvalues: self (copy)
		self:update(Value, p1)
	end)))
	
	if FFlagAXFixBodyScaleReduxUpdatesModule then
		self:initAvatarScalesChangedConnection()
	end
	self:initBodyColorsChangedConnection()
	self:initAdjustmentChangedConnection()
	self.characterModelPool:start()
	self.animationManager:start()
	self.toolManager:start()
	self:updateHumanoidDescriptionCurrentlyEquipped(self.store:getState())
	self:applyHumanoidDescription(true)
	self.toolManager:update(self.store:getState())
	self:update(self.store:getState(), self.cachedRoduxState)
end

function CharacterManager:updateHumanoidDescriptionTryOnWithColors(State)
	-- upvalues: SelectDefaultTryOnBodyColorsToggledModule (copy), SelectDefaultTryOnBodyColorsModule (copy), SelectAvatarPreviewColors (copy), UtilsModule1 (copy)
	UtilsModule1.setHumanoidDescriptionColorsFromBodyColor3s(self.humanoidDescriptionTryOn, if SelectDefaultTryOnBodyColorsToggledModule(State) then SelectDefaultTryOnBodyColorsModule(State) elseif self.overrideBodyColor3s then self.overrideBodyColor3s else SelectAvatarPreviewColors(State))
end

function CharacterManager:update(State, CachedRoduxState)
	-- upvalues: CharacterManagerUtilsModule (copy), AXEnableAccessoryAdjustmentDuringTryOnIXP (copy), IxpUtilsModule (copy), ConstantsModule (copy), AccessoryAdjustmentUtilsModule (copy), SetAdjustableTryOnIdsModule (copy), FFlagAXMakeupEquipping (copy), ConstantsModule1 (copy), FFlagAXMISEnableMultiShopping (copy), AvatarWidgetBlockyUtilsModule (copy)
	local ShouldUpdateHumanoidDescriptionCurrentlyEquipped = self:shouldUpdateHumanoidDescriptionCurrentlyEquipped(State, CachedRoduxState)
	
	if ShouldUpdateHumanoidDescriptionCurrentlyEquipped then
		self:updateHumanoidDescriptionCurrentlyEquipped(State)
	end
	local ShouldUpdateHumanoidDescriptionTryOnOutfit = self:shouldUpdateHumanoidDescriptionTryOnOutfit(State, CachedRoduxState)
	
	if ShouldUpdateHumanoidDescriptionTryOnOutfit then
		CharacterManagerUtilsModule.updateHumanoidDescriptionUsingOutfitTryOn(State, self.humanoidDescriptionTryOn)
		
		if if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXEnableAccessoryAdjustmentDuringTryOnIXP.EnabledForUser) else nil then
			self.store:dispatch(SetAdjustableTryOnIdsModule((AccessoryAdjustmentUtilsModule.getAdjustableAccessories(self.humanoidDescriptionTryOn, self.store:getState().AvatarExperience.AvatarEditor.AvatarSettings[ConstantsModule.AvatarSettings.accessoryRefinementTypes]))))
		end
	end
	local AvatarType = State.AvatarExperience.AvatarEditor.Character.AvatarType
	local IsNotAvatarTypeMatch = AvatarType ~= CachedRoduxState.AvatarExperience.AvatarEditor.Character.AvatarType
	
	if IsNotAvatarTypeMatch then
		self:switchAvatarType(AvatarType)
	end
	if FFlagAXMakeupEquipping then
		self.isTryingOnLook = State.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil
		self.isTryingOnMakeupLook = self.isTryingOnLook and State.AvatarExperience.AvatarScene.OutfitTryOn.LookType == ConstantsModule1.LookType.Makeup
	end
	if FFlagAXMISEnableMultiShopping then
		self.isTryingOnMakeupLook = State.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId ~= nil
		self.shouldUnequipAccessoriesAndMakeupBeforeTryOn = State.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems and not self.isTryingOnMakeupLook
	else
		self.shouldUnequipAccessoriesAndMakeupBeforeTryOn = State.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil and not self.isTryingOnMakeupLook
	end
	self.shouldUnequipBodyBeforeTryOn = AvatarWidgetBlockyUtilsModule.shouldUnequipBodyBeforeTryOn(State)
	local IsNotFinalPageViewModeMatch = CachedRoduxState.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode ~= State.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode
	
	if ShouldUpdateHumanoidDescriptionCurrentlyEquipped or ShouldUpdateHumanoidDescriptionTryOnOutfit or IsNotAvatarTypeMatch then
		self:applyHumanoidDescription(ShouldUpdateHumanoidDescriptionCurrentlyEquipped, ShouldUpdateHumanoidDescriptionTryOnOutfit)
	end
	if IsNotFinalPageViewModeMatch or ShouldUpdateHumanoidDescriptionCurrentlyEquipped or ShouldUpdateHumanoidDescriptionTryOnOutfit or IsNotAvatarTypeMatch then
		self.toolManager:update(State)
	end
end

function CharacterManager:updateNoFace(p1)
	-- upvalues: AssetTypeIdStringToHumanoidDescriptionProp (copy), AssetTypeIdStrings (copy), SetCurrentToastMessageModule (copy), CryoModule (copy), config (copy), ConstantsModule1 (copy)
	local Head = self._currentCharacter:FindFirstChild("Head")
	
	if not Head then
		warn("No head was found on the character!")
		
		return
	end
	local AssetTypeIdStringToHumanoidDescriptionPropEntry = AssetTypeIdStringToHumanoidDescriptionProp[AssetTypeIdStrings.Face]
	local LastHumanoidDescriptionAppliedEntry = p1[AssetTypeIdStringToHumanoidDescriptionPropEntry]
	local LastHumanoidDescriptionAppliedEntry1 = self.lastHumanoidDescriptionApplied[AssetTypeIdStringToHumanoidDescriptionPropEntry]
	
	if not Head:FindFirstChildWhichIsA("Decal") and LastHumanoidDescriptionAppliedEntry ~= LastHumanoidDescriptionAppliedEntry1 and LastHumanoidDescriptionAppliedEntry1 ~= 0 then
		self.store:dispatch(SetCurrentToastMessageModule(CryoModule.Dictionary.join(config)))
		local CatalogAnalytics = self.catalogAnalytics
		local LatestAvatarRoute = self.latestAvatarRoute
		
		if CatalogAnalytics and LatestAvatarRoute and LatestAvatarRoute.opaque then
			CatalogAnalytics.sendAXCounterV2(ConstantsModule1.Counter.Toasts.NoFaceHead, { route = LatestAvatarRoute.opaque.name })
		end
	end
end

function CharacterManager:shouldUpdateHumanoidDescriptionCurrentlyEquipped(p1, p2): boolean
	local IsNotAvatarScalesMatch = p1.AvatarExperience.AvatarEditor.Character.AvatarScales ~= p2.AvatarExperience.AvatarEditor.Character.AvatarScales
	local IsNotBodyColorsMatch = p1.AvatarExperience.AvatarEditor.Character.BodyColors ~= p2.AvatarExperience.AvatarEditor.Character.BodyColors
	local IsNotBodyColor3sMatch = p1.AvatarExperience.AvatarEditor.Character.BodyColor3s ~= p2.AvatarExperience.AvatarEditor.Character.BodyColor3s
	
	return p1.AvatarExperience.AvatarEditor.Character.EquippedAssets ~= p2.AvatarExperience.AvatarEditor.Character.EquippedAssets or (IsNotAvatarScalesMatch or (IsNotBodyColorsMatch or IsNotBodyColor3sMatch))
end

function CharacterManager:updateHumanoidDescriptionCurrentlyEquipped(State)
	-- upvalues: Logging (copy), GetFFlagFixCharacterManagerValueConversionWarningModule (copy), CharacterManagerUtilsModule (copy), AssetTypeIdStringToHumanoidDescriptionProp (copy), AssetTypeIdStrings (copy), CryoModule (copy), FFlagAXMakeupEquipping (copy), IsMakeupAssetTypeFunction (copy), ConstantsModule1 (copy), UtilsModule (copy), FFlagFixHeadShapeColorSlider (copy), SetMakeupDescriptionsFunction (copy), HumanoidDescriptionScaleToName (copy), UtilsModule1 (copy)
	local EquippedAssets = State.AvatarExperience.AvatarEditor.Character.EquippedAssets
	local AvatarScales = State.AvatarExperience.AvatarEditor.Character.AvatarScales
	
	if not EquippedAssets then
		Logging.warn("CharacterManager: Equipped assets has not been initialized!")
		
		return
	end
	if GetFFlagFixCharacterManagerValueConversionWarningModule() then
		CharacterManagerUtilsModule.resetHumanoidDescriptionProperties(self.humanoidDescriptionCurrentlyEquipped)
	else
		for _, value in AssetTypeIdStringToHumanoidDescriptionProp do
			self.humanoidDescriptionCurrentlyEquipped[value] = ""
		end
	end
	self.humanoidDescriptionCurrentlyEquipped:SetAccessories({}, true)
	local HumanoidDescriptionAccessoryInfos = {}
	local Flag = false
	local Flag1 = false
	
	if EquippedAssets and (not EquippedAssets[AssetTypeIdStrings.Head] or CryoModule.isEmpty(EquippedAssets[AssetTypeIdStrings.Head])) then
		Flag = true
	elseif EquippedAssets and (not EquippedAssets[AssetTypeIdStrings.DynamicHead] or CryoModule.isEmpty(EquippedAssets[AssetTypeIdStrings.DynamicHead])) then
		Flag1 = true
	end
	for DynamicHead, equippedAsset in EquippedAssets do
		local AssetTypeIdStringToHumanoidDescriptionPropEntry = AssetTypeIdStringToHumanoidDescriptionProp[DynamicHead]
		
		if DynamicHead ~= AssetTypeIdStrings.Gear and (not FFlagAXMakeupEquipping or not IsMakeupAssetTypeFunction(DynamicHead)) then
			if not ConstantsModule1.AssetTypeIdToAccessoryTypeEnum[DynamicHead] then
				if AssetTypeIdStringToHumanoidDescriptionPropEntry and (DynamicHead ~= AssetTypeIdStrings.Head or not Flag) and (DynamicHead ~= AssetTypeIdStrings.DynamicHead or not Flag1) then
					local KeysResult = CryoModule.Dictionary.keys(equippedAsset)
					
					if #KeysResult == 0 then
						self.humanoidDescriptionCurrentlyEquipped[AssetTypeIdStringToHumanoidDescriptionPropEntry] = 0
						continue
					elseif FFlagFixHeadShapeColorSlider and DynamicHead == ConstantsModule1.AssetTypeIdStrings.DynamicHead then
						CharacterManagerUtilsModule.applyHeadShapeFromAssetMetadata(self.humanoidDescriptionCurrentlyEquipped, equippedAsset)
					else
						self.humanoidDescriptionCurrentlyEquipped[AssetTypeIdStringToHumanoidDescriptionPropEntry] = table.concat(KeysResult, ",")
					end
					continue
				end
				continue
			end
			for i, value1 in equippedAsset do
				table.insert(HumanoidDescriptionAccessoryInfos, UtilsModule.createHumanoidDescriptionAccessoryInfo(DynamicHead, i, value1))
			end
		end
	end
	self.humanoidDescriptionCurrentlyEquipped:SetAccessories(HumanoidDescriptionAccessoryInfos, true)
	
	if FFlagAXMakeupEquipping then
		SetMakeupDescriptionsFunction(self.humanoidDescriptionCurrentlyEquipped, EquippedAssets)
	end
	for i1, avatarScale in AvatarScales do
		self.humanoidDescriptionCurrentlyEquipped[HumanoidDescriptionScaleToName[i1]] = avatarScale
	end
	self.checkBodyColors = true
	
	if self.overrideBodyColor3s then
		UtilsModule1.setHumanoidDescriptionColorsFromBodyColor3s(self.humanoidDescriptionCurrentlyEquipped, self.overrideBodyColor3s)
		
		return
	else
		UtilsModule1.setHumanoidDescriptionColorsFromCharacter(self.humanoidDescriptionCurrentlyEquipped, State.AvatarExperience)
	end
end

function CharacterManager:shouldUpdateHumanoidDescriptionTryOnOutfit(p1, p2): boolean
	-- upvalues: UtilsModule (copy), SelectLastTryOnClassicHeadShapeModule (copy), SelectDefaultTryOnBodyColorsToggledModule (copy)
	if self.latestAvatarRoute then
		if UtilsModule.routeIsProfilePictureEditor(self.latestAvatarRoute) then
			if not self.firstCallinPPE then
				return false
			end
			self.firstCallinPPE = false
		else
			self.firstCallinPPE = true
		end
	end
	local IsNotTryOnItemsMatch = p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems ~= p2.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	local IsNotCurrentSortMatch = p1.AvatarExperience.LayeredClothingSort.CurrentSort ~= p2.AvatarExperience.LayeredClothingSort.CurrentSort
	local IsNotSelectLastTryOnClassicHeadShapeModuleResultMatch = SelectLastTryOnClassicHeadShapeModule(p1) ~= SelectLastTryOnClassicHeadShapeModule(p2)
	
	if not self.initialTryOnApplied then
		IsNotTryOnItemsMatch = true
		self.initialTryOnApplied = true
	end
	return if IsNotTryOnItemsMatch or IsNotCurrentSortMatch or IsNotSelectLastTryOnClassicHeadShapeModuleResultMatch then true else p1.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s ~= p2.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s or SelectDefaultTryOnBodyColorsToggledModule(p1) ~= SelectDefaultTryOnBodyColorsToggledModule(p2)
end

function CharacterManager:setAccessoriesForTryOn(Humanoid: Humanoid)
	-- upvalues: ConstantsModule1 (copy), AssetTypeToAssetCategory (copy), FFlagAXMakeupEquipping (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy), AssetTypeIdStrings (copy), CharacterManagerUtilsModule (copy), AXRemoveDynamicHeadAssetsFromTryOn (copy), CryoModule (copy)
	local Accessories = Humanoid:GetAccessories(true)
	local Accessories1 = self.humanoidDescriptionTryOn:GetAccessories(true)
	local RemovedList = self.store:getState().AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList
	local t = {}
	local t1 = {}
	
	for _, value in Accessories1 do
		local AssetTypeToAssetCategoryEntry = AssetTypeToAssetCategory[ConstantsModule1.AccessoryTypeEnumToAssetTypeId[value.AccessoryType]]
		t[value.AccessoryType] = true
		
		if AssetTypeToAssetCategoryEntry then
			t1[AssetTypeToAssetCategoryEntry] = true
		end
	end
	for _, value1 in RemovedList do
		if not FFlagAXMakeupEquipping or not ASSETTYPEIDSTRINGTOMAKEUPTYPE[value1] then
			local AssetTypeToAssetCategoryEntry = AssetTypeToAssetCategory[value1]
			t[ConstantsModule1.AssetTypeIdToAccessoryTypeEnum[value1]] = true
			
			if AssetTypeToAssetCategoryEntry then
				t1[AssetTypeToAssetCategoryEntry] = true
			end
		end
	end
	if FFlagAXMakeupEquipping and self.isTryingOnMakeupLook then
		t[ConstantsModule1.AssetTypeIdToAccessoryTypeEnum[AssetTypeIdStrings.EyebrowAccessory]] = true
		t[ConstantsModule1.AssetTypeIdToAccessoryTypeEnum[AssetTypeIdStrings.EyelashAccessory]] = true
	end
	for _, accessory in Accessories do
		local AccessoryTypeEnumToAssetTypeIdEntry = ConstantsModule1.AccessoryTypeEnumToAssetTypeId[accessory.AccessoryType]
		local Inverted = not t[accessory.AccessoryType]
		local AssetTypeToAssetCategoryEntry = AssetTypeToAssetCategory[AccessoryTypeEnumToAssetTypeIdEntry]
		
		if AssetTypeToAssetCategoryEntry then
			Inverted = not t1[AssetTypeToAssetCategoryEntry]
		end
		if CharacterManagerUtilsModule.isDHBundleTryOn(self.store:getState()) and ConstantsModule1.DynamicHeadAssetTypes[AccessoryTypeEnumToAssetTypeIdEntry] then
			Inverted = false
		end
		if Inverted then
			table.insert(Accessories1, accessory)
		end
	end
	if AXRemoveDynamicHeadAssetsFromTryOn and CharacterManagerUtilsModule.isClassicHeadOrClassicFaceTryOn(self.store:getState()) then
		Accessories1 = CryoModule.List.filter(Accessories1, function(p1): boolean
			-- upvalues: ConstantsModule1 (upval)
			return not ConstantsModule1.DynamicHeadAssetTypes[ConstantsModule1.AccessoryTypeEnumToAssetTypeId[p1.AccessoryType]]
		end)
	end
	Humanoid:SetAccessories(Accessories1, true)
end

function CharacterManager:getTryOnsBundleOutfitInfo()
	-- upvalues: ConstantsModule1 (copy), UtilsModule (copy)
	local State = self.store:getState()
	local OutfitInfoFromBundleId = nil
	
	for _, tryOnItem in State.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
		if tryOnItem.itemType == ConstantsModule1.ItemType.Bundle and tryOnItem.itemSubType == ConstantsModule1.BundleTypeIdStrings.BodyParts then
			OutfitInfoFromBundleId = UtilsModule.getOutfitInfoFromBundleId(State, tryOnItem.itemId)
			
			if OutfitInfoFromBundleId then
				return OutfitInfoFromBundleId
			end
		end
	end
	return nil
end

function CharacterManager:makeupAssetsTryOn(Parent, Parent1)
	-- upvalues: GetMakeupDescriptionsFromHumanoidDescriptionFunction (copy), CryoModule (copy), GetTryOnItemReducerKeyFunction (copy), ConstantsModule1 (copy), MAXMAKEUPLAYERS (copy), DestroyMakeupDescriptionsFunction (copy)
	local MakeupDescriptionsFromHumanoidDescription = GetMakeupDescriptionsFromHumanoidDescriptionFunction(Parent1)
	
	if #MakeupDescriptionsFromHumanoidDescription == 0 then return end
	local State1 = self.store:getState()
	local TryOnItems = State1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	local MakeupDescriptionsFromHumanoidDescription1 = GetMakeupDescriptionsFromHumanoidDescriptionFunction(Parent)
	
	if State1.AvatarExperience.LayeredClothingSort and State1.AvatarExperience.LayeredClothingSort.CurrentSort and #State1.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList > 0 then
		local OrderedList = State1.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList
		MakeupDescriptionsFromHumanoidDescription1 = CryoModule.List.filter(MakeupDescriptionsFromHumanoidDescription1, function(p1): boolean
			-- upvalues: OrderedList (copy)
			for _, value in OrderedList do
				if tostring(value.id) == tostring(p1.AssetId) then
					return true
				end
			end
			return false
		end)
	end
	table.sort(MakeupDescriptionsFromHumanoidDescription1, function(A, B): boolean
		return A.Order < B.Order
	end)
	local t = {}
	
	for _, value in MakeupDescriptionsFromHumanoidDescription1 do
		t[value.AssetId] = true
	end
	local List = {}
	
	for _, value1 in MakeupDescriptionsFromHumanoidDescription do
		if not t[value1.AssetId] then
			local TryOnItem = TryOnItems[GetTryOnItemReducerKeyFunction(tostring(value1.AssetId), ConstantsModule1.ItemType.Asset)]
			value1.Order = if TryOnItem then TryOnItem.order else MAXMAKEUPLAYERS
			table.insert(List, value1)
		end
	end
	local MakeupDescriptionsFromHumanoidDescription2 = if #MakeupDescriptionsFromHumanoidDescription1 + #List <= MAXMAKEUPLAYERS then MakeupDescriptionsFromHumanoidDescription1 else {
		table.unpack(MakeupDescriptionsFromHumanoidDescription1, #MakeupDescriptionsFromHumanoidDescription1 + #List - MAXMAKEUPLAYERS + 1)
	}
	for _, value2 in List do
		table.insert(MakeupDescriptionsFromHumanoidDescription2, value2)
	end
	table.sort(MakeupDescriptionsFromHumanoidDescription2, function(A, B): boolean
		-- upvalues: GetTryOnItemReducerKeyFunction (upval), ConstantsModule1 (upval), TryOnItems (copy)
		if A.Order == B.Order then
			local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(tostring(A.AssetId), ConstantsModule1.ItemType.Asset)
			local TryOnItemReducerKey1 = GetTryOnItemReducerKeyFunction(tostring(B.AssetId), ConstantsModule1.ItemType.Asset)
			
			return not TryOnItems[TryOnItemReducerKey] or (if TryOnItems[TryOnItemReducerKey1] then TryOnItems[TryOnItemReducerKey].itemRecency < TryOnItems[TryOnItemReducerKey1].itemRecency else false)
		else
			return A.Order < B.Order
		end
	end)
	local List1 = {}
	
	for _, value3 in MakeupDescriptionsFromHumanoidDescription2 do
		table.insert(List1, value3:Clone())
	end
	DestroyMakeupDescriptionsFunction(Parent)
	
	for i, value4 in List1 do
		value4.Order = i - 1
		value4.Parent = Parent
	end
end

function CharacterManager:singleMakeupAssetTryOn(Parent, Parent1)
	-- upvalues: FFlagAXMakeupEquipping (copy), GetMakeupDescriptionsFromHumanoidDescriptionFunction (copy), GetTryOnItemReducerKeyFunction (copy), ConstantsModule1 (copy), MAXMAKEUPLAYERS (copy), DestroyMakeupDescriptionsFunction (copy)
	if not FFlagAXMakeupEquipping then return end
	local MakeupDescriptionsFromHumanoidDescriptionEntry = GetMakeupDescriptionsFromHumanoidDescriptionFunction(Parent1)[1]
	
	if not MakeupDescriptionsFromHumanoidDescriptionEntry then return end
	local TryOnItem = self.store:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems[GetTryOnItemReducerKeyFunction(tostring(MakeupDescriptionsFromHumanoidDescriptionEntry.AssetId), ConstantsModule1.ItemType.Asset)]
	local MakeupDescriptionsFromHumanoidDescription = GetMakeupDescriptionsFromHumanoidDescriptionFunction(Parent)
	table.sort(MakeupDescriptionsFromHumanoidDescription, function(A, B): boolean
		return A.Order < B.Order
	end)
	
	for _, value in MakeupDescriptionsFromHumanoidDescription do
		if value.AssetId == MakeupDescriptionsFromHumanoidDescriptionEntry.AssetId then return end
	end
	local MakeupDescriptionsFromHumanoidDescription1 = nil
	if #MakeupDescriptionsFromHumanoidDescription < MAXMAKEUPLAYERS then
		MakeupDescriptionsFromHumanoidDescription1 = MakeupDescriptionsFromHumanoidDescription
	else
		table.remove(MakeupDescriptionsFromHumanoidDescription, 1)
		MakeupDescriptionsFromHumanoidDescription1 = MakeupDescriptionsFromHumanoidDescription
	end
	local Order = if TryOnItem then TryOnItem.order else nil
	local CountMakeupDescriptionsFromHumanoidDescription1 = #MakeupDescriptionsFromHumanoidDescription1
	local CountMakeupDescriptionsFromHumanoidDescription: number = if Order == nil then CountMakeupDescriptionsFromHumanoidDescription1 else math.max(0, (math.min(Order, CountMakeupDescriptionsFromHumanoidDescription1)))
	local List = {}
	
	for _, value1 in MakeupDescriptionsFromHumanoidDescription1 do
		table.insert(List, value1:Clone())
	end
	table.insert(List, CountMakeupDescriptionsFromHumanoidDescription + 1, MakeupDescriptionsFromHumanoidDescriptionEntry)
	DestroyMakeupDescriptionsFunction(Parent)
	
	for i, value2 in List do
		value2.Order = i - 1
		value2.Parent = Parent
	end
end

function CharacterManager:lookMakeupTryOn(Parent, p1)
	-- upvalues: FFlagAXMakeupEquipping (copy), DestroyMakeupDescriptionsFunction (copy), GetMakeupDescriptionsFromHumanoidDescriptionFunction (copy)
	if not FFlagAXMakeupEquipping then return end
	DestroyMakeupDescriptionsFunction(Parent)
	
	for _, value in GetMakeupDescriptionsFromHumanoidDescriptionFunction(p1) do
		value:Clone().Parent = Parent
	end
end

function CharacterManager:combineTryOnMakeupDescriptionsWithEquipped(Parent, HumanoidDescriptionTryOn)
	-- upvalues: FFlagAXMakeupEquipping (copy), FFlagAXMakeupFixAvatarLooksTryOn (copy), CharacterManagerUtilsModule (copy), FFlagAXMISEnableMultiShopping (copy)
	if not FFlagAXMakeupEquipping then return end
	if FFlagAXMakeupFixAvatarLooksTryOn and self.isTryingOnLook or self.isTryingOnMakeupLook then
		CharacterManagerUtilsModule.lookMakeupTryOn(Parent, HumanoidDescriptionTryOn)
		
		return
	end
	if FFlagAXMISEnableMultiShopping then
		CharacterManagerUtilsModule.makeupAssetsTryOn(self.store:getState(), Parent, HumanoidDescriptionTryOn)
		
		return
	else
		CharacterManagerUtilsModule.singleMakeupAssetTryOn(self.store:getState(), Parent, HumanoidDescriptionTryOn)
	end
end

function CharacterManager:combineOutfitTryOnAndEquippedHumanoidDescriptions()
	-- upvalues: FFlagAXCatalogMakeupSupport (copy), DestroyMakeupDescriptionsFunction (copy), AssetTypeIdStringToHumanoidDescriptionProp (copy), ConstantsModule1 (copy), FFlagAXMakeupEquipping (copy), AXFixTryOnDefaultClothing (copy), HumanoidDescriptionScaleToName (copy), CharacterManagerUtilsModule (copy), FFlagEnableHeadShapeForCharacterManager (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), AvatarEditorService (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule2 (copy), AXCheckApplyDefaultClothingErrorGuards (copy), MutedErrorModule (copy)
	local HumanoidDescriptionCurrentlyEquipped = nil
	local TryOnsBundleOutfitInfo = self:getTryOnsBundleOutfitInfo()
	HumanoidDescriptionCurrentlyEquipped = self.humanoidDescriptionCurrentlyEquipped:Clone()
	
	if self.shouldUnequipAccessoriesAndMakeupBeforeTryOn then
		HumanoidDescriptionCurrentlyEquipped:SetAccessories({}, true)
		HumanoidDescriptionCurrentlyEquipped.GraphicTShirt = 0
		HumanoidDescriptionCurrentlyEquipped.Shirt = 0
		HumanoidDescriptionCurrentlyEquipped.Pants = 0
		
		if FFlagAXCatalogMakeupSupport then
			DestroyMakeupDescriptionsFunction(HumanoidDescriptionCurrentlyEquipped)
		end
	end
	for i, value in AssetTypeIdStringToHumanoidDescriptionProp do
		if ConstantsModule1.AssetTypeIdToCategory[i] == ConstantsModule1.AssetCategories.Body and self.shouldUnequipBodyBeforeTryOn then
			HumanoidDescriptionCurrentlyEquipped[value] = 0
		end
		local AssetTypeIdToAccessoryTypeEnumEntry = ConstantsModule1.AssetTypeIdToAccessoryTypeEnum[i]
		
		if not AssetTypeIdToAccessoryTypeEnumEntry then
			local HumanoidDescriptionTryOnEntry = self.humanoidDescriptionTryOn[value]
			AssetTypeIdToAccessoryTypeEnumEntry = HumanoidDescriptionTryOnEntry == "" or HumanoidDescriptionTryOnEntry == 0
		end
		if not AssetTypeIdToAccessoryTypeEnumEntry then
			HumanoidDescriptionCurrentlyEquipped[value] = self.humanoidDescriptionTryOn[value]
		end
	end
	self:setAccessoriesForTryOn(HumanoidDescriptionCurrentlyEquipped)
	
	if FFlagAXMakeupEquipping then
		self:combineTryOnMakeupDescriptionsWithEquipped(HumanoidDescriptionCurrentlyEquipped, self.humanoidDescriptionTryOn)
	end
	if AXFixTryOnDefaultClothing then
		if TryOnsBundleOutfitInfo then
			for i1, scale in TryOnsBundleOutfitInfo.scales do
				HumanoidDescriptionCurrentlyEquipped[HumanoidDescriptionScaleToName[i1]] = scale
			end
		end
		CharacterManagerUtilsModule.setAvatarTryOnProperties(HumanoidDescriptionCurrentlyEquipped, self.store:getState())
		
		if FFlagEnableHeadShapeForCharacterManager then
			CharacterManagerUtilsModule.applyHeadShapeToHumanoidDescription(HumanoidDescriptionCurrentlyEquipped, self.store:getState())
		end
	end
	local CheckApplyDefaultClothingAsyncResult = nil
	
	if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
		local Success, Result = pcall(function()
			-- upvalues: AvatarEditorService (upval), HumanoidDescriptionCurrentlyEquipped (ref)
			return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:CheckApplyDefaultClothingAsync(HumanoidDescriptionCurrentlyEquipped) else AvatarEditorService:CheckApplyDefaultClothing(HumanoidDescriptionCurrentlyEquipped)
		end)
		
		if Success then
			CheckApplyDefaultClothingAsyncResult = Result
		else
			ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule2.Counter.AvatarEditorServiceErrors.CheckApplyDefaultClothing)
			
			if AXCheckApplyDefaultClothingErrorGuards then
				MutedErrorModule(Result)
				CheckApplyDefaultClothingAsyncResult = nil
			else
				error(Result)
			end
		end
	else
		CheckApplyDefaultClothingAsyncResult = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:CheckApplyDefaultClothingAsync(HumanoidDescriptionCurrentlyEquipped) else AvatarEditorService:CheckApplyDefaultClothing(HumanoidDescriptionCurrentlyEquipped)
	end
	HumanoidDescriptionCurrentlyEquipped = CheckApplyDefaultClothingAsyncResult or HumanoidDescriptionCurrentlyEquipped
	
	if not AXFixTryOnDefaultClothing then
		if TryOnsBundleOutfitInfo then
			for i2, scale1 in TryOnsBundleOutfitInfo.scales do
				HumanoidDescriptionCurrentlyEquipped[HumanoidDescriptionScaleToName[i2]] = scale1
			end
		end
		CharacterManagerUtilsModule.setAvatarTryOnProperties(HumanoidDescriptionCurrentlyEquipped, self.store:getState())
		
		if FFlagEnableHeadShapeForCharacterManager then
			CharacterManagerUtilsModule.applyHeadShapeToHumanoidDescription(HumanoidDescriptionCurrentlyEquipped, self.store:getState())
		end
	end
	return HumanoidDescriptionCurrentlyEquipped
end

function CharacterManager:finishApplyDescription(p2, p3, p4, LastHumanoidDescriptionApplied)
	-- upvalues: AxLoadtime (copy), Text (copy), IncrementCharacterModelVersionModule (copy), IncrementTryOnCharacterModelVersionModule (copy), UtilsModule (copy), MutedErrorModule (copy)
	if self.initialHumanoidDescriptionApplied and not p4 then
		self:updateNoFace(LastHumanoidDescriptionApplied)
	end
	if not self.initialHumanoidDescriptionApplied then
		local ScaledCurrentTime = (tick() - self.startAvatarModelLoadTime) * 1000
		AxLoadtime:info("Avatar model load time: {} ms", ScaledCurrentTime)
		self.analytics.Diag:reportStats(Text, ScaledCurrentTime)
	end
	if self.characterModelPool:isR15() then
		self:adjustHeightToStandOnPlatform(self._currentCharacter)
	end
	if p2 then
		self.store:dispatch(IncrementCharacterModelVersionModule())
	elseif p3 then
		self.store:dispatch(IncrementTryOnCharacterModelVersionModule())
	end
	self.initialHumanoidDescriptionApplied = true
	
	if self._currentCharacter then
		local BoundingCFrame, BoundingSize = self._currentCharacter:GetBoundingBox()
		
		if not UtilsModule.isBoundingBoxVectorSane(BoundingSize) or not UtilsModule.isBoundingBoxCFrameSane(BoundingCFrame) then
			local NewAssetIdsWithGeometry = UtilsModule.calculateNewAssetIdsWithGeometry(LastHumanoidDescriptionApplied, self.lastHumanoidDescriptionApplied)
			
			if #NewAssetIdsWithGeometry > 0 then
				MutedErrorModule("(Avatar Experience) bad bounding box on adding assetIds: " .. table.concat(NewAssetIdsWithGeometry, ","))
			end
		end
	end
end

function CharacterManager:getCurrentCharacter()
	return self._currentCharacter
end

function CharacterManager:applyHumanoidDescription(ShouldUpdateHumanoidDescriptionCurrentlyEquipped, ShouldUpdateHumanoidDescriptionTryOnOutfit)
	-- upvalues: ArgCheckModule (copy), isHumanoidDescriptionEmpty (copy), IncrementCharacterVersionModule (copy), UpdateCharacterModule (copy), FinishedWaitingOnLCUpdateModule (copy)
	ArgCheckModule.assert(self.modelInitialized, "applyHumanoidDescription called before initializeModel")
	task.spawn(function()
		-- upvalues: self (copy), ShouldUpdateHumanoidDescriptionTryOnOutfit (copy), isHumanoidDescriptionEmpty (upval), IncrementCharacterVersionModule (upval), UpdateCharacterModule (upval), FinishedWaitingOnLCUpdateModule (upval), ShouldUpdateHumanoidDescriptionCurrentlyEquipped (copy)
		if not self.destroyed and self._currentCharacter:IsDescendantOf(game) then
			local LastHumanoidDescriptionApplied = self.lastHumanoidDescriptionApplied
			local CombineOutfitTryOnAndEquippedHumanoidDescriptionsResult = self:combineOutfitTryOnAndEquippedHumanoidDescriptions()
			self.checkBodyColors = false
			local IsHumanoidDescriptionEmpty = ShouldUpdateHumanoidDescriptionTryOnOutfit and isHumanoidDescriptionEmpty(self.humanoidDescriptionTryOn)
			self.characterModelPool:maybeUpdateCharacter(CombineOutfitTryOnAndEquippedHumanoidDescriptionsResult):andThen(function(Result, p2)
				-- upvalues: self (upval), IncrementCharacterVersionModule (upval), UpdateCharacterModule (upval), FinishedWaitingOnLCUpdateModule (upval), CombineOutfitTryOnAndEquippedHumanoidDescriptionsResult (copy), ShouldUpdateHumanoidDescriptionCurrentlyEquipped (upval), ShouldUpdateHumanoidDescriptionTryOnOutfit (upval), IsHumanoidDescriptionEmpty (copy), LastHumanoidDescriptionApplied (copy)
				self.store:dispatch(IncrementCharacterVersionModule())
				
				if Result ~= self._currentCharacter then
					self.toolManager:unequipTool()
					self._currentCharacter = Result
					self.store:dispatch(UpdateCharacterModule(self._currentCharacter))
					self._currentCharacter.Parent = self.characterRoot
					self.toolManager:checkAndEquipTool()
				end
				if not p2 and self.store:getState().AvatarExperience.AvatarScene.Character.WaitingOnLayeredClothingUpdates then
					self.store:dispatch(FinishedWaitingOnLCUpdateModule())
				end
				self.lastHumanoidDescriptionApplied = CombineOutfitTryOnAndEquippedHumanoidDescriptionsResult
				self:finishApplyDescription(ShouldUpdateHumanoidDescriptionCurrentlyEquipped, ShouldUpdateHumanoidDescriptionTryOnOutfit, IsHumanoidDescriptionEmpty, LastHumanoidDescriptionApplied)
				self.characterManagerCallbacks.setAppliedDescription(self._currentCharacter.Humanoid.HumanoidDescription)
			end)
			
			return
		end
	end)
end

function CharacterManager:switchAvatarType(AvatarType)
	-- upvalues: UpdateCharacterModule (copy), IncrementCharacterVersionModule (copy)
	self._currentCharacter = self.characterModelPool:switchAvatarType(AvatarType)
	self.store:dispatch(UpdateCharacterModule(self._currentCharacter))
	self.store:dispatch(IncrementCharacterVersionModule())
	self._currentCharacter.Parent = self.characterRoot
	self.toolManager:notifySwitchedAvatarType()
end

function CharacterManager:adjustHeightToStandOnPlatform(Character)
	local HumanoidRootPart = Character.HumanoidRootPart
	local NewY = HumanoidRootPart.Size.y * 0.5 + Character.Humanoid.HipHeight
	local ComponentsResult, _, ComponentsResult3, ComponentsResult4, ComponentsResult5, ComponentsResult6, ComponentsResult7, ComponentsResult8, ComponentsResult9, ComponentsResult10, ComponentsResult11, ComponentsResult12 = HumanoidRootPart.CFrame:components()
	HumanoidRootPart.CFrame = CFrame.new(ComponentsResult, NewY, ComponentsResult3, ComponentsResult4, ComponentsResult5, ComponentsResult6, ComponentsResult7, ComponentsResult8, ComponentsResult9, ComponentsResult10, ComponentsResult11, ComponentsResult12)
end

function CharacterManager:stop()
	-- upvalues: CharacterManagerUtilsModule (copy)
	CharacterManagerUtilsModule.updateHumanoidDescriptionUsingOutfitTryOn(self.store:getState(), self.humanoidDescriptionTryOn)
	self:applyHumanoidDescription(true)
	
	for _, connection in self.connections do
		connection:disconnect()
	end
	self.connections = {}
	self.characterModelPool:stop()
	self.animationManager:stop()
	self.toolManager:stop()
	self.initialTryOnApplied = false
	self.cachedRoduxState = self.store:getState()
end

function CharacterManager:onDestroy()
	-- upvalues: SetCurrentCharacterFunction (copy), IncrementCharacterVersionModule (copy)
	self.humanoidDescriptionCurrentlyEquipped:Destroy()
	self.humanoidDescriptionTryOn:Destroy()
	self.lastHumanoidDescriptionApplied:Destroy()
	self.characterRoot:Destroy()
	self.destroyed = true
	self.animationManager:onDestroy()
	self.toolManager:onDestroy()
	self.characterModelPool:onDestroy()
	self.store:dispatch(SetCurrentCharacterFunction(nil))
	self.store:dispatch(IncrementCharacterVersionModule())
end

function CharacterManager:updateAvatarRoute(LatestAvatarRoute, p2)
	-- upvalues: UtilsModule (copy)
	self.animationManager:updateAvatarRoute(LatestAvatarRoute, p2)
	self.toolManager:updateAvatarRoute(LatestAvatarRoute, p2)
	self.latestAvatarRoute = LatestAvatarRoute
	local RouteIsPPEStaticImagePageResult = UtilsModule.routeIsPPEStaticImagePage(LatestAvatarRoute)
	local RouteIsPPEStaticImagePageResult1 = UtilsModule.routeIsPPEStaticImagePage(p2)
	
	if RouteIsPPEStaticImagePageResult and not RouteIsPPEStaticImagePageResult1 then
		self:freezeParticles()
		self:watchCharacterToFreezeNewParticles()
		
		return
	end
	if RouteIsPPEStaticImagePageResult1 and not RouteIsPPEStaticImagePageResult then
		self:stopWatchingCharacter()
		self:unfreezeParticles()
	end
end

function CharacterManager:watchCharacterToFreezeNewParticles()
	-- upvalues: RunService (copy), ParticleUtility (copy)
	local CurrentCharacter = self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter
	
	if CurrentCharacter then
		self.freezeParticlesCharacterConnection = CurrentCharacter.DescendantAdded:Connect(function(Descendant: Tool)
			-- upvalues: RunService (upval), self (copy), ParticleUtility (upval)
			if Descendant:IsA("Tool") then
				RunService.Heartbeat:Wait()
				self:recursiveFreezeParticles(Descendant)
				ParticleUtility.FastForwardParticles(Descendant)
			end
		end)
	end
end

function CharacterManager:stopWatchingCharacter()
	if self.freezeParticlesCharacterConnection then
		self.freezeParticlesCharacterConnection:Disconnect()
		self.freezeParticlesCharacterConnection = nil
	end
end

function CharacterManager:instanceIsAParticleEffect(Object)
	return Object:IsA("ParticleEmitter") or (Object:IsA("Fire") or (Object:IsA("Smoke") or Object:IsA("Sparkles")))
end

function CharacterManager:recursiveFreezeParticles(CurrentCharacter)
	-- upvalues: ParticleUtility (copy)
	if ParticleUtility.InstanceIsAParticleEffect(CurrentCharacter) then
		self.frozenParticlesToTimeScale[CurrentCharacter] = CurrentCharacter.TimeScale
		CurrentCharacter.TimeScale = 0
	end
	for _, child in CurrentCharacter:GetChildren() do
		self:recursiveFreezeParticles(child)
	end
end

function CharacterManager:freezeParticles()
	self.frozenParticlesToTimeScale = {}
	local CurrentCharacter = self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter
	
	if CurrentCharacter then
		self:recursiveFreezeParticles(CurrentCharacter)
	end
end

function CharacterManager:unfreezeParticles()
	if self.frozenParticlesToTimeScale then
		for i, TimeScale in self.frozenParticlesToTimeScale do
			i.TimeScale = TimeScale
		end
		self.frozenParticlesToTimeScale = {}
	end
end

return CharacterManager
local InsertService = game:GetService("InsertService")
local ContentProvider = game:GetService("ContentProvider")
local CorePackages = game:GetService("CorePackages")
local FaceAnimatorService = game:GetService("FaceAnimatorService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PPEAnimationUtilsModule = require(Modules.AvatarExperience.Common.Managers.PPEAnimationUtils)
local AnimationUtilsModule = require(Modules.AvatarExperience.Common.Managers.AnimationUtils)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local PlayingSwimAnimationFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.PlayingSwimAnimation
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local PromiseModule = require(CorePackages.Packages.Promise)
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local UtilsModule1 = require(Modules.AvatarExperience.Common.Utils)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local DashModule = require(CorePackages.Packages.Dash)
local SelectShouldPlayMoodAnimationsUsingOutfitTryOnModule = require(Modules.AvatarExperience.Common.Selectors.SelectShouldPlayMoodAnimationsUsingOutfitTryOn)
local SelectIsToolEquippedModule = require(Modules.AvatarExperience.Common.Selectors.SelectIsToolEquipped)
local SelectOutfitTryOnMoodAnimationAssetIdModule = require(Modules.AvatarExperience.Common.Selectors.SelectOutfitTryOnMoodAnimationAssetId)
local SelectOutfitTryOnIdleAnimationAssetIdModule = require(Modules.AvatarExperience.Common.Selectors.SelectOutfitTryOnIdleAnimationAssetId)
local SelectOutfitTryOnEmoteAnimationAssetIdModule = require(Modules.AvatarExperience.Common.Selectors.SelectOutfitTryOnEmoteAnimationAssetId)
local PPEThumbnailTypeModule = require(Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AnimationTrackWithConnectionsTypes = require(Modules.AvatarExperience.Common.Managers.AnimationManagerTypes).AnimationTrackWithConnectionsTypes
local AssetTypeIdStrings = ConstantsModule1.AssetTypeIdStrings
local UniversalAppCameraIXPTestModule = require(Modules.AvatarExperience.Flags.UniversalAppCameraIXPTest)
local AxInit = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.init")
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AnimationManager = {}
AnimationManager.__index = AnimationManager

function AnimationManager.new(Store, p1, AvatarRoute)
	-- upvalues: AnimationManager (copy), AnimationUtilsModule (copy), InsertService (copy)
	local t = {}
	setmetatable(t, AnimationManager)
	t.destroyed = false
	t.started = false
	t.store = Store
	t.avatarRoute = AvatarRoute
	t.animationTrackWithConnectionsByType = {}
	t.unresolvedStateTransitions = {}
	t.shouldMoveToNextValidMainBodyAnimation = false
	t.stoppedButNotEndedATWCsByName = {}
	local Animations = AnimationUtilsModule.createR6AnimationFolder()
	local Animations1 = InsertService:LoadLocalAsset("rbxasset://avatar/animations/humanoidR15AnimateChildren.rbxm")
	t.animationTrackNameIndex = 0
	AnimationUtilsModule.createAnimation(Animations1, "Tool", AnimationUtilsModule.DefaultAnimations.R15.TOOL)
	AnimationUtilsModule.createAnimation(AnimationUtilsModule.createStringValue(Animations1, "wave"), "WaveAnim", AnimationUtilsModule.DefaultAnimations.R15.WAVE_EMOTE)
	Animations.Name = "Animations"
	Animations1.Name = "Animations"
	p1:setupAnimations(Animations, Animations1)
	t.currentStateDigest = {}
	t.currentAssetIdsToLoad = {}
	t.currentLoadedAssets = {}
	t.debugLoadAssetsFromFiles = false
	t.stateSummaryAtLastVersionUpdate = { equippedAssetsSummary = {}, outfitTryOnSummary = {} }
	t.equippedAssetsSummaryTriggeringLookAround = {}
	t.outfitTryOnSummaryTriggeringLookAround = {}
	
	return t
end

function AnimationManager:setToolManager(ToolManager)
	self.toolManager = ToolManager
end

function AnimationManager:start()
	-- upvalues: MutedErrorModule (copy), Logging (copy)
	if self.started then
		MutedErrorModule("calling AnimationManager:start when already started")
		
		return
	end
	self.started = true
	self.shouldMoveToNextValidMainBodyAnimation = false
	self:cleanupAllAnimationTracks()
	self.storeChangedConnection = self.store.changed:connect(function(Value, p1)
		-- upvalues: self (copy)
		local AvatarRoute = self.avatarRoute
		self:update(Value, p1, AvatarRoute, AvatarRoute)
	end)
	
	if not self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter then
		Logging.warn("Tried to start AnimationManager without a character!")
		
		return
	end
end

function AnimationManager:stop()
	-- upvalues: MutedErrorModule (copy)
	if not self.started then
		MutedErrorModule("calling AnimationManager:stop when not started")
		
		return
	end
	self.started = false
	
	if self.loadAssetsPromise then
		self.loadAssetsPromise:cancel()
	end
	self:cleanupAllAnimationTracks()
	
	if self.storeChangedConnection then
		self.storeChangedConnection:disconnect()
		self.storeChangedConnection = nil
	end
end

function AnimationManager:onDestroy()
	if self.loadAssetsPromise then
		self.loadAssetsPromise:cancel()
	end
	self.destroyed = true
end

function AnimationManager:updateAvatarRoute(AvatarRoute, p1)
	self.avatarRoute = AvatarRoute
	local State = self.store:getState()
	self:update(State, State, AvatarRoute, p1)
end

function AnimationManager:updateCategorySelection()
	local State = self.store:getState()
	self:update(State, State, self.avatarRoute, self.avatarRoute)
end

function AnimationManager:update(State, State1, AvatarRoute, AvatarRoute1)
	-- upvalues: DashModule (copy), PromiseModule (copy), Logging (copy)
	if State.AvatarExperience.AvatarScene.Character.CurrentCharacter then
		local StateDigest = self:createStateDigest(State, AvatarRoute)
		local StateTransitions = self:createStateTransitions(State, State1, AvatarRoute, AvatarRoute1)
		local AssetIdsToLoad = self:getAssetIdsToLoad(StateDigest, State)
		local ShallowEqualResult = DashModule.shallowEqual(self.currentStateDigest, StateDigest)
		local ShallowEqualResult1 = DashModule.shallowEqual(self.currentAssetIdsToLoad, AssetIdsToLoad)
		self.currentStateDigest = StateDigest
		self.currentAssetIdsToLoad = AssetIdsToLoad
		
		for i, stateTransition in pairs(StateTransitions) do
			if stateTransition then
				self.unresolvedStateTransitions[i] = stateTransition
			end
		end
		local Flag = false
		
		for _, unresolvedStateTransition in pairs(self.unresolvedStateTransitions) do
			if unresolvedStateTransition then
				Flag = true
				break
			end
		end
		if not ShallowEqualResult or not ShallowEqualResult1 or Flag then
			if self.loadAssetsPromise then
				if ShallowEqualResult and ShallowEqualResult1 then
					assert(Flag, "hasUnresolvedTransition should be true")
					
					if self.onUpdateFinished then
						self.onUpdateFinished(StateTransitions, StateDigest, AssetIdsToLoad, nil)
					end
					return
				else
					self.loadAssetsPromise:cancel()
					self.loadAssetsPromise = nil
				end
			end
			assert(self.loadAssetsPromise == nil, "self.loadAssetsPromise should be nil")
			self.loadAssetsPromise = self:makeLoadAssetsPromise(StateDigest, AssetIdsToLoad)
			self.loadAssetsPromise:andThen(function(Result)
				-- upvalues: self (copy), DashModule (upval), StateDigest (copy), AssetIdsToLoad (copy), StateTransitions (copy), PromiseModule (upval)
				self.loadAssetsPromise = nil
				self.currentLoadedAssets = Result
				
				if self.destroyed then return end
				assert(DashModule.shallowEqual(self.currentStateDigest, StateDigest), "stateDigest should match")
				assert(DashModule.shallowEqual(self.currentAssetIdsToLoad, AssetIdsToLoad), "assetIdsToLoad should match")
				self:playLoadedAssets(StateDigest, AssetIdsToLoad, Result)
				
				if self.onUpdateFinished then
					self.onUpdateFinished(StateTransitions, StateDigest, AssetIdsToLoad, Result)
				end
				return PromiseModule.resolve()
			end):catch(function(Err)
				-- upvalues: self (copy), Logging (upval), StateTransitions (copy), StateDigest (copy), AssetIdsToLoad (copy)
				self.loadAssetsPromise = nil
				Logging.warn("Error in loadAssetsPromise: " .. tostring(Err))
				
				if self.onUpdateFinished then
					self.onUpdateFinished(StateTransitions, StateDigest, AssetIdsToLoad, {})
				end
			end)
			
			return
		elseif self.onUpdateFinished then
			self.onUpdateFinished(StateTransitions, StateDigest, AssetIdsToLoad, nil)
		end
		return
	elseif self.onUpdateFinished then
		self.onUpdateFinished(nil, nil, nil, nil)
	end
end

function AnimationManager:createStateTransitions(p1, p2, p3, p4)
	-- upvalues: UtilsModule (copy), AnimationUtilsModule (copy)
	local CurrentCharacter = p1.AvatarExperience.AvatarScene.Character.CurrentCharacter
	local CurrentCharacter1 = p2.AvatarExperience.AvatarScene.Character.CurrentCharacter
	assert(CurrentCharacter, "currentCharacter should be non-nil. Silence type checker.")
	
	return {
		didUpdateCharacter = CurrentCharacter ~= CurrentCharacter1,
		didMoveOutOfPPE = AnimationUtilsModule.getDidMoveOutOfPPE(UtilsModule.routeIsProfilePictureEditor(p4), UtilsModule.routeIsProfilePictureEditor(p3), p3.isVisible),
		didSomethingThatShouldTriggerLookAround = self:getDidSomethingThatShouldTriggerLookAround(CurrentCharacter, p1, p2, p3, p4)
	}
end

function AnimationManager:shouldResumeLookAroundAfterCharacterSwap(IsVisible, p1, CurrentCharacter, EquippedAssetsSummary, OutfitTryOnSummary): boolean
	-- upvalues: AnimationTrackWithConnectionsTypes (copy), AnimationUtilsModule (copy)
	if p1 == CurrentCharacter then
		return false
	end
	if not self:animationTrackWithConnectionsIsPlaying(AnimationTrackWithConnectionsTypes.LookAround) then
		return false
	end
	if self.lookAroundReason == "EnteredAX" and IsVisible then
		return true
	end
	if self.lookAroundReason == "NewEquippedAssets" and AnimationUtilsModule.getEquippedAssetSummariesMatch(EquippedAssetsSummary, self.equippedAssetsSummaryTriggeringLookAround) then
		return true
	end
	if self.lookAroundReason == "NewOutfitTryOn" then
		assert(self.outfitTryOnSummaryTriggeringLookAround, "self.outfitTryOnSummaryTriggeringLookAround should be non-nil")
		
		if AnimationUtilsModule.getOutfitTryOnSummariesMatch(OutfitTryOnSummary, self.outfitTryOnSummaryTriggeringLookAround) then
			return true
		end
	end
	return false
end

function AnimationManager:getDidSomethingThatShouldTriggerLookAround(CurrentCharacter, p1, p2, p3, p4): boolean
	-- upvalues: AnimationUtilsModule (copy), UtilsModule (copy)
	local HumanoidFromCharacter = AnimationUtilsModule.getHumanoidFromCharacter(CurrentCharacter)
	
	if not HumanoidFromCharacter then
		return false
	end
	assert(HumanoidFromCharacter, "humanoid should not be nil. Silence type checker")
	
	if Enum.HumanoidRigType.R15 ~= HumanoidFromCharacter.RigType then
		return false
	end
	if UtilsModule.routeIsProfilePictureEditor(p3) then
		return false
	end
	local IsVisible = p3.isVisible
	local IsVisible1 = p4.isVisible
	
	if IsVisible and not IsVisible1 then
		self.lookAroundReason = "EnteredAX"
		
		return true
	end
	local CurrentCharacter1 = p2.AvatarExperience.AvatarScene.Character.CurrentCharacter
	local EquippedAssetsSummary = AnimationUtilsModule.getEquippedAssetsSummary(p1.AvatarExperience.AvatarEditor.Character.EquippedAssets)
	local OutfitTryOnSummary = AnimationUtilsModule.getOutfitTryOnSummary(p1.AvatarExperience.AvatarScene.OutfitTryOn)
	local EquippedAssetsSummary1 = self.stateSummaryAtLastVersionUpdate.equippedAssetsSummary
	local OutfitTryOnSummary1 = self.stateSummaryAtLastVersionUpdate.outfitTryOnSummary
	
	if p2.AvatarExperience.AvatarScene.Character.CharacterVersion ~= p1.AvatarExperience.AvatarScene.Character.CharacterVersion then
		self.stateSummaryAtLastVersionUpdate.equippedAssetsSummary = EquippedAssetsSummary
		self.stateSummaryAtLastVersionUpdate.outfitTryOnSummary = OutfitTryOnSummary
		
		if AnimationUtilsModule.getEquippedAssetsSummaryHasNewItems(EquippedAssetsSummary, EquippedAssetsSummary1) then
			self.lookAroundReason = "NewEquippedAssets"
			self.equippedAssetsSummaryTriggeringLookAround = EquippedAssetsSummary
			
			return true
		elseif AnimationUtilsModule.getOutfitTryOnSummaryHasNewItems(OutfitTryOnSummary, OutfitTryOnSummary1) then
			self.lookAroundReason = "NewOutfitTryOn"
			self.outfitTryOnSummaryTriggeringLookAround = OutfitTryOnSummary
			
			return true
		end
	end
	return if self:shouldResumeLookAroundAfterCharacterSwap(IsVisible, CurrentCharacter, CurrentCharacter1, EquippedAssetsSummary, OutfitTryOnSummary) then true else false
end

function AnimationManager:createStateDigest(p1, p2)
	-- upvalues: UtilsModule (copy), AnimationUtilsModule (copy), ConstantsModule1 (copy), AvatarScreen (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), ConstantsModule (copy), SelectShouldPlayMoodAnimationsUsingOutfitTryOnModule (copy), PPEThumbnailTypeModule (copy), IxpUtilsModule (copy), UniversalAppCameraIXPTestModule (copy), SelectIsToolEquippedModule (copy)
	local Name = p2.opaque.name
	local CategoryInfoFromState = UtilsModule.getCategoryInfoFromState(p1, p2)
	local AllowsTryingEmotesOrAnimations, AllowsTryingEmotesOrAnimations2 = AnimationUtilsModule.getAllowsTryingEmotesOrAnimations(p1, p2)
	local IsNameMatch: boolean = CategoryInfoFromState.PageType == ConstantsModule1.PageType.Emotes and Name == AvatarScreen.AvatarEditor
	
	if GetFFlagAXEnableSlotBasedEditorModule() then
		IsNameMatch = IsNameMatch or Name == AvatarScreen.EditEmotes
	end
	local IsNameMatch1: boolean = CategoryInfoFromState.PageType == ConstantsModule1.PageType.Animation and Name == AvatarScreen.AvatarEditor
	local IsNameMatch2 = Name == AvatarScreen.AdjustAccessoryView
	local SelectShouldPlayMoodAnimationsUsingOutfitTryOnModuleResult = p1.AvatarExperience.AvatarEditor.Character.AvatarType ~= ConstantsModule.AvatarType.R6 and SelectShouldPlayMoodAnimationsUsingOutfitTryOnModule(p1)
	local RouteIsProfilePictureEditorResult = UtilsModule.routeIsProfilePictureEditor(p2)
	local IsFinalPageViewModeMatch: boolean = RouteIsProfilePictureEditorResult and Name == AvatarScreen.ProfilePictureEditorFinal and p1.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode == PPEThumbnailTypeModule.FullBody or false
	local HasTool = false
	local CurrentCharacter = self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter
	
	if CurrentCharacter and CurrentCharacter:FindFirstChildOfClass("Tool") then
		HasTool = true
	end
	local CanPlayCameraBasedMoodAnimation, CanPlayCameraBasedMoodAnimation2 = AnimationUtilsModule.canPlayCameraBasedMoodAnimation(p1, CategoryInfoFromState.CanAnimateCameraBasedMood == true, AllowsTryingEmotesOrAnimations)
	local TestVariable = IxpUtilsModule.readTestVariable(UniversalAppCameraIXPTestModule.EnabledForUser)
	
	return {
		isInPPE = RouteIsProfilePictureEditorResult,
		isInAX = p2.isVisible,
		toolEquipped = SelectIsToolEquippedModule(p1),
		curCategoryInfo = CategoryInfoFromState,
		isAvatarBackground = UtilsModule.isAvatarBackground(p2.current.name),
		pageAllowsForTryingOnEmotes = AllowsTryingEmotesOrAnimations,
		pageAllowsForTryingOnAnimations = AllowsTryingEmotesOrAnimations2,
		pageHasBothAnimsAndEmotes = AllowsTryingEmotesOrAnimations and AllowsTryingEmotesOrAnimations2,
		pageIsEditorEmotes = IsNameMatch,
		pageIsEditorAnimations = IsNameMatch1,
		excludeIdleAnimation = IsNameMatch2,
		shouldPlayMoodAnimations = SelectShouldPlayMoodAnimationsUsingOutfitTryOnModuleResult,
		canPlayCameraBasedMoodAnimation = if TestVariable then CanPlayCameraBasedMoodAnimation else nil,
		receivedOutfitInfo = if TestVariable then CanPlayCameraBasedMoodAnimation2 else nil,
		ppeFinalPageFullView = IsFinalPageViewModeMatch,
		hasTool = HasTool,
		cameraButtonEnabled = if TestVariable then p1.AvatarExperience.CameraButton.enabled else nil
	}
end

function AnimationManager:getAssetIdsToLoad(StateDigest, p1)
	-- upvalues: PPEAnimationUtilsModule (copy), SelectOutfitTryOnMoodAnimationAssetIdModule (copy), UtilsModule1 (copy)
	if StateDigest.isInPPE then
		return PPEAnimationUtilsModule.getAssetIdsToLoad(p1, StateDigest.shouldPlayMoodAnimations)
	end
	local t = {}
	
	if StateDigest.shouldPlayMoodAnimations then
		local SelectOutfitTryOnMoodAnimationAssetIdModuleResult = SelectOutfitTryOnMoodAnimationAssetIdModule(p1)
		
		if SelectOutfitTryOnMoodAnimationAssetIdModuleResult then
			t.moodAssetId = SelectOutfitTryOnMoodAnimationAssetIdModuleResult
		else
			t.moodAssetId = UtilsModule1.getEquippedMoodAssetId(p1)
		end
	end
	t.mainBodyAssetId = self:getMainBodyAssetId(StateDigest, p1)
	
	return t
end

function AnimationManager:getMainBodyAssetId(StateDigest, p1)
	-- upvalues: ConstantsModule (copy), AnimationUtilsModule (copy)
	if p1.AvatarExperience.AvatarEditor.Character.AvatarType == ConstantsModule.AvatarType.R6 then
		return nil
	end
	if StateDigest.isAvatarBackground then
		return self:getAvatarBackgroundAssetId(p1)
	end
	local TryOnMainBodyAssetId = self:getTryOnMainBodyAssetId(StateDigest, p1)
	
	if TryOnMainBodyAssetId then
		return TryOnMainBodyAssetId
	end
	if StateDigest.pageIsEditorEmotes then
		local Slot = p1.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo[p1.AvatarExperience.AvatarEditor.EquippedEmotes.selectedSlot]
		
		if Slot and Slot.assetId then
			return Slot.assetId
		end
	end
	if StateDigest.pageIsEditorAnimations then
		local AssetTypeIdStringForCategory = AnimationUtilsModule.getAssetTypeIdStringForCategory(StateDigest.curCategoryInfo)
		
		if AssetTypeIdStringForCategory then
			local EquippedAssets = p1.AvatarExperience.AvatarEditor.Character.EquippedAssets
			local EquippedAsset = EquippedAssets and EquippedAssets[AssetTypeIdStringForCategory]
			local NextEntry = EquippedAsset and next(EquippedAsset) or nil
			
			return if NextEntry then NextEntry else nil
		end
	end
	local EquippedIdleAnimation = AnimationUtilsModule.getEquippedIdleAnimation(p1)
	
	return if EquippedIdleAnimation then EquippedIdleAnimation else nil
end

function AnimationManager:getAvatarBackgroundAssetId(p1)
	-- upvalues: AnimationUtilsModule (copy)
	if not p1.AvatarExperience.Common.PlayEmoteInBackground.shouldPlayEmoteInBackground then
		return nil
	end
	for _, value in p1.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo do
		if value.assetId then
			return value.assetId
		end
	end
	local EquippedIdleAnimation = AnimationUtilsModule.getEquippedIdleAnimation(p1)
	
	return if EquippedIdleAnimation then EquippedIdleAnimation else nil
end

function AnimationManager:getTryOnMainBodyAssetId(StateDigest, p2)
	-- upvalues: SelectOutfitTryOnEmoteAnimationAssetIdModule (copy), AssetTypeIdStrings (copy), SelectOutfitTryOnIdleAnimationAssetIdModule (copy)
	local TryOn = p2.AvatarExperience.AvatarScene.TryOn
	local OutfitTryOn = p2.AvatarExperience.AvatarScene.OutfitTryOn
	
	if StateDigest.pageAllowsForTryingOnEmotes then
		local SelectOutfitTryOnEmoteAnimationAssetIdModuleResult = SelectOutfitTryOnEmoteAnimationAssetIdModule(p2)
		
		if SelectOutfitTryOnEmoteAnimationAssetIdModuleResult then
			if not StateDigest.pageHasBothAnimsAndEmotes then
				return SelectOutfitTryOnEmoteAnimationAssetIdModuleResult
			end
			local LastAnimOrEmoteToggledItem = OutfitTryOn.LastAnimOrEmoteToggledItem
			
			if LastAnimOrEmoteToggledItem and LastAnimOrEmoteToggledItem.itemId == SelectOutfitTryOnEmoteAnimationAssetIdModuleResult then
				return SelectOutfitTryOnEmoteAnimationAssetIdModuleResult
			end
		end
	end
	if StateDigest.pageAllowsForTryingOnAnimations and TryOn.AnimationPreview and TryOn.AnimationPreviewAssetTypeIdString ~= AssetTypeIdStrings.EmoteAnimation then
		return TryOn.AnimationPreview
	else
		local SelectOutfitTryOnIdleAnimationAssetIdModuleResult = SelectOutfitTryOnIdleAnimationAssetIdModule(p2)
		
		return if SelectOutfitTryOnIdleAnimationAssetIdModuleResult then SelectOutfitTryOnIdleAnimationAssetIdModuleResult else nil
	end
end

function AnimationManager:getMultiTryOnTriedOnEmote(p2)
	-- upvalues: AssetTypeIdStrings (copy)
	for _, tryOnItem in p2.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
		if tryOnItem.itemSubType == AssetTypeIdStrings.EmoteAnimation then
			return tryOnItem.itemId
		end
	end
	return nil
end

function AnimationManager.makeLoadAssetsPromise(p3, StateDigest, AssetIdsToLoad)
	-- upvalues: PromiseModule (copy), PPEAnimationUtilsModule (copy), AnimationUtilsModule (copy), DashModule (copy), ContentProvider (copy)
	return PromiseModule.new(function(Callback1: (any) -> (), _, Callback: (any) -> ())
		-- upvalues: PPEAnimationUtilsModule (upval), p3 (copy), StateDigest (copy), AssetIdsToLoad (copy), AnimationUtilsModule (upval), DashModule (upval), ContentProvider (upval)
		Callback(function()
			-- upvalues: PPEAnimationUtilsModule (upval), p3 (upval)
			PPEAnimationUtilsModule.maybeNoteLoadingFinished(p3.store)
		end)
		
		if StateDigest.isInPPE then
			Callback1(PPEAnimationUtilsModule.makeLoadedAssets(p3.store, StateDigest, AssetIdsToLoad))
			
			return
		end
		local t = {}
		
		if AssetIdsToLoad.moodAssetId then
			t.moodAnimStringValues = AnimationUtilsModule.loadAnimStringValuesFromString(AssetIdsToLoad.moodAssetId, p3.debugLoadAssetsFromFiles, p3.mapAssetIdToFileName)
		end
		if AssetIdsToLoad.mainBodyAssetId then
			t.mainBodyAnimStringValues = AnimationUtilsModule.loadAnimStringValuesFromString(AssetIdsToLoad.mainBodyAssetId, p3.debugLoadAssetsFromFiles, p3.mapAssetIdToFileName)
		end
		local ContentIdList = {}
		
		if t.moodAnimStringValues then
			DashModule.append(ContentIdList, t.moodAnimStringValues)
		end
		if t.mainBodyAnimStringValues then
			DashModule.append(ContentIdList, t.mainBodyAnimStringValues)
		end
		if #ContentIdList > 0 and not p3.debugLoadAssetsFromFiles then
			ContentProvider:PreloadAsync(ContentIdList)
		end
		Callback1(t)
	end)
end

function AnimationManager:playLoadedAssets(StateDigest, AssetIdsToLoad, CurrentLoadedAssets)
	-- upvalues: AnimationUtilsModule (copy), PPEAnimationUtilsModule (copy), IxpUtilsModule (copy), UniversalAppCameraIXPTestModule (copy)
	if self.unresolvedStateTransitions.didUpdateCharacter then
		self:cleanupAllAnimationTracks()
		self.unresolvedStateTransitions.didUpdateCharacter = false
	end
	if StateDigest.isInPPE then
		self:stopAnimationsAndMaybeProceedWithPPEPosing()
		
		return
	end
	if self.unresolvedStateTransitions.didMoveOutOfPPE then
		local CurrentCharacter = self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter
		PPEAnimationUtilsModule.undoOldProfilePictureEditorPose(self.store, CurrentCharacter, (AnimationUtilsModule.getHumanoidFromCharacter(CurrentCharacter)))
	end
	self.unresolvedStateTransitions.didMoveOutOfPPE = false
	self:updateToolAnimation(StateDigest)
	self:updateMoodAnimation(StateDigest, AssetIdsToLoad, CurrentLoadedAssets)
	
	if IxpUtilsModule.readTestVariable(UniversalAppCameraIXPTestModule.EnabledForUser) then
		self:updateCameraBasedMoodAnimation(StateDigest)
	end
	if self.unresolvedStateTransitions.didSomethingThatShouldTriggerLookAround then
		self:updateMainBodyAnimationAfterPlayingLookAround(StateDigest, AssetIdsToLoad, CurrentLoadedAssets)
	else
		self:updateMainBodyAnimation(StateDigest, AssetIdsToLoad, CurrentLoadedAssets)
	end
	self.unresolvedStateTransitions.didSomethingThatShouldTriggerLookAround = false
end

function AnimationManager:cleanupAllAnimationTracks()
	-- upvalues: AnimationTrackWithConnectionsTypes (copy), AnimationUtilsModule (copy)
	for _, animationTrackWithConnectionsType in pairs(AnimationTrackWithConnectionsTypes) do
		AnimationUtilsModule.cleanupAnimationTrackWithConnections(self.animationTrackWithConnectionsByType[animationTrackWithConnectionsType])
		self.animationTrackWithConnectionsByType[animationTrackWithConnectionsType] = nil
	end
	for _, value in self.stoppedButNotEndedATWCsByName do
		AnimationUtilsModule.cleanupAnimationTrackWithConnections(value)
	end
	self.stoppedButNotEndedATWCsByName = {}
end

function AnimationManager:stopAnimationsAndMaybeProceedWithPPEPosing()
	-- upvalues: AnimationTrackWithConnectionsTypes (copy)
	assert(self.currentStateDigest.isInPPE, "Must be in PPE")
	assert(self.currentStateDigest.isInAX, "Must be in in AX")
	
	for _, animationTrackWithConnectionsType in pairs(AnimationTrackWithConnectionsTypes) do
		self:stopAnimationTrackWithConnections(animationTrackWithConnectionsType, 0.02)
	end
	self:maybeProceedWithPPEPosing()
end

function AnimationManager.maybeProceedWithPPEPosing(p3)
	-- upvalues: AnimationUtilsModule (copy), PPEAnimationUtilsModule (copy)
	local function maybeProceedWithPPEPosingInner()
		-- upvalues: p3 (copy), AnimationUtilsModule (upval), PPEAnimationUtilsModule (upval)
		if not p3.currentStateDigest.isInPPE then return end
		if not p3.currentStateDigest.isInAX then return end
		if p3.loadAssetsPromise then return end
		if p3:animationsAreMovingAvatar() then return end
		local CurrentCharacter = p3.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter
		
		if CurrentCharacter then
			local HumanoidFromCharacter = AnimationUtilsModule.getHumanoidFromCharacter(CurrentCharacter)
			
			if HumanoidFromCharacter then
				PPEAnimationUtilsModule.applyNewProfilePictureEditorPose(p3.store, CurrentCharacter, HumanoidFromCharacter, p3.currentLoadedAssets.keyframesForPose)
			end
		end
	end
	
	AnimationUtilsModule.waitForAnimationAndPosingToResolve(function()
		-- upvalues: maybeProceedWithPPEPosingInner (copy)
		maybeProceedWithPPEPosingInner()
	end)
end

function AnimationManager:animationTrackWithConnectionsIsPlaying(LookAround)
	-- upvalues: AnimationUtilsModule (copy)
	local AnimationTrackWithConnectionsByTypeEntry1 = self.animationTrackWithConnectionsByType[LookAround]
	
	return if AnimationTrackWithConnectionsByTypeEntry1 then AnimationUtilsModule.animationTrackWithConnectionsIsPlaying(AnimationTrackWithConnectionsByTypeEntry1) else false
end

function AnimationManager:animationsAreMovingAvatar(): boolean
	-- upvalues: AnimationTrackWithConnectionsTypes (copy)
	for _, animationTrackWithConnectionsType in pairs(AnimationTrackWithConnectionsTypes) do
		if self:animationTrackWithConnectionsIsPlaying(animationTrackWithConnectionsType) then
			return true
		end
	end
	return if next(self.stoppedButNotEndedATWCsByName) then true else false
end

function AnimationManager:updateToolAnimation(StateDigest)
	-- upvalues: AnimationTrackWithConnectionsTypes (copy), AnimationUtilsModule (copy), UtilsModule1 (copy)
	assert(not StateDigest.isInPPE, "Should not be in PPE")
	
	if not StateDigest.toolEquipped then
		self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.ToolHold)
		
		return
	end
	local CurrentCharacter = self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter
	local Animations = CurrentCharacter.Animations
	local AnimatorLoadAnimationTrackResult = nil
	local AssetIdFromContent = nil
	
	if Animations then
		local Tool = Animations.Tool
		
		if Tool then
			AnimatorLoadAnimationTrackResult = AnimationUtilsModule.animatorLoadAnimationTrack(CurrentCharacter, Tool, self.debugLoadAssetsFromFiles)
			AssetIdFromContent = UtilsModule1.getAssetIdFromContent(Tool.AnimationId)
		end
	end
	if not AssetIdFromContent or not AnimatorLoadAnimationTrackResult then
		self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.ToolHold)
		
		return
	end
	assert(AssetIdFromContent, "newToolAnimationAssetId is not nil. Silence type checker")
	
	if not AnimationUtilsModule.animationTrackWithConnectionsIsPlayingThisAssetId(self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.ToolHold], AssetIdFromContent) then
		self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.ToolHold)
		assert(AnimatorLoadAnimationTrackResult, "toolHoldAnimationTrack is not nil. Silence type checker")
		assert(AssetIdFromContent, "newToolAnimationAssetId should be non-nil")
		local config = { assetId = AssetIdFromContent }
		config.stoppedConnection = AnimatorLoadAnimationTrackResult.Stopped:Connect(function()
			-- upvalues: self (copy), AnimatorLoadAnimationTrackResult (ref), config (copy)
			self:handleStoppedConnection(AnimatorLoadAnimationTrackResult, config)
		end)
		config.endedConnection = AnimatorLoadAnimationTrackResult.Ended:Connect(function()
			-- upvalues: self (copy), AnimatorLoadAnimationTrackResult (ref)
			self:handleEndedConnection(AnimatorLoadAnimationTrackResult)
		end)
		config.animationTrack = AnimatorLoadAnimationTrackResult
		config.animationTrack.Name = self:getNextAnimationTrackName("ToolHold")
		self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.ToolHold] = config
		AnimatorLoadAnimationTrackResult:Play(0.1)
		self:recordAnimationTrackProgress(config.animationTrack.Name, "Playing")
		
		return
	end
end

function AnimationManager:updateMoodAnimation(p3, p4, p5)
	-- upvalues: AnimationTrackWithConnectionsTypes (copy), AnimationUtilsModule (copy)
	assert(not p3.isInPPE, "Should not be in PPE")
	
	if p4.moodAssetId == nil or p5.moodAnimStringValues == nil then
		self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.Mood)
		
		return
	end
	assert(p4.moodAssetId, "assetIdsToLoad.moodAssetId is non-nil. Silence type checker")
	assert(p5.moodAnimStringValues, "loadedAssets.moodAnimStringValues is non-nil. Silence type checker")
	
	if AnimationUtilsModule.animationTrackWithConnectionsIsPlayingThisAssetId(self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.Mood], p4.moodAssetId) then return end
	self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.Mood)
	assert(p5.moodAnimStringValues, "loadedAssets.moodAnimStringValues is not nil.  Silences type checker")
	local AnimatorLoadAnimationTrackResult = nil
	local Children = if p5.moodAnimStringValues[1] then p5.moodAnimStringValues[1]:GetChildren() else nil
	
	if Children then
		local Child = Children[1]
		
		if Child then
			assert(Child.ClassName == "Animation", "moodAnim should be an animation.")
			AnimatorLoadAnimationTrackResult = AnimationUtilsModule.animatorLoadAnimationTrack(self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter, Child, self.debugLoadAssetsFromFiles)
		end
	end
	if AnimatorLoadAnimationTrackResult then
		assert(AnimatorLoadAnimationTrackResult, "moodAnimationTrack is not nil. Silences type checker")
		local config = { assetId = p4.moodAssetId }
		config.stoppedConnection = AnimatorLoadAnimationTrackResult.Stopped:Connect(function()
			-- upvalues: self (copy), AnimatorLoadAnimationTrackResult (ref), config (copy)
			self:handleStoppedConnection(AnimatorLoadAnimationTrackResult, config)
		end)
		config.endedConnection = AnimatorLoadAnimationTrackResult.Ended:Connect(function()
			-- upvalues: self (copy), AnimatorLoadAnimationTrackResult (ref)
			self:handleEndedConnection(AnimatorLoadAnimationTrackResult)
		end)
		config.animationTrack = AnimatorLoadAnimationTrackResult
		config.animationTrack.Name = self:getNextAnimationTrackName("Mood")
		assert(self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.Mood] == nil, "self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.Mood] should be empty")
		self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.Mood] = config
		AnimatorLoadAnimationTrackResult:Play()
		self:recordAnimationTrackProgress(config.animationTrack.Name, "Playing")
		
		return
	end
end

function AnimationManager:updateCameraBasedMoodAnimation(StateDigest)
	-- upvalues: AnimationTrackWithConnectionsTypes (copy), FaceAnimatorService (copy), AnimationUtilsModule (copy)
	assert(not StateDigest.isInPPE, "Should not be in PPE")
	local AnimationTrackWithConnectionsByTypeEntry = self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.CameraStream]
	
	if not StateDigest.cameraButtonEnabled then
		self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.CameraStream)
		FaceAnimatorService:Stop()
		
		return
	end
	if AnimationTrackWithConnectionsByTypeEntry then
		if StateDigest.receivedOutfitInfo and not StateDigest.canPlayCameraBasedMoodAnimation then
			AnimationUtilsModule.adjustATWCWeight(AnimationTrackWithConnectionsByTypeEntry, 0.0001)
			
			return
		end
		if AnimationUtilsModule.animationTrackWithConnectionsIsPlaying(AnimationTrackWithConnectionsByTypeEntry) then
			AnimationUtilsModule.adjustATWCWeight(AnimationTrackWithConnectionsByTypeEntry, 1)
			
			return
		end
	end
	self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.CameraStream)
	local t = {}
	local AnimatorLoadTrackerStreamAnimationTrackResult = AnimationUtilsModule.animatorLoadTrackerStreamAnimationTrack(self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter, Instance.new("TrackerStreamAnimation"), self.debugLoadAssetsFromFiles)
	assert(AnimatorLoadTrackerStreamAnimationTrackResult, "cameraBasedMoodAnimationTrack is not nil. If it is ever nil, it should be investigated if a dependent flag is missing")
	t.animationTrack = AnimatorLoadTrackerStreamAnimationTrackResult
	t.animationTrack.Name = self:getNextAnimationTrackName("CameraBasedMoodAnimation")
	t.stoppedConnection = AnimatorLoadTrackerStreamAnimationTrackResult.Stopped:Connect(function()
		-- upvalues: self (copy), AnimatorLoadTrackerStreamAnimationTrackResult (copy), t (copy)
		self:handleStoppedConnection(AnimatorLoadTrackerStreamAnimationTrackResult, t)
		self:handleEndedConnection(AnimatorLoadTrackerStreamAnimationTrackResult)
	end)
	AnimatorLoadTrackerStreamAnimationTrackResult.Priority = Enum.AnimationPriority.Action4
	assert(self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.CameraStream] == nil, "self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.CameraStream] should be empty")
	self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.CameraStream] = t
	AnimatorLoadTrackerStreamAnimationTrackResult:Play()
	self:recordAnimationTrackProgress(t.animationTrack.Name, "Playing")
	
	if StateDigest.receivedOutfitInfo and not StateDigest.canPlayCameraBasedMoodAnimation then
		AnimationUtilsModule.adjustATWCWeight(t, 0.0001)
	end
end

function AnimationManager:updateMainBodyAnimationAfterPlayingLookAround(p3, p4, p5)
	-- upvalues: AnimationUtilsModule (copy), AnimationTrackWithConnectionsTypes (copy)
	assert(not p3.isInPPE, "Should not be in PPE")
	local MainBodyAnimStringValues = p5.mainBodyAnimStringValues
	local MainBodyAssetId = p4.mainBodyAssetId
	
	if not MainBodyAnimStringValues then
		MainBodyAnimStringValues, MainBodyAssetId = self:getFallbackMainBodyAnimStringValuesAndMockAssetId(p3)
	end
	local AnimationTrack = nil
	
	if MainBodyAnimStringValues then
		local WeightedAnimations, _ = AnimationUtilsModule.getWeightedAnimations(AnimationUtilsModule.convertToAnimations(MainBodyAnimStringValues[1]:GetChildren()))
		local v1 = nil
		local v2 = nil
		
		for i, value in next, WeightedAnimations do
			if v1 == nil or value < v2 then
				v1 = i
				v2 = value
			end
		end
		if v1 then
			AnimationTrack = AnimationUtilsModule.animatorLoadAnimationTrack(self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter, v1, self.debugLoadAssetsFromFiles)
		end
	end
	if not AnimationTrack or not MainBodyAssetId then
		self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.LookAround)
		self:updateMainBodyAnimation(p3, p4, p5)
		
		return
	end
	assert(AnimationTrack, "lookAroundTrack is not nil. Silences type checker")
	assert(MainBodyAssetId, "assetId is not nil. Silences type checker")
	
	if not AnimationUtilsModule.animationTrackWithConnectionsIsPlayingThisAssetId(self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.LookAround], MainBodyAssetId) then
		self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.LookAround)
		self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.MainBody)
		AnimationTrack.Looped = true
		local config = { assetId = MainBodyAssetId }
		config.stoppedConnection = AnimationTrack.Stopped:Connect(function()
			-- upvalues: self (copy), AnimationTrack (ref), config (copy)
			self:handleStoppedConnection(AnimationTrack, config)
		end)
		config.endedConnection = AnimationTrack.Ended:Connect(function()
			-- upvalues: self (copy), AnimationTrack (ref)
			self:handleEndedConnection(AnimationTrack)
		end)
		config.didLoopConnection = AnimationTrack.DidLoop:Connect(function()
			-- upvalues: self (copy), AnimationTrack (ref), AnimationTrackWithConnectionsTypes (upval), p3 (copy), p4 (copy), p5 (copy)
			if not self.destroyed then
				self:recordAnimationTrackProgress(AnimationTrack.Name, "Looped")
				self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.LookAround)
				self:updateMainBodyAnimation(p3, p4, p5)
				
				return
			end
		end)
		config.animationTrack = AnimationTrack
		config.animationTrack.Name = self:getNextAnimationTrackName("LookAround")
		assert(self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.LookAround] == nil, "self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.LookAround] should be empty")
		self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.LookAround] = config
		AnimationTrack:Play(0.1)
		self:recordAnimationTrackProgress(config.animationTrack.Name, "Playing")
		
		return
	end
end

function AnimationManager:updateMainBodyAnimation(StateDigest, p6, p7)
	-- upvalues: AnimationTrackWithConnectionsTypes (copy), AnimationUtilsModule (copy)
	assert(not StateDigest.isInPPE, "Should not be in PPE")
	local MainBodyAnimStringValues = p7.mainBodyAnimStringValues
	local MainBodyAssetId = p6.mainBodyAssetId
	
	if not MainBodyAnimStringValues then
		MainBodyAnimStringValues, MainBodyAssetId = self:getFallbackMainBodyAnimStringValuesAndMockAssetId(StateDigest)
	end
	if not MainBodyAnimStringValues or not MainBodyAssetId or #MainBodyAnimStringValues == 0 then
		self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.LookAround)
		self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.MainBody)
		
		return
	end
	assert(MainBodyAnimStringValues, "animStringValues is not nil. Silences type checker")
	assert(MainBodyAssetId, "assetId is not nil.  Silences type checker")
	local AnimationTrackWithConnectionsByTypeEntry = self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.LookAround]
	local NoExcludeIdleAnimation = not StateDigest.excludeIdleAnimation
	
	if AnimationUtilsModule.animationTrackWithConnectionsIsPlayingThisAssetId(self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.MainBody], MainBodyAssetId) and NoExcludeIdleAnimation then return end
	if AnimationUtilsModule.animationTrackWithConnectionsIsPlayingThisAssetId(AnimationTrackWithConnectionsByTypeEntry, MainBodyAssetId) and NoExcludeIdleAnimation then return end
	local v3 = 1
	
	if self.shouldMoveToNextValidMainBodyAnimation then
		v3 = v3 % #MainBodyAnimStringValues + 1
	end
	local SelectBestMainBodyAnimationResult, SelectBestMainBodyAnimationResult2 = self:selectBestMainBodyAnimation(MainBodyAnimStringValues, v3, StateDigest.excludeIdleAnimation)
	
	if SelectBestMainBodyAnimationResult then
		self:playMainBodyAnimation(SelectBestMainBodyAnimationResult, MainBodyAnimStringValues, MainBodyAssetId, SelectBestMainBodyAnimationResult2, nil, StateDigest.excludeIdleAnimation)
		
		return
	else
		self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.LookAround)
		self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.MainBody)
	end
end

function AnimationManager:playMainBodyAnimation(RandomAnimation, MainBodyAnimStringValues, AssetId, p6, p7, ExcludeIdleAnimation)
	-- upvalues: AnimationUtilsModule (copy), PlayingSwimAnimationFunction (copy), AnimationTrackWithConnectionsTypes (copy)
	local P89 = p7 or 0
	local AnimatorLoadAnimationTrackResult = AnimationUtilsModule.animatorLoadAnimationTrack(self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter, RandomAnimation, self.debugLoadAssetsFromFiles)
	
	if not AnimatorLoadAnimationTrackResult then return end
	assert(AnimatorLoadAnimationTrackResult, "animationTrack is not nil.  Silences type checker")
	local IsSwimAnimation = AnimationUtilsModule.isSwimAnimation(RandomAnimation)
	
	if self.store:getState().AvatarExperience.AvatarScene.Character.PlayingSwimAnimation ~= IsSwimAnimation then
		self.store:dispatch(PlayingSwimAnimationFunction(IsSwimAnimation))
	end
	AnimatorLoadAnimationTrackResult.Looped = true
	local config = { assetId = AssetId }
	config.stoppedConnection = AnimatorLoadAnimationTrackResult.Stopped:Connect(function()
		-- upvalues: self (copy), AnimatorLoadAnimationTrackResult (copy), config (copy)
		self:handleStoppedConnection(AnimatorLoadAnimationTrackResult, config)
	end)
	config.endedConnection = AnimatorLoadAnimationTrackResult.Ended:Connect(function()
		-- upvalues: self (copy), AnimatorLoadAnimationTrackResult (copy)
		self:handleEndedConnection(AnimatorLoadAnimationTrackResult)
	end)
	config.didLoopConnection = AnimatorLoadAnimationTrackResult.DidLoop:Connect(function()
		-- upvalues: self (copy), AnimatorLoadAnimationTrackResult (copy), AnimationTrackWithConnectionsTypes (upval), P89 (ref), MainBodyAnimStringValues (copy), p6 (copy), AnimationUtilsModule (upval), ExcludeIdleAnimation (copy), RandomAnimation (copy), AssetId (copy)
		if self.destroyed then return end
		self:recordAnimationTrackProgress(AnimatorLoadAnimationTrackResult.Name, "Looped")
		local AnimationTrackWithConnectionsByTypeEntry = self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.MainBody]
		
		if AnimationTrackWithConnectionsByTypeEntry == nil then return end
		assert(AnimationTrackWithConnectionsByTypeEntry, "mainBodyAnimationTrackWithConnections is non nil. Silence type checker")
		
		if AnimationTrackWithConnectionsByTypeEntry.animationTrack ~= AnimatorLoadAnimationTrackResult then return end
		if not self.started then
			AnimatorLoadAnimationTrackResult:Stop()
			
			return
		end
		P89 += 1
		local WeightedAnimations, WeightedAnimations2 = AnimationUtilsModule.getWeightedAnimations(AnimationUtilsModule.convertToAnimations((MainBodyAnimStringValues[p6]:GetChildren())), ExcludeIdleAnimation)
		local RandomAnimation1 = AnimationUtilsModule.getRandomAnimation(WeightedAnimations, WeightedAnimations2) or RandomAnimation
		assert(RandomAnimation1, "newAnimation not nil.  Silences type checker")
		local Flag = false
		
		if P89 % 4 == 0 then
			if self.shouldMoveToNextValidMainBodyAnimation then
				self.shouldMoveToNextValidMainBodyAnimation = false
			else
				self.shouldMoveToNextValidMainBodyAnimation = true
			end
			Flag = true
		end
		if Flag or RandomAnimation1 ~= RandomAnimation then
			self:playMainBodyAnimation(RandomAnimation1, MainBodyAnimStringValues, AssetId, p6, nil, ExcludeIdleAnimation)
		end
	end)
	self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.LookAround)
	self:stopAnimationTrackWithConnections(AnimationTrackWithConnectionsTypes.MainBody)
	config.animationTrack = AnimatorLoadAnimationTrackResult
	config.animationTrack.Name = self:getNextAnimationTrackName("MainBody")
	assert(self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.MainBody] == nil, "self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.MainBody] should be empty")
	self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.MainBody] = config
	AnimatorLoadAnimationTrackResult:Play(0.1)
	self:recordAnimationTrackProgress(config.animationTrack.Name, "Playing")
end

function AnimationManager:selectBestMainBodyAnimation(MainBodyAnimStringValues, p6, ExcludeIdleAnimation)
	local NextPlayableWeightedAnimations, NextPlayableWeightedAnimations2 = self:findNextPlayableWeightedAnimations(MainBodyAnimStringValues, p6, ExcludeIdleAnimation)
	local Key, Value = next(NextPlayableWeightedAnimations)
	
	if not Key then
		return nil, NextPlayableWeightedAnimations2
	end
	local Key1 = Key
	local Value1 = Value
	
	for i, nextPlayableWeightedAnimation in NextPlayableWeightedAnimations do
		if Value1 < nextPlayableWeightedAnimation then
			Key1 = i
			Value1 = nextPlayableWeightedAnimation
		end
	end
	return Key1, NextPlayableWeightedAnimations2
end

function AnimationManager:findNextPlayableWeightedAnimations(p7, p8: number, p9)
	-- upvalues: AnimationUtilsModule (copy)
	local WeightedAnimations = nil
	for _ = 1, #p7 do
		local Children = if p7[p8] then p7[p8]:GetChildren() else nil
		
		if Children then
			local WeightedAnimations2
			WeightedAnimations, WeightedAnimations2 = AnimationUtilsModule.getWeightedAnimations(AnimationUtilsModule.convertToAnimations(Children), p9)
			
			if WeightedAnimations2 > 0 then
				return WeightedAnimations, p8
			end
		end
		p8 = p8 % #p7 + 1
	end
	return {}, p8
end

function AnimationManager:getFallbackMainBodyAnimStringValuesAndMockAssetId(StateDigest)
	-- upvalues: AssetTypeIdStrings (copy), AnimationUtilsModule (copy)
	local CurrentCharacter = self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter
	assert(CurrentCharacter, "currentCharacter is not nil")
	
	if not StateDigest.isAvatarBackground then
		local AssetTypeIdStringForCategory = if StateDigest.pageIsEditorAnimations and StateDigest.curCategoryInfo then AnimationUtilsModule.getAssetTypeIdStringForCategory(StateDigest.curCategoryInfo) else AssetTypeIdStrings.IdleAnimation
		local AnimStringValuesAssignedToCharacter = self:getAnimStringValuesAssignedToCharacter(AssetTypeIdStringForCategory, CurrentCharacter)
		
		return AnimStringValuesAssignedToCharacter, if AnimStringValuesAssignedToCharacter and AssetTypeIdStringForCategory then "character_" .. AssetTypeIdStringForCategory else nil
	end
	local Wave = CurrentCharacter.Animations:FindFirstChild("wave")
	
	if Wave then
		return { Wave }, "character_defaultWave"
	else
		return nil, nil
	end
end

function AnimationManager:getAnimStringValuesAssignedToCharacter(AssetTypeIdStringForCategory, CurrentCharacter)
	-- upvalues: AssetTypeIdStrings (copy), ConstantsModule (copy), AnimationUtilsModule (copy)
	local AvatarType = self.store:getState().AvatarExperience.AvatarEditor.Character.AvatarType
	local List = {}
	
	if not CurrentCharacter then
		return nil
	end
	assert(CurrentCharacter, "currentCharacter is not nil.  Silences type checker")
	local Animations = CurrentCharacter:FindFirstChild("Animations")
	
	if Animations == nil then
		return nil
	end
	assert(Animations, "animations is not nil.  Silences type checker")
	
	if AssetTypeIdStringForCategory == AssetTypeIdStrings.ClimbAnimation then
		table.insert(List, Animations:FindFirstChild("climb"))
	elseif AssetTypeIdStringForCategory == AssetTypeIdStrings.FallAnimation then
		table.insert(List, Animations:FindFirstChild("fall"))
	elseif AssetTypeIdStringForCategory == AssetTypeIdStrings.IdleAnimation then
		table.insert(List, Animations:FindFirstChild("idle"))
	elseif AssetTypeIdStringForCategory == AssetTypeIdStrings.JumpAnimation then
		table.insert(List, Animations:FindFirstChild("jump"))
	elseif AssetTypeIdStringForCategory == AssetTypeIdStrings.RunAnimation then
		table.insert(List, Animations:FindFirstChild("run"))
	elseif AssetTypeIdStringForCategory == AssetTypeIdStrings.WalkAnimation then
		table.insert(List, Animations:FindFirstChild("walk"))
	elseif AssetTypeIdStringForCategory == AssetTypeIdStrings.EmoteAnimation then
		table.insert(List, Animations:FindFirstChild("idle"))
	elseif AssetTypeIdStringForCategory == AssetTypeIdStrings.SwimAnimation then
		if AvatarType == ConstantsModule.AvatarType.R15 then
			table.insert(List, Animations:FindFirstChild("swim"))
			table.insert(List, Animations:FindFirstChild("swimidle"))
		else
			local Run = Animations:FindFirstChild("run")
			
			if Run then
				local swim = Run:Clone()
				swim.Name = "swim"
				table.insert(List, swim)
			end
		end
	end
	return AnimationUtilsModule.convertToStringValues(List)
end

function AnimationManager:stopAnimationTrackWithConnections(LookAround, FadeTime)
	-- upvalues: AnimationUtilsModule (copy)
	local AnimationTrackWithConnectionsByTypeEntry = self.animationTrackWithConnectionsByType[LookAround]
	
	if AnimationTrackWithConnectionsByTypeEntry then
		if AnimationTrackWithConnectionsByTypeEntry.didLoopConnection then
			AnimationTrackWithConnectionsByTypeEntry.didLoopConnection:Disconnect()
		end
		self.animationTrackWithConnectionsByType[LookAround] = nil
		
		if AnimationUtilsModule.animationTrackWithConnectionsIsPlaying(AnimationTrackWithConnectionsByTypeEntry) then
			assert(AnimationTrackWithConnectionsByTypeEntry, "animationTrackWithConnections is not nil. Silences type checker")
			assert(AnimationTrackWithConnectionsByTypeEntry.animationTrack, "animationTrackWithConnections.animationTrack is not nil. Silences type checker")
			AnimationTrackWithConnectionsByTypeEntry.animationTrack:Stop(FadeTime)
			
			return
		elseif AnimationTrackWithConnectionsByTypeEntry and AnimationTrackWithConnectionsByTypeEntry.animationTrack then
			AnimationTrackWithConnectionsByTypeEntry.animationTrack:Destroy()
		end
	end
end

function AnimationManager:handleStoppedConnection(AnimatorLoadAnimationTrackResult, p10)
	if not self.destroyed then
		self:recordAnimationTrackProgress(AnimatorLoadAnimationTrackResult.Name, "Stopped")
		assert(AnimatorLoadAnimationTrackResult, "animationTrack should be non-nil")
		assert(AnimatorLoadAnimationTrackResult.Name, "animationTrack name should be set")
		assert(self.stoppedButNotEndedATWCsByName[AnimatorLoadAnimationTrackResult.Name] == nil, "animationTrack should not be in stoppedButNotEndedATWCsByName yet")
		self.stoppedButNotEndedATWCsByName[AnimatorLoadAnimationTrackResult.Name] = p10
		
		return
	end
end

function AnimationManager:handleEndedConnection(AnimatorLoadAnimationTrackResult)
	-- upvalues: AxInit (copy), MutedErrorModule (copy)
	assert(AnimatorLoadAnimationTrackResult, "originalTrack should exist")
	
	if self.destroyed then return end
	self:recordAnimationTrackProgress(AnimatorLoadAnimationTrackResult.Name, "Ended")
	
	if not self.stoppedButNotEndedATWCsByName[AnimatorLoadAnimationTrackResult.Name] then
		AxInit:info(string.format("\"%s\" missing from self.stoppedButNotEndedATWCsByName: ", AnimatorLoadAnimationTrackResult.Name) .. self:getAnimationTrackRecordString(AnimatorLoadAnimationTrackResult.Name))
		MutedErrorModule("originalTrack missing from self.stoppedButNotEndedATWCsByName")
	end
	AnimatorLoadAnimationTrackResult:Destroy()
	self.stoppedButNotEndedATWCsByName[AnimatorLoadAnimationTrackResult.Name] = nil
	
	if self.started then
		self:maybeProceedWithPPEPosing()
	end
end

function AnimationManager:setOnUpdateFinished(OnUpdateFinished)
	self.onUpdateFinished = OnUpdateFinished
end

function AnimationManager:setDebugLoadAssetsFromFiles(DebugLoadAssetsFromFiles, MapAssetIdToFileName)
	self.debugLoadAssetsFromFiles = DebugLoadAssetsFromFiles
	self.mapAssetIdToFileName = MapAssetIdToFileName
end

function AnimationManager:getNextAnimationTrackName(Text): string
	self.animationTrackNameIndex += 1
	
	return "AnimationTrack_" .. Text .. "_" .. tostring(self.animationTrackNameIndex)
end

function AnimationManager:recordAnimationTrackProgress(Name, p10)
	if self.animationTrackNameToHistory == nil then
		self.animationTrackNameToHistory = {}
	end
	local AnimationTrackNameToHistoryEntry = self.animationTrackNameToHistory[Name]
	
	if AnimationTrackNameToHistoryEntry == nil then
		AnimationTrackNameToHistoryEntry = {}
		self.animationTrackNameToHistory[Name] = AnimationTrackNameToHistoryEntry
	end
	table.insert(AnimationTrackNameToHistoryEntry, p10)
end

function AnimationManager:getAnimationTrackRecordString(Name): string
	local Text = "Name = " .. Name
	local AnimationTrackNameToHistoryEntry = self.animationTrackNameToHistory[Name]
	
	if AnimationTrackNameToHistoryEntry == nil then
		AnimationTrackNameToHistoryEntry = {}
	end
	for _, value in AnimationTrackNameToHistoryEntry do
		Text ..= ", " .. value
	end
	return Text
end

return AnimationManager
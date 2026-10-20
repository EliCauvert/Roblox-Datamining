local CorePackages = game:GetService("CorePackages")
local InsertService = game:GetService("InsertService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CryoModule = require(CorePackages.Packages.Cryo)
local TutilsModule = require(CorePackages.Packages.tutils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local MockAnimationTrackModule = require(Modules.AvatarExperience.Common.MockAnimationTrack)
local MockAnimationStreamTrackModule = require(Modules.AvatarExperience.Common.MockAnimationStreamTrack)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.AvatarExperience.Common.Managers.AnimationManagerTypes)
local SelectIsTryingOnClassicOrDynamicHeadModule = require(Modules.AvatarExperience.Common.Selectors.SelectIsTryingOnClassicOrDynamicHead)
local SelectOutfitTryOnEmoteAnimationAssetIdModule = require(Modules.AvatarExperience.Common.Selectors.SelectOutfitTryOnEmoteAnimationAssetId)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule1 = require(Modules.AvatarExperience.Common.Utils)
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogCategories = AvatarExperienceCommonModule.Enums.CatalogCategories
local IsMakeupOrEyebrowEyelashAssetTypeFunction = AvatarExperienceCommonModule.Utils.isMakeupOrEyebrowEyelashAssetType
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local AssetTypeIdStrings = ConstantsModule.AssetTypeIdStrings
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXPhotoboothFunctionality = AvatarExperienceFlagsModule.FFlagAXPhotoboothFunctionality
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXRemoveCatalogCategoryNavKey = AvatarExperienceFlagsModule.FFlagAXRemoveCatalogCategoryNavKey
local FFlagAXMakeupEquipping = AvatarExperienceFlagsModule.FFlagAXMakeupEquipping
local AnimationUtils = {
	DefaultAnimations = {
		R15 = { TOOL = 507768375, WAVE_EMOTE = 507770239 },
		R6 = {
			CLIMB = 180436334,
			FALL = 180436148,
			IDLE = 180435571,
			IDLE_LOOK_AROUND = 180435792,
			JUMP = 125750702,
			RUN = 180426354,
			SIT = 178130996,
			TOOL_NONE = 182393478,
			WALK = 180426354,
			TOOL = 182393478
		}
	},
	loadAnimationModel = function(Number, p1, Callback)
		-- upvalues: InsertService (copy)
		if not Number then
			return nil
		end
		local LocalAsset = nil
		local _, Result = pcall(function()
			-- upvalues: p1 (copy), Callback (copy), Number (copy), LocalAsset (ref), InsertService (upval)
			if p1 and Callback then
				LocalAsset = InsertService:LoadLocalAsset("rbxasset://" .. Callback(Number))
				
				return
			end
			local v1 = nil
			local BindableEvent = Instance.new("BindableEvent")
			task.spawn(function()
				-- upvalues: LocalAsset (upval), InsertService (upval), Number (upval), v1 (ref), BindableEvent (copy)
				local Success, Result = pcall(function()
					-- upvalues: LocalAsset (upval), InsertService (upval), Number (upval)
					LocalAsset = InsertService:LoadAsset(Number)
				end)
				
				if not Success then
					v1 = Result
				end
				BindableEvent:Fire()
			end)
			BindableEvent.Event:Wait()
			
			if v1 then
				error(v1)
			end
		end)
		
		if Result or not LocalAsset then
			warn(Result)
			
			return nil
		else
			return LocalAsset
		end
	end,
	isSwimAnimation = function(p1): boolean
		return p1.Parent and p1.Parent.Name == "swim" or false
	end,
	createStringValue = function(Folder, Name)
		local StrValue = Instance.new("StringValue")
		StrValue.Parent = Folder
		StrValue.Name = Name
		
		return StrValue
	end,
	createAnimation = function(Idle, Name, CLIMB)
		local Animation = Instance.new("Animation")
		Animation.Parent = Idle
		Animation.AnimationId = "http://www.roblox.com/asset/?id=" .. CLIMB
		Animation.Name = Name
		
		return Animation
	end
}

function AnimationUtils.createR6AnimationFolder()
	-- upvalues: AnimationUtils (copy)
	local Folder = Instance.new("Folder")
	AnimationUtils.createAnimation(AnimationUtils.createStringValue(Folder, "climb"), "ClimbAnim", AnimationUtils.DefaultAnimations.R6.CLIMB)
	AnimationUtils.createAnimation(AnimationUtils.createStringValue(Folder, "fall"), "FallAnim", AnimationUtils.DefaultAnimations.R6.FALL)
	local Idle = AnimationUtils.createStringValue(Folder, "idle")
	AnimationUtils.createAnimation(Idle, "Animation1", AnimationUtils.DefaultAnimations.R6.IDLE)
	AnimationUtils.createAnimation(Idle, "Animation2", AnimationUtils.DefaultAnimations.R6.IDLE_LOOK_AROUND)
	AnimationUtils.createAnimation(AnimationUtils.createStringValue(Folder, "jump"), "JumpAnim", AnimationUtils.DefaultAnimations.R6.JUMP)
	AnimationUtils.createAnimation(AnimationUtils.createStringValue(Folder, "run"), "RunAnim", AnimationUtils.DefaultAnimations.R6.RUN)
	AnimationUtils.createAnimation(AnimationUtils.createStringValue(Folder, "sit"), "SitAnim", AnimationUtils.DefaultAnimations.R6.SIT)
	AnimationUtils.createAnimation(AnimationUtils.createStringValue(Folder, "toolnone"), "ToolNoneAnim", AnimationUtils.DefaultAnimations.R6.TOOL_NONE)
	AnimationUtils.createAnimation(AnimationUtils.createStringValue(Folder, "walk"), "WalkAnim", AnimationUtils.DefaultAnimations.R6.WALK)
	AnimationUtils.createAnimation(Folder, "Tool", AnimationUtils.DefaultAnimations.R6.TOOL)
	
	return Folder
end

function AnimationUtils.convertToStringValues(Children, p1)
	-- upvalues: MutedErrorModule (copy)
	for _, StringValue in Children do
		if StringValue.ClassName ~= "StringValue" then
			MutedErrorModule(`instance should be StringValue: {p1}`)
			
			return {}
		end
	end
	return Children
end

function AnimationUtils.convertToAnimations(Animations)
	-- upvalues: MutedErrorModule (copy)
	for _, animation in Animations do
		if animation.ClassName ~= "Animation" then
			MutedErrorModule("instance should be Animation.")
			
			return {}
		end
	end
	return Animations
end

function AnimationUtils.getLowestWeightAnimation(p2)
	local v1 = nil
	local v2 = 1e999
	
	for _, value in next, p2 do
		local Weight = value:FindFirstChild("Weight")
		local Value = if Weight then Weight.Value else 1
		
		if Value < v2 then
			v1 = value
			v2 = Value
		end
	end
	return v1
end

function AnimationUtils.getWeightedAnimations(p3, p4)
	-- upvalues: AnimationUtils (copy)
	local Amounts = {}
	local Total = 0
	local LowestWeightAnimation = if p4 then AnimationUtils.getLowestWeightAnimation(p3) else nil
	for _, value in next, p3 do
		local Weight = value:FindFirstChild("Weight")
		local Value = if p4 and value == LowestWeightAnimation then 0 elseif Weight then Weight.Value else 1
		
		if Value > 0 then
			Amounts[value] = Value
			Total += Value
		end
	end
	return Amounts, Total
end

function AnimationUtils.getHumanoidFromCharacter(Object)
	return if Object then Object:FindFirstChildOfClass("Humanoid") else nil
end

function AnimationUtils.getAnimatorFromCharacter(p5)
	-- upvalues: AnimationUtils (copy)
	local HumanoidFromCharacter = AnimationUtils.getHumanoidFromCharacter(p5)
	
	return if HumanoidFromCharacter then HumanoidFromCharacter:FindFirstChildOfClass("Animator") else nil
end

function AnimationUtils.animationTrackWithConnectionsIsPlaying(p5)
	if not p5 then
		return false
	end
	assert(p5, "animationTrackWithId should be non-nil. Silence type checker.")
	
	if p5.animationTrack then
		assert(p5.animationTrack, "animationTrackWithId.animationTrack should be non-nil. Silence type checker.")
		
		return p5.animationTrack.IsPlaying
	else
		return false
	end
end

function AnimationUtils.animationTrackWithConnectionsIsPlayingThisAssetId(p5, AssetId): boolean
	-- upvalues: AnimationUtils (copy)
	return if p5 and p5.assetId == AssetId and AnimationUtils.animationTrackWithConnectionsIsPlaying(p5) then true else false
end

function AnimationUtils.getRandomAnimation(p5, p6)
	local ScaledRandomValue = math.random() * p6
	
	for i, value in next, p5 do
		if ScaledRandomValue <= value then
			return i
		end
		ScaledRandomValue -= value
	end
	return nil
end

function AnimationUtils.animatorLoadAnimationTrack(p7, Animation, p8)
	-- upvalues: AnimationUtils (copy), MockAnimationTrackModule (copy)
	local AnimatorFromCharacter = AnimationUtils.getAnimatorFromCharacter(p7)
	
	return if AnimatorFromCharacter then if p8 then MockAnimationTrackModule.new() else AnimatorFromCharacter:LoadAnimation(Animation) else nil
end

function AnimationUtils.animatorLoadTrackerStreamAnimationTrack(p7, Animation, p8)
	-- upvalues: AnimationUtils (copy), MockAnimationStreamTrackModule (copy), Players (copy)
	local AnimatorFromCharacter = AnimationUtils.getAnimatorFromCharacter(p7)
	
	if not AnimatorFromCharacter then
		return nil
	elseif p8 then
		return (MockAnimationStreamTrackModule.new())
	else
		assert(Players, "assert Players cannot be nil. Silences type checker")
		assert(Players.LocalPlayer, "assert LocalPlayer is not nil. Silences type checker")
		
		return if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then AnimatorFromCharacter:LoadStreamAnimationV2(Animation, Players.LocalPlayer, false, false) else AnimatorFromCharacter:LoadStreamAnimationForSelfieView_deprecated(Animation, Players.LocalPlayer)
	end
end

function AnimationUtils.loadAnimStringValuesFromString(p7, p8, p9)
	-- upvalues: AnimationUtils (copy)
	local Number: number? = tonumber(p7)
	
	if not Number then
		return nil
	end
	assert(Number, "assetIdAsNumber is not nil. Silences type checker")
	local AnimationModel = AnimationUtils.loadAnimationModel(Number, p8, p9)
	
	if not AnimationModel then
		return nil
	end
	assert(AnimationModel, "animationModel is not nil. Silence type checker.")
	local R15Anim = AnimationModel:FindFirstChild("R15Anim")
	
	if R15Anim then
		return AnimationUtils.convertToStringValues(R15Anim:GetChildren(), p7)
	end
	local StrValues = {}
	
	for _, Animation in AnimationModel:GetChildren() do
		if Animation:IsA("Animation") then
			local StrValue = Instance.new("StringValue")
			StrValue.Name = Animation.Name
			Animation.Parent = StrValue
			StrValues[#StrValues + 1] = StrValue
		end
	end
	return if #StrValues > 0 then StrValues else nil
end

AnimationUtils.getAssetTypeIdStringForCategory = MemoizeFunction(function(p10)
	return if p10 and p10.AssetTypeIdStrings and #p10.AssetTypeIdStrings == 1 then p10.AssetTypeIdStrings[1] else nil
end)
AnimationUtils.hasMissingIds = MemoizeFunction(function(List, p10): boolean
	if List == nil or not next(List) then
		return false
	end
	for i, _ in List do
		if not p10[i] then
			return true
		end
	end
	return false
end)
AnimationUtils.getEquippedAssetsSummary = MemoizeFunction(function(List)
	-- upvalues: UtilsModule (copy), FFlagAXMakeupEquipping (copy), IsMakeupOrEyebrowEyelashAssetTypeFunction (copy)
	local t = {}
	
	if List then
		for i, value in List do
			if not UtilsModule.assetTypeIdIsAnimationOrEmote(i) and (not FFlagAXMakeupEquipping or not IsMakeupOrEyebrowEyelashAssetTypeFunction(i)) then
				local t1 = {}
				
				for i1, _ in value do
					t1[i1] = true
				end
				t[i] = t1
			end
		end
	end
	return t
end)
AnimationUtils.getEquippedAssetSummariesMatch = MemoizeFunction(function(p11, p12)
	-- upvalues: TutilsModule (copy)
	return TutilsModule.deepEqual(p11, p12)
end)
AnimationUtils.getOutfitTryOnSummary = MemoizeFunction(function(p11)
	-- upvalues: ConstantsModule (copy), UtilsModule (copy), FFlagAXMakeupEquipping (copy), IsMakeupOrEyebrowEyelashAssetTypeFunction (copy)
	local t = {}
	
	if p11 and p11.TryOnItems then
		for i, tryOnItem in p11.TryOnItems do
			if (tryOnItem.itemType ~= ConstantsModule.ItemType.Bundle or tryOnItem.itemSubType ~= ConstantsModule.BundleTypeIdStrings.Animations) and (tryOnItem.itemType ~= ConstantsModule.ItemType.Asset or not UtilsModule.assetTypeIdIsAnimationOrEmote(tryOnItem.itemSubType)) and (not FFlagAXMakeupEquipping or tryOnItem.itemType ~= ConstantsModule.ItemType.Asset or not IsMakeupOrEyebrowEyelashAssetTypeFunction(tryOnItem.itemSubType)) then
				t[i] = {
					itemType = tryOnItem.itemType,
					itemSubType = tryOnItem.itemSubType
				}
			end
		end
	end
	return t
end)
AnimationUtils.getOutfitTryOnSummariesMatch = MemoizeFunction(function(p12, p13)
	-- upvalues: TutilsModule (copy)
	return TutilsModule.deepEqual(p12, p13)
end)
AnimationUtils.getEquippedAssetsSummaryHasNewItems = MemoizeFunction(function(List, p12): boolean
	-- upvalues: AnimationUtils (copy)
	for i, value in List do
		if AnimationUtils.hasMissingIds(value, if p12[i] then p12[i] else {}) then
			return true
		end
	end
	return false
end)

function AnimationUtils.getOutfitTryOnSummaryHasNewItems(List, p13): boolean
	for i, _ in List do
		if not p13[i] then
			return true
		end
	end
	return false
end

function AnimationUtils.cleanupAnimationTrackWithConnections(p14)
	if not p14 then return end
	assert(p14, "Assert animationTrackWithConnections is not nil, silence type checker")
	
	if p14.stoppedConnection then
		p14.stoppedConnection:Disconnect()
		p14.stoppedConnection = nil
	end
	if p14.endedConnection then
		p14.endedConnection:Disconnect()
		p14.endedConnection = nil
	end
	if p14.didLoopConnection then
		p14.didLoopConnection:Disconnect()
		p14.didLoopConnection = nil
	end
	if p14.animationTrack then
		p14.animationTrack:Stop()
		p14.animationTrack:Destroy()
		p14.animationTrack = nil
	end
end

function AnimationUtils.getDidMoveOutOfPPE(p14, p15, p16): boolean
	if p14 then
		if not p15 then
			return true
		elseif not p16 then
			return true
		end
	end
	return false
end

function AnimationUtils.getEquippedIdleAnimation(p14)
	-- upvalues: AssetTypeIdStrings (copy)
	local EquippedAssets = p14.AvatarExperience.AvatarEditor.Character.EquippedAssets
	local EquippedAsset = EquippedAssets and EquippedAssets[AssetTypeIdStrings.IdleAnimation]
	
	return EquippedAsset and next(EquippedAsset) or nil
end

function AnimationUtils.ableToAnimateHead(p14)
	-- upvalues: SelectIsTryingOnClassicOrDynamicHeadModule (copy), ConstantsModule (copy), CryoModule (copy)
	local SelectIsTryingOnClassicOrDynamicHeadModuleResult, SelectIsTryingOnClassicOrDynamicHeadModuleResult2, SelectIsTryingOnClassicOrDynamicHeadModuleResult3 = SelectIsTryingOnClassicOrDynamicHeadModule(p14)
	
	if SelectIsTryingOnClassicOrDynamicHeadModuleResult then
		return false, SelectIsTryingOnClassicOrDynamicHeadModuleResult3
	elseif p14.AvatarExperience.AvatarEditor.Character.AvatarType == ConstantsModule.AvatarType.R6 then
		return false, SelectIsTryingOnClassicOrDynamicHeadModuleResult3
	elseif SelectIsTryingOnClassicOrDynamicHeadModuleResult2 then
		return true, SelectIsTryingOnClassicOrDynamicHeadModuleResult3
	else
		local EquippedAssets = p14.AvatarExperience.AvatarEditor.Character.EquippedAssets
		local EquippedAsset = EquippedAssets and EquippedAssets[ConstantsModule.AssetTypeIdStrings.DynamicHead]
		
		return EquippedAsset ~= nil and not CryoModule.isEmpty(EquippedAsset), SelectIsTryingOnClassicOrDynamicHeadModuleResult3
	end
end

function AnimationUtils.adjustATWCWeight(p14, Weight)
	if p14.animationTrack then
		assert(p14.animationTrack, "assert animationTrackWithConnections.animationTrack is not nil. Silences Type checker")
		p14.animationTrack:AdjustWeight(Weight)
	end
end

function AnimationUtils.getAllowsTryingEmotesOrAnimations(p14, p15)
	-- upvalues: UtilsModule1 (copy), ConstantsModule (copy), AvatarScreen (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), CatalogCategories (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), FFlagAXPhotoboothFunctionality (copy)
	local Name = p15.opaque.name
	local CategoryInfoFromState = UtilsModule1.getCategoryInfoFromState(p14, p15)
	
	if CategoryInfoFromState.PageType == ConstantsModule.PageType.AllAnimation or Name == AvatarScreen.CatalogSearch or Name == AvatarScreen.TryOnItem or ((if FFlagAXRemoveCatalogCategoryNavKey then CategoryInfoFromState.Id == ConstantsModule.DefaultCatalogCategoryId else CategoryInfoFromState.NavigationKey == CatalogCategories.Recommended) or GetFFlagAXEnableSlotBasedEditorModule() and Name == AvatarScreen.EditEmotes) or FFlagAXPhotoboothFunctionality and Name == AvatarScreen.Photobooth then
		return true, true
	else
		return CategoryInfoFromState.PageType == ConstantsModule.PageType.Emotes, CategoryInfoFromState.PageType == ConstantsModule.PageType.Animation
	end
end

function AnimationUtils.canPlayCameraBasedMoodAnimation(p14, p15, p16)
	-- upvalues: SelectOutfitTryOnEmoteAnimationAssetIdModule (copy), AnimationUtils (copy)
	if not p15 then
		return false, true
	end
	local SelectOutfitTryOnEmoteAnimationAssetIdModuleResult = SelectOutfitTryOnEmoteAnimationAssetIdModule(p14)
	local LastAnimOrEmoteToggledItem = p14.AvatarExperience.AvatarScene.OutfitTryOn.LastAnimOrEmoteToggledItem
	local IsItemIdMatch: boolean = if LastAnimOrEmoteToggledItem then LastAnimOrEmoteToggledItem.itemId == SelectOutfitTryOnEmoteAnimationAssetIdModuleResult else false
	local AbleToAnimateHeadResult, AbleToAnimateHeadResult2 = AnimationUtils.ableToAnimateHead(p14)
	
	if AbleToAnimateHeadResult then
		AbleToAnimateHeadResult = not (IsItemIdMatch and p16)
	end
	return AbleToAnimateHeadResult, AbleToAnimateHeadResult2
end

function AnimationUtils.waitForAnimationAndPosingToResolve(Callback)
	-- upvalues: RunService (copy)
	task.spawn(function()
		-- upvalues: RunService (upval), Callback (copy)
		RunService.PreAnimation:Wait()
		RunService.PostSimulation:Wait()
		Callback()
	end)
end

return AnimationUtils
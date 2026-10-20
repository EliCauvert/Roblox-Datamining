local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local DashModule = require(CorePackages.Packages.Dash)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local AvatarExperienceHeadRefinementModule = require(CorePackages.Workspace.Packages.AvatarExperienceHeadRefinement)
local SetDynamicHeadShapeFunction = AvatarExperienceHeadRefinementModule.Thunks.SetDynamicHeadShape
local SetStaticFacialAnimationFunction = AvatarExperienceHeadRefinementModule.Thunks.SetStaticFacialAnimation
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagDynamicHeadsMigration = AvatarExperienceFlagsModule.FFlagDynamicHeadsMigration
local FFlagAXAddFacesToHeadList = AvatarExperienceFlagsModule.FFlagAXAddFacesToHeadList
local FFlagAXLogFacialAnimationToggle = AvatarExperienceFlagsModule.FFlagAXLogFacialAnimationToggle
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local FFlagRemoveClassicHeadsAndFaces = AvatarExperienceFlagsModule.FFlagRemoveClassicHeadsAndFaces
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local GetUserOwnedClassicHeadsFunction = AvatarExperienceHeadRefinementModule.Thunks.GetUserOwnedClassicHeads
local TryOnClassicHeadShapeFunction = AvatarExperienceHeadRefinementModule.Actions.TryOnClassicHeadShape
local SetLastSelectedHeadShapeFunction = AvatarExperienceHeadRefinementModule.Actions.SetLastSelectedHeadShape
local ToggleEquipAssetModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset)
local HeadShape = AvatarExperienceHeadRefinementModule.Enums.HeadShape
local HeadShapeProperties = AvatarExperienceHeadRefinementModule.Enums.HeadShapeProperties
local Counters = AvatarExperienceHeadRefinementModule.Counters
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UnifiedLoggingSurface = AvatarExperienceNavigationModule.Enums.UnifiedLoggingSurface
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local SendAXCounterV2Function = AvatarExperienceAnalyticsModule.sendAXCounterV2
local SendUnifiedEventLogFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLog
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local UtilsModule1 = require(Modules.AvatarExperience.AvatarEditor.Utils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SelectLastTryOnClassicHeadShapeModule = require(Modules.AvatarExperience.AvatarRefinement.HeadRefinement.Selectors.selectLastTryOnClassicHeadShape)
local SelectFacialAnimationForHeadAdjustmentModule = require(Modules.AvatarExperience.AvatarRefinement.HeadRefinement.Selectors.selectFacialAnimationForHeadAdjustment)
local GetEquippedHeadShapeNameFunction = AvatarExperienceHeadRefinementModule.Utils.getEquippedHeadShapeName
local GetDefaultSelectedHeadShapeNameFunction = AvatarExperienceHeadRefinementModule.Utils.getDefaultSelectedHeadShapeName
local GetHeadShapeInventoryStoreModule = require(Modules.AvatarExperience.AvatarRefinement.HeadRefinement.Stores.GetHeadShapeInventoryStore)
local FFlagAXFixTryOnHeadShapeThumbnail = AvatarExperienceFlagsModule.FFlagAXFixTryOnHeadShapeThumbnail
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.AvatarExperience.Common.Types)

local function selectLocalUserId(p1)
	return p1.LocalUserId
end

local function selectEquippedAssets(p1)
	return p1.AvatarExperience.AvatarEditor.Character.EquippedAssets
end

local function selectOutfitTryOn(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn
end

local function selectAvailableHeadShapes(p1)
	return p1.AvatarExperience.AvatarScene.HeadRefinement and p1.AvatarExperience.AvatarScene.HeadRefinement.availableHeadShapes
end

local function selectLastSelectedHeadShape(p1)
	return p1.AvatarExperience.AvatarScene.HeadRefinement and p1.AvatarExperience.AvatarScene.HeadRefinement.lastSelectedHeadShape
end

local function selectEntryPage(p1)
	return p1.AvatarExperience.LayeredClothingSort.EntryPage
end

local function selectAssetInfos(p1)
	return p1.AvatarExperience.Common.AssetInfos
end

local function selectBundleInfos(p1)
	return p1.AvatarExperience.Common.BundleInfos
end

return function()
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), selectLocalUserId (copy), selectEquippedAssets (copy), selectOutfitTryOn (copy), selectEntryPage (copy), FFlagDynamicHeadsMigration (copy), selectAssetInfos (copy), selectBundleInfos (copy), selectAvailableHeadShapes (copy), selectLastSelectedHeadShape (copy), SelectLastTryOnClassicHeadShapeModule (copy), AvatarScreen (copy), FFlagAXAddFacesToHeadList (copy), ConstantsModule (copy), FFlagAXFixTryOnHeadShapeThumbnail (copy), ReactModule (copy), CryoModule (copy), SendAXCounterV2Function (copy), Counters (copy), GetUserOwnedClassicHeadsFunction (copy), GetHeadShapeInventoryStoreModule (copy), SignalsReactModule (copy), HeadShapeProperties (copy), GetEquippedHeadShapeNameFunction (copy), GetDefaultSelectedHeadShapeNameFunction (copy), HeadShape (copy), SelectFacialAnimationForHeadAdjustmentModule (copy), FFlagHeadRefinementFacialAnimationToggle (copy), FFlagAXLogFacialAnimationToggle (copy), SendUnifiedEventLogFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), HttpService (copy), SetStaticFacialAnimationFunction (copy), UtilsModule (copy), DashModule (copy), SetDynamicHeadShapeFunction (copy), TryOnClassicHeadShapeFunction (copy), ToggleEquipAssetModule (copy), SetLastSelectedHeadShapeFunction (copy), FFlagRemoveClassicHeadsAndFaces (copy), UtilsModule1 (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(selectLocalUserId)
	local UseSelectorResult1 = UseSelectorFunction(selectEquippedAssets)
	local UseSelectorResult2 = UseSelectorFunction(selectOutfitTryOn)
	local UseSelectorResult3 = UseSelectorFunction(selectEntryPage)
	local UseSelectorResult4 = if FFlagDynamicHeadsMigration then UseSelectorFunction(selectAssetInfos) else nil
	local UseSelectorResult5 = if FFlagDynamicHeadsMigration then UseSelectorFunction(selectBundleInfos) else nil
	local UseSelectorResult6 = UseSelectorFunction(selectAvailableHeadShapes)
	local UseSelectorResult7 = UseSelectorFunction(selectLastSelectedHeadShape)
	local UseSelectorResult8 = UseSelectorFunction(SelectLastTryOnClassicHeadShapeModule)
	local TryOnItems = UseSelectorResult2.TryOnItems
	local LookId = UseSelectorResult2.LookId
	local IsUseSelectorResultMatch = UseSelectorResult3 == AvatarScreen.Catalog
	local UseSelectorResultEntry = if FFlagAXAddFacesToHeadList then UseSelectorResult1 and UseSelectorResult1[ConstantsModule.AssetTypeIdStrings.DynamicHead] else nil
	local NextEntry = if FFlagAXAddFacesToHeadList then UseSelectorResultEntry and next(UseSelectorResultEntry) else nil
	local v1 = nil
	
	if FFlagAXFixTryOnHeadShapeThumbnail and TryOnItems then
		for _, tryOnItem in TryOnItems do
			local BundleInfo = tryOnItem.bundleInfo
			
			if BundleInfo then
				for i, value in BundleInfo do
					if value.assetType == ConstantsModule.AssetTypeIdStrings.DynamicHead then
						v1 = i
					end
				end
			end
		end
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseRefResult = ReactModule.useRef(false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsUseSelectorResultMatch (copy), CryoModule (upval), TryOnItems (copy)
		return IsUseSelectorResultMatch or not CryoModule.isEmpty(TryOnItems)
	end, { IsUseSelectorResultMatch, TryOnItems })
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: SendAXCounterV2Function (upval), Counters (upval)
		SendAXCounterV2Function(Counters.Enter)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: CryoModule (upval), UseSelectorResult6 (copy), UseRoactServiceResult (copy), UseSelectorResult (copy), UseRefResult (copy), UseDispatchResult (copy), GetUserOwnedClassicHeadsFunction (upval), SendAXCounterV2Function (upval), UseStateResult2 (copy)
		if CryoModule.isEmpty(UseSelectorResult6) and UseRoactServiceResult and UseSelectorResult and not UseRefResult.current then
			UseDispatchResult(GetUserOwnedClassicHeadsFunction(UseRoactServiceResult, UseSelectorResult, SendAXCounterV2Function))
			UseRefResult.current = true
			
			return
		else
			UseStateResult2(false)
		end
	end, {
		UseSelectorResult6,
		UseRoactServiceResult,
		UseSelectorResult
	})
	local HeadShapeInventoryStoreModule = if FFlagDynamicHeadsMigration then GetHeadShapeInventoryStoreModule(false) else nil
	local UseSignalStateResult = if FFlagDynamicHeadsMigration and HeadShapeInventoryStoreModule then SignalsReactModule.useSignalState(HeadShapeInventoryStoreModule.getInventory) else nil
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: FFlagDynamicHeadsMigration (upval), HeadShapeProperties (upval), UseSignalStateResult (copy), FFlagAXAddFacesToHeadList (upval), NextEntry (copy), FFlagAXFixTryOnHeadShapeThumbnail (upval), v1 (ref)
		return if FFlagDynamicHeadsMigration then HeadShapeProperties.fromInventory(UseSignalStateResult, if FFlagAXAddFacesToHeadList then NextEntry else nil, if FFlagAXFixTryOnHeadShapeThumbnail then v1 else nil) else HeadShapeProperties
	end, {
		UseSignalStateResult,
		if FFlagAXFixTryOnHeadShapeThumbnail then v1 else nil,
		if FFlagAXFixTryOnHeadShapeThumbnail then NextEntry else nil
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: GetEquippedHeadShapeNameFunction (upval), UseSelectorResult1 (copy), ConstantsModule (upval)
		return GetEquippedHeadShapeNameFunction(UseSelectorResult1, ConstantsModule.AssetTypeIdStrings.Head)
	end, { UseSelectorResult1 })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: GetDefaultSelectedHeadShapeNameFunction (upval), UseMemoResult (copy), UseMemoResult2 (copy), UseSelectorResult8 (copy), UseSelectorResult1 (copy), UseSelectorResult7 (copy), HeadShape (upval)
		return GetDefaultSelectedHeadShapeNameFunction({
			isTryingOnItems = UseMemoResult,
			equippedHeadShapeName = UseMemoResult2,
			lastTryOnHeadShapeName = UseSelectorResult8,
			equippedAssets = UseSelectorResult1,
			defaultHeadShapeName = UseSelectorResult7 or HeadShape.Default
		})
	end, {
		UseMemoResult,
		UseMemoResult2,
		UseSelectorResult8,
		UseSelectorResult1,
		UseSelectorResult7
	})
	local UseSelectorResult9 = UseSelectorFunction(SelectFacialAnimationForHeadAdjustmentModule)
	local NoUseSelectorResult = if FFlagHeadRefinementFacialAnimationToggle then UseSelectorResult9 == nil or not UseSelectorResult9 else nil
	local UseMemoResult4 = if FFlagHeadRefinementFacialAnimationToggle then ReactModule.useMemo(function(): string?
		-- upvalues: UseSelectorResult1 (copy), ConstantsModule (upval), TryOnItems (copy)
		if UseSelectorResult1 then
			local UseSelectorResultEntry = UseSelectorResult1[ConstantsModule.AssetTypeIdStrings.DynamicHead]
			
			if UseSelectorResultEntry then
				for i, _ in UseSelectorResultEntry do
					return (tostring(i))
				end
			end
		end
		if TryOnItems then
			for _, tryOnItem in TryOnItems do
				if not tryOnItem.bundleInfo then
					if tryOnItem.itemSubType == ConstantsModule.AssetTypeIdStrings.DynamicHead then
						return (tostring(tryOnItem.itemId))
					end
					continue
				end
				for i1, value in tryOnItem.bundleInfo do
					if value.assetType == ConstantsModule.AssetTypeIdStrings.DynamicHead then
						return (tostring(i1))
					end
				end
			end
		end
		return nil
	end, { UseSelectorResult1, TryOnItems }) else nil
	local UseResult = if FFlagHeadRefinementFacialAnimationToggle then ReactModule.useCallback(function(p1)
		-- upvalues: UseMemoResult4 (copy), FFlagAXLogFacialAnimationToggle (upval), SendUnifiedEventLogFunction (upval), UnifiedEventLogEnums (upval), UnifiedLoggingSurface (upval), HttpService (upval), NoUseSelectorResult (copy), UseDispatchResult (copy), SetStaticFacialAnimationFunction (upval)
		if UseMemoResult4 then
			if FFlagAXLogFacialAnimationToggle then
				SendUnifiedEventLogFunction({
					elementName = "FACIAL_ANIMATION_TOGGLE",
					action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
					surface = UnifiedLoggingSurface.CUSTOMIZE,
					itemId = UseMemoResult4,
					elementMetadata = HttpService:JSONEncode({
						trigger = "MANUAL_TOGGLE",
						change_from_FACS_status = tostring(NoUseSelectorResult),
						change_to_FACS_status = tostring(p1)
					})
				})
			end
			UseDispatchResult(SetStaticFacialAnimationFunction(not p1, UseMemoResult4))
		end
	end, { UseDispatchResult, UseMemoResult4, NoUseSelectorResult }) else nil
	local UseMemoResult5 = if FFlagDynamicHeadsMigration then ReactModule.useMemo(function(): boolean
		-- upvalues: UseMemoResult (copy), CryoModule (upval), TryOnItems (copy), ConstantsModule (upval), UseSelectorResult4 (copy), UseSelectorResult5 (copy), UtilsModule (upval), UseSelectorResult1 (copy)
		if UseMemoResult and not CryoModule.isEmpty(TryOnItems) then
			for _, tryOnItem in TryOnItems do
				if tryOnItem.itemSubType == ConstantsModule.AssetTypeIdStrings.DynamicHead then
					local UseSelectorResultEntry = if UseSelectorResult4 and tryOnItem.itemId then UseSelectorResult4[tostring(tryOnItem.itemId)] else nil
					
					if UseSelectorResultEntry and UseSelectorResultEntry.supportsHeadShapes then
						return true
					end
				end
				if tryOnItem.itemType == ConstantsModule.ItemType.Bundle and tryOnItem.itemSubType == ConstantsModule.BundleTypeIdStrings.DynamicHead and tryOnItem.bundleInfo then
					for i, _ in tryOnItem.bundleInfo do
						local UseSelectorResultEntry = if UseSelectorResult4 then UseSelectorResult4[tostring(i)] else nil
						
						if UseSelectorResultEntry and UseSelectorResultEntry.supportsHeadShapes then
							return true
						end
					end
					if UseSelectorResult5 and UseSelectorResult5[tryOnItem.itemId] then
						local UseSelectorResultEntry = UseSelectorResult5[tryOnItem.itemId]
						
						if UseSelectorResultEntry and UseSelectorResultEntry.supportsHeadShapes then
							return true
						end
					end
				end
			end
		end
		if UseMemoResult and not CryoModule.isEmpty(TryOnItems) and UtilsModule.isTryingOnDynamicHead(TryOnItems) then
			return false
		end
		local UseSelectorResultEntry = if UseSelectorResult1 then UseSelectorResult1[ConstantsModule.AssetTypeIdStrings.DynamicHead] else nil
		
		if UseSelectorResultEntry then
			for i1, _ in UseSelectorResultEntry do
				local UseSelectorResultEntry1 = if UseSelectorResult4 then UseSelectorResult4[i1] else nil
				
				if UseSelectorResultEntry1 and UseSelectorResultEntry1.supportsHeadShapes then
					return true
				end
			end
		end
		return false
	end, {
		UseMemoResult,
		TryOnItems,
		UseSelectorResult1,
		UseSelectorResult4,
		UseSelectorResult5
	}) else nil
	local UseMemoResult6 = ReactModule.useMemo(function()
		-- upvalues: FFlagDynamicHeadsMigration (upval), DashModule (upval), UseMemoResult1 (copy), UseSelectorResult6 (copy), UseMemoResult3 (copy), SendAXCounterV2Function (upval), Counters (upval), UseMemoResult (copy), UseDispatchResult (copy), SetDynamicHeadShapeFunction (upval), TryOnClassicHeadShapeFunction (upval), ToggleEquipAssetModule (upval), ConstantsModule (upval), SetLastSelectedHeadShapeFunction (upval)
		local List = {}
		
		for _, HeadShapeName in if FFlagDynamicHeadsMigration then DashModule.keys(UseMemoResult1) else UseSelectorResult6 do
			local UseMemoResultEntry = UseMemoResult1[HeadShapeName]
			
			if UseMemoResultEntry then
				table.insert(List, {
					headShapeName = HeadShapeName,
					headShapeData = UseMemoResultEntry,
					isSelected = UseMemoResult3 == HeadShapeName,
					onActivated = function()
						-- upvalues: UseMemoResultEntry (copy), SendAXCounterV2Function (upval), Counters (upval), HeadShapeName (copy), UseMemoResult (upval), FFlagDynamicHeadsMigration (upval), UseDispatchResult (upval), SetDynamicHeadShapeFunction (upval), TryOnClassicHeadShapeFunction (upval), ToggleEquipAssetModule (upval), ConstantsModule (upval), SetLastSelectedHeadShapeFunction (upval)
						local AssetId = UseMemoResultEntry.assetId
						SendAXCounterV2Function(Counters.HeadShapeSelect, {
							headShapeName = HeadShapeName or "none",
							isTryingOnItems = if UseMemoResult then "true" else "false"
						})
						
						if FFlagDynamicHeadsMigration then
							UseDispatchResult(SetDynamicHeadShapeFunction(HeadShapeName, (tostring(AssetId))))
						elseif UseMemoResult then
							UseDispatchResult(TryOnClassicHeadShapeFunction(HeadShapeName))
						else
							UseDispatchResult(ToggleEquipAssetModule(ConstantsModule.AssetTypeIdStrings.Head, (tostring(AssetId))))
						end
						if FFlagDynamicHeadsMigration then
							UseDispatchResult(SetLastSelectedHeadShapeFunction(HeadShapeName))
							
							return
						else
							UseDispatchResult(SetLastSelectedHeadShapeFunction(HeadShapeName))
						end
					end
				})
			end
		end
		return List
	end, {
		UseSelectorResult6, UseMemoResult3, UseDispatchResult, UseMemoResult,
		UseMemoResult1, UseMemoResult5
	})
	local UseMemoResult7 = if FFlagRemoveClassicHeadsAndFaces then ReactModule.useMemo(function(): boolean
		-- upvalues: UseMemoResult (copy), LookId (copy), FFlagDynamicHeadsMigration (upval), UtilsModule1 (upval), UseSelectorResult1 (copy), UseMemoResult5 (copy), UseSelectorResult8 (copy), UtilsModule (upval), TryOnItems (copy), ConstantsModule (upval), UseSelectorResult4 (copy)
		if UseMemoResult and LookId ~= nil then
			return true
		end
		if FFlagDynamicHeadsMigration and UtilsModule1.isDynamicHeadEquipped(UseSelectorResult1) then
			return not UseMemoResult5
		end
		if not UseMemoResult then
			return false
		end
		if UseSelectorResult8 then
			return false
		end
		local HasLookId = LookId ~= nil
		
		if UtilsModule.isTryingOnDynamicHead(TryOnItems) then
			return not UseMemoResult5
		end
		if not HasLookId then
			return false
		end
		for _, tryOnItem in TryOnItems do
			if tryOnItem.itemSubType == ConstantsModule.AssetTypeIdStrings.DynamicHead then
				local UseSelectorResultEntry = if UseSelectorResult4 and tryOnItem.itemId then UseSelectorResult4[tostring(tryOnItem.itemId)] else nil
				
				return not UseSelectorResultEntry or not UseSelectorResultEntry.supportsHeadShapes
			end
		end
		return false
	end, {
		UseSelectorResult1, TryOnItems, UseMemoResult, LookId, UseSelectorResult8,
		UseMemoResult5, UseSelectorResult4
	}) else ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), UtilsModule (upval), TryOnItems (copy), LookId (copy), UseSelectorResult8 (copy), UtilsModule1 (upval), UseSelectorResult1 (copy)
		if UseMemoResult then
			if UtilsModule.isTryingOnDynamicHead(TryOnItems) or LookId ~= nil then
				return true
			elseif UseSelectorResult8 then
				return false
			end
		end
		return UtilsModule1.isDynamicHeadEquipped(UseSelectorResult1)
	end, {
		UseSelectorResult1,
		TryOnItems,
		UseMemoResult,
		LookId,
		UseSelectorResult8
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult7 (copy), UseRefResult1 (copy), SendAXCounterV2Function (upval), Counters (upval)
		if UseMemoResult7 and not UseRefResult1.current then
			UseRefResult1.current = true
			SendAXCounterV2Function(Counters.Unsupported)
		end
	end, { UseMemoResult7 })
	
	return UseMemoResult6, UseMemoResult7, UseStateResult, NoUseSelectorResult, UseResult
end
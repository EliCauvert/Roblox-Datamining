local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local GetOutfitsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfits)
local RequestStatusEnumModule = require(Modules.AvatarExperience.Common.Enum.RequestStatusEnum)
local UseRequestModule = require(Modules.AvatarExperience.Common.Hooks.useRequest)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local OutfitSelectionGridItemContainerModule = require(script.Parent.Items.OutfitSelectionGridItemContainer)
local WasLastInputGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).wasLastInputGamepad
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local AXMaxOutfitSelectionCount = game:DefineFastInt("AXMaxOutfitSelectionCount", 10)
local _ = require(script.Parent.OutfitSelectionGrid)

local function selectOutfitInfos(p1)
	return p1.AvatarExperience.AvatarEditor.OutfitInfos
end

local function selectScreenSize(p1)
	return p1.ScreenSize
end

local function _(p1)
	return function(p2): boolean
		-- upvalues: p1 (copy)
		return not p2.AvatarExperience.AvatarEditor.PageFinished[p1]
	end
end

local _ = function(p1)
	return function(p2)
		-- upvalues: p1 (copy)
		local List = {}
		
		for _, value in p2.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[p1] or {} do
			table.insert(List, (tostring(value)))
		end
		return List
	end
end

return function(p2)
	-- upvalues: ReactModule (copy), UtilsModule (copy), UseFocusGuiObjectFunction (copy), UseSelectorFunction (copy), selectOutfitInfos (copy), selectScreenSize (copy), UseAppPolicyModule (copy), UseDispatchFunction (copy), GetOutfitsModule (copy), UseRequestModule (copy), RequestStatusEnumModule (copy), UseLocalizationFunction (copy), AXMaxOutfitSelectionCount (copy), UseStyleFunction (copy), CryoModule (copy), AXMaxOutfitSelectionCount (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), ConstantsModule1 (copy), WasLastInputGamepadFunction (copy), ConstantsModule (copy), OutfitSelectionGridItemContainerModule (copy)
	local NoIsEditable = p2.isEditable == nil or p2.isEditable
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UtilsModule (upval), p2 (copy), NoIsEditable (copy)
		return UtilsModule.getOutfitSubtypeKey(p2.outfitType, NoIsEditable)
	end, { p2.outfitType, NoIsEditable })
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy)
		return function(p3)
			-- upvalues: UseMemoResult (copy)
			local List = {}
			
			for _, value in p3.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[UseMemoResult] or {} do
				table.insert(List, (tostring(value)))
			end
			return List
		end
	end, { UseMemoResult })
	local UseSelectorResult = UseSelectorFunction((ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy)
		return function(p3): boolean
			-- upvalues: UseMemoResult (copy)
			return not p3.AvatarExperience.AvatarEditor.PageFinished[UseMemoResult]
		end
	end, { UseMemoResult })))
	local UseSelectorResult1 = UseSelectorFunction(UseMemoResult1)
	local UseSelectorResult2 = UseSelectorFunction(selectOutfitInfos)
	local UseSelectorResult3 = UseSelectorFunction(selectScreenSize)
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p3)
		return p3.getCustomOutfitNames()
	end)
	local UseAppPolicyModuleResult1 = UseAppPolicyModule(function(p3)
		return p3.getEnableContinuousLoad()
	end)
	local UseDispatchResult = UseDispatchFunction()
	local UseRequestModuleResult, UseRequestModuleResult2 = UseRequestModule((ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), GetOutfitsModule (upval), UseMemoResult (copy), NoIsEditable (copy), p2 (copy)
		return UseDispatchResult(GetOutfitsModule(UseMemoResult, NoIsEditable, nil, p2.outfitType))
	end, {
		UseDispatchResult,
		UseMemoResult,
		p2.outfitType,
		NoIsEditable
	})))
	local IsStatusMatch = UseRequestModuleResult.status == RequestStatusEnumModule.Pending
	local UseLocalizationResult = UseLocalizationFunction({
		itemType = "Feature.Avatar.Label.Avatars",
		loadMore = "Feature.Catalog.Action.LoadMore",
		maxSelectionToast = {
			"Feature.Avatar.Toast.MaxOutfitsSelected",
			maxSelectCount = AXMaxOutfitSelectionCount
		}
	})
	local Localized = {
		itemType = UseLocalizationResult.itemType,
		noItemsLabel = UseLocalizationFunction({
			noItemsLabel = {
				"Feature.Avatar.Label.NoItems",
				itemType = UseLocalizationResult.itemType
			}
		}).noItemsLabel,
		maxSelectionToast = UseLocalizationResult.maxSelectionToast,
		loadMore = UseLocalizationResult.loadMore
	}
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(0)
	local UseRefResult3 = ReactModule.useRef(p2.multiSelect)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy), p2 (copy)
		if UseRefResult3.current == true and p2.multiSelect == false then
			p2.setSelectedOutfits({})
		end
		UseRefResult3.current = p2.multiSelect
	end, { p2.multiSelect, p2.setSelectedOutfits })
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), CryoModule (upval), UseSelectorResult1 (copy)
		local List = {}
		local Flag = false
		
		for _, selectedOutfit in p2.selectedOutfits do
			if CryoModule.List.find(UseSelectorResult1, selectedOutfit) then
				table.insert(List, selectedOutfit)
			else
				Flag = true
			end
		end
		if Flag then
			p2.setSelectedOutfits(List)
		end
	end, {
		UseSelectorResult1,
		p2.selectedOutfits,
		p2.setSelectedOutfits
	})
	local UseResult = ReactModule.useCallback(function(p3)
		-- upvalues: AXMaxOutfitSelectionCount (upval), UseDispatchResult (copy), SetCurrentToastMessageModule (upval), Localized (copy), ToastTypeModule (upval), p2 (copy)
		if AXMaxOutfitSelectionCount < #p3 then
			UseDispatchResult(SetCurrentToastMessageModule({
				isLocalized = true,
				toastMessage = Localized.maxSelectionToast,
				toastType = ToastTypeModule.InformationMessage
			}))
			
			return
		else
			p2.setSelectedOutfits(p3)
		end
	end, {
		UseDispatchResult,
		p2.setSelectedOutfits,
		Localized.maxSelectionToast
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p2 (copy), ConstantsModule1 (upval), UseRefResult2 (copy), UseRefResult1 (copy)
		if p2.setCanScroll then
			p2.setCanScroll(UseRefResult1.current < UseRefResult2.current + (ConstantsModule1.ItemsGridTopPadding + ConstantsModule1.ItemsGridBottomPadding))
		end
	end, { p2.setCanScroll })
	
	return {
		goBack = p2.goBack,
		pageOwner = p2.pageOwner,
		forwardRef = p2.forwardRef,
		showCustomOutfitNames = UseAppPolicyModuleResult,
		enableContinuousLoad = UseAppPolicyModuleResult1,
		outfitIds = UseSelectorResult1,
		screenSize = UseSelectorResult3,
		hasMoreItems = UseSelectorResult,
		loadMoreItems = UseRequestModuleResult2,
		isFetchingMore = IsStatusMatch,
		localized = Localized,
		loadableGridViewRef = UseRefResult,
		stylePalette = UseStyleResult,
		absoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: UseRefResult1 (copy), UseResult1 (copy)
			UseRefResult1.current = Frame.AbsoluteSize.Y
			UseResult1()
		end, { UseResult1 }),
		contentSizeChanged = ReactModule.useCallback(function(p3)
			-- upvalues: UseRefResult2 (copy), UseResult1 (copy)
			UseRefResult2.current = p3.AbsoluteContentSize.Y
			UseResult1()
		end, { UseResult1 }),
		onLoadMoreButtonActivated = ReactModule.useCallback(function()
			-- upvalues: WasLastInputGamepadFunction (upval), UseSelectorResult (copy), UseSelectorResult1 (copy), ConstantsModule (upval), UseFocusGuiObjectResult (copy), UseRefResult (copy), UseRequestModuleResult2 (copy)
			local v1: boolean = UseSelectorResult and #UseSelectorResult1 == 0
			local UseSelectorResult1_1 = if v1 then nil else UseSelectorResult1 or nil
			local ShimmerCardsToDisplay = ConstantsModule.ShimmerCardsToDisplay
			
			if WasLastInputGamepadFunction() and (UseSelectorResult1_1 and #UseSelectorResult1_1 or ShimmerCardsToDisplay) > 0 and UseFocusGuiObjectResult and UseRefResult.current then
				UseFocusGuiObjectResult(UseRefResult.current)
			end
			UseRequestModuleResult2()
		end, {
			UseSelectorResult,
			UseSelectorResult1,
			UseFocusGuiObjectResult,
			UseRequestModuleResult2
		}),
		renderItem = ReactModule.useCallback(function(p3)
			-- upvalues: ReactModule (upval), OutfitSelectionGridItemContainerModule (upval), p2 (copy), UseSelectorResult2 (copy), UseResult (copy)
			local ItemId = if typeof(p3) == "table" then nil else p3
			
			return ReactModule.createElement(OutfitSelectionGridItemContainerModule, {
				multiSelect = p2.multiSelect ~= nil and p2.multiSelect,
				itemId = ItemId,
				outfitInfo = UseSelectorResult2[tostring(ItemId)],
				setSelectedOutfits = UseResult,
				selectedOutfits = p2.selectedOutfits,
				onToggleOutfitCard = p2.onToggleOutfitCard
			})
		end, {
			p2.selectedOutfits, p2.multiSelect, p2.onToggleOutfitCard,
			p2.setSelectedOutfits, UseSelectorResult2, UseResult
		})
	}
end
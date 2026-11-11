local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local FoundationModule = require(CorePackages.Packages.Foundation)
local GridMetrics = require(CorePackages.Packages.UIBlox).App.Grid.GridMetrics
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local FFlagAEGetEditableOutfitsTypeModule = require(Modules.AvatarExperience.Flags.FFlagAEGetEditableOutfitsType)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local ConstantsModule = require(Modules.LuaApp.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local ConstantsModule2 = require(Modules.AvatarExperience.Common.Constants)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local SelectIsFullViewModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local GetOutfitsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfits)
local EditableCharacterKey = ConstantsModule1.EditableCharacterKey

local function selectPageFinished(p1)
	return p1.AvatarExperience.AvatarEditor.PageFinished
end

local function selectOwnedItemIdsWearing(p1)
	-- upvalues: EditableCharacterKey (copy), UtilsModule (copy)
	local OutfitInfos = p1.AvatarExperience.AvatarEditor.OutfitInfos
	local EquippedAssets = p1.AvatarExperience.AvatarEditor.Character.EquippedAssets
	local AvatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType
	local BodyColor3s = p1.AvatarExperience.AvatarEditor.Character.BodyColor3s
	local AvatarScales = p1.AvatarExperience.AvatarEditor.Character.AvatarScales
	local OwnedItemIdsBySubtype = p1.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype
	local ItemIdsToIsWearing = {}
	local HasItemEquipped = false
	local Copy = if OwnedItemIdsBySubtype then table.clone(OwnedItemIdsBySubtype[EditableCharacterKey] or {}) else {}
	for _, value in Copy do
		local OutfitInfo = OutfitInfos[value]
		
		if OutfitInfo then
			local IsWearingOutfitNoState = UtilsModule.isWearingOutfitNoState(OutfitInfo, AvatarType, BodyColor3s, EquippedAssets, AvatarScales)
			ItemIdsToIsWearing[value] = IsWearingOutfitNoState
			
			if IsWearingOutfitNoState then
				HasItemEquipped = true
			end
		end
	end
	return {
		ownedItemIds = Copy,
		itemIdsToIsWearing = ItemIdsToIsWearing,
		hasItemEquipped = HasItemEquipped
	}
end

local function selectScreenSize(p2)
	return p2.ScreenSize
end

local function selectAnalyticsMetadata(p2)
	return p2.AvatarExperience.AnalyticsMetadata
end

local function selectFetchStatus(p2)
	-- upvalues: PerformFetch (copy), EditableCharacterKey (copy)
	return PerformFetch.GetStatus(p2, EditableCharacterKey)
end

return function()
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), FoundationModule (copy), UseAppPolicyModule (copy), UseSelectorFunction (copy), selectScreenSize (copy), GetUseSelectorDeepEqualsFunction (copy), selectPageFinished (copy), SelectIsFullViewModule (copy), selectOwnedItemIdsWearing (copy), selectFetchStatus (copy), EditableCharacterKey (copy), RetrievalStatusModule (copy), ReactModule (copy), ConstantsModule2 (copy), FullView (copy), GridMetrics (copy), GetOutfitsModule (copy), ConstantsModule1 (copy), FFlagAEGetEditableOutfitsTypeModule (copy), selectAnalyticsMetadata (copy), ConstantsModule (copy), Signal (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		return p2.getEnableContinuousLoad()
	end)
	local UseSelectorResult = UseSelectorFunction(selectScreenSize, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(selectPageFinished, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: SelectIsFullViewModule (upval), UseAvatarRouteResult (copy)
		return SelectIsFullViewModule(p2, UseAvatarRouteResult.opaque.name)
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult3 = UseSelectorFunction(selectOwnedItemIdsWearing, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult4 = UseSelectorFunction(selectFetchStatus, GetUseSelectorDeepEqualsFunction())
	local ItemIdsToIsWearing = UseSelectorResult3.itemIdsToIsWearing
	local HasItemEquipped = UseSelectorResult3.hasItemEquipped
	local Inverted = not UseSelectorResult1[EditableCharacterKey]
	local IsNotUseSelectorResultMatch: boolean = not UseAppPolicyModuleResult and (Inverted and UseSelectorResult4 ~= RetrievalStatusModule.Fetching)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseSelectorResult.X * ConstantsModule2.LandscapeNavWidth)
	local IsUseSelectorResultMatch = UseSelectorResult2 == FullView.SceneFullView
	local IsUseSelectorResultMatch1 = UseSelectorResult2 == FullView.UIFullView
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GridMetrics (upval), UseStateResult (copy), UseTokensResult (copy)
		return GridMetrics.getSmallMetrics(math.max(UseStateResult - UseTokensResult.Size.Size_400 * 2, 0), UseTokensResult.Size.Size_300)
	end, { UseStateResult })
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.X)
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult3 (copy)
		if UseSelectorResult3.ownedItemIds then
			local Copy = table.clone(UseSelectorResult3.ownedItemIds)
			table.insert(Copy, 1, "AVATAR_SWITCHER_SETTINGS_TILE")
			
			return Copy
		else
			return {}
		end
	end, { UseSelectorResult3.ownedItemIds })
	local UseResult1 = ReactModule.useCallback(function(p2): boolean
		return p2 == "AVATAR_SWITCHER_SETTINGS_TILE"
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: Inverted (copy), UseSelectorResult4 (copy), RetrievalStatusModule (upval), UseDispatchResult (copy), GetOutfitsModule (upval), ConstantsModule1 (upval), EditableCharacterKey (upval), FFlagAEGetEditableOutfitsTypeModule (upval), ConstantsModule2 (upval)
		if Inverted and UseSelectorResult4 ~= RetrievalStatusModule.Fetching then
			UseDispatchResult(GetOutfitsModule(ConstantsModule1.EditableCharacterKey, true, EditableCharacterKey, if FFlagAEGetEditableOutfitsTypeModule then ConstantsModule2.OutfitTypes.Avatar else nil))
		end
	end, { UseDispatchResult, Inverted, UseSelectorResult4 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseAppPolicyModuleResult (copy), UseResult2 (copy)
		if UseAppPolicyModuleResult then
			UseResult2()
		end
	end, { UseAppPolicyModuleResult, UseResult2 })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.pop()
	end, { UseNavigationResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult2 (copy)
		UseResult2()
	end, {})
	local Key: string = UseAvatarRouteResult.current.key
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	
	return {
		fetchMoreOutfits = UseResult2,
		gridMetrics = UseMemoResult,
		hasItemFromCurrentPageEquipped = HasItemEquipped,
		isSceneFullView = IsUseSelectorResultMatch,
		isUIFullView = IsUseSelectorResultMatch1,
		itemIds = UseMemoResult1,
		itemIdsToIsWearing = ItemIdsToIsWearing,
		onAbsoluteSizeChanged = UseResult,
		onBackButtonPressed = UseResult4,
		onScrollingFrameThresholdReached = UseResult3,
		shouldRenderSettingsTile = UseResult1,
		impressionsTag = ConstantsModule.ImpressionsEvents.AvatarItems .. (if Key then string.gsub(Key, "[-{}]", "") else ""),
		analyticsMetadata = UseSelectorFunction(selectAnalyticsMetadata),
		requestImpressionsSignal = UseMemoResult2,
		impressionsPageFilter = ReactModule.useCallback(function(): boolean
			-- upvalues: Key (copy), UseNavigationResult (copy)
			return Key == UseNavigationResult.state.key
		end, { Key, UseNavigationResult.state.key }),
		onCanvasPositionChanged = ReactModule.useCallback(function()
			-- upvalues: UseMemoResult2 (copy)
			UseMemoResult2:fire()
		end, { UseMemoResult2 }),
		searchUuid = EditableCharacterKey,
		showLoadMoreButton = IsNotUseSelectorResultMatch
	}
end
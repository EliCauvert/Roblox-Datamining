local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local AvatarExperienceSaveModule = require(Parent.AvatarExperienceSave)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local SignalsReactModule = require(Parent.SignalsReact)
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FoundationModule = require(Parent.Foundation)
local ToastRoduxModule = require(Parent.ToastRodux)
local TutilsModule = require(Parent.tutils)
local IconName = FoundationModule.Enums.IconName
local FFlagAXExtendUndoRedoTracking = AvatarExperienceFlagsModule.FFlagAXExtendUndoRedoTracking
local FFlagAXMigrateBuilderIcons = AvatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons
local FFlagAXResetAvatarButton = AvatarExperienceFlagsModule.FFlagAXResetAvatarButton
local SlotBasedEditorAnalytics = require(Parent.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local ToastType = ToastRoduxModule.Enums.ToastType
local UseSelectorSignalFunction = AvatarExperienceCommonModule.Hooks.useSelectorSignal
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseAvatarSaveContextFunction = AvatarExperienceSaveModule.Context.useAvatarSaveContext
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local CharacterHistoryStateChangeButtonActivatedFunction = AvatarExperienceCommonModule.State.Actions.CharacterHistoryStateChangeButtonActivated
local ClearScreensFunction = AvatarExperienceNavigationModule.Actions.ClearScreens
local MenuItemEnumModule = require(AvatarExperienceControlBar.Enums.MenuItemEnum)
local SelectCharacterData = if FFlagAXResetAvatarButton then AvatarExperienceSaveModule.Selectors.selectCharacterData else nil
local ClearTryOnsFunction = require(Parent.AvatarExperienceRodux).Actions.ClearTryOns
local _ = require(AvatarExperienceControlBar.ControlBarTypes)
local ConstantsModule = require(AvatarExperienceControlBar.Constants)
local Config = if FFlagAXResetAvatarButton then {
	toastMessage = "Feature.Avatar.Message.OutfitCleared",
	isLocalized = false,
	toastType = ToastType.SuccessConfirmation
} else nil

return function() --[[ Line: 58 | Named "useUndoRedoBarViewModel" ]]
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), FFlagAXMigrateBuilderIcons (copy), UseTokensFunction (copy), UseAvatarSaveContextFunction (copy), FFlagAXResetAvatarButton (copy), UseSelectorSignalFunction (copy), SelectCharacterData (copy), TutilsModule (copy), FFlagAXExtendUndoRedoTracking (copy), UseAvatarRouteFunction (copy), SignalsReactModule (copy), ReactModule (copy), ConstantsModule (copy), SlotBasedEditorAnalytics (copy), CharacterHistoryStateChangeButtonActivatedFunction (copy), ClearScreensFunction (copy), AvatarScreen (copy), ClearTryOnsFunction (copy), SetCurrentToastMessageFunction (copy), Config (copy), MenuItemEnumModule (copy), IconName (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = if FFlagAXMigrateBuilderIcons then UseTokensFunction() else nil
	local UseAvatarSaveContextResult = UseAvatarSaveContextFunction()
	local UseSelectorSignalResult = if FFlagAXResetAvatarButton then UseSelectorSignalFunction(SelectCharacterData, TutilsModule.deepEqual) else nil
	local UseAvatarRouteResult = if FFlagAXExtendUndoRedoTracking then UseAvatarRouteFunction() else nil
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseAvatarSaveContextResult.getHistorySignal)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseAvatarSaveContextResult.getCurrentHistoryIndexSignal)
	local UseSignalStateResult2 = if FFlagAXResetAvatarButton then SignalsReactModule.useSignalState(UseSelectorSignalResult) else nil
	local UseMemoResult = ReactModule.useMemo(function(): boolean --[[ Line: 83 ]]
		-- upvalues: UseSignalStateResult1 (copy), UseSignalStateResult (copy)
		return not UseSignalStateResult1 or not UseSignalStateResult or UseSignalStateResult1 == 1
	end, { UseSignalStateResult1, UseSignalStateResult })
	local UseMemoResult1 = ReactModule.useMemo(function(): boolean --[[ Line: 91 ]]
		-- upvalues: UseSignalStateResult1 (copy), UseSignalStateResult (copy)
		return not UseSignalStateResult1 or not UseSignalStateResult or UseSignalStateResult1 == #UseSignalStateResult
	end, { UseSignalStateResult1, UseSignalStateResult })
	local UseMemoResult2 = if FFlagAXResetAvatarButton then ReactModule.useMemo(function(): boolean --[[ Line: 100 ]]
		-- upvalues: UseSignalStateResult2 (copy), ConstantsModule (upval)
		if UseSignalStateResult2 and UseSignalStateResult2.tryOn and UseSignalStateResult2.tryOn.OutfitTryOn and next(UseSignalStateResult2.tryOn.OutfitTryOn.TryOnItems) ~= nil then
			return false
		end
		if not UseSignalStateResult2 or not UseSignalStateResult2.equipped or not UseSignalStateResult2.equipped.EquippedAssets then
			return true
		end
		for equippedAsset in UseSignalStateResult2.equipped.EquippedAssets do
			if table.find(ConstantsModule.AssetTypeStringsToKeep, equippedAsset) == nil then
				return false
			end
		end
		return true
	end, { UseSignalStateResult2, UseSignalStateResult }) else nil
	local UseResult = ReactModule.useCallback(function(IsUndo) --[[ Line: 125 ]]
		-- upvalues: UseAvatarSaveContextResult (copy), UseSignalStateResult1 (copy), SlotBasedEditorAnalytics (upval), FFlagAXExtendUndoRedoTracking (upval), UseAvatarRouteResult (copy), UseDispatchResult (copy), CharacterHistoryStateChangeButtonActivatedFunction (upval), UseNavigationResult (copy), ClearScreensFunction (upval), AvatarScreen (upval)
		if UseAvatarSaveContextResult then
			local UpdateHistoryIndexAndGetCharacterDataResult = UseAvatarSaveContextResult.updateHistoryIndexAndGetCharacterData(UseSignalStateResult1 + (if IsUndo then -1 else 1))
			
			if UpdateHistoryIndexAndGetCharacterDataResult then
				SlotBasedEditorAnalytics.trackUndoRedoClick(IsUndo, if FFlagAXExtendUndoRedoTracking and UseAvatarRouteResult and UseAvatarRouteResult.opaque then UseAvatarRouteResult.opaque.name else nil)
				UseDispatchResult(CharacterHistoryStateChangeButtonActivatedFunction({
					isUndo = IsUndo,
					equipped = UpdateHistoryIndexAndGetCharacterDataResult.equipped,
					tryOn = UpdateHistoryIndexAndGetCharacterDataResult.tryOn
				}))
				UseNavigationResult.dispatch(ClearScreensFunction({ AvatarScreen.LookDetails }))
			end
		end
	end, {
		UseDispatchResult, UseAvatarSaveContextResult, UseSignalStateResult1,
		UseNavigationResult, UseAvatarRouteResult, UseSignalStateResult
	})
	local UseResult1 = if FFlagAXResetAvatarButton then ReactModule.useCallback(function() --[[ Line: 152 ]]
		-- upvalues: UseSelectorSignalResult (copy), SlotBasedEditorAnalytics (upval), UseAvatarRouteResult (copy), ConstantsModule (upval), UseDispatchResult (copy), CharacterHistoryStateChangeButtonActivatedFunction (upval), ClearTryOnsFunction (upval), SetCurrentToastMessageFunction (upval), Config (upval)
		local UseSelectorSignalResultResult = UseSelectorSignalResult(false)
		
		if UseSelectorSignalResultResult then
			if SlotBasedEditorAnalytics.trackAvatarRemoveAllClick and UseAvatarRouteResult and UseAvatarRouteResult.opaque then
				SlotBasedEditorAnalytics.trackAvatarRemoveAllClick(UseAvatarRouteResult.opaque.name)
			end
			local EquippedAssets = {}
			
			for _, value in ConstantsModule.AssetTypeStringsToKeep do
				EquippedAssets[value] = UseSelectorSignalResultResult.equipped.EquippedAssets[value]
			end
			UseSelectorSignalResultResult.equipped.EquippedAssets = EquippedAssets
			UseDispatchResult(CharacterHistoryStateChangeButtonActivatedFunction(UseSelectorSignalResultResult))
			UseDispatchResult(ClearTryOnsFunction())
			UseDispatchResult(SetCurrentToastMessageFunction(Config))
		end
	end, { UseDispatchResult }) else nil
	
	if FFlagAXExtendUndoRedoTracking then
		ReactModule.useEffect(function() --[[ Line: 182 ]]
			-- upvalues: SlotBasedEditorAnalytics (upval), UseAvatarRouteResult (copy), UseSignalStateResult (copy)
			if SlotBasedEditorAnalytics.trackUndoHistoryCount and UseAvatarRouteResult and UseAvatarRouteResult.opaque and UseSignalStateResult and #UseSignalStateResult then
				SlotBasedEditorAnalytics.trackUndoHistoryCount(UseAvatarRouteResult.opaque.name, #UseSignalStateResult)
			end
		end, { UseSignalStateResult, UseAvatarRouteResult })
	end
	return {
		items = ReactModule.useMemo(function() --[[ Line: 197 ]]
			-- upvalues: FFlagAXResetAvatarButton (upval), MenuItemEnumModule (upval), IconName (upval), UseTokensResult (copy), UseResult1 (copy), UseMemoResult2 (copy), FFlagAXMigrateBuilderIcons (upval), UseResult (copy), UseMemoResult (copy), UseMemoResult1 (copy)
			return if FFlagAXResetAvatarButton then {
				{
					type = "icon",
					isActive = false,
					id = MenuItemEnumModule.Reset.Reset,
					icon = IconName.ArrowSpinClockwise,
					iconSize = UseTokensResult.Size.Size_500,
					onActivated = function() --[[ Line: 206 ]]
						-- upvalues: UseResult1 (upval)
						UseResult1()
					end,
					disabled = UseMemoResult2
				},
				{
					type = "icon",
					isActive = false,
					id = MenuItemEnumModule.Undo,
					icon = if FFlagAXMigrateBuilderIcons then IconName.ArrowCurlToLeft else "icons/actions/edit/undo",
					onActivated = function() --[[ Line: 217 ]]
						-- upvalues: UseResult (upval)
						UseResult(true)
					end,
					disabled = UseMemoResult
				},
				{
					type = "icon",
					isActive = false,
					id = MenuItemEnumModule.Redo,
					icon = if FFlagAXMigrateBuilderIcons then IconName.ArrowCurlToRight else "icons/actions/edit/redo",
					onActivated = function() --[[ Line: 229 ]]
						-- upvalues: UseResult (upval)
						UseResult(false)
					end,
					disabled = UseMemoResult1
				}
			} else {
				{
					type = "icon",
					isActive = false,
					id = MenuItemEnumModule.Undo,
					icon = if FFlagAXMigrateBuilderIcons then IconName.ArrowCurlToLeft else "icons/actions/edit/undo",
					onActivated = function() --[[ Line: 244 ]]
						-- upvalues: UseResult (upval)
						UseResult(true)
					end,
					disabled = UseMemoResult
				},
				{
					type = "icon",
					isActive = false,
					id = MenuItemEnumModule.Redo,
					icon = if FFlagAXMigrateBuilderIcons then IconName.ArrowCurlToRight else "icons/actions/edit/redo",
					onActivated = function() --[[ Line: 256 ]]
						-- upvalues: UseResult (upval)
						UseResult(false)
					end,
					disabled = UseMemoResult1
				}
			}
		end, if FFlagAXResetAvatarButton then {
			UseMemoResult,
			UseMemoResult1,
			UseMemoResult2,
			UseResult,
			UseResult1
		} else { UseMemoResult, UseMemoResult1, UseResult })
	}
end
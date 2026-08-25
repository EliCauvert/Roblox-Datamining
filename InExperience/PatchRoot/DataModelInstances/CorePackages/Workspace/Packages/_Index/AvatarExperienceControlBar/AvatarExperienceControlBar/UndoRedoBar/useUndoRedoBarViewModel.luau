local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local avatarExperienceSaveModule = require(parent.AvatarExperienceSave)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local signalsReactModule = require(parent.SignalsReact)
local navigationModule = require(parent.Navigation)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local foundationModule = require(parent.Foundation)
local toastRoduxModule = require(parent.ToastRodux)
local tutilsModule = require(parent.tutils)
local iconName = foundationModule.Enums.IconName
local fFlagAXExtendUndoRedoTracking = avatarExperienceFlagsModule.FFlagAXExtendUndoRedoTracking
local fFlagAXMigrateBuilderIcons = avatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons
local fFlagAXResetAvatarButton = avatarExperienceFlagsModule.FFlagAXResetAvatarButton
local fFlagDynamicHeadsMigration = avatarExperienceFlagsModule.FFlagDynamicHeadsMigration
local slotBasedEditorAnalytics = avatarExperienceAnalyticsModule.Surfaces.SlotBasedEditorAnalytics
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local toastType = toastRoduxModule.Enums.ToastType
local useSelectorSignal = avatarExperienceCommonModule.Hooks.useSelectorSignal
local useTokens = foundationModule.Hooks.useTokens
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useAvatarSaveContext = avatarExperienceSaveModule.Context.useAvatarSaveContext
local useNavigation = navigationModule.useNavigation
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local avatarScreen = avatarExperienceNavigationModule.Enums.AvatarScreen
local characterHistoryStateChangeButtonActivated = avatarExperienceCommonModule.State.Actions.CharacterHistoryStateChangeButtonActivated
local clearScreens = avatarExperienceNavigationModule.Actions.ClearScreens
local fFlagAXMISEnableMultiShopping = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local menuItemEnumModule = require(avatarExperienceControlBar.Enums.MenuItemEnum)
local var13 = if fFlagAXResetAvatarButton then avatarExperienceSaveModule.Selectors.selectCharacterData else nil
local clearTryOns = require(parent.AvatarExperienceRodux).Actions.ClearTryOns
local _ = require(avatarExperienceControlBar.ControlBarTypes)
local constantsModule = require(avatarExperienceControlBar.Constants)
local var15 = if fFlagAXResetAvatarButton then {
	toastMessage = "Feature.Avatar.Message.OutfitCleared",
	isLocalized = false,
	toastType = toastType.SuccessConfirmation
} else nil

return function()
	-- upvalues: useNavigation (ref), useDispatch (ref), fFlagAXMigrateBuilderIcons (ref), useTokens (ref), useAvatarSaveContext (ref), fFlagAXResetAvatarButton (ref), useSelectorSignal (ref), var13 (ref), tutilsModule (ref), fFlagAXExtendUndoRedoTracking (ref), useAvatarRoute (ref), signalsReactModule (ref), reactModule (ref), fFlagDynamicHeadsMigration (ref), constantsModule (ref), slotBasedEditorAnalytics (ref), characterHistoryStateChangeButtonActivated (ref), fFlagAXMISEnableMultiShopping (ref), avatarScreen (ref), clearScreens (ref), clearTryOns (ref), setCurrentToastMessage (ref), var15 (ref), menuItemEnumModule (ref), iconName (ref)
	local var16 = useNavigation()
	local var17 = useDispatch()
	local var18 = if fFlagAXMigrateBuilderIcons then useTokens() else nil
	local var19 = useAvatarSaveContext()
	local getHistorySignal = var19.getHistorySignal
	local getCurrentHistoryIndexSignal = var19.getCurrentHistoryIndexSignal
	local var20 = if fFlagAXResetAvatarButton then useSelectorSignal(var13, tutilsModule.deepEqual) else nil
	local var21 = if fFlagAXExtendUndoRedoTracking then useAvatarRoute() else nil
	local var22 = signalsReactModule.useSignalState(getHistorySignal)
	local var23 = signalsReactModule.useSignalState(getCurrentHistoryIndexSignal)
	local var24 = if fFlagAXResetAvatarButton then signalsReactModule.useSignalState(var20) else nil
	local var25 = reactModule.useMemo(function()
		-- upvalues: var23 (ref), var22 (ref)
		return if var23 and var22 then var23 == 1 else true
	end, { var23, var22 })
	local var26 = reactModule.useMemo(function()
		-- upvalues: var23 (ref), var22 (ref)
		return if var23 and var22 then var23 == #var22 else true
	end, { var23, var22 })
	local var27 = if fFlagAXResetAvatarButton then reactModule.useMemo(function()
		-- upvalues: fFlagDynamicHeadsMigration (copy), var24 (ref), constantsModule (copy)
		if fFlagDynamicHeadsMigration then
			if var24 and var24.tryOn and (var24.tryOn.OutfitTryOn and next(var24.tryOn.OutfitTryOn.TryOnItems) ~= nil) then
				return false
			elseif not var24 or not var24.equipped or not var24.equipped.EquippedAssets then
				return true
			end
			for i in var24.equipped.EquippedAssets do
				if table.find(constantsModule.AssetTypeStringsToKeep, i) == nil then
					return false
				end
			end
			return true
		elseif next(var24.tryOn.OutfitTryOn.TryOnItems) ~= nil then
			return false
		end
		for i in var24.equipped.EquippedAssets do
			if table.find(constantsModule.AssetTypeStringsToKeep, i) == nil then
				return false
			end
		end
		return true
	end, { var24, var22 }) else nil
	local var28 = reactModule.useCallback(function(p0)
		-- upvalues: var19 (ref), var23 (ref), slotBasedEditorAnalytics (copy), fFlagAXExtendUndoRedoTracking (copy), var21 (ref), var17 (ref), characterHistoryStateChangeButtonActivated (copy), fFlagAXMISEnableMultiShopping (copy), var16 (ref), avatarScreen (copy), clearScreens (copy)
		if var19 then
			local var30 = var19.updateHistoryIndexAndGetCharacterData(var23 + (if p0 then -1 else 1))
			
			if var30 then
				slotBasedEditorAnalytics.trackUndoRedoClick(p0, if fFlagAXExtendUndoRedoTracking and var21 and var21.opaque then var21.opaque.name else nil)
				var17(characterHistoryStateChangeButtonActivated({
					isUndo = p0,
					equipped = var30.equipped,
					tryOn = var30.tryOn
				}))
				
				if var30.tryOn.OutfitTryOn and var30.tryOn.OutfitTryOn.LookId ~= nil and (var30.tryOn.OutfitTryOn.LookId ~= "" and not fFlagAXMISEnableMultiShopping) then
					var16.navigate(avatarScreen.LookDetails)
					
					return
				end
				var16.dispatch(clearScreens({ avatarScreen.LookDetails }))
			end
		end
	end, {
		var17, var19, var23, var16, var21, var22
	})
	local var29 = if fFlagAXResetAvatarButton then reactModule.useCallback(function()
		-- upvalues: var20 (ref), slotBasedEditorAnalytics (copy), var21 (ref), constantsModule (copy), var17 (ref), characterHistoryStateChangeButtonActivated (copy), clearTryOns (copy), setCurrentToastMessage (copy), var15 (copy)
		local var31 = var20(false)
		
		if var31 then
			if slotBasedEditorAnalytics.trackAvatarRemoveAllClick and var21 and var21.opaque then
				slotBasedEditorAnalytics.trackAvatarRemoveAllClick(var21.opaque.name)
			end
			local t = {}
			
			for i, v in constantsModule.AssetTypeStringsToKeep do
				t[v] = var31.equipped.EquippedAssets[v]
			end
			var31.equipped.EquippedAssets = t
			var17(characterHistoryStateChangeButtonActivated(var31))
			var17(clearTryOns())
			var17(setCurrentToastMessage(var15))
		end
	end, { var17 }) else nil
	
	if fFlagAXExtendUndoRedoTracking then
		reactModule.useEffect(function()
			-- upvalues: slotBasedEditorAnalytics (copy), var21 (ref), var22 (ref)
			if slotBasedEditorAnalytics.trackUndoHistoryCount and var21 and (var21.opaque and var22) and #var22 then
				slotBasedEditorAnalytics.trackUndoHistoryCount(var21.opaque.name, #var22)
			end
		end, { var22, var21 })
	end
	return {
		items = reactModule.useMemo(function()
			-- upvalues: fFlagAXResetAvatarButton (copy), menuItemEnumModule (copy), iconName (copy), var18 (ref), var29 (ref), var27 (ref), fFlagAXMigrateBuilderIcons (copy), var28 (ref), var25 (ref), var26 (ref)
			return if fFlagAXResetAvatarButton then {
				{
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Reset.Reset,
					icon = iconName.ArrowSpinClockwise,
					iconSize = var18.Size.Size_500,
					onActivated = function()
						-- upvalues: var29 (copy)
						var29()
					end,
					disabled = var27
				},
				{
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Undo,
					icon = if fFlagAXMigrateBuilderIcons then iconName.ArrowCurlToLeft else "icons/actions/edit/undo",
					onActivated = function()
						-- upvalues: var28 (copy)
						var28(true)
					end,
					disabled = var25
				},
				{
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Redo,
					icon = if fFlagAXMigrateBuilderIcons then iconName.ArrowCurlToRight else "icons/actions/edit/redo",
					onActivated = function()
						-- upvalues: var28 (copy)
						var28(false)
					end,
					disabled = var26
				}
			} else {
				{
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Undo,
					icon = if fFlagAXMigrateBuilderIcons then iconName.ArrowCurlToLeft else "icons/actions/edit/undo",
					onActivated = function()
						-- upvalues: var28 (copy)
						var28(true)
					end,
					disabled = var25
				},
				{
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Redo,
					icon = if fFlagAXMigrateBuilderIcons then iconName.ArrowCurlToRight else "icons/actions/edit/redo",
					onActivated = function()
						-- upvalues: var28 (copy)
						var28(false)
					end,
					disabled = var26
				}
			}
		end, if fFlagAXResetAvatarButton then {
			var25,
			var26,
			var27,
			var28,
			var29
		} else { var25, var26, var28 })
	}
end
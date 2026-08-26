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
local var1 = if fFlagAXResetAvatarButton then avatarExperienceSaveModule.Selectors.selectCharacterData else nil
local clearTryOns = require(parent.AvatarExperienceRodux).Actions.ClearTryOns
local _ = require(avatarExperienceControlBar.ControlBarTypes)
local constantsModule = require(avatarExperienceControlBar.Constants)
local var2 = if fFlagAXResetAvatarButton then {
	toastMessage = "Feature.Avatar.Message.OutfitCleared",
	isLocalized = false,
	toastType = toastType.SuccessConfirmation
} else nil

return function()
	-- upvalues: useNavigation (ref), useDispatch (ref), fFlagAXMigrateBuilderIcons (ref), useTokens (ref), useAvatarSaveContext (ref), fFlagAXResetAvatarButton (ref), useSelectorSignal (ref), var1 (ref), tutilsModule (ref), fFlagAXExtendUndoRedoTracking (ref), useAvatarRoute (ref), signalsReactModule (ref), reactModule (ref), fFlagDynamicHeadsMigration (ref), constantsModule (ref), slotBasedEditorAnalytics (ref), characterHistoryStateChangeButtonActivated (ref), fFlagAXMISEnableMultiShopping (ref), avatarScreen (ref), clearScreens (ref), clearTryOns (ref), setCurrentToastMessage (ref), var2 (ref), menuItemEnumModule (ref), iconName (ref)
	local var3 = useNavigation()
	local var4 = useDispatch()
	local var5 = if fFlagAXMigrateBuilderIcons then useTokens() else nil
	local var6 = useAvatarSaveContext()
	local getHistorySignal = var6.getHistorySignal
	local getCurrentHistoryIndexSignal = var6.getCurrentHistoryIndexSignal
	local var7 = if fFlagAXResetAvatarButton then useSelectorSignal(var1, tutilsModule.deepEqual) else nil
	local var8 = if fFlagAXExtendUndoRedoTracking then useAvatarRoute() else nil
	local var9 = signalsReactModule.useSignalState(getHistorySignal)
	local var10 = signalsReactModule.useSignalState(getCurrentHistoryIndexSignal)
	local var11 = if fFlagAXResetAvatarButton then signalsReactModule.useSignalState(var7) else nil
	local var12 = reactModule.useMemo(function()
		-- upvalues: var10 (ref), var9 (ref)
		return if var10 and var9 then var10 == 1 else true
	end, { var10, var9 })
	local var13 = reactModule.useMemo(function()
		-- upvalues: var10 (ref), var9 (ref)
		return if var10 and var9 then var10 == #var9 else true
	end, { var10, var9 })
	local var14 = if fFlagAXResetAvatarButton then reactModule.useMemo(function()
		-- upvalues: fFlagDynamicHeadsMigration (copy), var11 (ref), constantsModule (copy)
		if fFlagDynamicHeadsMigration then
			if var11 and var11.tryOn and (var11.tryOn.OutfitTryOn and next(var11.tryOn.OutfitTryOn.TryOnItems) ~= nil) then
				return false
			elseif not var11 or not var11.equipped or not var11.equipped.EquippedAssets then
				return true
			end
			for i in var11.equipped.EquippedAssets do
				if table.find(constantsModule.AssetTypeStringsToKeep, i) == nil then
					return false
				end
			end
			return true
		elseif next(var11.tryOn.OutfitTryOn.TryOnItems) ~= nil then
			return false
		end
		for i in var11.equipped.EquippedAssets do
			if table.find(constantsModule.AssetTypeStringsToKeep, i) == nil then
				return false
			end
		end
		return true
	end, { var11, var9 }) else nil
	local var15 = reactModule.useCallback(function(p1)
		-- upvalues: var6 (ref), var10 (ref), slotBasedEditorAnalytics (copy), fFlagAXExtendUndoRedoTracking (copy), var8 (ref), var4 (ref), characterHistoryStateChangeButtonActivated (copy), fFlagAXMISEnableMultiShopping (copy), var3 (ref), avatarScreen (copy), clearScreens (copy)
		if var6 then
			local var16 = var6.updateHistoryIndexAndGetCharacterData(var10 + (if p1 then -1 else 1))
			
			if var16 then
				slotBasedEditorAnalytics.trackUndoRedoClick(p1, if fFlagAXExtendUndoRedoTracking and var8 and var8.opaque then var8.opaque.name else nil)
				var4(characterHistoryStateChangeButtonActivated({
					isUndo = p1,
					equipped = var16.equipped,
					tryOn = var16.tryOn
				}))
				
				if var16.tryOn.OutfitTryOn and var16.tryOn.OutfitTryOn.LookId ~= nil and (var16.tryOn.OutfitTryOn.LookId ~= "" and not fFlagAXMISEnableMultiShopping) then
					var3.navigate(avatarScreen.LookDetails)
					
					return
				end
				var3.dispatch(clearScreens({ avatarScreen.LookDetails }))
			end
		end
	end, {
		var4, var6, var10, var3, var8, var9
	})
	local var16 = if fFlagAXResetAvatarButton then reactModule.useCallback(function()
		-- upvalues: var7 (ref), slotBasedEditorAnalytics (copy), var8 (ref), constantsModule (copy), var4 (ref), characterHistoryStateChangeButtonActivated (copy), clearTryOns (copy), setCurrentToastMessage (copy), var2 (copy)
		local var17 = var7(false)
		
		if var17 then
			if slotBasedEditorAnalytics.trackAvatarRemoveAllClick and var8 and var8.opaque then
				slotBasedEditorAnalytics.trackAvatarRemoveAllClick(var8.opaque.name)
			end
			local t = {}
			
			for i, v in constantsModule.AssetTypeStringsToKeep do
				t[v] = var17.equipped.EquippedAssets[v]
			end
			var17.equipped.EquippedAssets = t
			var4(characterHistoryStateChangeButtonActivated(var17))
			var4(clearTryOns())
			var4(setCurrentToastMessage(var2))
		end
	end, { var4 }) else nil
	
	if fFlagAXExtendUndoRedoTracking then
		reactModule.useEffect(function()
			-- upvalues: slotBasedEditorAnalytics (copy), var8 (ref), var9 (ref)
			if slotBasedEditorAnalytics.trackUndoHistoryCount and var8 and (var8.opaque and var9) and #var9 then
				slotBasedEditorAnalytics.trackUndoHistoryCount(var8.opaque.name, #var9)
			end
		end, { var9, var8 })
	end
	return {
		items = reactModule.useMemo(function()
			-- upvalues: fFlagAXResetAvatarButton (copy), menuItemEnumModule (copy), iconName (copy), var5 (ref), var16 (ref), var14 (ref), fFlagAXMigrateBuilderIcons (copy), var15 (ref), var12 (ref), var13 (ref)
			return if fFlagAXResetAvatarButton then {
				{
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Reset.Reset,
					icon = iconName.ArrowSpinClockwise,
					iconSize = var5.Size.Size_500,
					onActivated = function()
						-- upvalues: var16 (copy)
						var16()
					end,
					disabled = var14
				},
				{
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Undo,
					icon = if fFlagAXMigrateBuilderIcons then iconName.ArrowCurlToLeft else "icons/actions/edit/undo",
					onActivated = function()
						-- upvalues: var15 (copy)
						var15(true)
					end,
					disabled = var12
				},
				{
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Redo,
					icon = if fFlagAXMigrateBuilderIcons then iconName.ArrowCurlToRight else "icons/actions/edit/redo",
					onActivated = function()
						-- upvalues: var15 (copy)
						var15(false)
					end,
					disabled = var13
				}
			} else {
				{
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Undo,
					icon = if fFlagAXMigrateBuilderIcons then iconName.ArrowCurlToLeft else "icons/actions/edit/undo",
					onActivated = function()
						-- upvalues: var15 (copy)
						var15(true)
					end,
					disabled = var12
				},
				{
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Redo,
					icon = if fFlagAXMigrateBuilderIcons then iconName.ArrowCurlToRight else "icons/actions/edit/redo",
					onActivated = function()
						-- upvalues: var15 (copy)
						var15(false)
					end,
					disabled = var13
				}
			}
		end, if fFlagAXResetAvatarButton then {
			var12,
			var13,
			var14,
			var15,
			var16
		} else { var12, var13, var15 })
	}
end
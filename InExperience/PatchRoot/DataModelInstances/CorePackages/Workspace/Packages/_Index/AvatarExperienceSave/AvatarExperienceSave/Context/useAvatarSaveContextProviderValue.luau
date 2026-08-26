local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local parent = avatarExperienceSave.Parent
local reactModule = require(parent.React)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local dashModule = require(parent.Dash)
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local toastRoduxModule = require(parent.ToastRodux)
local tutilsModule = require(parent.tutils)
local navigationModule = require(parent.Navigation)
local roactNavigationModule = require(parent.RoactNavigation)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local navigationRoduxModule = require(parent.NavigationRodux)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local promiseModule = require(parent.Promise)
local useSelectorSignal = avatarExperienceCommonModule.Hooks.useSelectorSignal
local useSignal = avatarExperienceCommonModule.Hooks.useSignal
local useComputedSignal = avatarExperienceCommonModule.Hooks.useComputedSignal
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = navigationModule.useNavigation
local _ = require(script.Parent.AvatarSaveContext)
local saveStatusEnumModule = require(avatarExperienceSave.Enums.SaveStatusEnum)
local toastType = toastRoduxModule.Enums.ToastType
local actions = roactNavigationModule.Actions
local avatarScreen = avatarExperienceNavigationModule.Enums.AvatarScreen
local appPage = robloxAppEnumsModule.AppPage
local customGetStateForAction = avatarExperienceNavigationModule.Enums.CustomGetStateForAction
local saveAvatarModule = require(avatarExperienceSave.Requests.saveAvatar)
local saveProfileConfigurationModule = require(avatarExperienceSave.Requests.saveProfileConfiguration)
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local characterHistoryStateChangeButtonActivated = avatarExperienceCommonModule.State.Actions.CharacterHistoryStateChangeButtonActivated
local registerCustomGetStateForAction = avatarExperienceNavigationModule.Actions.RegisterCustomGetStateForAction
local shouldInsertNewHistoryEntryModule = require(avatarExperienceSave.Utils.shouldInsertNewHistoryEntry)
local shouldReplaceLastHistoryEntryModule = require(avatarExperienceSave.Utils.shouldReplaceLastHistoryEntry)
local getSaveDictModule = require(avatarExperienceSave.Utils.getSaveDict)
local checkHasChangesToSaveModule = require(avatarExperienceSave.Utils.checkHasChangesToSave)
local getInvalidAssetIdsToAssetTypeIdMapModule = require(avatarExperienceSave.Utils.getInvalidAssetIdsToAssetTypeIdMap)
local removeInvalidAssetsFromCharacterDataModule = require(avatarExperienceSave.Utils.removeInvalidAssetsFromCharacterData)
local checkCharacterDataHasTryOnItemsModule = require(avatarExperienceSave.Utils.checkCharacterDataHasTryOnItems)
local selectCharacterDataModule = require(avatarExperienceSave.Selectors.selectCharacterData)
local selectHasAvatarDataModule = require(avatarExperienceSave.Selectors.selectHasAvatarData)
local navigateToRoute = navigationRoduxModule.Thunks.NavigateToRoute
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local buildHumanoidDescription = avatarExperienceCommonModule.Utils.buildHumanoidDescription
local getGearAssetIdFromEquippedAssets = avatarExperienceCommonModule.Utils.getGearAssetIdFromEquippedAssets
local getAssetIdToAssetTypeIdFromHumanoidDescription = avatarExperienceCommonModule.Utils.getAssetIdToAssetTypeIdFromHumanoidDescription
local fIntAXMinSaveIntervalSeconds = game:DefineFastInt("FIntAXMinSaveIntervalSeconds", 2)
local AXMaxUndoRedoHistory = game:DefineFastInt("AXMaxUndoRedoHistory", 20)
local AXEnableMaxUndoRedoHistory = game:DefineFastFlag("AXEnableMaxUndoRedoHistory", false)
local fFlagAXEnableManualSavingBlockingPrompt = avatarExperienceFlagsModule.FFlagAXEnableManualSavingBlockingPrompt
local fFlagAXBackgroundsPersistence = avatarExperienceFlagsModule.FFlagAXBackgroundsPersistence
local t = {
	toastMessage = "Feature.Avatar.Message.SaveThrottled",
	isLocalized = false,
	toastType = toastType.InformationMessage
}
local t_1 = {
	toastMessage = "Feature.Avatar.Message.SaveSuccessWithInvalidAssets",
	isLocalized = false,
	toastType = toastType.SuccessConfirmation
}
local t_2 = {
	toastMessage = "Feature.Avatar.Message.SaveSuccess",
	isLocalized = false,
	toastType = toastType.SuccessConfirmation
}
local t_3 = {
	toastMessage = "Feature.Avatar.Message.SaveFailure",
	isLocalized = false,
	toastType = toastType.InformationMessage
}
local t_4 = {
	Home = appPage.Home,
	More = appPage.More,
	Chat = appPage.Chat,
	Games = appPage.Games
}

local function _(p1)
	-- upvalues: buildHumanoidDescription (ref)
	return buildHumanoidDescription({
		currentAssets = p1.equipped.EquippedAssets,
		avatarScales = p1.equipped.AvatarScales,
		bodyColor3s = p1.equipped.BodyColor3s,
		emotesSlotInfo = p1.equipped.EquippedEmotes.slotInfo
	})
end

return function()
	-- upvalues: useDispatch (ref), useNavigation (ref), useSelectorSignal (ref), selectCharacterDataModule (ref), tutilsModule (ref), selectHasAvatarDataModule (ref), useSignal (ref), reactModule (ref), signalsModule (ref), shouldInsertNewHistoryEntryModule (ref), dashModule (ref), AXEnableMaxUndoRedoHistory (ref), AXMaxUndoRedoHistory (ref), shouldReplaceLastHistoryEntryModule (ref), removeInvalidAssetsFromCharacterDataModule (ref), avatarExperienceCommonModule (ref), useComputedSignal (ref), saveStatusEnumModule (ref), checkHasChangesToSaveModule (ref), checkCharacterDataHasTryOnItemsModule (ref), getInvalidAssetIdsToAssetTypeIdMapModule (ref), getAssetIdToAssetTypeIdFromHumanoidDescription (ref), setCurrentToastMessage (ref), t_2 (ref), t_1 (ref), characterHistoryStateChangeButtonActivated (ref), t (ref), t_3 (ref), promiseModule (ref), fIntAXMinSaveIntervalSeconds (ref), buildHumanoidDescription (ref), getSaveDictModule (ref), fFlagAXBackgroundsPersistence (ref), avatarExperienceFlagsModule (ref), cryoModule (ref), saveProfileConfigurationModule (ref), getGearAssetIdFromEquippedAssets (ref), saveAvatarModule (ref), fFlagAXEnableManualSavingBlockingPrompt (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateToRoute (ref), actions (ref), avatarScreen (ref), t_4 (ref), registerCustomGetStateForAction (ref), customGetStateForAction (ref)
	local var2 = useDispatch()
	local var3 = useNavigation()
	local var4 = useSelectorSignal(selectCharacterDataModule, tutilsModule.deepEqual)
	local var5 = useSelectorSignal(selectHasAvatarDataModule)
	local var6, var7 = useSignal({})
	local var8, var9 = useSignal(0)
	local var10, var11 = useSignal(nil)
	local var12, var13 = useSignal(nil)
	local var14, var15 = useSignal(0)
	local var16, var17 = useSignal(false)
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var5 (ref), var4 (ref), var6 (ref), tutilsModule (copy), var7 (ref), var9 (ref), var11 (ref), var13 (ref), var15 (ref)
		return signalsModule.createEffect(function(p1)
			-- upvalues: var5 (copy), var4 (copy), var6 (copy), tutilsModule (copy), var7 (copy), var9 (copy), var11 (copy), var13 (copy), var15 (copy)
			local var18 = var4(p1)
			
			if var5(p1) and (var18.equipped.BodyPartRangeIds and tutilsModule.fieldCount(var18.equipped.BodyPartRangeIds) > 0) and #var6(false) == 0 then
				var7({ var18 })
				var9(1)
				var11(var18)
				var13(nil)
				var15(0)
			end
		end)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var4 (ref), var6 (ref), var8 (ref), shouldInsertNewHistoryEntryModule (copy), dashModule (copy), AXEnableMaxUndoRedoHistory (copy), AXMaxUndoRedoHistory (copy), var7 (ref), var9 (ref), shouldReplaceLastHistoryEntryModule (copy)
		return signalsModule.createEffect(function(p1)
			-- upvalues: var4 (copy), var6 (copy), var8 (copy), shouldInsertNewHistoryEntryModule (copy), dashModule (copy), AXEnableMaxUndoRedoHistory (copy), AXMaxUndoRedoHistory (copy), var7 (copy), var9 (copy), shouldReplaceLastHistoryEntryModule (copy)
			local var18 = var4(p1)
			local var19 = var6(false)
			local var20 = var8(false)
			local var21 = var19[var20] or var18
			
			if shouldInsertNewHistoryEntryModule(var21, var18) and #var19 > 0 then
				local var22 = dashModule.slice(var19, 1, var20)
				table.insert(var22, var18)
				
				if AXEnableMaxUndoRedoHistory then
					local var23 = var20 + 1
					
					if AXMaxUndoRedoHistory < #var22 then
						table.remove(var22, 1)
						var23 -= 1
					end
					var7(var22)
					var9(var23)
					
					return
				else
					var7(var22)
					var9(var20 + 1)
					
					return
				end
			elseif shouldReplaceLastHistoryEntryModule(var21, var18) and #var19 > 0 then
				local var24 = dashModule.slice(var19)
				var24[var20] = var18
				var7(var24)
				var9(var20)
			end
		end)
	end, {})
	local var18 = reactModule.useCallback(function(p1)
		-- upvalues: var6 (ref), var9 (ref)
		local var19 = var6(false)
		
		if p1 < 1 or #var19 < p1 then
			return nil
		end
		var9(p1)
		
		return var19[p1]
	end, { var6, var9 })
	local var19 = reactModule.useCallback(function(p1)
		-- upvalues: var6 (ref), var8 (ref), removeInvalidAssetsFromCharacterDataModule (copy), var7 (ref)
		local var20 = var6(false)
		local var21 = var8(false)
		local var22 = var20[var21]
		
		if not var22 then
			return nil
		end
		local var23, var24 = removeInvalidAssetsFromCharacterDataModule(var22, p1)
		
		if var24 then
			var20[var21] = var23
			var7(var20)
			
			return var23
		end
		return nil
	end, { var6, var7, var9 })
	local timeoutStatusStore = avatarExperienceCommonModule.Stores.getTimeoutStatusStore()
	local var20 = useComputedSignal(function(p1)
		-- upvalues: timeoutStatusStore (ref), saveStatusEnumModule (copy), var6 (ref), var8 (ref), var10 (ref), var12 (ref), checkHasChangesToSaveModule (copy), checkCharacterDataHasTryOnItemsModule (copy)
		if timeoutStatusStore and timeoutStatusStore.getIsTimedOut(p1) then
			return saveStatusEnumModule.TimedOut
		end
		local var21 = var10(p1)
		local var22 = var6(p1)[var8(p1)]
		
		return if not (not var22 or not var21) then if var12(p1) then saveStatusEnumModule.Saving elseif var21 and not checkHasChangesToSaveModule(var22, var21) then saveStatusEnumModule.AlreadySaved elseif checkCharacterDataHasTryOnItemsModule(var22) then saveStatusEnumModule.HasTryOns else saveStatusEnumModule.Eligible else saveStatusEnumModule.NoData
	end)
	local var21 = reactModule.useCallback(function(p1, p2, p3, _, p4)
		-- upvalues: saveStatusEnumModule (copy), getInvalidAssetIdsToAssetTypeIdMapModule (copy), getAssetIdToAssetTypeIdFromHumanoidDescription (copy), var19 (ref), removeInvalidAssetsFromCharacterDataModule (copy), var11 (ref), var13 (ref), var2 (ref), setCurrentToastMessage (copy), t_2 (copy), t_1 (copy), characterHistoryStateChangeButtonActivated (copy)
		local var22 = p3
		local success = saveStatusEnumModule.Success
		local var23 = nil
		
		if p4.Assets then
			local var24 = getInvalidAssetIdsToAssetTypeIdMapModule(getAssetIdToAssetTypeIdFromHumanoidDescription(p1), getAssetIdToAssetTypeIdFromHumanoidDescription(p2))
			var23 = var19(var24)
			var22 = removeInvalidAssetsFromCharacterDataModule(var22, var24)
		end
		var11(var22)
		var13(nil)
		
		if var23 ~= nil then
			success = saveStatusEnumModule.SuccessWithInvalidAssets
		end
		if success == saveStatusEnumModule.Success then
			var2(setCurrentToastMessage(t_2))
		elseif success == saveStatusEnumModule.SuccessWithInvalidAssets then
			var2(setCurrentToastMessage(t_1))
		end
		if var23 then
			var2(characterHistoryStateChangeButtonActivated(var23))
		end
		return success
	end, {
		var6,
		var8,
		var11,
		var13,
		var19
	})
	local var22 = reactModule.useCallback(function(p1)
		-- upvalues: var13 (ref), saveStatusEnumModule (copy), var2 (ref), setCurrentToastMessage (copy), t (copy), t_3 (copy)
		var13(nil)
		
		if p1 == saveStatusEnumModule.Throttled then
			var2(setCurrentToastMessage(t))
			
			return
		end
		var2(setCurrentToastMessage(t_3))
	end, { var13, var2 })
	local var23 = reactModule.useCallback(function()
		-- upvalues: promiseModule (copy), timeoutStatusStore (ref), var22 (ref), saveStatusEnumModule (copy), var6 (ref), var8 (ref), var10 (ref), var14 (ref), fIntAXMinSaveIntervalSeconds (copy), var13 (ref), var15 (ref), buildHumanoidDescription (copy), getSaveDictModule (copy), fFlagAXBackgroundsPersistence (copy), avatarExperienceFlagsModule (copy), cryoModule (copy), saveProfileConfigurationModule (copy), var17 (ref), var21 (ref), getGearAssetIdFromEquippedAssets (copy), saveAvatarModule (copy)
		return promiseModule.new(function(p1, p2)
			-- upvalues: timeoutStatusStore (copy), var22 (copy), saveStatusEnumModule (copy), var6 (copy), var8 (copy), var10 (copy), var14 (copy), fIntAXMinSaveIntervalSeconds (copy), var13 (copy), var15 (copy), buildHumanoidDescription (copy), getSaveDictModule (copy), fFlagAXBackgroundsPersistence (copy), avatarExperienceFlagsModule (copy), cryoModule (copy), saveProfileConfigurationModule (copy), var17 (copy), var21 (copy), getGearAssetIdFromEquippedAssets (copy), saveAvatarModule (copy)
			if timeoutStatusStore and timeoutStatusStore.getIsTimedOut(false) then
				var22(saveStatusEnumModule.TimedOut)
				
				return
			end
			local var24 = var10(false)
			local var25 = var6(false)[var8(false)]
			
			if var25 and var24 then
				local var26 = var14(false)
				
				if var26 > 0 and os.time() - var26 < fIntAXMinSaveIntervalSeconds then
					var22(saveStatusEnumModule.Throttled)
					
					return
				end
				var13(var25)
				var15(os.time())
				local var27 = buildHumanoidDescription({
					currentAssets = var25.equipped.EquippedAssets,
					avatarScales = var25.equipped.AvatarScales,
					bodyColor3s = var25.equipped.BodyColor3s,
					emotesSlotInfo = var25.equipped.EquippedEmotes.slotInfo
				})
				local avatarType = Enum.HumanoidRigType[var25.equipped.AvatarType]
				local var28 = getSaveDictModule(var25, var24)
				local var29 = if fFlagAXBackgroundsPersistence then var25.equipped.BackgroundAssetId else nil
				local var30 = var28.Background == true and var29 ~= nil
				local var31 = if avatarExperienceFlagsModule.FFlagAXProfileConfigurationMultiFieldApply then { BackgroundAssetId = var29 } else var29
				local var32 = false
				
				if fFlagAXBackgroundsPersistence then
					var28 = cryoModule.Dictionary.join(var28, { Background = cryoModule.None })
					
					for i, v in var28 do
						if v then
							var32 = true
							break
						end
					end
				end
				if var30 and not var32 then
					saveProfileConfigurationModule(var31):andThen(function()
						-- upvalues: var17 (copy), var21 (copy), var27 (ref), var25 (ref), var24 (ref), var28 (write), p1 (ref)
						var17(false)
						var21(var27, var27, var25, var24, var28)
						p1()
					end):catch(function()
						-- upvalues: var17 (copy), var22 (copy), saveStatusEnumModule (copy), p2 (ref)
						var17(false)
						var22(saveStatusEnumModule.Failure)
						p2()
					end)
					
					return
				end
				local var33 = if var30 then saveProfileConfigurationModule(var31) else nil
				saveAvatarModule(var27, avatarType, var28, getGearAssetIdFromEquippedAssets(var25.equipped.EquippedAssets)):andThen(function(p3)
					-- upvalues: var17 (copy), var21 (copy), var27 (ref), var24 (ref), var28 (write), p1 (ref), var33 (ref), var25 (ref), cryoModule (copy)
					var17(false)
					
					local function _(p4)
						-- upvalues: var21 (copy), var27 (copy), p3 (ref), var24 (copy), var28 (copy), p1 (copy)
						var21(var27, p3.humanoidDescriptionWithValidAssets, p4, var24, var28)
						p1()
					end
					
					if var33 then
						var33:andThen(function()
							-- upvalues: var25 (copy), var21 (copy), var27 (copy), p3 (ref), var24 (copy), var28 (copy), p1 (copy)
							var21(var27, p3.humanoidDescriptionWithValidAssets, var25, var24, var28)
							p1()
						end, function()
							-- upvalues: cryoModule (copy), var25 (copy), var24 (copy), var21 (copy), var27 (copy), p3 (ref), var28 (copy), p1 (copy)
							var21(var27, p3.humanoidDescriptionWithValidAssets, cryoModule.Dictionary.join(var25, {
								equipped = cryoModule.Dictionary.join(var25.equipped, {
									BackgroundAssetId = if var24.equipped.BackgroundAssetId ~= nil then cryoModule.None else var24.equipped.BackgroundAssetId
								})
							}), var24, var28)
							p1()
						end)
						
						return
					end
					var21(var27, p3.humanoidDescriptionWithValidAssets, var25, var24, var28)
					p1()
				end):catch(function(_)
					-- upvalues: var17 (copy), timeoutStatusStore (copy), var22 (copy), saveStatusEnumModule (copy), p2 (ref)
					var17(false)
					
					if timeoutStatusStore then
						timeoutStatusStore.fetchStatus()
					end
					var22(saveStatusEnumModule.Failure)
					p2()
				end)
			end
		end)
	end, {
		timeoutStatusStore, var6, var8, var11, var13, var15, var19, var22, var17
	})
	
	if fFlagAXEnableManualSavingBlockingPrompt then
		local var24 = reactModule.useCallback(function(p1)
			-- upvalues: var23 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateToRoute (copy)
			return function()
				-- upvalues: var23 (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), p1 (ref), var2 (copy), navigateToRoute (copy)
				var23():finally(function()
					-- upvalues: fFlagSignalsNavP3Dispatch (copy), var1 (copy), p1 (copy), var2 (copy), navigateToRoute (copy)
					if fFlagSignalsNavP3Dispatch then
						var1.to(var1.fromLegacyPage({ skipSaveBlockingPrompt = true, name = p1 }))
						
						return
					end
					var2(navigateToRoute({ { skipSaveBlockingPrompt = true, name = p1 } }))
				end)
			end
		end, { var23, var2 })
		local var25 = reactModule.useCallback(function(p1)
			-- upvalues: var10 (ref), var2 (ref), characterHistoryStateChangeButtonActivated (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateToRoute (copy)
			return function()
				-- upvalues: var10 (copy), var2 (copy), characterHistoryStateChangeButtonActivated (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), p1 (ref), navigateToRoute (copy)
				task.spawn(function()
					-- upvalues: var10 (copy), var2 (copy), characterHistoryStateChangeButtonActivated (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), p1 (copy), navigateToRoute (copy)
					var2(characterHistoryStateChangeButtonActivated(var10(false)))
					task.wait()
					
					if fFlagSignalsNavP3Dispatch then
						var1.to(var1.fromLegacyPage({ skipSaveBlockingPrompt = true, name = p1 }))
						
						return
					end
					var2(navigateToRoute({ { skipSaveBlockingPrompt = true, name = p1 } }))
				end)
			end
		end, { var2, var10 })
		local var26 = reactModule.useCallback(function(p1, p2)
			-- upvalues: actions (copy), avatarScreen (copy), t_4 (copy), tutilsModule (copy), var20 (ref), saveStatusEnumModule (copy), cryoModule (copy), var24 (ref), var25 (ref)
			local routeName = (p1 or {}).routeName
			local params = (p1 or {}).params
			
			if p1.type == actions.Back and not p1.immediate and (p2.routes[#p2.routes] and p2.routes[#p2.routes].routeName == avatarScreen.SaveAvatarOnLeaveAvatarExperiencePrompt) then
				return true, nil
			elseif p1.type ~= actions.Navigate or t_4[routeName] == nil or params ~= nil and tutilsModule.fieldCount(params) ~= 0 or var20(false) ~= saveStatusEnumModule.Eligible then
				return false, nil
			elseif p2.routes[#p2.routes] and p2.routes[#p2.routes].routeName == avatarScreen.SaveAvatarOnLeaveAvatarExperiencePrompt then
				return true, nil
			end
			local var27 = cryoModule.List.join(p2.routes, {
				{
					key = avatarScreen.SaveAvatarOnLeaveAvatarExperiencePrompt,
					routeName = avatarScreen.SaveAvatarOnLeaveAvatarExperiencePrompt,
					params = {
						saveAndContinue = var24(routeName),
						continueWithoutSave = var25(routeName)
					}
				}
			})
			
			return true, cryoModule.Dictionary.join(p2, { routes = var27, index = #var27 })
		end, { var20, var24, var25 })
		reactModule.useEffect(function()
			-- upvalues: var3 (ref), registerCustomGetStateForAction (copy), customGetStateForAction (copy), var26 (ref)
			var3.dispatch(registerCustomGetStateForAction(customGetStateForAction.HandlerId.BlockAXExitOnUnsavedChanges, var26))
		end, { var3, var26 })
	end
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var6 (ref), var16 (ref), var20 (ref), saveStatusEnumModule (copy), var23 (ref)
		return signalsModule.createEffect(function(p1)
			-- upvalues: var6 (copy), var16 (copy), var20 (copy), saveStatusEnumModule (copy), var23 (copy)
			local var27 = var6(p1)
			
			if var27[#var27] and var16(false) then
				local var28 = var20(false)
				
				if var28 == saveStatusEnumModule.Eligible or var28 == saveStatusEnumModule.HasTryOns then
					var23()
				end
			end
		end)
	end, {})
	local var27 = reactModule.useCallback(function()
		-- upvalues: var17 (ref)
		var17(true)
	end, { var17 })
	
	return reactModule.useMemo(function()
		-- upvalues: var6 (ref), var8 (ref), var18 (ref), var10 (ref), var20 (ref), var23 (ref), var27 (ref)
		return {
			getHistorySignal = var6,
			getCurrentHistoryIndexSignal = var8,
			updateHistoryIndexAndGetCharacterData = var18,
			getLastSuccessfullySavedStateSignal = var10,
			getSaveEligibilityStatusSignal = var20,
			trySaveAvatar = var23,
			autoSaveNextNewSaveData = var27
		}
	end, {
		var6, var8, var18, var10, var20, var23, var27
	})
end
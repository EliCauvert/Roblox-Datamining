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
local var27 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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

local function _(p0)
	-- upvalues: buildHumanoidDescription (ref)
	return buildHumanoidDescription({
		currentAssets = p0.equipped.EquippedAssets,
		avatarScales = p0.equipped.AvatarScales,
		bodyColor3s = p0.equipped.BodyColor3s,
		emotesSlotInfo = p0.equipped.EquippedEmotes.slotInfo
	})
end

return function()
	-- upvalues: useDispatch (ref), useNavigation (ref), useSelectorSignal (ref), selectCharacterDataModule (ref), tutilsModule (ref), selectHasAvatarDataModule (ref), useSignal (ref), reactModule (ref), signalsModule (ref), shouldInsertNewHistoryEntryModule (ref), dashModule (ref), AXEnableMaxUndoRedoHistory (ref), AXMaxUndoRedoHistory (ref), shouldReplaceLastHistoryEntryModule (ref), removeInvalidAssetsFromCharacterDataModule (ref), avatarExperienceCommonModule (ref), useComputedSignal (ref), saveStatusEnumModule (ref), checkHasChangesToSaveModule (ref), checkCharacterDataHasTryOnItemsModule (ref), getInvalidAssetIdsToAssetTypeIdMapModule (ref), getAssetIdToAssetTypeIdFromHumanoidDescription (ref), setCurrentToastMessage (ref), t_2 (ref), t_1 (ref), characterHistoryStateChangeButtonActivated (ref), t (ref), t_3 (ref), promiseModule (ref), fIntAXMinSaveIntervalSeconds (ref), buildHumanoidDescription (ref), getSaveDictModule (ref), fFlagAXBackgroundsPersistence (ref), avatarExperienceFlagsModule (ref), cryoModule (ref), saveProfileConfigurationModule (ref), getGearAssetIdFromEquippedAssets (ref), saveAvatarModule (ref), fFlagAXEnableManualSavingBlockingPrompt (ref), fFlagSignalsNavP3Dispatch (ref), var27 (ref), navigateToRoute (ref), actions (ref), avatarScreen (ref), t_4 (ref), registerCustomGetStateForAction (ref), customGetStateForAction (ref)
	local var36 = useDispatch()
	local var37 = useNavigation()
	local var38 = useSelectorSignal(selectCharacterDataModule, tutilsModule.deepEqual)
	local var39 = useSelectorSignal(selectHasAvatarDataModule)
	local var40, var41 = useSignal({})
	local var42, var43 = useSignal(0)
	local var44, var45 = useSignal(nil)
	local var46, var47 = useSignal(nil)
	local var48, var49 = useSignal(0)
	local var50, var51 = useSignal(false)
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var39 (ref), var38 (ref), var40 (ref), tutilsModule (copy), var41 (ref), var43 (ref), var45 (ref), var47 (ref), var49 (ref)
		return signalsModule.createEffect(function(p1)
			-- upvalues: var39 (copy), var38 (copy), var40 (copy), tutilsModule (copy), var41 (copy), var43 (copy), var45 (copy), var47 (copy), var49 (copy)
			local var63 = var38(p1)
			
			if var39(p1) and (var63.equipped.BodyPartRangeIds and tutilsModule.fieldCount(var63.equipped.BodyPartRangeIds) > 0) and #var40(false) == 0 then
				var41({ var63 })
				var43(1)
				var45(var63)
				var47(nil)
				var49(0)
			end
		end)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var38 (ref), var40 (ref), var42 (ref), shouldInsertNewHistoryEntryModule (copy), dashModule (copy), AXEnableMaxUndoRedoHistory (copy), AXMaxUndoRedoHistory (copy), var41 (ref), var43 (ref), shouldReplaceLastHistoryEntryModule (copy)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var38 (copy), var40 (copy), var42 (copy), shouldInsertNewHistoryEntryModule (copy), dashModule (copy), AXEnableMaxUndoRedoHistory (copy), AXMaxUndoRedoHistory (copy), var41 (copy), var43 (copy), shouldReplaceLastHistoryEntryModule (copy)
			local var64 = var38(p2)
			local var65 = var40(false)
			local var66 = var42(false)
			local var67 = var65[var66] or var64
			
			if shouldInsertNewHistoryEntryModule(var67, var64) and #var65 > 0 then
				local var68 = dashModule.slice(var65, 1, var66)
				table.insert(var68, var64)
				
				if AXEnableMaxUndoRedoHistory then
					local var69 = var66 + 1
					
					if AXMaxUndoRedoHistory < #var68 then
						table.remove(var68, 1)
						var69 -= 1
					end
					var41(var68)
					var43(var69)
					
					return
				else
					var41(var68)
					var43(var66 + 1)
					
					return
				end
			elseif shouldReplaceLastHistoryEntryModule(var67, var64) and #var65 > 0 then
				local var70 = dashModule.slice(var65)
				var70[var66] = var64
				var41(var70)
				var43(var66)
			end
		end)
	end, {})
	local var52 = reactModule.useCallback(function(p3)
		-- upvalues: var40 (ref), var43 (ref)
		local var71 = var40(false)
		
		if p3 < 1 or #var71 < p3 then
			return nil
		end
		var43(p3)
		
		return var71[p3]
	end, { var40, var43 })
	local var53 = reactModule.useCallback(function(p4)
		-- upvalues: var40 (ref), var42 (ref), removeInvalidAssetsFromCharacterDataModule (copy), var41 (ref)
		local var72 = var40(false)
		local var73 = var42(false)
		local var74 = var72[var73]
		
		if not var74 then
			return nil
		end
		local var75, var76 = removeInvalidAssetsFromCharacterDataModule(var74, p4)
		
		if var76 then
			var72[var73] = var75
			var41(var72)
			
			return var75
		end
		return nil
	end, { var40, var41, var43 })
	local timeoutStatusStore = avatarExperienceCommonModule.Stores.getTimeoutStatusStore()
	local var55 = useComputedSignal(function(p5)
		-- upvalues: timeoutStatusStore (ref), saveStatusEnumModule (copy), var40 (ref), var42 (ref), var44 (ref), var46 (ref), checkHasChangesToSaveModule (copy), checkCharacterDataHasTryOnItemsModule (copy)
		if timeoutStatusStore and timeoutStatusStore.getIsTimedOut(p5) then
			return saveStatusEnumModule.TimedOut
		end
		local var77 = var44(p5)
		local var78 = var40(p5)[var42(p5)]
		
		return if not (not var78 or not var77) then if var46(p5) then saveStatusEnumModule.Saving elseif var77 and not checkHasChangesToSaveModule(var78, var77) then saveStatusEnumModule.AlreadySaved elseif checkCharacterDataHasTryOnItemsModule(var78) then saveStatusEnumModule.HasTryOns else saveStatusEnumModule.Eligible else saveStatusEnumModule.NoData
	end)
	local var56 = reactModule.useCallback(function(p6, p7, p8, _, p9)
		-- upvalues: saveStatusEnumModule (copy), getInvalidAssetIdsToAssetTypeIdMapModule (copy), getAssetIdToAssetTypeIdFromHumanoidDescription (copy), var53 (ref), removeInvalidAssetsFromCharacterDataModule (copy), var45 (ref), var47 (ref), var36 (ref), setCurrentToastMessage (copy), t_2 (copy), t_1 (copy), characterHistoryStateChangeButtonActivated (copy)
		local var79 = p8
		local success = saveStatusEnumModule.Success
		local var80 = nil
		
		if p9.Assets then
			local var81 = getInvalidAssetIdsToAssetTypeIdMapModule(getAssetIdToAssetTypeIdFromHumanoidDescription(p6), getAssetIdToAssetTypeIdFromHumanoidDescription(p7))
			var80 = var53(var81)
			var79 = removeInvalidAssetsFromCharacterDataModule(var79, var81)
		end
		var45(var79)
		var47(nil)
		
		if var80 ~= nil then
			success = saveStatusEnumModule.SuccessWithInvalidAssets
		end
		if success == saveStatusEnumModule.Success then
			var36(setCurrentToastMessage(t_2))
		elseif success == saveStatusEnumModule.SuccessWithInvalidAssets then
			var36(setCurrentToastMessage(t_1))
		end
		if var80 then
			var36(characterHistoryStateChangeButtonActivated(var80))
		end
		return success
	end, {
		var40,
		var42,
		var45,
		var47,
		var53
	})
	local var57 = reactModule.useCallback(function(p10)
		-- upvalues: var47 (ref), saveStatusEnumModule (copy), var36 (ref), setCurrentToastMessage (copy), t (copy), t_3 (copy)
		var47(nil)
		
		if p10 == saveStatusEnumModule.Throttled then
			var36(setCurrentToastMessage(t))
			
			return
		end
		var36(setCurrentToastMessage(t_3))
	end, { var47, var36 })
	local var58 = reactModule.useCallback(function()
		-- upvalues: promiseModule (copy), timeoutStatusStore (ref), var57 (ref), saveStatusEnumModule (copy), var40 (ref), var42 (ref), var44 (ref), var48 (ref), fIntAXMinSaveIntervalSeconds (copy), var47 (ref), var49 (ref), buildHumanoidDescription (copy), getSaveDictModule (copy), fFlagAXBackgroundsPersistence (copy), avatarExperienceFlagsModule (copy), cryoModule (copy), saveProfileConfigurationModule (copy), var51 (ref), var56 (ref), getGearAssetIdFromEquippedAssets (copy), saveAvatarModule (copy)
		return promiseModule.new(function(p11, p12)
			-- upvalues: timeoutStatusStore (copy), var57 (copy), saveStatusEnumModule (copy), var40 (copy), var42 (copy), var44 (copy), var48 (copy), fIntAXMinSaveIntervalSeconds (copy), var47 (copy), var49 (copy), buildHumanoidDescription (copy), getSaveDictModule (copy), fFlagAXBackgroundsPersistence (copy), avatarExperienceFlagsModule (copy), cryoModule (copy), saveProfileConfigurationModule (copy), var51 (copy), var56 (copy), getGearAssetIdFromEquippedAssets (copy), saveAvatarModule (copy)
			if timeoutStatusStore and timeoutStatusStore.getIsTimedOut(false) then
				var57(saveStatusEnumModule.TimedOut)
				
				return
			end
			local var82 = var44(false)
			local var83 = var40(false)[var42(false)]
			
			if var83 and var82 then
				local var84 = var48(false)
				
				if var84 > 0 and os.time() - var84 < fIntAXMinSaveIntervalSeconds then
					var57(saveStatusEnumModule.Throttled)
					
					return
				end
				var47(var83)
				var49(os.time())
				local var85 = buildHumanoidDescription({
					currentAssets = var83.equipped.EquippedAssets,
					avatarScales = var83.equipped.AvatarScales,
					bodyColor3s = var83.equipped.BodyColor3s,
					emotesSlotInfo = var83.equipped.EquippedEmotes.slotInfo
				})
				local avatarType = Enum.HumanoidRigType[var83.equipped.AvatarType]
				local var86 = getSaveDictModule(var83, var82)
				local var87 = if fFlagAXBackgroundsPersistence then var83.equipped.BackgroundAssetId else nil
				local var88 = var86.Background == true and var87 ~= nil
				local var89 = if avatarExperienceFlagsModule.FFlagAXProfileConfigurationMultiFieldApply then { BackgroundAssetId = var87 } else var87
				local var90 = false
				
				if fFlagAXBackgroundsPersistence then
					var86 = cryoModule.Dictionary.join(var86, { Background = cryoModule.None })
					
					for i, v in var86 do
						if v then
							var90 = true
							break
						end
					end
				end
				if var88 and not var90 then
					saveProfileConfigurationModule(var89):andThen(function()
						-- upvalues: var51 (copy), var56 (copy), var85 (ref), var83 (ref), var82 (ref), var86 (write), p11 (ref)
						var51(false)
						var56(var85, var85, var83, var82, var86)
						p11()
					end):catch(function()
						-- upvalues: var51 (copy), var57 (copy), saveStatusEnumModule (copy), p12 (ref)
						var51(false)
						var57(saveStatusEnumModule.Failure)
						p12()
					end)
					
					return
				end
				local var91 = if var88 then saveProfileConfigurationModule(var89) else nil
				saveAvatarModule(var85, avatarType, var86, getGearAssetIdFromEquippedAssets(var83.equipped.EquippedAssets)):andThen(function(p13)
					-- upvalues: var51 (copy), var56 (copy), var85 (ref), var82 (ref), var86 (write), p11 (ref), var91 (ref), var83 (ref), cryoModule (copy)
					var51(false)
					
					local function _(p14)
						-- upvalues: var56 (copy), var85 (copy), p13 (ref), var82 (copy), var86 (copy), p11 (copy)
						var56(var85, p13.humanoidDescriptionWithValidAssets, p14, var82, var86)
						p11()
					end
					
					if var91 then
						var91:andThen(function()
							-- upvalues: var83 (copy), var56 (copy), var85 (copy), p13 (ref), var82 (copy), var86 (copy), p11 (copy)
							var56(var85, p13.humanoidDescriptionWithValidAssets, var83, var82, var86)
							p11()
						end, function()
							-- upvalues: cryoModule (copy), var83 (copy), var82 (copy), var56 (copy), var85 (copy), p13 (ref), var86 (copy), p11 (copy)
							var56(var85, p13.humanoidDescriptionWithValidAssets, cryoModule.Dictionary.join(var83, {
								equipped = cryoModule.Dictionary.join(var83.equipped, {
									BackgroundAssetId = if var82.equipped.BackgroundAssetId ~= nil then cryoModule.None else var82.equipped.BackgroundAssetId
								})
							}), var82, var86)
							p11()
						end)
						
						return
					end
					var56(var85, p13.humanoidDescriptionWithValidAssets, var83, var82, var86)
					p11()
				end):catch(function(_)
					-- upvalues: var51 (copy), timeoutStatusStore (copy), var57 (copy), saveStatusEnumModule (copy), p12 (ref)
					var51(false)
					
					if timeoutStatusStore then
						timeoutStatusStore.fetchStatus()
					end
					var57(saveStatusEnumModule.Failure)
					p12()
				end)
			end
		end)
	end, {
		timeoutStatusStore, var40, var42, var45, var47, var49, var53, var57, var51
	})
	
	if fFlagAXEnableManualSavingBlockingPrompt then
		local var59 = reactModule.useCallback(function(p15)
			-- upvalues: var58 (ref), fFlagSignalsNavP3Dispatch (copy), var27 (copy), var36 (ref), navigateToRoute (copy)
			return function()
				-- upvalues: var58 (copy), fFlagSignalsNavP3Dispatch (copy), var27 (copy), p15 (ref), var36 (copy), navigateToRoute (copy)
				var58():finally(function()
					-- upvalues: fFlagSignalsNavP3Dispatch (copy), var27 (copy), p15 (copy), var36 (copy), navigateToRoute (copy)
					if fFlagSignalsNavP3Dispatch then
						var27.to(var27.fromLegacyPage({ skipSaveBlockingPrompt = true, name = p15 }))
						
						return
					end
					var36(navigateToRoute({ { skipSaveBlockingPrompt = true, name = p15 } }))
				end)
			end
		end, { var58, var36 })
		local var60 = reactModule.useCallback(function(p16)
			-- upvalues: var44 (ref), var36 (ref), characterHistoryStateChangeButtonActivated (copy), fFlagSignalsNavP3Dispatch (copy), var27 (copy), navigateToRoute (copy)
			return function()
				-- upvalues: var44 (copy), var36 (copy), characterHistoryStateChangeButtonActivated (copy), fFlagSignalsNavP3Dispatch (copy), var27 (copy), p16 (ref), navigateToRoute (copy)
				task.spawn(function()
					-- upvalues: var44 (copy), var36 (copy), characterHistoryStateChangeButtonActivated (copy), fFlagSignalsNavP3Dispatch (copy), var27 (copy), p16 (copy), navigateToRoute (copy)
					var36(characterHistoryStateChangeButtonActivated(var44(false)))
					task.wait()
					
					if fFlagSignalsNavP3Dispatch then
						var27.to(var27.fromLegacyPage({ skipSaveBlockingPrompt = true, name = p16 }))
						
						return
					end
					var36(navigateToRoute({ { skipSaveBlockingPrompt = true, name = p16 } }))
				end)
			end
		end, { var36, var44 })
		local var61 = reactModule.useCallback(function(p17, p18)
			-- upvalues: actions (copy), avatarScreen (copy), t_4 (copy), tutilsModule (copy), var55 (ref), saveStatusEnumModule (copy), cryoModule (copy), var59 (ref), var60 (ref)
			local routeName = (p17 or {}).routeName
			local params = (p17 or {}).params
			
			if p17.type == actions.Back and not p17.immediate and (p18.routes[#p18.routes] and p18.routes[#p18.routes].routeName == avatarScreen.SaveAvatarOnLeaveAvatarExperiencePrompt) then
				return true, nil
			elseif p17.type ~= actions.Navigate or t_4[routeName] == nil or params ~= nil and tutilsModule.fieldCount(params) ~= 0 or var55(false) ~= saveStatusEnumModule.Eligible then
				return false, nil
			elseif p18.routes[#p18.routes] and p18.routes[#p18.routes].routeName == avatarScreen.SaveAvatarOnLeaveAvatarExperiencePrompt then
				return true, nil
			end
			local var92 = cryoModule.List.join(p18.routes, {
				{
					key = avatarScreen.SaveAvatarOnLeaveAvatarExperiencePrompt,
					routeName = avatarScreen.SaveAvatarOnLeaveAvatarExperiencePrompt,
					params = {
						saveAndContinue = var59(routeName),
						continueWithoutSave = var60(routeName)
					}
				}
			})
			
			return true, cryoModule.Dictionary.join(p18, { routes = var92, index = #var92 })
		end, { var55, var59, var60 })
		reactModule.useEffect(function()
			-- upvalues: var37 (ref), registerCustomGetStateForAction (copy), customGetStateForAction (copy), var61 (ref)
			var37.dispatch(registerCustomGetStateForAction(customGetStateForAction.HandlerId.BlockAXExitOnUnsavedChanges, var61))
		end, { var37, var61 })
	end
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var40 (ref), var50 (ref), var55 (ref), saveStatusEnumModule (copy), var58 (ref)
		return signalsModule.createEffect(function(p19)
			-- upvalues: var40 (copy), var50 (copy), var55 (copy), saveStatusEnumModule (copy), var58 (copy)
			local var93 = var40(p19)
			
			if var93[#var93] and var50(false) then
				local var94 = var55(false)
				
				if var94 == saveStatusEnumModule.Eligible or var94 == saveStatusEnumModule.HasTryOns then
					var58()
				end
			end
		end)
	end, {})
	local var62 = reactModule.useCallback(function()
		-- upvalues: var51 (ref)
		var51(true)
	end, { var51 })
	
	return reactModule.useMemo(function()
		-- upvalues: var40 (ref), var42 (ref), var52 (ref), var44 (ref), var55 (ref), var58 (ref), var62 (ref)
		return {
			getHistorySignal = var40,
			getCurrentHistoryIndexSignal = var42,
			updateHistoryIndexAndGetCharacterData = var52,
			getLastSuccessfullySavedStateSignal = var44,
			getSaveEligibilityStatusSignal = var55,
			trySaveAvatar = var58,
			autoSaveNextNewSaveData = var62
		}
	end, {
		var40, var42, var52, var44, var55, var58, var62
	})
end
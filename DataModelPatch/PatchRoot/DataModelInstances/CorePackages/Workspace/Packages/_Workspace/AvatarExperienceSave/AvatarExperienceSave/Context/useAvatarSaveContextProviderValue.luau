local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local Parent = AvatarExperienceSave.Parent
local ReactModule = require(Parent.React)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local DashModule = require(Parent.Dash)
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local ToastRoduxModule = require(Parent.ToastRodux)
local TutilsModule = require(Parent.tutils)
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local PromiseModule = require(Parent.Promise)
local UseSelectorSignalFunction = AvatarExperienceCommonModule.Hooks.useSelectorSignal
local UseSignalFunction = AvatarExperienceCommonModule.Hooks.useSignal
local UseComputedSignalFunction = AvatarExperienceCommonModule.Hooks.useComputedSignal
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local _ = require(script.Parent.AvatarSaveContext)
local SaveStatusEnumModule = require(AvatarExperienceSave.Enums.SaveStatusEnum)
local ToastType = ToastRoduxModule.Enums.ToastType
local Actions = require(Parent.RoactNavigation).Actions
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CustomGetStateForAction = AvatarExperienceNavigationModule.Enums.CustomGetStateForAction
local SaveAvatarModule = require(AvatarExperienceSave.Requests.saveAvatar)
local SaveProfileConfigurationModule = require(AvatarExperienceSave.Requests.saveProfileConfiguration)
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local CharacterHistoryStateChangeButtonActivatedFunction = AvatarExperienceCommonModule.State.Actions.CharacterHistoryStateChangeButtonActivated
local RegisterCustomGetStateForActionFunction = AvatarExperienceNavigationModule.Actions.RegisterCustomGetStateForAction
local ShouldInsertNewHistoryEntryModule = require(AvatarExperienceSave.Utils.shouldInsertNewHistoryEntry)
local ShouldReplaceLastHistoryEntryModule = require(AvatarExperienceSave.Utils.shouldReplaceLastHistoryEntry)
local GetSaveDictModule = require(AvatarExperienceSave.Utils.getSaveDict)
local CheckHasChangesToSaveModule = require(AvatarExperienceSave.Utils.checkHasChangesToSave)
local GetInvalidAssetIdsToAssetTypeIdMapModule = require(AvatarExperienceSave.Utils.getInvalidAssetIdsToAssetTypeIdMap)
local RemoveInvalidAssetsFromCharacterDataModule = require(AvatarExperienceSave.Utils.removeInvalidAssetsFromCharacterData)
local CheckCharacterDataHasTryOnItemsModule = require(AvatarExperienceSave.Utils.checkCharacterDataHasTryOnItems)
local SelectCharacterDataModule = require(AvatarExperienceSave.Selectors.selectCharacterData)
local SelectHasAvatarDataModule = require(AvatarExperienceSave.Selectors.selectHasAvatarData)
local NavigateToRouteFunction = require(Parent.NavigationRodux).Thunks.NavigateToRoute
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local BuildHumanoidDescriptionFunction = AvatarExperienceCommonModule.Utils.buildHumanoidDescription
local GetGearAssetIdFromEquippedAssetsFunction = AvatarExperienceCommonModule.Utils.getGearAssetIdFromEquippedAssets
local GetAssetIdToAssetTypeIdFromHumanoidDescriptionFunction = AvatarExperienceCommonModule.Utils.getAssetIdToAssetTypeIdFromHumanoidDescription
local FIntAXMinSaveIntervalSeconds = game:DefineFastInt("FIntAXMinSaveIntervalSeconds", 2)
local AXMaxUndoRedoHistory = game:DefineFastInt("AXMaxUndoRedoHistory", 20)
local AXEnableMaxUndoRedoHistory = game:DefineFastFlag("AXEnableMaxUndoRedoHistory", false)
local FFlagAXAvatarTimeoutFlow = AvatarExperienceFlagsModule.FFlagAXAvatarTimeoutFlow
local FFlagAXEnableManualSavingBlockingPrompt = AvatarExperienceFlagsModule.FFlagAXEnableManualSavingBlockingPrompt
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagAXBackgroundsPersistence = AvatarExperienceFlagsModule.FFlagAXBackgroundsPersistence
local config = {
	toastMessage = "Feature.Avatar.Message.SaveThrottled",
	isLocalized = false,
	toastType = ToastType.InformationMessage
}
local config1 = {
	toastMessage = "Feature.Avatar.Message.SaveSuccessWithInvalidAssets",
	isLocalized = false,
	toastType = ToastType.SuccessConfirmation
}
local config2 = {
	toastMessage = "Feature.Avatar.Message.SaveSuccess",
	isLocalized = false,
	toastType = ToastType.SuccessConfirmation
}
local config3 = {
	toastMessage = "Feature.Avatar.Message.SaveFailure",
	isLocalized = false,
	toastType = ToastType.InformationMessage
}
local config4 = {
	Home = AppPage.Home,
	More = AppPage.More,
	Chat = AppPage.Chat,
	Games = AppPage.Games
}

local function _(p1)
	-- upvalues: BuildHumanoidDescriptionFunction (copy)
	return BuildHumanoidDescriptionFunction({
		currentAssets = p1.equipped.EquippedAssets,
		avatarScales = p1.equipped.AvatarScales,
		bodyColor3s = p1.equipped.BodyColor3s,
		emotesSlotInfo = p1.equipped.EquippedEmotes.slotInfo
	})
end

return function()
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseSelectorSignalFunction (copy), SelectCharacterDataModule (copy), TutilsModule (copy), SelectHasAvatarDataModule (copy), UseSignalFunction (copy), ReactModule (copy), SignalsModule (copy), ShouldInsertNewHistoryEntryModule (copy), DashModule (copy), AXEnableMaxUndoRedoHistory (copy), AXMaxUndoRedoHistory (copy), FFlagAXCustomizeMakeupSupport (copy), ShouldReplaceLastHistoryEntryModule (copy), RemoveInvalidAssetsFromCharacterDataModule (copy), AvatarExperienceCommonModule (copy), FFlagAXAvatarTimeoutFlow (copy), UseComputedSignalFunction (copy), SaveStatusEnumModule (copy), CheckHasChangesToSaveModule (copy), CheckCharacterDataHasTryOnItemsModule (copy), GetInvalidAssetIdsToAssetTypeIdMapModule (copy), GetAssetIdToAssetTypeIdFromHumanoidDescriptionFunction (copy), SetCurrentToastMessageFunction (copy), config2 (copy), config1 (copy), CharacterHistoryStateChangeButtonActivatedFunction (copy), config (copy), config3 (copy), PromiseModule (copy), FIntAXMinSaveIntervalSeconds (copy), BuildHumanoidDescriptionFunction (copy), GetSaveDictModule (copy), FFlagAXBackgroundsPersistence (copy), CryoModule (copy), SaveProfileConfigurationModule (copy), GetGearAssetIdFromEquippedAssetsFunction (copy), SaveAvatarModule (copy), FFlagAXEnableManualSavingBlockingPrompt (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateToRouteFunction (copy), Actions (copy), AvatarScreen (copy), config4 (copy), RegisterCustomGetStateForActionFunction (copy), CustomGetStateForAction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseSelectorSignalResult = UseSelectorSignalFunction(SelectCharacterDataModule, TutilsModule.deepEqual)
	local UseSelectorSignalResult1 = UseSelectorSignalFunction(SelectHasAvatarDataModule)
	local UseSignalResult, UseSignalResult2 = UseSignalFunction({})
	local UseSignalResult1, UseSignalResult2_1 = UseSignalFunction(0)
	local UseSignalResult3, UseSignalResult2_2 = UseSignalFunction(nil)
	local UseSignalResult4, UseSignalResult2_3 = UseSignalFunction(nil)
	local UseSignalResult5, UseSignalResult2_4 = UseSignalFunction(0)
	local UseSignalResult6, UseSignalResult2_5 = UseSignalFunction(false)
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), UseSelectorSignalResult1 (copy), UseSelectorSignalResult (copy), UseSignalResult (copy), TutilsModule (upval), UseSignalResult2 (copy), UseSignalResult2_1 (copy), UseSignalResult2_2 (copy), UseSignalResult2_3 (copy), UseSignalResult2_4 (copy)
		return SignalsModule.createEffect(function(p1)
			-- upvalues: UseSelectorSignalResult1 (upval), UseSelectorSignalResult (upval), UseSignalResult (upval), TutilsModule (upval), UseSignalResult2 (upval), UseSignalResult2_1 (upval), UseSignalResult2_2 (upval), UseSignalResult2_3 (upval), UseSignalResult2_4 (upval)
			local UseSelectorSignalResultResult = UseSelectorSignalResult1(p1)
			local UseSelectorSignalResultResult1 = UseSelectorSignalResult(p1)
			local UseSignalResultResult = UseSignalResult(false)
			local IsFieldCountResultAbove: boolean = UseSelectorSignalResultResult1.equipped.BodyPartRangeIds and TutilsModule.fieldCount(UseSelectorSignalResultResult1.equipped.BodyPartRangeIds) > 0
			
			if UseSelectorSignalResultResult and IsFieldCountResultAbove and #UseSignalResultResult == 0 then
				UseSignalResult2({ UseSelectorSignalResultResult1 })
				UseSignalResult2_1(1)
				UseSignalResult2_2(UseSelectorSignalResultResult1)
				UseSignalResult2_3(nil)
				UseSignalResult2_4(0)
			end
		end)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), UseSelectorSignalResult (copy), UseSignalResult (copy), UseSignalResult1 (copy), ShouldInsertNewHistoryEntryModule (upval), DashModule (upval), AXEnableMaxUndoRedoHistory (upval), AXMaxUndoRedoHistory (upval), UseSignalResult2 (copy), UseSignalResult2_1 (copy), FFlagAXCustomizeMakeupSupport (upval), ShouldReplaceLastHistoryEntryModule (upval)
		return SignalsModule.createEffect(function(p1)
			-- upvalues: UseSelectorSignalResult (upval), UseSignalResult (upval), UseSignalResult1 (upval), ShouldInsertNewHistoryEntryModule (upval), DashModule (upval), AXEnableMaxUndoRedoHistory (upval), AXMaxUndoRedoHistory (upval), UseSignalResult2 (upval), UseSignalResult2_1 (upval), FFlagAXCustomizeMakeupSupport (upval), ShouldReplaceLastHistoryEntryModule (upval)
			local UseSelectorSignalResultResult = UseSelectorSignalResult(p1)
			local UseSignalResultResult = UseSignalResult(false)
			local UseSignalResultResult1: number = UseSignalResult1(false)
			local UseSignalResultResultEntry = UseSignalResultResult[UseSignalResultResult1] or UseSelectorSignalResultResult
			
			if ShouldInsertNewHistoryEntryModule(UseSignalResultResultEntry, UseSelectorSignalResultResult) and #UseSignalResultResult > 0 then
				local SliceResult = DashModule.slice(UseSignalResultResult, 1, UseSignalResultResult1)
				table.insert(SliceResult, UseSelectorSignalResultResult)
				
				if not AXEnableMaxUndoRedoHistory then
					UseSignalResult2(SliceResult)
					UseSignalResult2_1(UseSignalResultResult1 + 1)
					
					return
				end
				local NewUseSignalResultResult = UseSignalResultResult1 + 1
				
				if AXMaxUndoRedoHistory < #SliceResult then
					table.remove(SliceResult, 1)
					NewUseSignalResultResult -= 1
				end
				UseSignalResult2(SliceResult)
				UseSignalResult2_1(NewUseSignalResultResult)
				
				return
			elseif FFlagAXCustomizeMakeupSupport and ShouldReplaceLastHistoryEntryModule(UseSignalResultResultEntry, UseSelectorSignalResultResult) and #UseSignalResultResult > 0 then
				local SliceResult = DashModule.slice(UseSignalResultResult)
				SliceResult[UseSignalResultResult1] = UseSelectorSignalResultResult
				UseSignalResult2(SliceResult)
				UseSignalResult2_1(UseSignalResultResult1)
			end
		end)
	end, {})
	local UseResult = ReactModule.useCallback(function(p1: number)
		-- upvalues: UseSignalResult (copy), UseSignalResult2_1 (copy)
		local UseSignalResultResult = UseSignalResult(false)
		
		if p1 < 1 or #UseSignalResultResult < p1 then
			return nil
		else
			UseSignalResult2_1(p1)
			
			return UseSignalResultResult[p1]
		end
	end, { UseSignalResult, UseSignalResult2_1 })
	local UseResult1 = ReactModule.useCallback(function(p1)
		-- upvalues: UseSignalResult (copy), UseSignalResult1 (copy), RemoveInvalidAssetsFromCharacterDataModule (upval), UseSignalResult2 (copy)
		local UseSignalResultResult = UseSignalResult(false)
		local UseSignalResultResult1 = UseSignalResult1(false)
		local UseSignalResultResultEntry = UseSignalResultResult[UseSignalResultResult1]
		
		if not UseSignalResultResultEntry then
			return nil
		end
		local RemoveInvalidAssetsFromCharacterDataModuleResult, RemoveInvalidAssetsFromCharacterDataModuleResult2 = RemoveInvalidAssetsFromCharacterDataModule(UseSignalResultResultEntry, p1)
		
		if RemoveInvalidAssetsFromCharacterDataModuleResult2 then
			UseSignalResultResult[UseSignalResultResult1] = RemoveInvalidAssetsFromCharacterDataModuleResult
			UseSignalResult2(UseSignalResultResult)
			
			return RemoveInvalidAssetsFromCharacterDataModuleResult
		else
			return nil
		end
	end, { UseSignalResult, UseSignalResult2, UseSignalResult2_1 })
	local GetTimeoutStatusStoreFunction = AvatarExperienceCommonModule.Stores.getTimeoutStatusStore
	local TimeoutStatusStore = if FFlagAXAvatarTimeoutFlow then GetTimeoutStatusStoreFunction() else nil
	local UseComputedSignalResult = UseComputedSignalFunction(function(p1)
		-- upvalues: FFlagAXAvatarTimeoutFlow (upval), TimeoutStatusStore (copy), SaveStatusEnumModule (upval), UseSignalResult (copy), UseSignalResult1 (copy), UseSignalResult3 (copy), UseSignalResult4 (copy), CheckHasChangesToSaveModule (upval), CheckCharacterDataHasTryOnItemsModule (upval)
		if FFlagAXAvatarTimeoutFlow and TimeoutStatusStore and TimeoutStatusStore.getIsTimedOut(p1) then
			return SaveStatusEnumModule.TimedOut
		else
			local UseSignalResultResult = UseSignalResult(p1)
			local UseSignalResultResult1 = UseSignalResult1(p1)
			local UseSignalResultResult2 = UseSignalResult3(p1)
			local UseSignalResultResult3 = UseSignalResult4(p1)
			local UseSignalResultResultEntry = UseSignalResultResult[UseSignalResultResult1]
			
			return if UseSignalResultResultEntry and UseSignalResultResult2 then if UseSignalResultResult3 then SaveStatusEnumModule.Saving elseif UseSignalResultResult2 and not CheckHasChangesToSaveModule(UseSignalResultResultEntry, UseSignalResultResult2) then SaveStatusEnumModule.AlreadySaved elseif CheckCharacterDataHasTryOnItemsModule(UseSignalResultResultEntry) then SaveStatusEnumModule.HasTryOns else SaveStatusEnumModule.Eligible else SaveStatusEnumModule.NoData
		end
	end)
	local UseResult2 = ReactModule.useCallback(function(p1, p2, p3, _, p4)
		-- upvalues: SaveStatusEnumModule (upval), GetInvalidAssetIdsToAssetTypeIdMapModule (upval), GetAssetIdToAssetTypeIdFromHumanoidDescriptionFunction (upval), UseResult1 (copy), RemoveInvalidAssetsFromCharacterDataModule (upval), UseSignalResult2_2 (copy), UseSignalResult2_3 (copy), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), config2 (upval), config1 (upval), CharacterHistoryStateChangeButtonActivatedFunction (upval)
		local v1 = p3
		local Success = SaveStatusEnumModule.Success
		local v2 = nil
		
		if p4.Assets then
			local InvalidAssetIdsToAssetTypeIdMapModule = GetInvalidAssetIdsToAssetTypeIdMapModule(GetAssetIdToAssetTypeIdFromHumanoidDescriptionFunction(p1), GetAssetIdToAssetTypeIdFromHumanoidDescriptionFunction(p2))
			v2 = UseResult1(InvalidAssetIdsToAssetTypeIdMapModule)
			v1 = RemoveInvalidAssetsFromCharacterDataModule(v1, InvalidAssetIdsToAssetTypeIdMapModule)
		end
		UseSignalResult2_2(v1)
		UseSignalResult2_3(nil)
		
		if v2 ~= nil then
			Success = SaveStatusEnumModule.SuccessWithInvalidAssets
		end
		if Success == SaveStatusEnumModule.Success then
			UseDispatchResult(SetCurrentToastMessageFunction(config2))
		elseif Success == SaveStatusEnumModule.SuccessWithInvalidAssets then
			UseDispatchResult(SetCurrentToastMessageFunction(config1))
		end
		if v2 then
			UseDispatchResult(CharacterHistoryStateChangeButtonActivatedFunction(v2))
		end
		return Success
	end, {
		UseSignalResult,
		UseSignalResult1,
		UseSignalResult2_2,
		UseSignalResult2_3,
		UseResult1
	})
	local UseResult3 = ReactModule.useCallback(function(Throttled)
		-- upvalues: UseSignalResult2_3 (copy), SaveStatusEnumModule (upval), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), config (upval), config3 (upval)
		UseSignalResult2_3(nil)
		
		if Throttled == SaveStatusEnumModule.Throttled then
			UseDispatchResult(SetCurrentToastMessageFunction(config))
			
			return
		else
			UseDispatchResult(SetCurrentToastMessageFunction(config3))
		end
	end, { UseSignalResult2_3, UseDispatchResult })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: PromiseModule (upval), FFlagAXAvatarTimeoutFlow (upval), TimeoutStatusStore (copy), UseResult3 (copy), SaveStatusEnumModule (upval), UseSignalResult (copy), UseSignalResult1 (copy), UseSignalResult3 (copy), UseSignalResult5 (copy), FIntAXMinSaveIntervalSeconds (upval), UseSignalResult2_3 (copy), UseSignalResult2_4 (copy), BuildHumanoidDescriptionFunction (upval), GetSaveDictModule (upval), FFlagAXBackgroundsPersistence (upval), CryoModule (upval), SaveProfileConfigurationModule (upval), UseSignalResult2_5 (copy), UseResult2 (copy), GetGearAssetIdFromEquippedAssetsFunction (upval), SaveAvatarModule (upval)
		return PromiseModule.new(function(Callback, Callback1)
			-- upvalues: FFlagAXAvatarTimeoutFlow (upval), TimeoutStatusStore (upval), UseResult3 (upval), SaveStatusEnumModule (upval), UseSignalResult (upval), UseSignalResult1 (upval), UseSignalResult3 (upval), UseSignalResult5 (upval), FIntAXMinSaveIntervalSeconds (upval), UseSignalResult2_3 (upval), UseSignalResult2_4 (upval), BuildHumanoidDescriptionFunction (upval), GetSaveDictModule (upval), FFlagAXBackgroundsPersistence (upval), CryoModule (upval), SaveProfileConfigurationModule (upval), UseSignalResult2_5 (upval), UseResult2 (upval), GetGearAssetIdFromEquippedAssetsFunction (upval), SaveAvatarModule (upval)
			if FFlagAXAvatarTimeoutFlow and TimeoutStatusStore and TimeoutStatusStore.getIsTimedOut(false) then
				UseResult3(SaveStatusEnumModule.TimedOut)
				
				return
			end
			local UseSignalResultResult = UseSignalResult(false)
			local UseSignalResultResult1 = UseSignalResult1(false)
			local UseSignalResultResult2 = UseSignalResult3(false)
			local UseSignalResultResultEntry = UseSignalResultResult[UseSignalResultResult1]
			
			if UseSignalResultResultEntry and UseSignalResultResult2 then
				local UseSignalResultResult3: number = UseSignalResult5(false)
				
				if UseSignalResultResult3 > 0 and os.time() - UseSignalResultResult3 < FIntAXMinSaveIntervalSeconds then
					UseResult3(SaveStatusEnumModule.Throttled)
					
					return
				end
				UseSignalResult2_3(UseSignalResultResultEntry)
				UseSignalResult2_4(os.time())
				local HumanoidDescription = BuildHumanoidDescriptionFunction({
					currentAssets = UseSignalResultResultEntry.equipped.EquippedAssets,
					avatarScales = UseSignalResultResultEntry.equipped.AvatarScales,
					bodyColor3s = UseSignalResultResultEntry.equipped.BodyColor3s,
					emotesSlotInfo = UseSignalResultResultEntry.equipped.EquippedEmotes.slotInfo
				})
				local HumanoidRigTypeEntry = Enum.HumanoidRigType[UseSignalResultResultEntry.equipped.AvatarType]
				local SaveDictModule = GetSaveDictModule(UseSignalResultResultEntry, UseSignalResultResult2)
				local BackgroundAssetId = if FFlagAXBackgroundsPersistence then UseSignalResultResultEntry.equipped.BackgroundAssetId else nil
				local HasBackgroundAssetId: boolean = SaveDictModule.Background == true and BackgroundAssetId ~= nil
				local Flag = false
				
				if FFlagAXBackgroundsPersistence then
					SaveDictModule = CryoModule.Dictionary.join(SaveDictModule, { Background = CryoModule.None })
					
					for _, value in SaveDictModule do
						if value then
							Flag = true
							break
						end
					end
				end
				if HasBackgroundAssetId and not Flag then
					SaveProfileConfigurationModule(BackgroundAssetId):andThen(function()
						-- upvalues: UseSignalResult2_5 (upval), UseResult2 (upval), HumanoidDescription (copy), UseSignalResultResultEntry (copy), UseSignalResultResult2 (copy), SaveDictModule (ref), Callback (copy)
						UseSignalResult2_5(false)
						UseResult2(HumanoidDescription, HumanoidDescription, UseSignalResultResultEntry, UseSignalResultResult2, SaveDictModule)
						Callback()
					end):catch(function()
						-- upvalues: UseSignalResult2_5 (upval), UseResult3 (upval), SaveStatusEnumModule (upval), Callback1 (copy)
						UseSignalResult2_5(false)
						UseResult3(SaveStatusEnumModule.Failure)
						Callback1()
					end)
					
					return
				end
				local SaveProfileConfigurationModuleResult = if HasBackgroundAssetId then SaveProfileConfigurationModule(BackgroundAssetId) else nil
				SaveAvatarModule(HumanoidDescription, HumanoidRigTypeEntry, SaveDictModule, (GetGearAssetIdFromEquippedAssetsFunction(UseSignalResultResultEntry.equipped.EquippedAssets))):andThen(function(Result)
					-- upvalues: UseSignalResult2_5 (upval), UseResult2 (upval), HumanoidDescription (copy), UseSignalResultResult2 (copy), SaveDictModule (ref), Callback (copy), SaveProfileConfigurationModuleResult (copy), UseSignalResultResultEntry (copy), CryoModule (upval)
					UseSignalResult2_5(false)
					
					local function _(p1)
						-- upvalues: UseResult2 (upval), HumanoidDescription (upval), Result (copy), UseSignalResultResult2 (upval), SaveDictModule (upval), Callback (upval)
						UseResult2(HumanoidDescription, Result.humanoidDescriptionWithValidAssets, p1, UseSignalResultResult2, SaveDictModule)
						Callback()
					end
					
					if SaveProfileConfigurationModuleResult then
						SaveProfileConfigurationModuleResult:andThen(function()
							-- upvalues: UseSignalResultResultEntry (upval), UseResult2 (upval), HumanoidDescription (upval), Result (copy), UseSignalResultResult2 (upval), SaveDictModule (upval), Callback (upval)
							UseResult2(HumanoidDescription, Result.humanoidDescriptionWithValidAssets, UseSignalResultResultEntry, UseSignalResultResult2, SaveDictModule)
							Callback()
						end, function()
							-- upvalues: CryoModule (upval), UseSignalResultResultEntry (upval), UseSignalResultResult2 (upval), UseResult2 (upval), HumanoidDescription (upval), Result (copy), SaveDictModule (upval), Callback (upval)
							UseResult2(HumanoidDescription, Result.humanoidDescriptionWithValidAssets, CryoModule.Dictionary.join(UseSignalResultResultEntry, {
								equipped = CryoModule.Dictionary.join(UseSignalResultResultEntry.equipped, {
									BackgroundAssetId = if UseSignalResultResult2.equipped.BackgroundAssetId == nil then CryoModule.None else UseSignalResultResult2.equipped.BackgroundAssetId
								})
							}), UseSignalResultResult2, SaveDictModule)
							Callback()
						end)
						
						return
					else
						UseResult2(HumanoidDescription, Result.humanoidDescriptionWithValidAssets, UseSignalResultResultEntry, UseSignalResultResult2, SaveDictModule)
						Callback()
					end
				end):catch(function(_)
					-- upvalues: UseSignalResult2_5 (upval), FFlagAXAvatarTimeoutFlow (upval), TimeoutStatusStore (upval), UseResult3 (upval), SaveStatusEnumModule (upval), Callback1 (copy)
					UseSignalResult2_5(false)
					
					if FFlagAXAvatarTimeoutFlow and TimeoutStatusStore then
						TimeoutStatusStore.fetchStatus()
					end
					UseResult3(SaveStatusEnumModule.Failure)
					Callback1()
				end)
			end
		end)
	end, {
		if FFlagAXAvatarTimeoutFlow then TimeoutStatusStore else nil, UseSignalResult,
		UseSignalResult1, UseSignalResult2_2, UseSignalResult2_3, UseSignalResult2_4,
		UseResult1, if FFlagAXAvatarTimeoutFlow then UseResult3 else nil,
		UseSignalResult2_5
	})
	
	if FFlagAXEnableManualSavingBlockingPrompt then
		local UseResult5 = ReactModule.useCallback(function(Name)
			-- upvalues: UseResult4 (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateToRouteFunction (upval)
			return function()
				-- upvalues: UseResult4 (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Name (copy), UseDispatchResult (upval), NavigateToRouteFunction (upval)
				UseResult4():finally(function()
					-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Name (upval), UseDispatchResult (upval), NavigateToRouteFunction (upval)
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.to(NavigationCommands.fromLegacyPage({ skipSaveBlockingPrompt = true, name = Name }))
						
						return
					else
						UseDispatchResult(NavigateToRouteFunction({ { skipSaveBlockingPrompt = true, name = Name } }))
					end
				end)
			end
		end, { UseResult4, UseDispatchResult })
		local UseResult6 = ReactModule.useCallback(function(Name)
			-- upvalues: UseSignalResult3 (copy), UseDispatchResult (copy), CharacterHistoryStateChangeButtonActivatedFunction (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateToRouteFunction (upval)
			return function()
				-- upvalues: UseSignalResult3 (upval), UseDispatchResult (upval), CharacterHistoryStateChangeButtonActivatedFunction (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Name (copy), NavigateToRouteFunction (upval)
				task.spawn(function()
					-- upvalues: UseSignalResult3 (upval), UseDispatchResult (upval), CharacterHistoryStateChangeButtonActivatedFunction (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Name (upval), NavigateToRouteFunction (upval)
					UseDispatchResult(CharacterHistoryStateChangeButtonActivatedFunction((UseSignalResult3(false))))
					task.wait()
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.to(NavigationCommands.fromLegacyPage({ skipSaveBlockingPrompt = true, name = Name }))
						
						return
					else
						UseDispatchResult(NavigateToRouteFunction({ { skipSaveBlockingPrompt = true, name = Name } }))
					end
				end)
			end
		end, { UseDispatchResult, UseSignalResult3 })
		local UseResult7 = ReactModule.useCallback(function(p1, p2)
			-- upvalues: Actions (upval), AvatarScreen (upval), config4 (upval), TutilsModule (upval), UseComputedSignalResult (copy), SaveStatusEnumModule (upval), CryoModule (upval), UseResult5 (copy), UseResult6 (copy)
			local RouteName = (p1 or {}).routeName
			local Params = (p1 or {}).params
			
			if p1.type == Actions.Back and not p1.immediate and p2.routes[#p2.routes] and p2.routes[#p2.routes].routeName == AvatarScreen.SaveAvatarOnLeaveAvatarExperiencePrompt then
				return true, nil
			elseif p1.type ~= Actions.Navigate or config4[RouteName] == nil or Params ~= nil and TutilsModule.fieldCount(Params) ~= 0 or UseComputedSignalResult(false) ~= SaveStatusEnumModule.Eligible then
				return false, nil
			elseif p2.routes[#p2.routes] and p2.routes[#p2.routes].routeName == AvatarScreen.SaveAvatarOnLeaveAvatarExperiencePrompt then
				return true, nil
			else
				local JoinResult = CryoModule.List.join(p2.routes, {
					{
						key = AvatarScreen.SaveAvatarOnLeaveAvatarExperiencePrompt,
						routeName = AvatarScreen.SaveAvatarOnLeaveAvatarExperiencePrompt,
						params = {
							saveAndContinue = UseResult5(RouteName),
							continueWithoutSave = UseResult6(RouteName)
						}
					}
				})
				
				return true, CryoModule.Dictionary.join(p2, { routes = JoinResult, index = #JoinResult })
			end
		end, { UseComputedSignalResult, UseResult5, UseResult6 })
		ReactModule.useEffect(function()
			-- upvalues: UseNavigationResult (copy), RegisterCustomGetStateForActionFunction (upval), CustomGetStateForAction (upval), UseResult7 (copy)
			UseNavigationResult.dispatch(RegisterCustomGetStateForActionFunction(CustomGetStateForAction.HandlerId.BlockAXExitOnUnsavedChanges, UseResult7))
		end, { UseNavigationResult, UseResult7 })
	end
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), UseSignalResult (copy), UseSignalResult6 (copy), UseComputedSignalResult (copy), SaveStatusEnumModule (upval), UseResult4 (copy)
		return SignalsModule.createEffect(function(p1)
			-- upvalues: UseSignalResult (upval), UseSignalResult6 (upval), UseComputedSignalResult (upval), SaveStatusEnumModule (upval), UseResult4 (upval)
			local UseSignalResultResult = UseSignalResult(p1)
			
			if UseSignalResultResult[#UseSignalResultResult] and UseSignalResult6(false) then
				local UseComputedSignalResultResult = UseComputedSignalResult(false)
				
				if UseComputedSignalResultResult == SaveStatusEnumModule.Eligible or UseComputedSignalResultResult == SaveStatusEnumModule.HasTryOns then
					UseResult4()
				end
			end
		end)
	end, {})
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: UseSignalResult2_5 (copy)
		UseSignalResult2_5(true)
	end, { UseSignalResult2_5 })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseSignalResult (copy), UseSignalResult1 (copy), UseResult (copy), UseSignalResult3 (copy), UseComputedSignalResult (copy), UseResult4 (copy), UseResult8 (copy)
		return {
			getHistorySignal = UseSignalResult,
			getCurrentHistoryIndexSignal = UseSignalResult1,
			updateHistoryIndexAndGetCharacterData = UseResult,
			getLastSuccessfullySavedStateSignal = UseSignalResult3,
			getSaveEligibilityStatusSignal = UseComputedSignalResult,
			trySaveAvatar = UseResult4,
			autoSaveNextNewSaveData = UseResult8
		}
	end, {
		UseSignalResult, UseSignalResult1, UseResult, UseSignalResult3,
		UseComputedSignalResult, UseResult4, UseResult8
	})
end
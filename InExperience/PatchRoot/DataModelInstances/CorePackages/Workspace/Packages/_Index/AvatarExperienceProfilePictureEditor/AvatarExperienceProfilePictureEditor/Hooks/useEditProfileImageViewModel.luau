local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local FFlagEditProfileFramesEnabled = require(Parent.SharedFlags).FFlagEditProfileFramesEnabled
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseProfileFramesModule = require(AvatarExperienceProfilePictureEditor.Hooks.useProfileFrames)
local UseUserAvatarConfigurationsModule = require(AvatarExperienceProfilePictureEditor.Hooks.useUserAvatarConfigurations)
local UseProfileFramesGatingModule = require(AvatarExperienceProfilePictureEditor.Hooks.useProfileFramesGating)
local UseEditProfileImageDraftModule = require(AvatarExperienceProfilePictureEditor.Hooks.useEditProfileImageDraft)
local UseEditProfileImageEmotesModule = require(AvatarExperienceProfilePictureEditor.Hooks.useEditProfileImageEmotes)
local UseEditProfileImageNavigationModule = require(AvatarExperienceProfilePictureEditor.Hooks.useEditProfileImageNavigation)
local UseEditProfileImageSaveModule = require(AvatarExperienceProfilePictureEditor.Hooks.useEditProfileImageSave)
local UseFocusOnMountEffectFunction = require(Parent.AvatarExperienceCommon).Hooks.useFocusOnMountEffect
local OpenProfileFramesSubscriptionUpsellModule = require(AvatarExperienceProfilePictureEditor.Utils.openProfileFramesSubscriptionUpsell)
local EditProfileImageHelpersModule = require(AvatarExperienceProfilePictureEditor.Utils.editProfileImageHelpers)
local BuildEditProfileImageAssetItemsModule = require(AvatarExperienceProfilePictureEditor.Utils.buildEditProfileImageAssetItems)
local _ = require(AvatarExperienceProfilePictureEditor.Components.AssetPicker.AssetPickerTile)
local EditProfileImageAnalyticsModule = require(AvatarExperienceProfilePictureEditor.Analytics.EditProfileImageAnalytics)
local _ = require(AvatarExperienceProfilePictureEditor.Common.Enums)
local ConstantsModule = require(AvatarExperienceProfilePictureEditor.Constants)
local TextKeysModule = require(AvatarExperienceProfilePictureEditor.Common.TextKeys)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1) --[[ Line: 111 | Named "useEditProfileImageViewModel" ]]
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), UseUserAvatarConfigurationsModule (copy), UseProfileFramesModule (copy), UseProfileFramesGatingModule (copy), ReactModule (copy), UseEditProfileImageDraftModule (copy), UseEditProfileImageNavigationModule (copy), UseEditProfileImageEmotesModule (copy), HttpService (copy), ConstantsModule (copy), EditProfileImageAnalyticsModule (copy), OpenProfileFramesSubscriptionUpsellModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), BuildEditProfileImageAssetItemsModule (copy), UseEditProfileImageSaveModule (copy), FFlagEditProfileFramesEnabled (copy), EditProfileImageHelpersModule (copy), UseFocusOnMountEffectFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseUserAvatarConfigurationsModuleResult, UseUserAvatarConfigurationsModuleResult2, UseUserAvatarConfigurationsModuleResult3 = UseUserAvatarConfigurationsModule(UseLocalUserIdResult)
	local UseProfileFramesModuleResult = UseProfileFramesModule()
	local UseProfileFramesGatingModuleResult = UseProfileFramesGatingModule()
	local IsShouldShowFrames = UseProfileFramesGatingModuleResult.shouldShowFrames == true
	local UseEditProfileImageDraftModuleResult = UseEditProfileImageDraftModule({
		savedCloseupConfig = UseUserAvatarConfigurationsModuleResult,
		savedFrameAssetId = UseUserAvatarConfigurationsModuleResult2,
		isSavedConfigLoading = UseUserAvatarConfigurationsModuleResult3,
		showFrames = IsShouldShowFrames,
		initialFrameAssetId = p1.initialFrameAssetId,
		initialFrameSelectionRequestId = p1.initialFrameSelectionRequestId,
		isInitialFrameSelectionLoading = p1.initialFrameAssetId ~= nil and UseProfileFramesModuleResult.isLoading,
		isInitialFrameAvailable = ReactModule.useMemo(function(): boolean --[[ Line: 118 ]]
			-- upvalues: p1 (copy), UseProfileFramesModuleResult (copy)
			if p1.initialFrameAssetId == nil then
				return false
			end
			for _, frameItem in UseProfileFramesModuleResult.frameItems do
				if frameItem.id == p1.initialFrameAssetId then
					return true
				end
			end
			return false
		end, {
			p1.initialFrameAssetId,
			UseProfileFramesModuleResult.frameItems
		})
	})
	local UseEditProfileImageNavigationModuleResult = UseEditProfileImageNavigationModule({ mode = p1.mode })
	local UseEditProfileImageEmotesModuleResult = UseEditProfileImageEmotesModule({
		selectedEmoteId = UseEditProfileImageDraftModuleResult.selectedEmoteId
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local CanEquipFrame = UseProfileFramesGatingModuleResult.canEquipFrame or UseStateResult
	local NoUseStateResult: boolean = UseProfileFramesGatingModuleResult.shouldShowUpsell and not UseStateResult
	local UseResult = ReactModule.useCallback(function() --[[ Line: 150 ]]
		-- upvalues: UseStateResult2 (copy), UseProfileFramesGatingModuleResult (copy)
		UseStateResult2(true)
		UseProfileFramesGatingModuleResult.refetchAmpAccess()
	end, { UseProfileFramesGatingModuleResult.refetchAmpAccess })
	local UseResult1 = ReactModule.useCallback(function(Source) --[[ Line: 154 ]]
		-- upvalues: HttpService (upval), UseEditProfileImageDraftModuleResult (copy), ConstantsModule (upval), EditProfileImageAnalyticsModule (upval), p1 (copy), OpenProfileFramesSubscriptionUpsellModule (upval), UseDispatchResult (copy), UseResult (copy)
		local Guid = HttpService:GenerateGUID(false)
		EditProfileImageAnalyticsModule.logSubscribe({
			mode = p1.mode,
			purchaseFlowUuid = Guid,
			frameAssetId = if UseEditProfileImageDraftModuleResult.selectedFrameId == nil or UseEditProfileImageDraftModuleResult.selectedFrameId == ConstantsModule.ProfileFrameNoneId then nil else tonumber(UseEditProfileImageDraftModuleResult.selectedFrameId),
			source = Source
		})
		OpenProfileFramesSubscriptionUpsellModule({
			dispatch = UseDispatchResult,
			onGranted = UseResult,
			purchaseFlowUuid = Guid
		})
	end, {
		UseDispatchResult,
		UseEditProfileImageDraftModuleResult.selectedFrameId,
		UseResult,
		p1.mode
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 175 ]]
		-- upvalues: UseEditProfileImageDraftModuleResult (copy), ConstantsModule (upval), UseProfileFramesModuleResult (copy)
		if not UseEditProfileImageDraftModuleResult.selectedFrameId or UseEditProfileImageDraftModuleResult.selectedFrameId == ConstantsModule.ProfileFrameNoneId then
			return nil
		end
		for _, frameItem in UseProfileFramesModuleResult.frameItems do
			if frameItem.id == UseEditProfileImageDraftModuleResult.selectedFrameId then
				return frameItem.previewImage or frameItem.image
			end
		end
		return nil
	end, {
		UseEditProfileImageDraftModuleResult.selectedFrameId,
		UseProfileFramesModuleResult.frameItems
	})
	local UseLocalizationResult = UseLocalizationFunction({
		frames = TextKeysModule.Frames,
		subscribe = TextKeysModule.Subscribe,
		save = TextKeysModule.Save
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 193 ]]
		-- upvalues: BuildEditProfileImageAssetItemsModule (upval), UseEditProfileImageEmotesModuleResult (copy), UseProfileFramesModuleResult (copy)
		return BuildEditProfileImageAssetItemsModule({
			ownedEmotes = UseEditProfileImageEmotesModuleResult.ownedEmotes,
			recommendedEmotes = UseEditProfileImageEmotesModuleResult.recommendedEmotes,
			frameItems = UseProfileFramesModuleResult.frameItems,
			freeLabel = UseEditProfileImageEmotesModuleResult.freeLabel
		})
	end, {
		UseEditProfileImageEmotesModuleResult.ownedEmotes,
		UseEditProfileImageEmotesModuleResult.recommendedEmotes,
		UseProfileFramesModuleResult.frameItems,
		UseEditProfileImageEmotesModuleResult.freeLabel
	})
	local UseEditProfileImageSaveModuleResult = UseEditProfileImageSaveModule({
		mode = p1.mode,
		activeView = UseEditProfileImageNavigationModuleResult.activeView,
		titleBackAvailable = UseEditProfileImageNavigationModuleResult.titleBackAvailable,
		selectedEmoteId = UseEditProfileImageDraftModuleResult.selectedEmoteId,
		savedEmoteAssetId = UseUserAvatarConfigurationsModuleResult.emoteAssetId,
		selectedFrameId = UseEditProfileImageDraftModuleResult.selectedFrameId,
		showFrames = IsShouldShowFrames,
		distanceScale = UseEditProfileImageDraftModuleResult.distanceScale,
		yRotDeg = UseEditProfileImageDraftModuleResult.yRotDeg,
		cutoutFieldOfViewDeg = p1.cutoutFieldOfViewDeg,
		localUserId = UseLocalUserIdResult,
		isPlusSubscriber = if UseProfileFramesGatingModuleResult.ampAccess then UseProfileFramesGatingModuleResult.ampAccess.granted else false,
		dispatch = UseDispatchResult,
		onReturnToCombined = UseEditProfileImageNavigationModuleResult.onReturnToCombined,
		onClose = p1.onClose,
		onSaveSuccess = p1.onSaveSuccess
	})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 228 ]]
		-- upvalues: UseEditProfileImageDraftModuleResult (copy), UseEditProfileImageSaveModuleResult (copy), p1 (copy)
		UseEditProfileImageDraftModuleResult.resetFromSavedConfig()
		UseEditProfileImageSaveModuleResult.resetTransientState()
		p1.onClose()
	end, {
		UseEditProfileImageDraftModuleResult.resetFromSavedConfig,
		UseEditProfileImageSaveModuleResult.resetTransientState,
		p1.onClose
	})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 235 ]]
		-- upvalues: UseEditProfileImageNavigationModuleResult (copy), UseResult2 (copy), FFlagEditProfileFramesEnabled (upval), UseEditProfileImageEmotesModuleResult (copy), UseEditProfileImageDraftModuleResult (copy), EditProfileImageAnalyticsModule (upval), p1 (copy)
		local Outcome = nil
		local ClearSelectedEmoteFunction = nil
		if UseEditProfileImageNavigationModuleResult.isFramesOnlyEntry then
			Outcome = "exit"
			ClearSelectedEmoteFunction = UseResult2
		elseif UseEditProfileImageNavigationModuleResult.activeView == "emotes" and not FFlagEditProfileFramesEnabled then
			if UseEditProfileImageEmotesModuleResult.isRecommendedEmoteSelected then
				Outcome = "clear_emote"
				ClearSelectedEmoteFunction = UseEditProfileImageDraftModuleResult.clearSelectedEmote
			else
				Outcome = "exit"
				ClearSelectedEmoteFunction = UseResult2
			end
		elseif UseEditProfileImageNavigationModuleResult.titleBackAvailable then
			Outcome = "return_to_combined"
			ClearSelectedEmoteFunction = UseEditProfileImageNavigationModuleResult.onReturnToCombined
		elseif UseEditProfileImageEmotesModuleResult.isRecommendedEmoteSelected then
			Outcome = "clear_emote"
			ClearSelectedEmoteFunction = UseEditProfileImageDraftModuleResult.clearSelectedEmote
		else
			Outcome = "exit"
			ClearSelectedEmoteFunction = UseResult2
		end
		EditProfileImageAnalyticsModule.logBack({
			mode = p1.mode,
			activeView = UseEditProfileImageNavigationModuleResult.activeView,
			outcome = Outcome
		})
		ClearSelectedEmoteFunction()
	end, {
		p1.mode, UseEditProfileImageNavigationModuleResult.isFramesOnlyEntry,
		UseEditProfileImageNavigationModuleResult.activeView,
		UseEditProfileImageNavigationModuleResult.titleBackAvailable,
		UseEditProfileImageNavigationModuleResult.onReturnToCombined,
		UseEditProfileImageEmotesModuleResult.isRecommendedEmoteSelected, UseResult2,
		UseEditProfileImageDraftModuleResult.clearSelectedEmote
	})
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 280 ]]
		-- upvalues: EditProfileImageAnalyticsModule (upval), p1 (copy), UseEditProfileImageEmotesModuleResult (copy)
		EditProfileImageAnalyticsModule.logRetry({ assetType = "emotes", mode = p1.mode })
		UseEditProfileImageEmotesModuleResult.onRetry()
	end, { p1.mode, UseEditProfileImageEmotesModuleResult.onRetry })
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 288 ]]
		-- upvalues: EditProfileImageAnalyticsModule (upval), p1 (copy), UseProfileFramesModuleResult (copy)
		EditProfileImageAnalyticsModule.logRetry({ assetType = "frames", mode = p1.mode })
		UseProfileFramesModuleResult.refetch()
	end, { p1.mode, UseProfileFramesModuleResult.refetch })
	local ResolveFooterCtaResult = EditProfileImageHelpersModule.resolveFooterCta({
		isFramesOnlyEntry = UseEditProfileImageNavigationModuleResult.isFramesOnlyEntry,
		isRecommendedEmoteSelected = UseEditProfileImageEmotesModuleResult.isRecommendedEmoteSelected,
		isEquipRestrictedFrameSelected = FFlagEditProfileFramesEnabled and (IsShouldShowFrames and (not CanEquipFrame and (UseEditProfileImageDraftModuleResult.selectedFrameId ~= nil and UseEditProfileImageDraftModuleResult.selectedFrameId ~= ConstantsModule.ProfileFrameNoneId)))
	})
	local UseRefResult = ReactModule.useRef(nil)
	UseFocusOnMountEffectFunction(UseRefResult, 0)
	
	return {
		navigation = {
			activeView = UseEditProfileImageNavigationModuleResult.activeView,
			closeButtonRef = UseRefResult,
			onExpandEmotes = UseEditProfileImageNavigationModuleResult.onExpandEmotes,
			onExpandFrames = UseEditProfileImageNavigationModuleResult.onExpandFrames,
			onTitleBack = UseEditProfileImageNavigationModuleResult.onTitleBack,
			onBack = UseResult3,
			onLeaveScreen = UseResult2,
			onDidFocus = UseEditProfileImageSaveModuleResult.resetTransientState
		},
		emotes = {
			selectedEmoteId = UseEditProfileImageDraftModuleResult.selectedEmoteId,
			ownedItems = UseMemoResult1.ownedEmoteItems,
			recommendedItems = UseMemoResult1.recommendedEmoteItems,
			items = UseMemoResult1.combinedEmoteItems,
			isLoading = UseEditProfileImageEmotesModuleResult.isLoading,
			hasError = UseEditProfileImageEmotesModuleResult.hasError,
			hasMore = UseEditProfileImageEmotesModuleResult.hasMoreEmotes,
			isLoadingMore = UseEditProfileImageEmotesModuleResult.isLoadingMoreEmotes,
			hasLoadMoreError = UseEditProfileImageEmotesModuleResult.hasLoadMoreError,
			onSelect = UseEditProfileImageDraftModuleResult.onSelectEmote,
			onRetry = UseResult4,
			onMore = UseEditProfileImageEmotesModuleResult.onMoreEmotes
		},
		frames = {
			show = IsShouldShowFrames,
			shouldShowUpsell = NoUseStateResult,
			selectedFrameId = UseEditProfileImageDraftModuleResult.selectedFrameId,
			items = UseMemoResult1.frameAssetItems,
			isLoading = UseProfileFramesModuleResult.isLoading,
			hasError = UseProfileFramesModuleResult.hasError,
			selectedImage = UseMemoResult,
			localizedTitle = UseLocalizationResult.frames,
			onSelect = UseEditProfileImageDraftModuleResult.onSelectFrame,
			onRetry = UseResult5,
			onOpenSubscriptionUpsell = UseResult1
		},
		preview = {
			localUserId = UseLocalUserIdResult,
			yRotDeg = UseEditProfileImageDraftModuleResult.yRotDeg,
			distanceScale = UseEditProfileImageDraftModuleResult.distanceScale,
			onYRotDegChanged = UseEditProfileImageDraftModuleResult.onYRotDegChanged,
			onDistanceScaleChanged = UseEditProfileImageDraftModuleResult.onDistanceScaleChanged
		},
		footer = {
			isSaving = UseEditProfileImageSaveModuleResult.isSaving,
			cta = ResolveFooterCtaResult,
			subscribeLabel = UseLocalizationResult.subscribe,
			saveLabel = UseLocalizationResult.save,
			onSave = UseEditProfileImageSaveModuleResult.onSave
		}
	}
end
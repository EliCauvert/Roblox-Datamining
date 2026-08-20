local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local fFlagEditProfileFramesEnabled = require(parent.SharedFlags).FFlagEditProfileFramesEnabled
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local localizationModule = require(parent.Localization)
local roactUtilsModule = require(parent.RoactUtils)
local useProfileFramesModule = require(avatarExperienceProfilePictureEditor.Hooks.useProfileFrames)
local useUserAvatarConfigurationsModule = require(avatarExperienceProfilePictureEditor.Hooks.useUserAvatarConfigurations)
local useProfileFramesGatingModule = require(avatarExperienceProfilePictureEditor.Hooks.useProfileFramesGating)
local useEditProfileImageDraftModule = require(avatarExperienceProfilePictureEditor.Hooks.useEditProfileImageDraft)
local useEditProfileImageEmotesModule = require(avatarExperienceProfilePictureEditor.Hooks.useEditProfileImageEmotes)
local useEditProfileImageNavigationModule = require(avatarExperienceProfilePictureEditor.Hooks.useEditProfileImageNavigation)
local useEditProfileImageSaveModule = require(avatarExperienceProfilePictureEditor.Hooks.useEditProfileImageSave)
local useFocusOnMountEffect = require(parent.AvatarExperienceCommon).Hooks.useFocusOnMountEffect
local openProfileFramesSubscriptionUpsellModule = require(avatarExperienceProfilePictureEditor.Utils.openProfileFramesSubscriptionUpsell)
local editProfileImageHelpersModule = require(avatarExperienceProfilePictureEditor.Utils.editProfileImageHelpers)
local buildEditProfileImageAssetItemsModule = require(avatarExperienceProfilePictureEditor.Utils.buildEditProfileImageAssetItems)
local _ = require(avatarExperienceProfilePictureEditor.Components.AssetPicker.AssetPickerTile)
local editProfileImageAnalyticsModule = require(avatarExperienceProfilePictureEditor.Analytics.EditProfileImageAnalytics)
local _ = require(avatarExperienceProfilePictureEditor.Common.Enums)
local constantsModule = require(avatarExperienceProfilePictureEditor.Constants)
local textKeysModule = require(avatarExperienceProfilePictureEditor.Common.TextKeys)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization

return function(p0) --[[ line: 109 | named "useEditProfileImageViewModel" ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), useUserAvatarConfigurationsModule (ref), useProfileFramesModule (ref), useProfileFramesGatingModule (ref), useEditProfileImageDraftModule (ref), useEditProfileImageNavigationModule (ref), useEditProfileImageEmotesModule (ref), reactModule (ref), httpService (ref), constantsModule (ref), editProfileImageAnalyticsModule (ref), openProfileFramesSubscriptionUpsellModule (ref), useLocalization (ref), textKeysModule (ref), buildEditProfileImageAssetItemsModule (ref), useEditProfileImageSaveModule (ref), fFlagEditProfileFramesEnabled (ref), editProfileImageHelpersModule (ref), useFocusOnMountEffect (ref)
	local var18 = useDispatch()
	local var19 = useLocalUserId()
	local var20, var21, var22 = useUserAvatarConfigurationsModule(var19)
	local var23 = useProfileFramesModule()
	local var24 = useProfileFramesGatingModule()
	local var25 = var24.shouldShowFrames == true
	local var26 = useEditProfileImageDraftModule({
		savedCloseupConfig = var20,
		savedFrameAssetId = var21,
		isSavedConfigLoading = var22,
		showFrames = var25
	})
	local var27 = useEditProfileImageNavigationModule({ mode = p0.mode })
	local var28 = useEditProfileImageEmotesModule({ selectedEmoteId = var26.selectedEmoteId })
	local var29, var30 = reactModule.useState(false)
	local canEquipFrame = var24.canEquipFrame or var29
	local var32 = var24.shouldShowUpsell and not var29
	local var33 = reactModule.useCallback(function() --[[ line: 133 ]]
		-- upvalues: var30 (ref), var24 (ref)
		var30(true)
		var24.refetchAmpAccess()
	end, { var24.refetchAmpAccess })
	local var34 = reactModule.useCallback(function(p1) --[[ line: 137 ]]
		-- upvalues: httpService (copy), var26 (ref), constantsModule (copy), editProfileImageAnalyticsModule (copy), p0 (ref), openProfileFramesSubscriptionUpsellModule (copy), var18 (ref), var33 (ref)
		local var45 = httpService:GenerateGUID(false)
		editProfileImageAnalyticsModule.logSubscribe({
			mode = p0.mode,
			purchaseFlowUuid = var45,
			frameAssetId = if not (var26.selectedFrameId == nil or var26.selectedFrameId == constantsModule.ProfileFrameNoneId) then tonumber(var26.selectedFrameId) else nil,
			source = p1
		})
		openProfileFramesSubscriptionUpsellModule({
			dispatch = var18,
			onGranted = var33,
			purchaseFlowUuid = var45
		})
	end, { var18, var26.selectedFrameId, var33, p0.mode })
	local var35 = reactModule.useMemo(function() --[[ line: 158 ]]
		-- upvalues: var26 (ref), constantsModule (copy), var23 (ref)
		if not var26.selectedFrameId or var26.selectedFrameId == constantsModule.ProfileFrameNoneId then
			return nil
		end
		for i, v in var23.frameItems do
			if v.id == var26.selectedFrameId then
				return v.previewImage or v.image
			end
		end
		return nil
	end, { var26.selectedFrameId, var23.frameItems })
	local var36 = useLocalization({
		frames = textKeysModule.Frames,
		subscribe = textKeysModule.Subscribe,
		save = textKeysModule.Save
	})
	local var37 = reactModule.useMemo(function() --[[ line: 176 ]]
		-- upvalues: buildEditProfileImageAssetItemsModule (copy), var28 (ref), var23 (ref)
		return buildEditProfileImageAssetItemsModule({
			ownedEmotes = var28.ownedEmotes,
			recommendedEmotes = var28.recommendedEmotes,
			frameItems = var23.frameItems,
			freeLabel = var28.freeLabel
		})
	end, {
		var28.ownedEmotes,
		var28.recommendedEmotes,
		var23.frameItems,
		var28.freeLabel
	})
	local var38 = useEditProfileImageSaveModule({
		mode = p0.mode,
		activeView = var27.activeView,
		titleBackAvailable = var27.titleBackAvailable,
		selectedEmoteId = var26.selectedEmoteId,
		savedEmoteAssetId = var20.emoteAssetId,
		selectedFrameId = var26.selectedFrameId,
		showFrames = var25,
		distanceScale = var26.distanceScale,
		yRotDeg = var26.yRotDeg,
		cutoutFieldOfViewDeg = p0.cutoutFieldOfViewDeg,
		localUserId = var19,
		isPlusSubscriber = if var24.ampAccess then var24.ampAccess.granted else false,
		dispatch = var18,
		onReturnToCombined = var27.onReturnToCombined,
		onClose = p0.onClose,
		onSaveSuccess = p0.onSaveSuccess
	})
	local var39 = reactModule.useCallback(function() --[[ line: 211 ]]
		-- upvalues: var26 (ref), var38 (ref), p0 (ref)
		var26.resetFromSavedConfig()
		var38.resetTransientState()
		p0.onClose()
	end, {
		var26.resetFromSavedConfig,
		var38.resetTransientState,
		p0.onClose
	})
	local var40 = reactModule.useCallback(function() --[[ line: 218 ]]
		-- upvalues: var27 (ref), var39 (ref), fFlagEditProfileFramesEnabled (copy), var28 (ref), var26 (ref), editProfileImageAnalyticsModule (copy), p0 (ref)
		local var46, var47
		local _ = nil
		local _ = nil
		
		if var27.isFramesOnlyEntry then
			var46 = "exit"
			var47 = var39
		elseif var27.activeView == "emotes" and not fFlagEditProfileFramesEnabled then
			if var28.isRecommendedEmoteSelected then
				var46 = "clear_emote"
				var47 = var26.clearSelectedEmote
			else
				var46 = "exit"
				var47 = var39
			end
		elseif var27.titleBackAvailable then
			var46 = "return_to_combined"
			var47 = var27.onReturnToCombined
		elseif var28.isRecommendedEmoteSelected then
			var46 = "clear_emote"
			var47 = var26.clearSelectedEmote
		else
			var46 = "exit"
			var47 = var39
		end
		editProfileImageAnalyticsModule.logBack({
			mode = p0.mode,
			activeView = var27.activeView,
			outcome = var46
		})
		var47()
	end, {
		p0.mode, var27.isFramesOnlyEntry, var27.activeView, var27.titleBackAvailable,
		var27.onReturnToCombined, var28.isRecommendedEmoteSelected, var39,
		var26.clearSelectedEmote
	})
	local var41 = reactModule.useCallback(function() --[[ line: 263 ]]
		-- upvalues: editProfileImageAnalyticsModule (copy), p0 (ref), var28 (ref)
		editProfileImageAnalyticsModule.logRetry({ assetType = "emotes", mode = p0.mode })
		var28.onRetry()
	end, { p0.mode, var28.onRetry })
	local var42 = reactModule.useCallback(function() --[[ line: 271 ]]
		-- upvalues: editProfileImageAnalyticsModule (copy), p0 (ref), var23 (ref)
		editProfileImageAnalyticsModule.logRetry({ assetType = "frames", mode = p0.mode })
		var23.refetch()
	end, { p0.mode, var23.refetch })
	local var43 = editProfileImageHelpersModule.resolveFooterCta({
		isFramesOnlyEntry = var27.isFramesOnlyEntry,
		isRecommendedEmoteSelected = var28.isRecommendedEmoteSelected,
		isEquipRestrictedFrameSelected = fFlagEditProfileFramesEnabled and (var25 and (not canEquipFrame and (var26.selectedFrameId ~= nil and var26.selectedFrameId ~= constantsModule.ProfileFrameNoneId)))
	})
	local var44 = reactModule.useRef(nil)
	useFocusOnMountEffect(var44, 0)
	
	return {
		navigation = {
			activeView = var27.activeView,
			closeButtonRef = var44,
			onExpandEmotes = var27.onExpandEmotes,
			onExpandFrames = var27.onExpandFrames,
			onTitleBack = var27.onTitleBack,
			onBack = var40,
			onLeaveScreen = var39,
			onDidFocus = var38.resetTransientState
		},
		emotes = {
			selectedEmoteId = var26.selectedEmoteId,
			ownedItems = var37.ownedEmoteItems,
			recommendedItems = var37.recommendedEmoteItems,
			items = var37.combinedEmoteItems,
			isLoading = var28.isLoading,
			hasError = var28.hasError,
			hasMore = var28.hasMoreEmotes,
			isLoadingMore = var28.isLoadingMoreEmotes,
			hasLoadMoreError = var28.hasLoadMoreError,
			onSelect = var26.onSelectEmote,
			onRetry = var41,
			onMore = var28.onMoreEmotes
		},
		frames = {
			show = var25,
			shouldShowUpsell = var32,
			selectedFrameId = var26.selectedFrameId,
			items = var37.frameAssetItems,
			isLoading = var23.isLoading,
			hasError = var23.hasError,
			selectedImage = var35,
			localizedTitle = var36.frames,
			onSelect = var26.onSelectFrame,
			onRetry = var42,
			onOpenSubscriptionUpsell = var34
		},
		preview = {
			localUserId = var19,
			yRotDeg = var26.yRotDeg,
			distanceScale = var26.distanceScale,
			onYRotDegChanged = var26.onYRotDegChanged,
			onDistanceScaleChanged = var26.onDistanceScaleChanged
		},
		footer = {
			isSaving = var38.isSaving,
			cta = var43,
			subscribeLabel = var36.subscribe,
			saveLabel = var36.save,
			onSave = var38.onSave
		}
	}
end
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

return function(p1)
	-- upvalues: useDispatch (ref), useLocalUserId (ref), useUserAvatarConfigurationsModule (ref), useProfileFramesModule (ref), useProfileFramesGatingModule (ref), reactModule (ref), useEditProfileImageDraftModule (ref), useEditProfileImageNavigationModule (ref), useEditProfileImageEmotesModule (ref), httpService (ref), constantsModule (ref), editProfileImageAnalyticsModule (ref), openProfileFramesSubscriptionUpsellModule (ref), useLocalization (ref), textKeysModule (ref), buildEditProfileImageAssetItemsModule (ref), useEditProfileImageSaveModule (ref), fFlagEditProfileFramesEnabled (ref), editProfileImageHelpersModule (ref), useFocusOnMountEffect (ref)
	local var1 = useDispatch()
	local var2 = useLocalUserId()
	local var3, var4, var5 = useUserAvatarConfigurationsModule(var2)
	local var6 = useProfileFramesModule()
	local var7 = useProfileFramesGatingModule()
	local var8 = var7.shouldShowFrames == true
	local var9 = useEditProfileImageDraftModule({
		savedCloseupConfig = var3,
		savedFrameAssetId = var4,
		isSavedConfigLoading = var5,
		showFrames = var8,
		initialFrameAssetId = p1.initialFrameAssetId,
		initialFrameSelectionRequestId = p1.initialFrameSelectionRequestId,
		isInitialFrameSelectionLoading = p1.initialFrameAssetId ~= nil and var6.isLoading,
		isInitialFrameAvailable = reactModule.useMemo(function()
			-- upvalues: p1 (ref), var6 (ref)
			if p1.initialFrameAssetId == nil then
				return false
			end
			for i, v in var6.frameItems do
				if v.id == p1.initialFrameAssetId then
					return true
				end
			end
			return false
		end, { p1.initialFrameAssetId, var6.frameItems })
	})
	local var10 = useEditProfileImageNavigationModule({ mode = p1.mode })
	local var11 = useEditProfileImageEmotesModule({ selectedEmoteId = var9.selectedEmoteId })
	local var12, var13 = reactModule.useState(false)
	local canEquipFrame = var7.canEquipFrame or var12
	local var14 = var7.shouldShowUpsell and not var12
	local var15 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), var7 (ref)
		var13(true)
		var7.refetchAmpAccess()
	end, { var7.refetchAmpAccess })
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: httpService (copy), var9 (ref), constantsModule (copy), editProfileImageAnalyticsModule (copy), p1 (ref), openProfileFramesSubscriptionUpsellModule (copy), var1 (ref), var15 (ref)
		local var17 = httpService:GenerateGUID(false)
		editProfileImageAnalyticsModule.logSubscribe({
			mode = p1.mode,
			purchaseFlowUuid = var17,
			frameAssetId = if not (var9.selectedFrameId == nil or var9.selectedFrameId == constantsModule.ProfileFrameNoneId) then tonumber(var9.selectedFrameId) else nil,
			source = p2
		})
		openProfileFramesSubscriptionUpsellModule({
			dispatch = var1,
			onGranted = var15,
			purchaseFlowUuid = var17
		})
	end, { var1, var9.selectedFrameId, var15, p1.mode })
	local var17 = reactModule.useMemo(function()
		-- upvalues: var9 (ref), constantsModule (copy), var6 (ref)
		if not var9.selectedFrameId or var9.selectedFrameId == constantsModule.ProfileFrameNoneId then
			return nil
		end
		for i, v in var6.frameItems do
			if v.id == var9.selectedFrameId then
				return v.previewImage or v.image
			end
		end
		return nil
	end, { var9.selectedFrameId, var6.frameItems })
	local var18 = useLocalization({
		frames = textKeysModule.Frames,
		subscribe = textKeysModule.Subscribe,
		save = textKeysModule.Save
	})
	local var19 = reactModule.useMemo(function()
		-- upvalues: buildEditProfileImageAssetItemsModule (copy), var11 (ref), var6 (ref)
		return buildEditProfileImageAssetItemsModule({
			ownedEmotes = var11.ownedEmotes,
			recommendedEmotes = var11.recommendedEmotes,
			frameItems = var6.frameItems,
			freeLabel = var11.freeLabel
		})
	end, {
		var11.ownedEmotes,
		var11.recommendedEmotes,
		var6.frameItems,
		var11.freeLabel
	})
	local var20 = useEditProfileImageSaveModule({
		mode = p1.mode,
		activeView = var10.activeView,
		titleBackAvailable = var10.titleBackAvailable,
		selectedEmoteId = var9.selectedEmoteId,
		savedEmoteAssetId = var3.emoteAssetId,
		selectedFrameId = var9.selectedFrameId,
		showFrames = var8,
		distanceScale = var9.distanceScale,
		yRotDeg = var9.yRotDeg,
		cutoutFieldOfViewDeg = p1.cutoutFieldOfViewDeg,
		localUserId = var2,
		isPlusSubscriber = if var7.ampAccess then var7.ampAccess.granted else false,
		dispatch = var1,
		onReturnToCombined = var10.onReturnToCombined,
		onClose = p1.onClose,
		onSaveSuccess = p1.onSaveSuccess
	})
	local var21 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var20 (ref), p1 (ref)
		var9.resetFromSavedConfig()
		var20.resetTransientState()
		p1.onClose()
	end, {
		var9.resetFromSavedConfig,
		var20.resetTransientState,
		p1.onClose
	})
	local var22 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var21 (ref), fFlagEditProfileFramesEnabled (copy), var11 (ref), var9 (ref), editProfileImageAnalyticsModule (copy), p1 (ref)
		local var23, var24
		local _ = nil
		local _ = nil
		
		if var10.isFramesOnlyEntry then
			var23 = "exit"
			var24 = var21
		elseif var10.activeView == "emotes" and not fFlagEditProfileFramesEnabled then
			if var11.isRecommendedEmoteSelected then
				var23 = "clear_emote"
				var24 = var9.clearSelectedEmote
			else
				var23 = "exit"
				var24 = var21
			end
		elseif var10.titleBackAvailable then
			var23 = "return_to_combined"
			var24 = var10.onReturnToCombined
		elseif var11.isRecommendedEmoteSelected then
			var23 = "clear_emote"
			var24 = var9.clearSelectedEmote
		else
			var23 = "exit"
			var24 = var21
		end
		editProfileImageAnalyticsModule.logBack({
			mode = p1.mode,
			activeView = var10.activeView,
			outcome = var23
		})
		var24()
	end, {
		p1.mode, var10.isFramesOnlyEntry, var10.activeView, var10.titleBackAvailable,
		var10.onReturnToCombined, var11.isRecommendedEmoteSelected, var21,
		var9.clearSelectedEmote
	})
	local var23 = reactModule.useCallback(function()
		-- upvalues: editProfileImageAnalyticsModule (copy), p1 (ref), var11 (ref)
		editProfileImageAnalyticsModule.logRetry({ assetType = "emotes", mode = p1.mode })
		var11.onRetry()
	end, { p1.mode, var11.onRetry })
	local var24 = reactModule.useCallback(function()
		-- upvalues: editProfileImageAnalyticsModule (copy), p1 (ref), var6 (ref)
		editProfileImageAnalyticsModule.logRetry({ assetType = "frames", mode = p1.mode })
		var6.refetch()
	end, { p1.mode, var6.refetch })
	local var25 = editProfileImageHelpersModule.resolveFooterCta({
		isFramesOnlyEntry = var10.isFramesOnlyEntry,
		isRecommendedEmoteSelected = var11.isRecommendedEmoteSelected,
		isEquipRestrictedFrameSelected = fFlagEditProfileFramesEnabled and (var8 and (not canEquipFrame and (var9.selectedFrameId ~= nil and var9.selectedFrameId ~= constantsModule.ProfileFrameNoneId)))
	})
	local var26 = reactModule.useRef(nil)
	useFocusOnMountEffect(var26, 0)
	
	return {
		navigation = {
			activeView = var10.activeView,
			closeButtonRef = var26,
			onExpandEmotes = var10.onExpandEmotes,
			onExpandFrames = var10.onExpandFrames,
			onTitleBack = var10.onTitleBack,
			onBack = var22,
			onLeaveScreen = var21,
			onDidFocus = var20.resetTransientState
		},
		emotes = {
			selectedEmoteId = var9.selectedEmoteId,
			ownedItems = var19.ownedEmoteItems,
			recommendedItems = var19.recommendedEmoteItems,
			items = var19.combinedEmoteItems,
			isLoading = var11.isLoading,
			hasError = var11.hasError,
			hasMore = var11.hasMoreEmotes,
			isLoadingMore = var11.isLoadingMoreEmotes,
			hasLoadMoreError = var11.hasLoadMoreError,
			onSelect = var9.onSelectEmote,
			onRetry = var23,
			onMore = var11.onMoreEmotes
		},
		frames = {
			show = var8,
			shouldShowUpsell = var14,
			selectedFrameId = var9.selectedFrameId,
			items = var19.frameAssetItems,
			isLoading = var6.isLoading,
			hasError = var6.hasError,
			selectedImage = var17,
			localizedTitle = var18.frames,
			onSelect = var9.onSelectFrame,
			onRetry = var24,
			onOpenSubscriptionUpsell = var16
		},
		preview = {
			localUserId = var2,
			yRotDeg = var9.yRotDeg,
			distanceScale = var9.distanceScale,
			onYRotDegChanged = var9.onYRotDegChanged,
			onDistanceScaleChanged = var9.onDistanceScaleChanged
		},
		footer = {
			isSaving = var20.isSaving,
			cta = var25,
			subscribeLabel = var18.subscribe,
			saveLabel = var18.save,
			onSave = var20.onSave
		}
	}
end
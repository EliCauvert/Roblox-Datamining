local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local fFlagEditProfileFramesEnabled2 = require(parent.SharedFlags).FFlagEditProfileFramesEnabled2
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local localizationModule = require(parent.Localization)
local roactUtilsModule = require(parent.RoactUtils)
local useProfileFramesModule = require(avatarExperienceProfilePictureEditor.Hooks.useProfileFrames)
local useUserAvatarConfigurationsModule = require(avatarExperienceProfilePictureEditor.Hooks.useUserAvatarConfigurations)
local useProfileFramesGatingModule = require(avatarExperienceProfilePictureEditor.Hooks.useProfileFramesGating)
local useEditProfileImageDraft = require(avatarExperienceProfilePictureEditor.Hooks.useEditProfileImageDraft).useEditProfileImageDraft
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

return {
	useEditProfileImageViewModel = function(p0) --[[ line: 109 ]]
		-- upvalues: useDispatch (ref), useLocalUserId (ref), useUserAvatarConfigurationsModule (ref), useProfileFramesModule (ref), useProfileFramesGatingModule (ref), useEditProfileImageDraft (ref), useEditProfileImageNavigationModule (ref), useEditProfileImageEmotesModule (ref), reactModule (ref), httpService (ref), constantsModule (ref), editProfileImageAnalyticsModule (ref), openProfileFramesSubscriptionUpsellModule (ref), useLocalization (ref), textKeysModule (ref), buildEditProfileImageAssetItemsModule (ref), useEditProfileImageSaveModule (ref), fFlagEditProfileFramesEnabled2 (ref), editProfileImageHelpersModule (ref), useFocusOnMountEffect (ref)
		local var17 = useDispatch()
		local var18 = useLocalUserId()
		local var19, var20, var21 = useUserAvatarConfigurationsModule(var18)
		local var22 = useProfileFramesModule()
		local var23 = useProfileFramesGatingModule()
		local var24 = var23.shouldShowFrames == true
		local var25 = useEditProfileImageDraft({
			savedCloseupConfig = var19,
			savedFrameAssetId = var20,
			isSavedConfigLoading = var21,
			showFrames = var24
		})
		local var26 = useEditProfileImageNavigationModule({ mode = p0.mode })
		local var27 = useEditProfileImageEmotesModule({ selectedEmoteId = var25.selectedEmoteId })
		local var28, var29 = reactModule.useState(false)
		local canEquipFrame = var23.canEquipFrame or var28
		local var31 = var23.shouldShowUpsell and not var28
		local var32 = reactModule.useCallback(function() --[[ line: 133 ]]
			-- upvalues: var29 (ref), var23 (ref)
			var29(true)
			var23.refetchAmpAccess()
		end, { var23.refetchAmpAccess })
		local var33 = reactModule.useCallback(function(p1) --[[ line: 137 ]]
			-- upvalues: httpService (copy), var25 (ref), constantsModule (copy), editProfileImageAnalyticsModule (copy), p0 (ref), openProfileFramesSubscriptionUpsellModule (copy), var17 (ref), var32 (ref)
			local var44 = httpService:GenerateGUID(false)
			editProfileImageAnalyticsModule.logSubscribe({
				mode = p0.mode,
				purchaseFlowUuid = var44,
				frameAssetId = if not (var25.selectedFrameId == nil or var25.selectedFrameId == constantsModule.ProfileFrameNoneId) then tonumber(var25.selectedFrameId) else nil,
				source = p1
			})
			openProfileFramesSubscriptionUpsellModule({
				dispatch = var17,
				onGranted = var32,
				purchaseFlowUuid = var44
			})
		end, { var17, var25.selectedFrameId, var32, p0.mode })
		local var34 = reactModule.useMemo(function() --[[ line: 158 ]]
			-- upvalues: var25 (ref), constantsModule (copy), var22 (ref)
			if not var25.selectedFrameId or var25.selectedFrameId == constantsModule.ProfileFrameNoneId then
				return nil
			end
			for i, v in var22.frameItems do
				if v.id == var25.selectedFrameId then
					return v.previewImage or v.image
				end
			end
			return nil
		end, { var25.selectedFrameId, var22.frameItems })
		local var35 = useLocalization({
			frames = textKeysModule.Frames,
			subscribe = textKeysModule.Subscribe,
			save = textKeysModule.Save
		})
		local var36 = reactModule.useMemo(function() --[[ line: 176 ]]
			-- upvalues: buildEditProfileImageAssetItemsModule (copy), var27 (ref), var22 (ref)
			return buildEditProfileImageAssetItemsModule({
				ownedEmotes = var27.ownedEmotes,
				recommendedEmotes = var27.recommendedEmotes,
				frameItems = var22.frameItems,
				freeLabel = var27.freeLabel
			})
		end, {
			var27.ownedEmotes,
			var27.recommendedEmotes,
			var22.frameItems,
			var27.freeLabel
		})
		local var37 = useEditProfileImageSaveModule({
			mode = p0.mode,
			activeView = var26.activeView,
			titleBackAvailable = var26.titleBackAvailable,
			selectedEmoteId = var25.selectedEmoteId,
			savedEmoteAssetId = var19.emoteAssetId,
			selectedFrameId = var25.selectedFrameId,
			showFrames = var24,
			distanceScale = var25.distanceScale,
			yRotDeg = var25.yRotDeg,
			cutoutFieldOfViewDeg = p0.cutoutFieldOfViewDeg,
			localUserId = var18,
			isPlusSubscriber = if var23.ampAccess then var23.ampAccess.granted else false,
			dispatch = var17,
			onReturnToCombined = var26.onReturnToCombined,
			onClose = p0.onClose,
			onSaveSuccess = p0.onSaveSuccess
		})
		local var38 = reactModule.useCallback(function() --[[ line: 211 ]]
			-- upvalues: var25 (ref), var37 (ref), p0 (ref)
			var25.resetFromSavedConfig()
			var37.resetTransientState()
			p0.onClose()
		end, {
			var25.resetFromSavedConfig,
			var37.resetTransientState,
			p0.onClose
		})
		local var39 = reactModule.useCallback(function() --[[ line: 218 ]]
			-- upvalues: var26 (ref), var38 (ref), fFlagEditProfileFramesEnabled2 (copy), var27 (ref), var25 (ref), editProfileImageAnalyticsModule (copy), p0 (ref)
			local var45, var46
			local _ = nil
			local _ = nil
			
			if var26.isFramesOnlyEntry then
				var45 = "exit"
				var46 = var38
			elseif var26.activeView == "emotes" and not fFlagEditProfileFramesEnabled2 then
				if var27.isRecommendedEmoteSelected then
					var45 = "clear_emote"
					var46 = var25.clearSelectedEmote
				else
					var45 = "exit"
					var46 = var38
				end
			elseif var26.titleBackAvailable then
				var45 = "return_to_combined"
				var46 = var26.onReturnToCombined
			elseif var27.isRecommendedEmoteSelected then
				var45 = "clear_emote"
				var46 = var25.clearSelectedEmote
			else
				var45 = "exit"
				var46 = var38
			end
			editProfileImageAnalyticsModule.logBack({
				mode = p0.mode,
				activeView = var26.activeView,
				outcome = var45
			})
			var46()
		end, {
			p0.mode, var26.isFramesOnlyEntry, var26.activeView, var26.titleBackAvailable,
			var26.onReturnToCombined, var27.isRecommendedEmoteSelected, var38,
			var25.clearSelectedEmote
		})
		local var40 = reactModule.useCallback(function() --[[ line: 263 ]]
			-- upvalues: editProfileImageAnalyticsModule (copy), p0 (ref), var27 (ref)
			editProfileImageAnalyticsModule.logRetry({ assetType = "emotes", mode = p0.mode })
			var27.onRetry()
		end, { p0.mode, var27.onRetry })
		local var41 = reactModule.useCallback(function() --[[ line: 271 ]]
			-- upvalues: editProfileImageAnalyticsModule (copy), p0 (ref), var22 (ref)
			editProfileImageAnalyticsModule.logRetry({ assetType = "frames", mode = p0.mode })
			var22.refetch()
		end, { p0.mode, var22.refetch })
		local var42 = editProfileImageHelpersModule.resolveFooterCta({
			isFramesOnlyEntry = var26.isFramesOnlyEntry,
			isRecommendedEmoteSelected = var27.isRecommendedEmoteSelected,
			isEquipRestrictedFrameSelected = fFlagEditProfileFramesEnabled2 and (var24 and (not canEquipFrame and (var25.selectedFrameId ~= nil and var25.selectedFrameId ~= constantsModule.ProfileFrameNoneId)))
		})
		local var43 = reactModule.useRef(nil)
		useFocusOnMountEffect(var43, 0)
		
		return {
			navigation = {
				activeView = var26.activeView,
				closeButtonRef = var43,
				onExpandEmotes = var26.onExpandEmotes,
				onExpandFrames = var26.onExpandFrames,
				onTitleBack = var26.onTitleBack,
				onBack = var39,
				onLeaveScreen = var38,
				onDidFocus = var37.resetTransientState
			},
			emotes = {
				selectedEmoteId = var25.selectedEmoteId,
				ownedItems = var36.ownedEmoteItems,
				recommendedItems = var36.recommendedEmoteItems,
				items = var36.combinedEmoteItems,
				isLoading = var27.isLoading,
				hasError = var27.hasError,
				hasMore = var27.hasMoreEmotes,
				isLoadingMore = var27.isLoadingMoreEmotes,
				hasLoadMoreError = var27.hasLoadMoreError,
				onSelect = var25.onSelectEmote,
				onRetry = var40,
				onMore = var27.onMoreEmotes
			},
			frames = {
				show = var24,
				shouldShowUpsell = var31,
				selectedFrameId = var25.selectedFrameId,
				items = var36.frameAssetItems,
				isLoading = var22.isLoading,
				hasError = var22.hasError,
				selectedImage = var34,
				localizedTitle = var35.frames,
				onSelect = var25.onSelectFrame,
				onRetry = var41,
				onOpenSubscriptionUpsell = var33
			},
			preview = {
				localUserId = var18,
				yRotDeg = var25.yRotDeg,
				distanceScale = var25.distanceScale,
				onYRotDegChanged = var25.onYRotDegChanged,
				onDistanceScaleChanged = var25.onDistanceScaleChanged
			},
			footer = {
				isSaving = var37.isSaving,
				cta = var42,
				subscribeLabel = var35.subscribe,
				saveLabel = var35.save,
				onSave = var37.onSave
			}
		}
	end
}
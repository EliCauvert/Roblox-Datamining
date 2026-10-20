local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local UseRealtimeEventFunction = require(Parent.RealtimeDelivery).useRealtimeEvent
local LocalizationModule = require(Parent.Localization)
local UseOwnedEmotesModule = require(AvatarExperienceProfilePictureEditor.Hooks.useOwnedEmotes)
local UseRecommendedEmotesModule = require(AvatarExperienceProfilePictureEditor.Hooks.useRecommendedEmotes)
local TextKeysModule = require(AvatarExperienceProfilePictureEditor.Common.TextKeys)
local UseEditProfileImageActionsFunction = require(AvatarExperienceProfilePictureEditor.Context.EditProfileImageActionsContext).useEditProfileImageActions

return function(p1)
	-- upvalues: UseEditProfileImageActionsFunction (copy), UseOwnedEmotesModule (copy), UseRecommendedEmotesModule (copy), ReactModule (copy), UseRealtimeEventFunction (copy), LocalizationModule (copy), TextKeysModule (copy)
	local UseEditProfileImageActionsResult = UseEditProfileImageActionsFunction()
	local UseOwnedEmotesModuleResult = UseOwnedEmotesModule()
	local EmoteItems = UseOwnedEmotesModuleResult.emoteItems
	local RecommendedEmotes = UseRecommendedEmotesModule().recommendedEmotes
	local UseResult = ReactModule.useCallback(function(Id)
		-- upvalues: RecommendedEmotes (copy), UseOwnedEmotesModuleResult (copy)
		local Label = nil
		
		for _, recommendedEmote in RecommendedEmotes do
			if recommendedEmote.id == Id then
				Label = recommendedEmote.label
				break
			end
		end
		UseOwnedEmotesModuleResult.markEmoteOwned(Id, Label)
	end, {
		RecommendedEmotes,
		UseOwnedEmotesModuleResult.markEmoteOwned
	})
	UseRealtimeEventFunction("AvatarAssetOwnershipNotifications", "Grant", function(p2)
		-- upvalues: UseResult (copy)
		if tostring(p2.AssetTypeId) == tostring(Enum.AvatarAssetType.EmoteAnimation.Value) then
			UseResult((tostring(p2.AssetId)))
		end
	end, { UseResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: EmoteItems (copy)
		local t = {}
		
		for _, emoteItem in EmoteItems do
			t[emoteItem.id] = true
		end
		return t
	end, { EmoteItems })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: RecommendedEmotes (copy)
		local t = {}
		
		for _, recommendedEmote in RecommendedEmotes do
			t[recommendedEmote.id] = true
		end
		return t
	end, { RecommendedEmotes })
	local SelectedEmoteId = p1.selectedEmoteId
	local IsUseMemoResultEntry: boolean = if SelectedEmoteId then UseMemoResult[SelectedEmoteId] ~= true and UseMemoResult1[SelectedEmoteId] == true else false
	ReactModule.useEffect(function()
		-- upvalues: SelectedEmoteId (copy), IsUseMemoResultEntry (copy), UseEditProfileImageActionsResult (copy)
		if SelectedEmoteId and IsUseMemoResultEntry then
			UseEditProfileImageActionsResult.onPrepareRecommendedEmotePurchase(SelectedEmoteId)
		end
	end, {
		SelectedEmoteId,
		IsUseMemoResultEntry,
		UseEditProfileImageActionsResult.onPrepareRecommendedEmotePurchase
	})
	
	return {
		ownedEmotes = EmoteItems,
		recommendedEmotes = RecommendedEmotes,
		isLoading = UseOwnedEmotesModuleResult.isLoading,
		hasError = UseOwnedEmotesModuleResult.hasError,
		hasMoreEmotes = UseOwnedEmotesModuleResult.hasMoreEmotes,
		isLoadingMoreEmotes = UseOwnedEmotesModuleResult.isLoadingMoreEmotes,
		hasLoadMoreError = UseOwnedEmotesModuleResult.hasLoadMoreError,
		onRetry = UseOwnedEmotesModuleResult.refetch,
		onMoreEmotes = UseOwnedEmotesModuleResult.onMoreEmotes,
		isRecommendedEmoteSelected = IsUseMemoResultEntry,
		freeLabel = LocalizationModule.Hooks.useLocalization({ free = TextKeysModule.Free }).free
	}
end
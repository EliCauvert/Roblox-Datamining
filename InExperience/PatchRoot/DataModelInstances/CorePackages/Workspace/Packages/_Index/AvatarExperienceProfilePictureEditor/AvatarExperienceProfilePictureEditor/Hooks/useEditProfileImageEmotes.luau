local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local useRealtimeEvent = require(parent.RealtimeDelivery).useRealtimeEvent
local localizationModule = require(parent.Localization)
local useOwnedEmotesModule = require(avatarExperienceProfilePictureEditor.Hooks.useOwnedEmotes)
local useRecommendedEmotesModule = require(avatarExperienceProfilePictureEditor.Hooks.useRecommendedEmotes)
local textKeysModule = require(avatarExperienceProfilePictureEditor.Common.TextKeys)
local useEditProfileImageActions = require(avatarExperienceProfilePictureEditor.Context.EditProfileImageActionsContext).useEditProfileImageActions

return function(p1)
	-- upvalues: useEditProfileImageActions (ref), useOwnedEmotesModule (ref), useRecommendedEmotesModule (ref), reactModule (ref), useRealtimeEvent (ref), localizationModule (ref), textKeysModule (ref)
	local var1
	local var2 = useEditProfileImageActions()
	local var3 = useOwnedEmotesModule()
	local emoteItems = var3.emoteItems
	local recommendedEmotes = useRecommendedEmotesModule().recommendedEmotes
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: recommendedEmotes (ref), var3 (ref)
		local label = nil
		
		for i, v in recommendedEmotes do
			if v.id == p2 then
				label = v.label
				break
			end
		end
		var3.markEmoteOwned(p2, label)
	end, { recommendedEmotes, var3.markEmoteOwned })
	useRealtimeEvent("AvatarAssetOwnershipNotifications", "Grant", function(p3)
		-- upvalues: var4 (ref)
		if tostring(p3.AssetTypeId) == tostring(Enum.AvatarAssetType.EmoteAnimation.Value) then
			var4(tostring(p3.AssetId))
		end
	end, { var4 })
	local var5 = reactModule.useMemo(function()
		-- upvalues: emoteItems (ref)
		local t = {}
		
		for i, v in emoteItems do
			t[v.id] = true
		end
		return t
	end, { emoteItems })
	local var6 = reactModule.useMemo(function()
		-- upvalues: recommendedEmotes (ref)
		local t = {}
		
		for i, v in recommendedEmotes do
			t[v.id] = true
		end
		return t
	end, { recommendedEmotes })
	local selectedEmoteId = p1.selectedEmoteId
	
	if selectedEmoteId then
		var1 = false
		
		if var5[selectedEmoteId] ~= true then
			local _ = var6[selectedEmoteId] == true
		end
	else
		var1 = false
	end
	reactModule.useEffect(function()
		-- upvalues: selectedEmoteId (ref), var1 (ref), var2 (ref)
		if selectedEmoteId and var1 then
			var2.onPrepareRecommendedEmotePurchase(selectedEmoteId)
		end
	end, {
		selectedEmoteId,
		var1,
		var2.onPrepareRecommendedEmotePurchase
	})
	
	return {
		ownedEmotes = emoteItems,
		recommendedEmotes = recommendedEmotes,
		isLoading = var3.isLoading,
		hasError = var3.hasError,
		hasMoreEmotes = var3.hasMoreEmotes,
		isLoadingMoreEmotes = var3.isLoadingMoreEmotes,
		hasLoadMoreError = var3.hasLoadMoreError,
		onRetry = var3.refetch,
		onMoreEmotes = var3.onMoreEmotes,
		isRecommendedEmoteSelected = var1,
		freeLabel = localizationModule.Hooks.useLocalization({ free = textKeysModule.Free }).free
	}
end
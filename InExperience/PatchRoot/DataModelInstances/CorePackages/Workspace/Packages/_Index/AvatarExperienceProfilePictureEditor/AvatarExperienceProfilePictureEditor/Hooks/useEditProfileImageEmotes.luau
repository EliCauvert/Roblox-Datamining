local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local useRealtimeEvent = require(parent.RealtimeDelivery).useRealtimeEvent
local localizationModule = require(parent.Localization)
local useOwnedEmotesModule = require(avatarExperienceProfilePictureEditor.Hooks.useOwnedEmotes)
local useRecommendedEmotesModule = require(avatarExperienceProfilePictureEditor.Hooks.useRecommendedEmotes)
local textKeysModule = require(avatarExperienceProfilePictureEditor.Common.TextKeys)
local useEditProfileImageActions = require(avatarExperienceProfilePictureEditor.Context.EditProfileImageActionsContext).useEditProfileImageActions

return function(p0) --[[ line: 35 | named "useEditProfileImageEmotes" ]]
	-- upvalues: useEditProfileImageActions (ref), useOwnedEmotesModule (ref), useRecommendedEmotesModule (ref), reactModule (ref), useRealtimeEvent (ref), localizationModule (ref), textKeysModule (ref)
	local var11
	local var6 = useEditProfileImageActions()
	local var7 = useOwnedEmotesModule()
	local emoteItems = var7.emoteItems
	local recommendedEmotes = useRecommendedEmotesModule().recommendedEmotes
	local var8 = reactModule.useCallback(function(p1) --[[ line: 43 ]]
		-- upvalues: recommendedEmotes (ref), var7 (ref)
		local label = nil
		
		for i, v in recommendedEmotes do
			if v.id == p1 then
				label = v.label
				break
			end
		end
		var7.markEmoteOwned(p1, label)
		var7.refetch({ inBackground = true })
	end, { recommendedEmotes, var7.markEmoteOwned, var7.refetch })
	useRealtimeEvent("AvatarAssetOwnershipNotifications", "Grant", function(p2) --[[ line: 62 ]]
		-- upvalues: var8 (ref)
		if tostring(p2.AssetTypeId) == tostring(Enum.AvatarAssetType.EmoteAnimation.Value) then
			var8(tostring(p2.AssetId))
		end
	end, { var8 })
	local var9 = reactModule.useMemo(function() --[[ line: 68 ]]
		-- upvalues: emoteItems (ref)
		local t = {}
		
		for i, v in emoteItems do
			t[v.id] = true
		end
		return t
	end, { emoteItems })
	local var10 = reactModule.useMemo(function() --[[ line: 75 ]]
		-- upvalues: recommendedEmotes (ref)
		local t = {}
		
		for i, v in recommendedEmotes do
			t[v.id] = true
		end
		return t
	end, { recommendedEmotes })
	local selectedEmoteId = p0.selectedEmoteId
	
	if selectedEmoteId then
		var11 = false
		
		if var9[selectedEmoteId] ~= true then
			local _ = var10[selectedEmoteId] == true
		end
	else
		var11 = false
	end
	reactModule.useEffect(function() --[[ line: 87 ]]
		-- upvalues: selectedEmoteId (ref), var11 (ref), var6 (ref)
		if selectedEmoteId and var11 then
			var6.onPrepareRecommendedEmotePurchase(selectedEmoteId)
		end
	end, {
		selectedEmoteId,
		var11,
		var6.onPrepareRecommendedEmotePurchase
	})
	
	return {
		ownedEmotes = emoteItems,
		recommendedEmotes = recommendedEmotes,
		isLoading = var7.isLoading,
		hasError = var7.hasError,
		hasMoreEmotes = var7.hasMoreEmotes,
		isLoadingMoreEmotes = var7.isLoadingMoreEmotes,
		hasLoadMoreError = var7.hasLoadMoreError,
		onRetry = var7.refetch,
		onMoreEmotes = var7.onMoreEmotes,
		isRecommendedEmoteSelected = var11,
		freeLabel = localizationModule.Hooks.useLocalization({ free = textKeysModule.Free }).free
	}
end
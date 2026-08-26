local t = {}

local function _(p1, p2)
	return { id = p1, callback = p2 }
end

return {
	addEventListener = function(_, p1, p2, p3)
		-- upvalues: t (ref)
		if t[p1] == nil then
			t[p1] = {}
		end
		table.insert(t[p1], { id = p2, callback = p3 })
	end,
	removeEventListener = function(_, p1, p2)
		-- upvalues: t (ref)
		if t[p1] == nil then return end
		for i, v in ipairs(t[p1]) do
			if v ~= nil and v.id == p2 then
				table.remove(t[p1], i)
			end
		end
	end,
	removeCallbackFromEvent = function(_, p3, p4, p5)
		-- upvalues: t (ref)
		if t[p3] == nil then return end
		for i, v in ipairs(t[p3]) do
			if v ~= nil and v.id == p4 and v.callback == p5 then
				table.remove(t[p3], i)
				
				return
			end
		end
	end,
	dispatchEvent = function(_, p6, ...)
		-- upvalues: t (ref)
		if t[p6] == nil then return end
		for i, v in ipairs(t[p6]) do
			v.callback(...)
		end
	end,
	Notifications = {
		AuthenticationSuccess = "rbxNotificationAuthenticationSuccess",
		GameJoin = "rbxNotificationGameJoin",
		OpenGames = "rbxNotificationOpenGames",
		OpenGameDetail = "rbxNotificationOpenGameDetail",
		OpenGameGenre = "rbxNotificationOpenGameGenre",
		OpenBadgeScreen = "rbxNotificationOpenBadgeScreen",
		OpenSettingsScreen = "rbxNotificationOpenSettingsScreen",
		OpenSearchScreen = "rbxNotificationOpenSearchScreen",
		OpenStoreScreen = "rbxNotificationOpenStoreScreen",
		OpenAvatarEditorScreen = "rbxNotificationOpenAvatarEditorScreen",
		OpenAccountSettingsScreen = "rbxNotificationOpenAccountSettingsScreen",
		NavigateToEquippedAvatar = "rbxNotificationNavigateToEquippedAvatar",
		NavigateToRobuxScreen = "rbxNotificationNavigateToRobuxScreen",
		RobuxCatalogPurchaseInitiated = "rbxRobuxCatalogPurchaseInitiated",
		DonnedDifferentPackage = "rbxDonnedDifferentPackage",
		VotedOnPlace = "rbxVotedOnPlace",
		AvatarEquipBegin = "rbxAvatarEquipBegin",
		DonnedDifferentOutfit = "rbxDonnedDifferentOutfit",
		AvatarEquipSuccess = "rbxAvatarEquipSuccess",
		AvatarPurchaseBegin = "rbxAvatarPurchaseBegin",
		AvatarPurchaseSuccess = "rbxAvatarPurchaseSuccess",
		FavoriteToggle = "rbxFavoriteToggle",
		PlayedGamesChanged = "rbxPlayedGamesChanged",
		UnlockedUGC = "rbxNotificationUnlockedUGC",
		SetGamesHints = "rbxNotificationSetGamesHints",
		CharacterEquipped = "CharacterEquipped",
		CharacterUpdated = "CharacterUpdated",
		HardwareBundleGranted = "HardwareBundleGranted"
	}
}
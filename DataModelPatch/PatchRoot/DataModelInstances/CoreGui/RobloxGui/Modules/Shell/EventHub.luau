local t = {}

local function _(Id, Callback)
	return { id = Id, callback = Callback }
end

return {
	addEventListener = function(_, Key, Id, Callback)
		-- upvalues: t (copy)
		if t[Key] == nil then
			t[Key] = {}
		end
		table.insert(t[Key], { id = Id, callback = Callback })
	end,
	removeEventListener = function(_, p1, Id)
		-- upvalues: t (copy)
		if t[p1] == nil then return end
		for i, value in ipairs(t[p1]) do
			if value ~= nil and value.id == Id then
				table.remove(t[p1], i)
			end
		end
	end,
	removeCallbackFromEvent = function(_, p2, Id, Callback)
		-- upvalues: t (copy)
		if t[p2] == nil then return end
		for i, Listener in ipairs(t[p2]) do
			if Listener ~= nil and Listener.id == Id and Listener.callback == Callback then
				table.remove(t[p2], i)
				break
			end
		end
	end,
	dispatchEvent = function(_, p3, ...)
		-- upvalues: t (copy)
		if t[p3] == nil then return end
		for _, value in ipairs(t[p3]) do
			value.callback(...)
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
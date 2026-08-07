local t = {}

local function _(p0, p1) --[[ line: 6 | named "createListener" ]]
	return { id = p0, callback = p1 }
end

return {
	addEventListener = function(_, p2, p3, p4) --[[ line: 18 ]]
		-- upvalues: t (ref)
		if t[p2] == nil then
			t[p2] = {}
		end
		table.insert(t[p2], { id = p3, callback = p4 })
	end,
	removeEventListener = function(_, p5, p6) --[[ line: 26 ]]
		-- upvalues: t (ref)
		if t[p5] == nil then return end
		for i, v in ipairs(t[p5]) do
			if v ~= nil and v.id == p6 then
				table.remove(t[p5], i)
			end
		end
	end,
	removeCallbackFromEvent = function(_, p7, p8, p9) --[[ line: 40 ]]
		-- upvalues: t (ref)
		if t[p7] == nil then return end
		for i, v in ipairs(t[p7]) do
			if v ~= nil and v.id == p8 and v.callback == p9 then
				table.remove(t[p7], i)
				
				return
			end
		end
	end,
	dispatchEvent = function(_, p10, ...) --[[ line: 56 ]]
		-- upvalues: t (ref)
		if t[p10] == nil then return end
		for i, v in ipairs(t[p10]) do
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
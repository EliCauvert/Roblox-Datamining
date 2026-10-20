local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(AppChat.types)
local RoduxPresenceModule = require(AppChat.Http.RoduxPresence)
local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)
local DataHydrationModule = require(Parent.DataHydration)
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local PresenceType = RoduxPresenceModule.Enums.PresenceType
local PresenceType1 = if FFlagAppChatPresenceStoreMigrationModule then DataHydrationModule.Presence.PresenceEnums.PresenceType else nil
local config = {
	[PresenceType.InGame] = "Active",
	[PresenceType.Online] = "Active",
	[PresenceType.InStudio] = "Active",
	[PresenceType.Offline] = "None",
	[PresenceType.Invisible] = "None"
}
local config1 = {
	InGame = "Active",
	Online = "Active",
	InStudio = "Active",
	Offline = "None"
}
local config2 = {
	[PresenceType.InGame] = "ingameStatusLabel",
	[PresenceType.Online] = "onlinePresenceText",
	[PresenceType.InStudio] = "studioStatusLabel",
	[PresenceType.Offline] = "offlinePresenceText",
	[PresenceType.Invisible] = "offlinePresenceText"
}
local config3 = {
	InGame = "ingameStatusLabel",
	Online = "onlinePresenceText",
	InStudio = "studioStatusLabel",
	Offline = "offlinePresenceText"
}
local config4 = {
	offlinePresenceText = "Common.Presence.Label.Offline",
	onlinePresenceText = "Common.Presence.Label.Online",
	studioStatusLabel = "Common.Presence.Label.RobloxStudio",
	ingameStatusLabel = "Common.Presence.Label.InExperience"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config4 (copy), ReactModule (copy), FFlagAppChatPresenceStoreMigrationModule (copy), UseGetPresenceByUserIdFunction (copy), UseSelectorFunction (copy), RoduxPresenceModule (copy), PresenceType1 (copy), PresenceType (copy), config3 (copy), config2 (copy), config1 (copy), config (copy)
	local UseLocalizationResult = UseLocalizationFunction(config4)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UseLocalizationResult.offlinePresenceText)
	local None, None2 = ReactModule.useState("None")
	local UseGetPresenceByUserIdResult = nil
	UseGetPresenceByUserIdResult = if FFlagAppChatPresenceStoreMigrationModule then UseGetPresenceByUserIdFunction(p1) else UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy), RoduxPresenceModule (upval)
		return if p1 and p1 ~= "" then if p2 == nil or p2.ChatAppReducer == nil or p2.ChatAppReducer.Presence == nil or p2.ChatAppReducer.Presence.byUserId == nil then nil else RoduxPresenceModule.Selectors.getUserPresenceByUserId(p2, p1) else nil
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseLocalizationResult (copy), FFlagAppChatPresenceStoreMigrationModule (upval), PresenceType1 (upval), PresenceType (upval), UseGetPresenceByUserIdResult (ref), config3 (upval), config2 (upval), config1 (upval), config (upval), None2 (copy), UseBindingResult2 (copy)
		local OfflinePresenceText = UseLocalizationResult.offlinePresenceText
		local Offline = if FFlagAppChatPresenceStoreMigrationModule then PresenceType1.Offline else PresenceType.Offline
		
		if UseGetPresenceByUserIdResult then
			Offline = UseGetPresenceByUserIdResult.userPresenceType
			local LastLocation = UseGetPresenceByUserIdResult.lastLocation
			OfflinePresenceText = if (if FFlagAppChatPresenceStoreMigrationModule then Offline == PresenceType1.InGame else Offline == PresenceType.InGame) and LastLocation and LastLocation ~= "" then LastLocation elseif FFlagAppChatPresenceStoreMigrationModule then UseLocalizationResult[config3[Offline]] else UseLocalizationResult[config2[Offline]]
		end
		None2((if FFlagAppChatPresenceStoreMigrationModule then config1 else config)[Offline] or "None")
		UseBindingResult2(OfflinePresenceText)
	end, { UseGetPresenceByUserIdResult, UseLocalizationResult })
	
	return ReactModule.useMemo(function()
		-- upvalues: None (copy), UseBindingResult (copy)
		return { presence = None, presenceText = UseBindingResult }
	end, { None, UseBindingResult })
end
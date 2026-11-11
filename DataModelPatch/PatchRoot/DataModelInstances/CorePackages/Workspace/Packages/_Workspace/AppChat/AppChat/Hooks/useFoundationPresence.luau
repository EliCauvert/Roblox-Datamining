local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(AppChat.types)
local RoduxPresenceModule = require(AppChat.Http.RoduxPresence)
local PresenceType = RoduxPresenceModule.Enums.PresenceType
local config = {
	[PresenceType.InGame] = "Active",
	[PresenceType.Online] = "Active",
	[PresenceType.InStudio] = "Active",
	[PresenceType.Offline] = "None",
	[PresenceType.Invisible] = "None"
}
local config1 = {
	[PresenceType.InGame] = "ingameStatusLabel",
	[PresenceType.Online] = "onlinePresenceText",
	[PresenceType.InStudio] = "studioStatusLabel",
	[PresenceType.Offline] = "offlinePresenceText",
	[PresenceType.Invisible] = "offlinePresenceText"
}
local config2 = {
	offlinePresenceText = "Common.Presence.Label.Offline",
	onlinePresenceText = "Common.Presence.Label.Online",
	studioStatusLabel = "Common.Presence.Label.RobloxStudio",
	ingameStatusLabel = "Common.Presence.Label.InExperience"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config2 (copy), ReactModule (copy), UseSelectorFunction (copy), RoduxPresenceModule (copy), PresenceType (copy), config1 (copy), config (copy)
	local UseLocalizationResult = UseLocalizationFunction(config2)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UseLocalizationResult.offlinePresenceText)
	local None, None2 = ReactModule.useState("None")
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy), RoduxPresenceModule (upval)
		return if p1 and p1 ~= "" then if p2 == nil or p2.ChatAppReducer == nil or p2.ChatAppReducer.Presence == nil or p2.ChatAppReducer.Presence.byUserId == nil then nil else RoduxPresenceModule.Selectors.getUserPresenceByUserId(p2, p1) else nil
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseLocalizationResult (copy), PresenceType (upval), UseSelectorResult (copy), config1 (upval), config (upval), None2 (copy), UseBindingResult2 (copy)
		local OfflinePresenceText = UseLocalizationResult.offlinePresenceText
		local Offline = PresenceType.Offline
		
		if UseSelectorResult then
			Offline = UseSelectorResult.userPresenceType
			local LastLocation = UseSelectorResult.lastLocation
			OfflinePresenceText = if Offline == PresenceType.InGame and LastLocation and LastLocation ~= "" then LastLocation else UseLocalizationResult[config1[Offline]]
		end
		None2(config[Offline] or "None")
		UseBindingResult2(OfflinePresenceText)
	end, { UseSelectorResult, UseLocalizationResult })
	
	return ReactModule.useMemo(function()
		-- upvalues: None (copy), UseBindingResult (copy)
		return { presence = None, presenceText = UseBindingResult }
	end, { None, UseBindingResult })
end
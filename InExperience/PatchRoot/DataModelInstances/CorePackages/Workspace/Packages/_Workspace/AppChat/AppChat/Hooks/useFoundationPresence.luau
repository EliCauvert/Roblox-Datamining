local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(appChat.types)
local roduxPresenceModule = require(appChat.Http.RoduxPresence)
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local dataHydrationModule = require(parent.DataHydration)
local useGetPresenceByUserId = require(parent.FriendsCommon).Hooks.useGetPresenceByUserId
local presenceType = roduxPresenceModule.Enums.PresenceType
local var5 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceEnums.PresenceType else nil
local t = {
	[presenceType.InGame] = "Active",
	[presenceType.Online] = "Active",
	[presenceType.InStudio] = "Active",
	[presenceType.Offline] = "None",
	[presenceType.Invisible] = "None"
}
local t_1 = {
	InGame = "Active",
	Online = "Active",
	InStudio = "Active",
	Offline = "None"
}
local t_2 = {
	[presenceType.InGame] = "ingameStatusLabel",
	[presenceType.Online] = "onlinePresenceText",
	[presenceType.InStudio] = "studioStatusLabel",
	[presenceType.Offline] = "offlinePresenceText",
	[presenceType.Invisible] = "offlinePresenceText"
}
local t_3 = {
	InGame = "ingameStatusLabel",
	Online = "onlinePresenceText",
	InStudio = "studioStatusLabel",
	Offline = "offlinePresenceText"
}
local t_4 = {
	offlinePresenceText = "Common.Presence.Label.Offline",
	onlinePresenceText = "Common.Presence.Label.Online",
	studioStatusLabel = "Common.Presence.Label.RobloxStudio",
	ingameStatusLabel = "Common.Presence.Label.InExperience"
}

return function(p0)
	-- upvalues: useLocalization (ref), t_4 (ref), reactModule (ref), fFlagAppChatPresenceStoreMigrationModule (ref), useGetPresenceByUserId (ref), useSelector (ref), roduxPresenceModule (ref), var5 (ref), presenceType (ref), t_3 (ref), t_2 (ref), t_1 (ref), t (ref)
	local var11 = useLocalization(t_4)
	local var12, var13 = reactModule.useBinding(var11.offlinePresenceText)
	local none, none_1 = reactModule.useState("None")
	local var16 = if fFlagAppChatPresenceStoreMigrationModule then useGetPresenceByUserId(p0) else useSelector(function(p1)
		-- upvalues: p0 (ref), roduxPresenceModule (copy)
		return if not (not p0 or p0 == "") then if p1 == nil or p1.ChatAppReducer == nil or (p1.ChatAppReducer.Presence == nil or p1.ChatAppReducer.Presence.byUserId == nil) then nil else roduxPresenceModule.Selectors.getUserPresenceByUserId(p1, p0) else nil
	end)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), fFlagAppChatPresenceStoreMigrationModule (copy), var5 (copy), presenceType (copy), var16 (write), t_3 (copy), t_2 (copy), t_1 (copy), t (copy), none_1 (ref), var13 (ref)
		local offlinePresenceText = var11.offlinePresenceText
		local var17 = if fFlagAppChatPresenceStoreMigrationModule then var5.Offline else presenceType.Offline
		
		if var16 then
			local var18
			var17 = var16.userPresenceType
			local lastLocation = var16.lastLocation
			offlinePresenceText = if fFlagAppChatPresenceStoreMigrationModule then var11[t_3[var17]] else var11[t_2[var17]]
			
			if fFlagAppChatPresenceStoreMigrationModule then
				var18 = var17 == var5.InGame
				var18 = nil
			else
				var18 = var17 == presenceType.InGame
			end
			if var18 and lastLocation and lastLocation ~= "" then
				offlinePresenceText = lastLocation
			end
		end
		none_1((if fFlagAppChatPresenceStoreMigrationModule then t_1 else t)[var17] or "None")
		var13(offlinePresenceText)
	end, { var16, var11 })
	
	return reactModule.useMemo(function()
		-- upvalues: none (ref), var12 (ref)
		return { presence = none, presenceText = var12 }
	end, { none, var12 })
end
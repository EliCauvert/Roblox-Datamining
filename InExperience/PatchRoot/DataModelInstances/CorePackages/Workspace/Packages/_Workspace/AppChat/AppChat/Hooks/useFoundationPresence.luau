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
local var1 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceEnums.PresenceType else nil
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

return function(p1)
	-- upvalues: useLocalization (ref), t_4 (ref), reactModule (ref), fFlagAppChatPresenceStoreMigrationModule (ref), useGetPresenceByUserId (ref), useSelector (ref), roduxPresenceModule (ref), var1 (ref), presenceType (ref), t_3 (ref), t_2 (ref), t_1 (ref), t (ref)
	local var2 = useLocalization(t_4)
	local var3, var4 = reactModule.useBinding(var2.offlinePresenceText)
	local none, none_1 = reactModule.useState("None")
	local var5 = if fFlagAppChatPresenceStoreMigrationModule then useGetPresenceByUserId(p1) else useSelector(function(p2)
		-- upvalues: p1 (ref), roduxPresenceModule (copy)
		return if not (not p1 or p1 == "") then if p2 == nil or p2.ChatAppReducer == nil or (p2.ChatAppReducer.Presence == nil or p2.ChatAppReducer.Presence.byUserId == nil) then nil else roduxPresenceModule.Selectors.getUserPresenceByUserId(p2, p1) else nil
	end)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), fFlagAppChatPresenceStoreMigrationModule (copy), var1 (copy), presenceType (copy), var5 (write), t_3 (copy), t_2 (copy), t_1 (copy), t (copy), none_1 (ref), var4 (ref)
		local offlinePresenceText = var2.offlinePresenceText
		local var6 = if fFlagAppChatPresenceStoreMigrationModule then var1.Offline else presenceType.Offline
		
		if var5 then
			local var7
			var6 = var5.userPresenceType
			local lastLocation = var5.lastLocation
			offlinePresenceText = if fFlagAppChatPresenceStoreMigrationModule then var2[t_3[var6]] else var2[t_2[var6]]
			
			if fFlagAppChatPresenceStoreMigrationModule then
				var7 = var6 == var1.InGame
				var7 = nil
			else
				var7 = var6 == presenceType.InGame
			end
			if var7 and lastLocation and lastLocation ~= "" then
				offlinePresenceText = lastLocation
			end
		end
		none_1((if fFlagAppChatPresenceStoreMigrationModule then t_1 else t)[var6] or "None")
		var4(offlinePresenceText)
	end, { var5, var2 })
	
	return reactModule.useMemo(function()
		-- upvalues: none (ref), var3 (ref)
		return { presence = none, presenceText = var3 }
	end, { none, var3 })
end
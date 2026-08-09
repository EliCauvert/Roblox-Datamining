local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(appChat.types)
local roduxPresenceModule = require(appChat.Http.RoduxPresence)
local presenceType = roduxPresenceModule.Enums.PresenceType
local t = {
	[presenceType.InGame] = "Active",
	[presenceType.Online] = "Active",
	[presenceType.InStudio] = "Active",
	[presenceType.Offline] = "None",
	[presenceType.Invisible] = "None"
}
local t_1 = {
	[presenceType.InGame] = "ingameStatusLabel",
	[presenceType.Online] = "onlinePresenceText",
	[presenceType.InStudio] = "studioStatusLabel",
	[presenceType.Offline] = "offlinePresenceText",
	[presenceType.Invisible] = "offlinePresenceText"
}
local t_2 = {
	offlinePresenceText = "Common.Presence.Label.Offline",
	onlinePresenceText = "Common.Presence.Label.Online",
	studioStatusLabel = "Common.Presence.Label.RobloxStudio",
	ingameStatusLabel = "Common.Presence.Label.InExperience"
}

return function(p0) --[[ line: 43 | named "useFoundationPresence" ]]
	-- upvalues: useLocalization (ref), t_2 (ref), reactModule (ref), useSelector (ref), roduxPresenceModule (ref), presenceType (ref), t_1 (ref), t (ref)
	local var6 = useLocalization(t_2)
	local var7, var8 = reactModule.useBinding(var6.offlinePresenceText)
	local none, none_1 = reactModule.useState("None")
	local var11 = useSelector(function(p1) --[[ line: 49 ]]
		-- upvalues: p0 (ref), roduxPresenceModule (copy)
		return if not (not p0 or p0 == "") then if p1 == nil or p1.ChatAppReducer == nil or (p1.ChatAppReducer.Presence == nil or p1.ChatAppReducer.Presence.byUserId == nil) then nil else roduxPresenceModule.Selectors.getUserPresenceByUserId(p1, p0) else nil
	end)
	reactModule.useEffect(function() --[[ line: 64 ]]
		-- upvalues: var6 (ref), presenceType (copy), var11 (ref), t_1 (copy), t (copy), none_1 (ref), var8 (ref)
		local offlinePresenceText = var6.offlinePresenceText
		local offline = presenceType.Offline
		
		if var11 then
			offline = var11.userPresenceType
			local lastLocation = var11.lastLocation
			offlinePresenceText = if offline == presenceType.InGame and lastLocation and lastLocation ~= "" then lastLocation else var6[t_1[offline]]
		end
		none_1(t[offline] or "None")
		var8(offlinePresenceText)
	end, { var11, var6 })
	
	return reactModule.useMemo(function() --[[ line: 84 ]]
		-- upvalues: none (ref), var7 (ref)
		return { presence = none, presenceText = var7 }
	end, { none, var7 })
end
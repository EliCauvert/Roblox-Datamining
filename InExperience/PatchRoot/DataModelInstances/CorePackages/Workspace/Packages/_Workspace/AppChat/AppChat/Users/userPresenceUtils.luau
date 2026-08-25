local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local presenceType = require(appChat.Http.RoduxPresence).Enums.PresenceType
local circle25 = require(parent.UIBlox).App.ImageSet.Images["component_assets/circle_25"]
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local presenceType_1 = dataHydrationModule.Presence.PresenceEnums.PresenceType
local t = {
	[presenceType.Offline] = "Common.Presence.Label.Offline",
	[presenceType.Online] = "Common.Presence.Label.Online",
	[presenceType.InGame] = "",
	[presenceType.InStudio] = ""
}
local t_1 = {
	[presenceType.Offline] = "",
	[presenceType.Online] = circle25,
	[presenceType.InGame] = circle25,
	[presenceType.InStudio] = circle25
}
local t_2 = {
	Offline = "Common.Presence.Label.Offline",
	Online = "Common.Presence.Label.Online",
	InGame = "",
	InStudio = ""
}
local t_3 = {
	Offline = "",
	Online = circle25,
	InGame = circle25,
	InStudio = circle25
}

return {
	getUserDisplayPresence = if fFlagAppChatPresenceStoreMigrationModule then function(p2, p3)
		-- upvalues: t_2 (ref), presenceType_1 (ref), t_3 (ref)
		if not p2 then
			return { text = "" }
		elseif p3 then
			return {
				text = t_2[presenceType_1.Online],
				image = t_3[presenceType_1.Online]
			}
		end
		local t = {}
		local userPresenceType = p2.userPresenceType
		local lastLocation = p2.lastLocation
		t.text = if userPresenceType == presenceType_1.Offline then t_2[presenceType_1.Offline] elseif userPresenceType == presenceType_1.Online then t_2[presenceType_1.Online] elseif userPresenceType ~= presenceType_1.InGame and userPresenceType ~= presenceType_1.InStudio then if lastLocation and lastLocation ~= "" then tostring(lastLocation) else t_2[presenceType_1.Online] else ""
		t.image = t_3[p2.userPresenceType]
		
		return t
	end else function(p0, p1)
		-- upvalues: t (ref), presenceType (ref), t_1 (ref)
		local t_2
		if not p0 then
			return { text = "" }
		elseif p1 then
			t_2 = {
				text = t[presenceType.Online],
				image = t_1[presenceType.Online]
			}
			
			if not t_2 then
				t_2 = {}
				local userPresenceType = p0.userPresenceType
				local lastLocation = p0.lastLocation
				t_2.text = if userPresenceType == presenceType.Offline then t[presenceType.Offline] elseif userPresenceType == presenceType.Online then t[presenceType.Online] elseif userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio then if lastLocation then tostring(lastLocation) else t[presenceType.Online] else ""
				t_2.image = t_1[p0.userPresenceType]
			end
			return t_2
		end
	end,
	getUserPresenceText = if fFlagAppChatPresenceStoreMigrationModule then function(p5)
		-- upvalues: presenceType_1 (ref), t_2 (ref)
		local userPresenceType = p5.userPresenceType
		local lastLocation = p5.lastLocation
		
		return if userPresenceType == presenceType_1.Offline then t_2[presenceType_1.Offline] elseif userPresenceType == presenceType_1.Online then t_2[presenceType_1.Online] elseif not (userPresenceType ~= presenceType_1.InGame and userPresenceType ~= presenceType_1.InStudio) then if lastLocation and lastLocation ~= "" then tostring(lastLocation) else t_2[presenceType_1.Online] else ""
	end else function(p4)
		-- upvalues: presenceType (ref), t (ref)
		local userPresenceType = p4.userPresenceType
		local lastLocation = p4.lastLocation
		
		return if userPresenceType == presenceType.Offline then t[presenceType.Offline] elseif userPresenceType == presenceType.Online then t[presenceType.Online] elseif not (userPresenceType ~= presenceType.InGame and userPresenceType ~= presenceType.InStudio) then if lastLocation then tostring(lastLocation) else t[presenceType.Online] else ""
	end,
	userPresenceImage = t_1,
	userPresenceText = t,
	storePresenceImage = if fFlagAppChatPresenceStoreMigrationModule then t_3 else nil,
	storePresenceText = if fFlagAppChatPresenceStoreMigrationModule then t_2 else nil
}
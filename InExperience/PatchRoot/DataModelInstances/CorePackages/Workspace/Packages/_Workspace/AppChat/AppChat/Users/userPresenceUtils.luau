local appChat = script:FindFirstAncestor("AppChat")
local presenceType = require(appChat.Http.RoduxPresence).Enums.PresenceType
local circle25 = require(appChat.Parent.UIBlox).App.ImageSet.Images["component_assets/circle_25"]
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

return {
	getUserDisplayPresence = function(p0, p1) --[[ line: 41 ]]
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
	getUserPresenceText = function(p2) --[[ line: 22 ]]
		-- upvalues: presenceType (ref), t (ref)
		local userPresenceType = p2.userPresenceType
		local lastLocation = p2.lastLocation
		
		return if userPresenceType == presenceType.Offline then t[presenceType.Offline] elseif userPresenceType == presenceType.Online then t[presenceType.Online] elseif not (userPresenceType ~= presenceType.InGame and userPresenceType ~= presenceType.InStudio) then if lastLocation then tostring(lastLocation) else t[presenceType.Online] else ""
	end,
	userPresenceImage = t_1,
	userPresenceText = t
}
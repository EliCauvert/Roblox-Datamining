local AppChat = script:FindFirstAncestor("AppChat")
local PresenceType = require(AppChat.Http.RoduxPresence).Enums.PresenceType
local ComponentAssetsCircle25 = require(AppChat.Parent.UIBlox).App.ImageSet.Images["component_assets/circle_25"]
local UserPresenceText = {
	[PresenceType.Offline] = "Common.Presence.Label.Offline",
	[PresenceType.Online] = "Common.Presence.Label.Online",
	[PresenceType.InGame] = "",
	[PresenceType.InStudio] = ""
}
local UserPresenceImage = {
	[PresenceType.Offline] = "",
	[PresenceType.Online] = ComponentAssetsCircle25,
	[PresenceType.InGame] = ComponentAssetsCircle25,
	[PresenceType.InStudio] = ComponentAssetsCircle25
}

return {
	getUserDisplayPresence = function(p1, p2)
		-- upvalues: UserPresenceText (copy), PresenceType (copy), UserPresenceImage (copy)
		local config = nil
		if not p1 then
			return { text = "" }
		end
		repeat
			if p2 then
				config = {
					text = UserPresenceText[PresenceType.Online],
					image = UserPresenceImage[PresenceType.Online]
				}
				
				if config then break end
			end
			local UserPresenceType = p1.userPresenceType
			local LastLocation = p1.lastLocation
			config = {
				text = if UserPresenceType == PresenceType.Offline then UserPresenceText[PresenceType.Offline] elseif UserPresenceType == PresenceType.Online then UserPresenceText[PresenceType.Online] elseif UserPresenceType == PresenceType.InGame or UserPresenceType == PresenceType.InStudio then if LastLocation then tostring(LastLocation) else UserPresenceText[PresenceType.Online] else "",
				image = UserPresenceImage[p1.userPresenceType]
			}
		until true
		return config
	end,
	getUserPresenceText = function(p1)
		-- upvalues: PresenceType (copy), UserPresenceText (copy)
		local UserPresenceType = p1.userPresenceType
		local LastLocation = p1.lastLocation
		
		return if UserPresenceType == PresenceType.Offline then UserPresenceText[PresenceType.Offline] elseif UserPresenceType == PresenceType.Online then UserPresenceText[PresenceType.Online] elseif UserPresenceType == PresenceType.InGame or UserPresenceType == PresenceType.InStudio then if LastLocation then tostring(LastLocation) else UserPresenceText[PresenceType.Online] else ""
	end,
	userPresenceImage = UserPresenceImage,
	userPresenceText = UserPresenceText
}
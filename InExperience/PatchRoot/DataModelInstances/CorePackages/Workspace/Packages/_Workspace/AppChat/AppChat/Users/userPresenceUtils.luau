local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local PresenceType = require(AppChat.Http.RoduxPresence).Enums.PresenceType
local ComponentAssetsCircle25 = require(Parent.UIBlox).App.ImageSet.Images["component_assets/circle_25"]
local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)
local PresenceType1 = require(Parent.DataHydration).Presence.PresenceEnums.PresenceType
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
local config = {
	Offline = "Common.Presence.Label.Offline",
	Online = "Common.Presence.Label.Online",
	InGame = "",
	InStudio = ""
}
local config1 = {
	Offline = "",
	Online = ComponentAssetsCircle25,
	InGame = ComponentAssetsCircle25,
	InStudio = ComponentAssetsCircle25
}

local function v10(p1)
	-- upvalues: PresenceType (copy), UserPresenceText (copy)
	local UserPresenceType = p1.userPresenceType
	local LastLocation = p1.lastLocation
	
	return if UserPresenceType == PresenceType.Offline then UserPresenceText[PresenceType.Offline] elseif UserPresenceType == PresenceType.Online then UserPresenceText[PresenceType.Online] elseif UserPresenceType == PresenceType.InGame or UserPresenceType == PresenceType.InStudio then if LastLocation then tostring(LastLocation) else UserPresenceText[PresenceType.Online] else ""
end

local function getUserPresenceTextFromStore(p1)
	-- upvalues: PresenceType1 (copy), config (copy)
	local UserPresenceType = p1.userPresenceType
	local LastLocation = p1.lastLocation
	
	return if UserPresenceType == PresenceType1.Offline then config[PresenceType1.Offline] elseif UserPresenceType == PresenceType1.Online then config[PresenceType1.Online] elseif UserPresenceType == PresenceType1.InGame or UserPresenceType == PresenceType1.InStudio then if LastLocation and LastLocation ~= "" then tostring(LastLocation) else config[PresenceType1.Online] else ""
end

local function v12(p1, p2)
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
end

local function getUserDisplayPresenceFromStoreData(p1, p2)
	-- upvalues: config (copy), PresenceType1 (copy), config1 (copy)
	if not p1 then
		return { text = "" }
	elseif p2 then
		return {
			text = config[PresenceType1.Online],
			image = config1[PresenceType1.Online]
		}
	else
		local UserPresenceType = p1.userPresenceType
		local LastLocation = p1.lastLocation
		
		return {
			text = if UserPresenceType == PresenceType1.Offline then config[PresenceType1.Offline] elseif UserPresenceType == PresenceType1.Online then config[PresenceType1.Online] elseif UserPresenceType == PresenceType1.InGame or UserPresenceType == PresenceType1.InStudio then if LastLocation and LastLocation ~= "" then tostring(LastLocation) else config[PresenceType1.Online] else "",
			image = config1[p1.userPresenceType]
		}
	end
end

return {
	getUserDisplayPresence = if FFlagAppChatPresenceStoreMigrationModule then getUserDisplayPresenceFromStoreData else v12,
	getUserPresenceText = if FFlagAppChatPresenceStoreMigrationModule then getUserPresenceTextFromStore else v10,
	userPresenceImage = UserPresenceImage,
	userPresenceText = UserPresenceText,
	storePresenceImage = if FFlagAppChatPresenceStoreMigrationModule then config1 else nil,
	storePresenceText = if FFlagAppChatPresenceStoreMigrationModule then config else nil
}
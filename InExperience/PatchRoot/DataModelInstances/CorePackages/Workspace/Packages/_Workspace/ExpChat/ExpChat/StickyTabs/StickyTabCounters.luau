local TelemetryService = game:GetService("TelemetryService")
local FriendsChatTabNameModule = require(script:FindFirstAncestor("ExpChat").Parent.FriendsChat.FriendsChatTabName)
local config = {
	eventName = "ExpChatStickyTabStarted",
	description = "The sticky tab observer started, once per join. customFields: tab (the saved tab's category, or none), has_restorable_tab.",
	links = "",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 11, 12 }
}
local config1 = {
	eventName = "ExpChatStickyTabRestored",
	description = "The pending sticky tab was resolved. customFields: tab, outcome (switched/already_on_tab/other_tab_pinned/too_late/developer_default/tab_removed).",
	links = "",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 11, 12 }
}

local function _(Config, CustomFields)
	-- upvalues: TelemetryService (copy)
	TelemetryService:LogCounter(Config, { customFields = CustomFields }, 1)
end

return {
	getTabCategory = function(Text: string): string
		-- upvalues: FriendsChatTabNameModule (copy)
		return if Text == "RBXGeneral" then "general" elseif Text == "RBXGlobal" then "global" elseif Text == FriendsChatTabNameModule then "friends" elseif string.sub(Text, 1, 7) == "RBXTeam" then "team" elseif string.sub(Text, 1, 11) == "RBXWhisper:" then "whisper" elseif string.sub(Text, 1, 3) == "RBX" then "other" else "developer"
	end,
	reportStarted = function(Text: string, p1)
		-- upvalues: config (copy), FriendsChatTabNameModule (copy), TelemetryService (copy)
		TelemetryService:LogCounter(config, {
			customFields = {
				tab = if Text then if Text == "RBXGeneral" then "general" elseif Text == "RBXGlobal" then "global" elseif Text == FriendsChatTabNameModule then "friends" elseif string.sub(Text, 1, 7) == "RBXTeam" then "team" elseif string.sub(Text, 1, 11) == "RBXWhisper:" then "whisper" elseif string.sub(Text, 1, 3) == "RBX" then "other" else "developer" else "none",
				has_restorable_tab = tostring(p1)
			}
		}, 1)
	end,
	reportRestored = function(Text: string, Outcome)
		-- upvalues: config1 (copy), FriendsChatTabNameModule (copy), TelemetryService (copy)
		TelemetryService:LogCounter(config1, {
			customFields = {
				tab = if Text == "RBXGeneral" then "general" elseif Text == "RBXGlobal" then "global" elseif Text == FriendsChatTabNameModule then "friends" elseif string.sub(Text, 1, 7) == "RBXTeam" then "team" elseif string.sub(Text, 1, 11) == "RBXWhisper:" then "whisper" elseif string.sub(Text, 1, 3) == "RBX" then "other" else "developer",
				outcome = Outcome
			}
		}, 1)
	end
}
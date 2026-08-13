local tabTypesModule = require(script.Parent.TabTypes)
local getOtherDisplayNameInWhisperChannelModule = require(script.Parent.getOtherDisplayNameInWhisperChannel)

return {
	LocalizationKeys = {
		yourServer = "CoreScripts.TextChat.ChannelTabs.Here",
		moreServers = "CoreScripts.TextChat.ChannelTabs.Global2",
		friends = "CoreScripts.TextChat.ChannelTabs.Friends",
		system = "CoreScripts.TextChat.ChannelTabs.System",
		team = "CoreScripts.TextChat.ChannelTabs.Team"
	},
	getDisplayLabel = function(p0, p1, p2, p3, p4) --[[ line: 23 ]]
		-- upvalues: getOtherDisplayNameInWhisperChannelModule (ref), tabTypesModule (ref)
		if p0 == "TextChat" then
			if string.find(p1, "RBXGeneral") then
				return p4.yourServer
			elseif string.find(p1, "RBXSystem") then
				return p4.system
			elseif string.find(p1, "^RBXTeam") then
				return p4.team
			elseif string.find(p1, "^RBXWhisper") and p2 and p3 then
				return getOtherDisplayNameInWhisperChannelModule(p2, p3) or p1
			end
		elseif p0 == "UniverseChat" then
			return if string.find(p1, "RBXGlobal") then p4.moreServers else p1
		elseif p0 == "FriendsChat" then
			return p4.friends
		end
		tabTypesModule.unreachable(p0)
	end
}
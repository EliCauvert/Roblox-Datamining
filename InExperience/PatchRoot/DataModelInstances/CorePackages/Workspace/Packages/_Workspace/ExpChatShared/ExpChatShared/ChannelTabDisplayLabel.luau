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
	getDisplayLabel = function(p1, p2, p3, p4, p5)
		-- upvalues: getOtherDisplayNameInWhisperChannelModule (ref), tabTypesModule (ref)
		if p1 == "TextChat" then
			if string.find(p2, "RBXGeneral") then
				return p5.yourServer
			elseif string.find(p2, "RBXSystem") then
				return p5.system
			elseif string.find(p2, "^RBXTeam") then
				return p5.team
			elseif string.find(p2, "^RBXWhisper") and p3 and p4 then
				return getOtherDisplayNameInWhisperChannelModule(p3, p4) or p2
			end
		elseif p1 == "UniverseChat" then
			return if string.find(p2, "RBXGlobal") then p5.moreServers else p2
		elseif p1 == "FriendsChat" then
			return p5.friends
		end
		tabTypesModule.unreachable(p1)
	end
}
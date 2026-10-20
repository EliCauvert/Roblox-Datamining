local TabTypesModule = require(script.Parent.TabTypes)
local GetOtherDisplayNameInWhisperChannelModule = require(script.Parent.getOtherDisplayNameInWhisperChannel)

return {
	LocalizationKeys = {
		yourServer = "CoreScripts.TextChat.ChannelTabs.Here",
		moreServers = "CoreScripts.TextChat.ChannelTabs.Global2",
		friends = "CoreScripts.TextChat.ChannelTabs.Friends",
		system = "CoreScripts.TextChat.ChannelTabs.System",
		team = "CoreScripts.TextChat.ChannelTabs.Team"
	},
	getDisplayLabel = function(p1, Text: string, p2, p3, p4)
		-- upvalues: GetOtherDisplayNameInWhisperChannelModule (copy), TabTypesModule (copy)
		if p1 ~= "TextChat" then
			if p1 ~= "UniverseChat" then
				if p1 == "FriendsChat" then
					return p4.friends
				end
				TabTypesModule.unreachable(p1)
			elseif string.find(Text, "RBXGlobal") then
				return p4.moreServers
			end
		elseif string.find(Text, "RBXGeneral") then
			return p4.yourServer
		elseif string.find(Text, "RBXSystem") then
			return p4.system
		elseif string.find(Text, "^RBXTeam") then
			return p4.team
		elseif string.find(Text, "^RBXWhisper") and p2 and p3 then
			return GetOtherDisplayNameInWhisperChannelModule(p2, p3) or Text
		end
		return Text
	end
}
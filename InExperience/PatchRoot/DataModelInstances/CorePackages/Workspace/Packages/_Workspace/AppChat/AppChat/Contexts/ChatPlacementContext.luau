local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local t = {
	Unknown = "Unknown",
	ConnectTab = "ConnectTab",
	ChatTab = "ChatTab",
	InExperienceDefault = "InExperienceDefault",
	InExperienceFriendsTab = "InExperienceFriendsTab"
}
local var2 = reactModule.createContext({ chatPlacement = t.Unknown })
local consumer = var2.Consumer

return {
	Provider = var2.Provider,
	Consumer = consumer,
	Context = var2,
	Enum = t,
	useChatPlacementContext = function()
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.useContext(var2)
	end,
	withChatPlacementContext = function(p0)
		-- upvalues: reactModule (ref), consumer (ref)
		return reactModule.createElement(consumer, {
			render = function(p1)
				-- upvalues: p0 (ref)
				return p0(p1)
			end
		})
	end,
	isPlacementInExperience = function(p2)
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), t (ref)
		return if fFlagExpChatEnableFriendsTab and p2 == t.InExperienceFriendsTab then true else p2 == t.InExperienceDefault
	end
}
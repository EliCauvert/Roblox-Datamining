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
local var1 = reactModule.createContext({ chatPlacement = t.Unknown })
local consumer = var1.Consumer

return {
	Provider = var1.Provider,
	Consumer = consumer,
	Context = var1,
	Enum = t,
	useChatPlacementContext = function()
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.useContext(var1)
	end,
	withChatPlacementContext = function(p1)
		-- upvalues: reactModule (ref), consumer (ref)
		return reactModule.createElement(consumer, {
			render = function(p2)
				-- upvalues: p1 (ref)
				return p1(p2)
			end
		})
	end,
	isPlacementInExperience = function(p1)
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), t (ref)
		return if fFlagExpChatEnableFriendsTab and p1 == t.InExperienceFriendsTab then true else p1 == t.InExperienceDefault
	end
}
local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local config = {
	Unknown = "Unknown",
	ConnectTab = "ConnectTab",
	ChatTab = "ChatTab",
	InExperienceDefault = "InExperienceDefault",
	InExperienceFriendsTab = "InExperienceFriendsTab"
}
local Context = ReactModule.createContext({ chatPlacement = config.Unknown })
local Consumer = Context.Consumer

return {
	Provider = Context.Provider,
	Consumer = Consumer,
	Context = Context,
	Enum = config,
	useChatPlacementContext = function()
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end,
	withChatPlacementContext = function(Callback)
		-- upvalues: ReactModule (copy), Consumer (copy)
		return ReactModule.createElement(Consumer, {
			render = function(p1)
				-- upvalues: Callback (copy)
				return Callback(p1)
			end
		})
	end,
	isPlacementInExperience = function(InExperienceDefault): boolean
		-- upvalues: config (copy)
		return InExperienceDefault == config.InExperienceFriendsTab or InExperienceDefault == config.InExperienceDefault
	end
}
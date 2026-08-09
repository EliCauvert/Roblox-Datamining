local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local t = {
	Unknown = "Unknown",
	ConnectTab = "ConnectTab",
	ChatTab = "ChatTab",
	InExperienceDefault = "InExperienceDefault"
}
local var2 = reactModule.createContext({ chatPlacement = t.Unknown })
local consumer = var2.Consumer

return {
	Provider = var2.Provider,
	Consumer = consumer,
	Context = var2,
	Enum = t,
	useChatPlacementContext = function() --[[ line: 38 ]]
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.useContext(var2)
	end,
	withChatPlacementContext = function(p0) --[[ line: 41 ]]
		-- upvalues: reactModule (ref), consumer (ref)
		return reactModule.createElement(consumer, {
			render = function(p1) --[[ line: 43 ]]
				-- upvalues: p0 (ref)
				return p0(p1)
			end
		})
	end,
	isPlacementInExperience = function(p2) --[[ line: 48 ]]
		-- upvalues: t (ref)
		return p2 == t.InExperienceDefault
	end
}
local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.AppChatNetworking)
local buildConversationMessageFromApiModule = require(script.Parent.buildConversationMessageFromApi)

return function(p1, p2)
	-- upvalues: cryoModule (ref), buildConversationMessageFromApiModule (ref)
	return cryoModule.List.filterMap(p2, function(p3)
		-- upvalues: buildConversationMessageFromApiModule (copy), p1 (ref)
		return if p3 and p3.id then buildConversationMessageFromApiModule(p3, p1) else nil
	end)
end
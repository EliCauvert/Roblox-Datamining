local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.AppChatNetworking)
local buildConversationMessageFromApiModule = require(script.Parent.buildConversationMessageFromApi)

return function(p0, p1) --[[ line: 17 | named "buildValidMessages" ]]
	-- upvalues: cryoModule (ref), buildConversationMessageFromApiModule (ref)
	return cryoModule.List.filterMap(p1, function(p2) --[[ line: 18 ]]
		-- upvalues: buildConversationMessageFromApiModule (copy), p0 (ref)
		return if p2 and p2.id then buildConversationMessageFromApiModule(p2, p0) else nil
	end)
end
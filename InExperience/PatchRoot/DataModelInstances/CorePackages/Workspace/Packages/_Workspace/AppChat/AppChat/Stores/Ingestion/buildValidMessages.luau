local Parent = script:FindFirstAncestor("AppChat").Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.AppChatNetworking)
local BuildConversationMessageFromApiModule = require(script.Parent.buildConversationMessageFromApi)

return function(p1, p2) --[[ Line: 17 | Named "buildValidMessages" ]]
	-- upvalues: CryoModule (copy), BuildConversationMessageFromApiModule (copy)
	return CryoModule.List.filterMap(p2, function(p3) --[[ Line: 18 ]]
		-- upvalues: BuildConversationMessageFromApiModule (upval), p1 (copy)
		return if p3 and p3.id then BuildConversationMessageFromApiModule(p3, p1) else nil
	end)
end
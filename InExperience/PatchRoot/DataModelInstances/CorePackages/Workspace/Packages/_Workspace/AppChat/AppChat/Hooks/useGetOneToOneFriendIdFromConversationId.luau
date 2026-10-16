local AppChat = script:FindFirstAncestor("AppChat")
local UseLocalUserIdFunction = require(AppChat.Parent.RobloxAppHooks).useLocalUserId
local UseGetConversationFromIdModule = require(AppChat.Hooks.useGetConversationFromId)
local GetOtherParticipantsModule = require(AppChat.Conversations.getOtherParticipants)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: UseLocalUserIdFunction (copy), UseGetConversationFromIdModule (copy), GetOtherParticipantsModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(p1)
	
	if not p1 or not UseLocalUserIdResult then
		return nil
	elseif not UseGetConversationFromIdModuleResult then
		return nil
	elseif UseGetConversationFromIdModuleResult.type == "one_to_one" then
		local OtherParticipantsModule = GetOtherParticipantsModule(UseGetConversationFromIdModuleResult, UseLocalUserIdResult)
		
		return if #OtherParticipantsModule == 1 then OtherParticipantsModule[1] else nil
	else
		return nil
	end
end
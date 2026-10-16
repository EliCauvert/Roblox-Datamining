local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)
local LoggerModule = require(AppChat.Logger)

return function(p1) --[[ Line: 8 | Named "markConversationAsRead" ]]
	-- upvalues: GetDeepValueModule (copy), LoggerModule (copy), AppChatNetworkingModule (copy)
	return function(p2) --[[ Line: 9 ]]
		-- upvalues: GetDeepValueModule (upval), p1 (copy), LoggerModule (upval), AppChatNetworkingModule (upval)
		local DeepValueModule = GetDeepValueModule(p2:getState(), string.format("ChatAppReducer.Conversations.%s", p1 or ""))
		
		if DeepValueModule and DeepValueModule.hasUnreadMessages then
			LoggerModule:info("Marking conversation {} as read", p1)
			p2:dispatch(AppChatNetworkingModule.rodux.MarkConversation.API(p1)):catch(function(Err) --[[ Line: 14 ]]
				-- upvalues: LoggerModule (upval)
				LoggerModule:error(`AppChatNetworking failure in markConversationAsRead, Status: {tostring(Err)}`)
			end)
		end
	end
end
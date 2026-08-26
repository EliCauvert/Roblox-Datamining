local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local loggerModule = require(appChat.Logger)

return function(p1)
	-- upvalues: getDeepValueModule (ref), loggerModule (ref), appChatNetworkingModule (ref)
	return function(p2)
		-- upvalues: getDeepValueModule (copy), p1 (ref), loggerModule (copy), appChatNetworkingModule (copy)
		local var1 = getDeepValueModule(p2:getState(), string.format("ChatAppReducer.Conversations.%s", p1 or ""))
		
		if var1 and var1.hasUnreadMessages then
			loggerModule:info("Marking conversation {} as read", p1)
			p2:dispatch(appChatNetworkingModule.rodux.MarkConversation.API(p1)):catch(function(p3)
				-- upvalues: loggerModule (copy)
				loggerModule:error(`AppChatNetworking failure in markConversationAsRead, Status: {tostring(p3)}`)
			end)
		end
	end
end
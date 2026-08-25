local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local loggerModule = require(appChat.Logger)

return function(p0)
	-- upvalues: getDeepValueModule (ref), loggerModule (ref), appChatNetworkingModule (ref)
	return function(p1)
		-- upvalues: getDeepValueModule (copy), p0 (ref), loggerModule (copy), appChatNetworkingModule (copy)
		local var4 = getDeepValueModule(p1:getState(), string.format("ChatAppReducer.Conversations.%s", p0 or ""))
		
		if var4 and var4.hasUnreadMessages then
			loggerModule:info("Marking conversation {} as read", p0)
			p1:dispatch(appChatNetworkingModule.rodux.MarkConversation.API(p0)):catch(function(p2)
				-- upvalues: loggerModule (copy)
				loggerModule:error(`AppChatNetworking failure in markConversationAsRead, Status: {tostring(p2)}`)
			end)
		end
	end
end
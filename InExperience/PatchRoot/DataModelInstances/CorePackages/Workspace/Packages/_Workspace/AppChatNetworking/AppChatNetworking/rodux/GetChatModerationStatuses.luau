local CHAT_PLATFORM_BASE_URLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p1, p2)
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref)
	local var1 = p1(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("get-chat-moderation-statuses"):body({ ids = p2 or {} })
	
	if p2 and #p2 > 0 then
		var1 = var1:setStatusIds(p2)
	end
	return var1
end)
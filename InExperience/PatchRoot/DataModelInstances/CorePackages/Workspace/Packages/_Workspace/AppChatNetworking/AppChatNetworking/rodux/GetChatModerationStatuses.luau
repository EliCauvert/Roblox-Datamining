local CHAT_PLATFORM_BASE_URLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p0, p1) --[[ line: 8 ]]
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref)
	local var1 = p0(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("get-chat-moderation-statuses"):body({ ids = p1 or {} })
	
	if p1 and #p1 > 0 then
		var1 = var1:setStatusIds(p1)
	end
	return var1
end)
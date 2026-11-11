local CHATPLATFORMBASEURLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return (require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback, p1)
	-- upvalues: CHATPLATFORMBASEURLModule (copy)
	local BodyResult = Callback(CHATPLATFORMBASEURLModule):path("v1"):path("get-chat-moderation-statuses"):body({ ids = p1 or {} })
	
	if p1 and #p1 > 0 then
		BodyResult = BodyResult:setStatusIds(p1)
	end
	return BodyResult
end))
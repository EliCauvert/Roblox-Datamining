local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local LuauPolyfillModule = require(AppChatNetworking.Parent.LuauPolyfill)
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback, Source_conversation_id, p1)
	-- upvalues: LuauPolyfillModule (copy), CHATPLATFORMBASEURLModule (copy)
	return Callback(CHATPLATFORMBASEURLModule):path("v1"):path("expand-to-group-conversation"):body({
		source_conversation_id = Source_conversation_id,
		participant_user_ids = LuauPolyfillModule.Array.map(p1, function(p2): number
			return (tonumber(p2))
		end)
	}):setStatusIds({ Source_conversation_id })
end)
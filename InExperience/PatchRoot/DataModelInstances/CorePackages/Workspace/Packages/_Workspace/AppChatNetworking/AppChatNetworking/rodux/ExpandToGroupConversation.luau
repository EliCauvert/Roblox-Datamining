local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local luauPolyfillModule = require(appChatNetworking.Parent.LuauPolyfill)
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p1, p2, p3)
	-- upvalues: luauPolyfillModule (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	return p1(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("expand-to-group-conversation"):body({
		source_conversation_id = p2,
		participant_user_ids = luauPolyfillModule.Array.map(p3, function(p4)
			return tonumber(p4)
		end)
	}):setStatusIds({ p2 })
end)
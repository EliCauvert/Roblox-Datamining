local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local luauPolyfillModule = require(appChatNetworking.Parent.LuauPolyfill)
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p0, p1, p2)
	-- upvalues: luauPolyfillModule (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	return p0(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("add-users"):body({
		conversation_id = p1,
		user_ids = luauPolyfillModule.Array.map(p2, function(p3)
			return tonumber(p3)
		end)
	})
end)
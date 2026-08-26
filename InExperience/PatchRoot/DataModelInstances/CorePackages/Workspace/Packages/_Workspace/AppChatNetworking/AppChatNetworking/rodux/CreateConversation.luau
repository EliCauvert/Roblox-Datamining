local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local luauPolyfillModule = require(appChatNetworking.Parent.LuauPolyfill)
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local _ = require(appChatNetworking.responses.SharedTypes)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p1, p2, p3, p4)
	-- upvalues: luauPolyfillModule (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	return p1(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("create-conversations"):body({
		conversations = {
			{
				type = p2,
				name = p4,
				participant_user_ids = luauPolyfillModule.Array.map(p3, function(p5)
					return tonumber(p5)
				end)
			}
		}
	}):setStatusIds(p3)
end)
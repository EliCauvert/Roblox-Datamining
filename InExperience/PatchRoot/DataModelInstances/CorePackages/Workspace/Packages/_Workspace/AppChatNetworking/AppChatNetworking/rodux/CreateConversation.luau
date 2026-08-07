local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local luauPolyfillModule = require(appChatNetworking.Parent.LuauPolyfill)
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local _ = require(appChatNetworking.responses.SharedTypes)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p0, p1, p2, p3) --[[ line: 15 ]]
	-- upvalues: luauPolyfillModule (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	return p0(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("create-conversations"):body({
		conversations = {
			{
				type = p1,
				name = p3,
				participant_user_ids = luauPolyfillModule.Array.map(p2, function(p4) --[[ line: 21 ]]
					return tonumber(p4)
				end)
			}
		}
	}):setStatusIds(p2)
end)
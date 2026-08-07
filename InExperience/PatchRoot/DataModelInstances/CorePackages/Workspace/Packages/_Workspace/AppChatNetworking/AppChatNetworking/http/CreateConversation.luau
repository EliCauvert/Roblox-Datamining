local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local luauPolyfillModule = require(appChatNetworking.Parent.LuauPolyfill)
local default = require(appChatNetworking.url.HttpRequest).default
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)

return function(p0, p1, p2, p3) --[[ line: 11 ]]
	-- upvalues: default (ref), luauPolyfillModule (ref), httpService (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	return (p0 or default)(`{CHAT_PLATFORM_BASE_URLModule}/v1/create-conversations`, "POST", {
		postBody = httpService:JSONEncode({
			conversations = {
				{
					type = p1,
					name = p3,
					participant_user_ids = luauPolyfillModule.Array.map(p2, function(p4) --[[ line: 18 ]]
						return tonumber(p4)
					end)
				}
			}
		})
	})
end
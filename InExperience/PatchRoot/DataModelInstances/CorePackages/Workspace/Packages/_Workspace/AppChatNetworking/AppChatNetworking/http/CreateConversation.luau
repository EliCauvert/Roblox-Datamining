local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local luauPolyfillModule = require(appChatNetworking.Parent.LuauPolyfill)
local default = require(appChatNetworking.url.HttpRequest).default
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)

return function(p1, p2, p3, p4)
	-- upvalues: default (ref), luauPolyfillModule (ref), httpService (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	return (p1 or default)(`{CHAT_PLATFORM_BASE_URLModule}/v1/create-conversations`, "POST", {
		postBody = httpService:JSONEncode({
			conversations = {
				{
					type = p2,
					name = p4,
					participant_user_ids = luauPolyfillModule.Array.map(p3, function(p5)
						return tonumber(p5)
					end)
				}
			}
		})
	})
end
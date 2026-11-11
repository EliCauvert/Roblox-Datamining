local HttpService = game:GetService("HttpService")
local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local LuauPolyfillModule = require(AppChatNetworking.Parent.LuauPolyfill)
local Default = require(AppChatNetworking.url.HttpRequest).default
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)

return function(p1, p2, p3, Name)
	-- upvalues: Default (copy), LuauPolyfillModule (copy), HttpService (copy), CHATPLATFORMBASEURLModule (copy)
	return (p1 or Default)(`{CHATPLATFORMBASEURLModule}/v1/create-conversations`, "POST", {
		postBody = HttpService:JSONEncode({
			conversations = {
				{
					type = p2,
					name = Name,
					participant_user_ids = LuauPolyfillModule.Array.map(p3, function(p4): number
						return (tonumber(p4))
					end)
				}
			}
		})
	})
end
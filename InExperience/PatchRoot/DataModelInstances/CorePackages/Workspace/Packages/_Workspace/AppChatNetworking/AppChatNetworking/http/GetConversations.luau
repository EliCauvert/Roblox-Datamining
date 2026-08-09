local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local parent = appChatNetworking.Parent
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local default = require(appChatNetworking.url.HttpRequest).default
local object = require(parent.LuauPolyfill).Object
local t = {
	include_participants = true,
	include_user_data = true,
	include_messages = true
}

return function(p0, p1, p2) --[[ line: 24 ]]
	-- upvalues: default (ref), object (ref), t (ref), httpService (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	local var4 = object.assign({}, t, p2 or {})
	
	return (p0 or default)(`{CHAT_PLATFORM_BASE_URLModule}/v1/get-conversations`, "POST", {
		postBody = httpService:JSONEncode({
			ids = { p1 },
			include_participants = var4.include_participants,
			include_user_data = var4.include_user_data,
			include_messages = var4.include_messages
		})
	})
end
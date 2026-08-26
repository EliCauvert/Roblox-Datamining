local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local parent = appChatNetworking.Parent
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local default = require(appChatNetworking.url.HttpRequest).default
local object = require(parent.LuauPolyfill).Object
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards
local t = {
	include_participants = true,
	include_user_data = true,
	include_messages = true
}

return function(p1, p2, p3)
	-- upvalues: default (ref), object (ref), t (ref), httpService (ref), getFFlagEnableSocialCards (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	local var1 = object.assign({}, t, p3 or {})
	
	return (p1 or default)(`{CHAT_PLATFORM_BASE_URLModule}/v1/get-conversations`, "POST", {
		postBody = httpService:JSONEncode({
			ids = { p2 },
			include_participants = var1.include_participants,
			include_user_data = var1.include_user_data,
			include_messages = var1.include_messages,
			include_cards = if getFFlagEnableSocialCards() then true else false
		})
	})
end
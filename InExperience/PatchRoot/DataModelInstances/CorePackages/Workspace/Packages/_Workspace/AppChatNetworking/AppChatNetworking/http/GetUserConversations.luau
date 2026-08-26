local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local parent = appChatNetworking.Parent
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local default = require(appChatNetworking.url.HttpRequest).default
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards

local function appendQueryArgs(p1, p2)
	-- upvalues: httpService (ref)
	local t = {}
	
	for i, v in p2 do
		if v ~= nil then
			table.insert(t, `{httpService:UrlEncode(i)}={httpService:UrlEncode(tostring(v))}`)
		end
	end
	return if #t == 0 then p1 else `{p1}?{table.concat(t, "&")}`
end

return function(p3, p4)
	-- upvalues: default (ref), getFFlagEnableSocialCards (ref), getFFlagIsSquadEnabled (ref), appendQueryArgs (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	return (p3 or default)(appendQueryArgs(`{CHAT_PLATFORM_BASE_URLModule}/v1/get-user-conversations`, {
		include_user_data = true,
		cursor = if p4 == nil or p4 == "" then nil else p4,
		include_cards = if getFFlagEnableSocialCards() then true else false,
		check_for_group_up = if getFFlagIsSquadEnabled() then true else false
	}), "GET")
end
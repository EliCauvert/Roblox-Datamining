local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local parent = appChatNetworking.Parent
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local default = require(appChatNetworking.url.HttpRequest).default
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards

local function appendQueryArgs(p0, p1) --[[ line: 11 ]]
	-- upvalues: httpService (ref)
	local t = {}
	
	for i, v in p1 do
		if v ~= nil then
			table.insert(t, `{httpService:UrlEncode(i)}={httpService:UrlEncode(tostring(v))}`)
		end
	end
	return if #t == 0 then p0 else `{p0}?{table.concat(t, "&")}`
end

return function(p2, p3) --[[ line: 26 ]]
	-- upvalues: default (ref), getFFlagEnableSocialCards (ref), getFFlagIsSquadEnabled (ref), appendQueryArgs (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	return (p2 or default)(appendQueryArgs(`{CHAT_PLATFORM_BASE_URLModule}/v1/get-user-conversations`, {
		include_user_data = true,
		cursor = if p3 == nil or p3 == "" then nil else p3,
		include_cards = if getFFlagEnableSocialCards() then true else false,
		check_for_group_up = if getFFlagIsSquadEnabled() then true else false
	}), "GET")
end
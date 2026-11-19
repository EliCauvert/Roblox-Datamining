local HttpService = game:GetService("HttpService")
local Url = require(script:FindFirstAncestor("VrCommon").Parent.Http).Url

local function _(Text: string): boolean
	return string.sub(Text, 1, 1) == "/" and string.find(string.sub(Text, 2, 2), "[/\\]") == nil and string.find(Text, "[%s%c]") == nil
end

return function(Text: string, Input, p1): string
	-- upvalues: HttpService (copy), Url (copy)
	if string.sub(Text, 1, 1) ~= "/" or (string.find(string.sub(Text, 2, 2), "[/\\]") ~= nil or string.find(Text, "[%s%c]") ~= nil) then
		error("buildLoginRedirectUrl: returnPath must be a same-site relative path", 2)
	end
	return `{Url.WWW_URL}login-redirect/v2?{table.concat({
		`at={HttpService:UrlEncode(Input)}`,
		`returnUrl={HttpService:UrlEncode(Text)}`,
		`tuid={HttpService:UrlEncode((tostring(p1)))}`
	}, "&")}`
end
local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local HttpService = game:GetService("HttpService")
local LocalizationService = game:GetService("LocalizationService")
local ArgCheckModule = require(Parent.ArgCheck)
local Url = require(Parent.Http).Url
local _ = require(GenericAbuseReporting.Enums.AbuseVector)

return function(Callback, Input, Input1)
	-- upvalues: ArgCheckModule (copy), LocalizationService (copy), HttpService (copy), Url (copy)
	ArgCheckModule.assert(Input, "abuseVector is required")
	ArgCheckModule.isType(Input, "string", "fetchConfigWithAttributes expects abuseVector as a string")
	
	return Callback(`{Url.APIS_URL}abuse-reporting/v1/dynamic-config?abuseVector={HttpService:UrlEncode(Input)}&locale={HttpService:UrlEncode(LocalizationService.RobloxLocaleId)}&entryPoint=ua{if Input1 and next(Input1) ~= nil then `&attributes={HttpService:UrlEncode((HttpService:JSONEncode(Input1)))}` else ""}&version=2`, "GET")
end
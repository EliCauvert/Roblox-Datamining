local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local httpService = game:GetService("HttpService")
local localizationService = game:GetService("LocalizationService")
local argCheckModule = require(parent.ArgCheck)
local url = require(parent.Http).Url
local _ = require(genericAbuseReporting.Enums.AbuseVector)
local var4 = if require(parent.SharedFlags).FFlagAbuseReportSubmissionTargetV4 then "&version=4" elseif require(parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3 then "&version=3" else "&version=2"

return function(p0, p1, p2) --[[ line: 23 ]]
	-- upvalues: argCheckModule (ref), localizationService (ref), httpService (ref), url (ref), var4 (ref)
	argCheckModule.assert(p1, "abuseVector is required")
	argCheckModule.isType(p1, "string", "fetchConfigWithAttributes expects abuseVector as a string")
	
	return p0(`{url.APIS_URL}abuse-reporting/v1/dynamic-config?abuseVector={httpService:UrlEncode(p1)}&locale={httpService:UrlEncode(localizationService.RobloxLocaleId)}&entryPoint=ua{if p2 and next(p2) ~= nil then `&attributes={httpService:UrlEncode(httpService:JSONEncode(p2))}` else ""}{var4}`, "GET")
end
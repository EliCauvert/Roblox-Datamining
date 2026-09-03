local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local httpService = game:GetService("HttpService")
local localizationService = game:GetService("LocalizationService")
local argCheckModule = require(parent.ArgCheck)
local url = require(parent.Http).Url
local _ = require(genericAbuseReporting.Enums.AbuseVector)
local fFlagAbuseReportSubmissionTargetV4 = require(parent.SharedFlags).FFlagAbuseReportSubmissionTargetV4
local var1 = if game:DefineFastFlag("AbuseReportSubmissionLegacyChatV5", false) and fFlagAbuseReportSubmissionTargetV4 then "&version=5" elseif fFlagAbuseReportSubmissionTargetV4 then "&version=4" elseif require(parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3 then "&version=3" else "&version=2"

return function(p1, p2, p3)
	-- upvalues: argCheckModule (ref), localizationService (ref), httpService (ref), url (ref), var1 (ref)
	argCheckModule.assert(p2, "abuseVector is required")
	argCheckModule.isType(p2, "string", "fetchConfigWithAttributes expects abuseVector as a string")
	
	return p1(`{url.APIS_URL}abuse-reporting/v1/dynamic-config?abuseVector={httpService:UrlEncode(p2)}&locale={httpService:UrlEncode(localizationService.RobloxLocaleId)}&entryPoint=ua{if p3 and next(p3) ~= nil then `&attributes={httpService:UrlEncode(httpService:JSONEncode(p3))}` else ""}{var1}`, "GET")
end
local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local HttpService = game:GetService("HttpService")
local LocalizationService = game:GetService("LocalizationService")
local ArgCheckModule = require(Parent.ArgCheck)
local Url = require(Parent.Http).Url
local _ = require(GenericAbuseReporting.Enums.AbuseVector)
local FFlagAbuseReportInExpPlayerListV3 = require(Parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3
local FFlagAbuseReportSubmissionTargetV4 = require(Parent.SharedFlags).FFlagAbuseReportSubmissionTargetV4
local Version: string = if game:DefineFastFlag("AbuseReportSubmissionLegacyChatV5", false) and FFlagAbuseReportSubmissionTargetV4 then "&version=5" elseif FFlagAbuseReportSubmissionTargetV4 then "&version=4" elseif FFlagAbuseReportInExpPlayerListV3 then "&version=3" else "&version=2"

return function(Callback, Input, Input1) --[[ Line: 26 ]]
	-- upvalues: ArgCheckModule (copy), LocalizationService (copy), HttpService (copy), Url (copy), Version (copy)
	ArgCheckModule.assert(Input, "abuseVector is required")
	ArgCheckModule.isType(Input, "string", "fetchConfigWithAttributes expects abuseVector as a string")
	
	return Callback(`{Url.APIS_URL}abuse-reporting/v1/dynamic-config?abuseVector={HttpService:UrlEncode(Input)}&locale={HttpService:UrlEncode(LocalizationService.RobloxLocaleId)}&entryPoint=ua{if Input1 and next(Input1) ~= nil then `&attributes={HttpService:UrlEncode((HttpService:JSONEncode(Input1)))}` else ""}{Version}`, "GET")
end
local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local localizationService = game:GetService("LocalizationService")
local argCheckModule = require(parent.ArgCheck)
local url = require(parent.Http).Url
local _ = require(genericAbuseReporting.Enums.AbuseVector)

return function(p0, p1, p2) --[[ line: 15 ]]
	-- upvalues: argCheckModule (ref), localizationService (ref), url (ref)
	argCheckModule.assert(p1, "abuseVector is required")
	argCheckModule.isType(p1, "string", "fetchBeduiData expects abuseVector as a string")
	
	return p0(`{url.APIS_URL}abuse-reporting/v1/dynamic-config?abuseVector={p1}&locale={localizationService.RobloxLocaleId}&entryPoint=ua&targetId={p2}&version=2`, "GET")
end
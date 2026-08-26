local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local localizationService = game:GetService("LocalizationService")
local argCheckModule = require(parent.ArgCheck)
local url = require(parent.Http).Url
local _ = require(genericAbuseReporting.Enums.AbuseVector)

return function(p1, p2)
	-- upvalues: argCheckModule (ref), localizationService (ref), url (ref)
	argCheckModule.assert(p2, "abuseVector is required")
	argCheckModule.isType(p2, "string", "fetchBeduiData expects abuseVector as a string")
	
	return p1(`{url.APIS_URL}abuse-reporting/v1/dynamic-dialog-sequential?context={p2}&locale={localizationService.RobloxLocaleId}&surface=ua&version=v1`, "GET")
end
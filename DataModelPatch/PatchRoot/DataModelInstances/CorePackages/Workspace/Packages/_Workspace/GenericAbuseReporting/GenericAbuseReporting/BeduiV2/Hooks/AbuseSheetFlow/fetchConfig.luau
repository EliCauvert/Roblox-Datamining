local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local LocalizationService = game:GetService("LocalizationService")
local ArgCheckModule = require(Parent.ArgCheck)
local Url = require(Parent.Http).Url
local _ = require(GenericAbuseReporting.Enums.AbuseVector)

return function(Callback, p1, p2)
	-- upvalues: ArgCheckModule (copy), LocalizationService (copy), Url (copy)
	ArgCheckModule.assert(p1, "abuseVector is required")
	ArgCheckModule.isType(p1, "string", "fetchBeduiData expects abuseVector as a string")
	
	return Callback(`{Url.APIS_URL}abuse-reporting/v1/dynamic-config?abuseVector={p1}&locale={LocalizationService.RobloxLocaleId}&entryPoint=ua&targetId={p2}&version=2`, "GET")
end
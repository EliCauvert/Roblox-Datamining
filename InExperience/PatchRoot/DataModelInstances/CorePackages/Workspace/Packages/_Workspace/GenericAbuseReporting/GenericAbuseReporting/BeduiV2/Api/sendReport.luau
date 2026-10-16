local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local FFlagAbuseReportImproveErrorEventsModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)

return function(Callback, Text, Input) --[[ Line: 13 ]]
	-- upvalues: HttpService (copy), FFlagAbuseReportImproveErrorEventsModule (copy), PromiseModule (copy), Url (copy)
	local Success, Result = pcall(function() --[[ Line: 14 ]]
		-- upvalues: HttpService (upval), Input (copy)
		return HttpService:JSONEncode(Input)
	end)
	
	if not Success then
		warn("Failed to encode v1 report body")
		
		if FFlagAbuseReportImproveErrorEventsModule then
			return PromiseModule.reject("Failed to encode v1 report body")
		end
	end
	return Callback(Url.APIS_URL .. Text, "POST", { postBody = Result })
end
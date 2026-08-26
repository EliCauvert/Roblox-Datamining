local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local fFlagAbuseReportImproveErrorEventsModule = require(genericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)

return function(p1, p2, p3)
	-- upvalues: httpService (ref), fFlagAbuseReportImproveErrorEventsModule (ref), promiseModule (ref), url (ref)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p3 (ref)
		return httpService:JSONEncode(p3)
	end)
	
	if not ok then
		warn("Failed to encode v1 report body")
		
		return if fFlagAbuseReportImproveErrorEventsModule then promiseModule.reject("Failed to encode v1 report body") else p1(url.APIS_URL .. p1, "POST", { postBody = status })
	end
end
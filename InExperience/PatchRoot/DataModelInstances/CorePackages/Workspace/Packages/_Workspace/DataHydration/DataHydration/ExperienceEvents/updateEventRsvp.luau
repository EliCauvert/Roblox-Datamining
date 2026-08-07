local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local httpRequestModule = require(parent.HttpRequest)
local promiseModule = require(parent.Promise)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local experienceEventsUrlBuilderModule = require(script.Parent.ExperienceEventsUrlBuilder)

return function(p0, p1) --[[ line: 13 | named "updateEventRsvp" ]]
	-- upvalues: getLocalPlayerUserId (ref), promiseModule (ref), experienceEventsUrlBuilderModule (ref), httpRequestModule (ref), httpService (ref)
	local var5 = getLocalPlayerUserId()
	
	return if var5 and var5 > 0 then httpRequestModule.config({
		requestFunction = function(p2, p3, p4) --[[ line: 25 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p2, p3, p4)
		end
	})(experienceEventsUrlBuilderModule.buildRsvpUpdateUrl(tostring(p0)), "POST", { postBody = httpService:JSONEncode({ rsvpStatus = p1 }) }) else promiseModule.reject({
		ClientError = "Missing or invalid local player ID",
		message = "Cannot RSVP to event: missing or invalid local player ID"
	})
end
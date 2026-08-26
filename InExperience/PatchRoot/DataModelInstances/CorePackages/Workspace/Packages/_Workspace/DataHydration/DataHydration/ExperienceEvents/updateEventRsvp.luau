local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local httpRequestModule = require(parent.HttpRequest)
local promiseModule = require(parent.Promise)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local experienceEventsUrlBuilderModule = require(script.Parent.ExperienceEventsUrlBuilder)

return function(p1, p2)
	-- upvalues: getLocalPlayerUserId (ref), promiseModule (ref), experienceEventsUrlBuilderModule (ref), httpRequestModule (ref), httpService (ref)
	local var1 = getLocalPlayerUserId()
	
	return if var1 and var1 > 0 then httpRequestModule.config({
		requestFunction = function(p3, p4, p5)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p3, p4, p5)
		end
	})(experienceEventsUrlBuilderModule.buildRsvpUpdateUrl(tostring(p1)), "POST", { postBody = httpService:JSONEncode({ rsvpStatus = p2 }) }) else promiseModule.reject({
		ClientError = "Missing or invalid local player ID",
		message = "Cannot RSVP to event: missing or invalid local player ID"
	})
end
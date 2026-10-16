local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpService = game:GetService("HttpService")
local HttpRequestModule = require(Parent.HttpRequest)
local PromiseModule = require(Parent.Promise)
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local ExperienceEventsUrlBuilderModule = require(script.Parent.ExperienceEventsUrlBuilder)

return function(p1, RsvpStatus) --[[ Line: 13 | Named "updateEventRsvp" ]]
	-- upvalues: GetLocalPlayerUserIdFunction (copy), PromiseModule (copy), ExperienceEventsUrlBuilderModule (copy), HttpRequestModule (copy), HttpService (copy)
	local LocalPlayerUserId: number = GetLocalPlayerUserIdFunction()
	
	return if LocalPlayerUserId and LocalPlayerUserId > 0 then HttpRequestModule.config({
		requestFunction = function(p2, p3, p4) --[[ Line: 25 ]]
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.RequestInternal(p2, p3, p4)
		end
	})(ExperienceEventsUrlBuilderModule.buildRsvpUpdateUrl((tostring(p1))), "POST", {
		postBody = HttpService:JSONEncode({ rsvpStatus = RsvpStatus })
	}) else PromiseModule.reject({
		ClientError = "Missing or invalid local player ID",
		message = "Cannot RSVP to event: missing or invalid local player ID"
	})
end
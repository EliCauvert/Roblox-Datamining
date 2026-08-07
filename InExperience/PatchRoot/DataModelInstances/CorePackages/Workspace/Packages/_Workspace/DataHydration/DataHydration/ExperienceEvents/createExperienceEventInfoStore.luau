local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local experienceEventTypesModule = require(script.Parent.ExperienceEventTypes)
local experienceEventDerivedFieldsModule = require(script.Parent.ExperienceEventDerivedFields)
local experienceEventsUrlBuilderModule = require(script.Parent.ExperienceEventsUrlBuilder)
local createDataResolverModule = require(dataHydration.createDataResolver)
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local logResponseError = discoveryUtilsModule.logResponseError
local updateEventRsvpModule = require(script.Parent.updateEventRsvp)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagSduiEventDetailsSupport = sharedFlagsModule.FFlagSduiEventDetailsSupport

return function() --[[ line: 30 | named "createExperienceEventInfoStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), experienceEventDerivedFieldsModule (ref), experienceEventTypesModule (ref), updateEventRsvpModule (ref), logResponseError (ref), experienceEventsUrlBuilderModule (ref), discoveryEventErrorLogger (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref)
	local var10 = createDataCacheModule()
	local var11 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var10,
		fetchFn = function(_) --[[ line: 35 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	
	return {
		getExperienceEventInfo = var11.getCachedItem,
		getExperienceEventInfos = var11.getCachedItems,
		updateExperienceEventInfo = var10.updateItem,
		updateExperienceEventInfos = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then function(p0) --[[ line: 44 | named "updateExperienceEventInfos" ]]
			-- upvalues: experienceEventDerivedFieldsModule (copy), var10 (ref)
			for i, v in p0 do
				p0[i] = experienceEventDerivedFieldsModule.enrichWithTimestamps(v)
			end
			var10.updateItems(p0)
		end else var10.updateItems,
		calculateDerivedField = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then experienceEventDerivedFieldsModule.calculateDerivedField else nil,
		patchRsvpStatus = function(p1, p2) --[[ line: 51 ]]
			-- upvalues: var11 (ref), experienceEventTypesModule (copy), updateEventRsvpModule (copy), var10 (ref), logResponseError (copy), experienceEventsUrlBuilderModule (copy), discoveryEventErrorLogger (copy), fFlagSduiExperienceDetailsSupport (copy), fFlagSduiEventDetailsSupport (copy)
			local var12 = var11.getCachedItem(p1).data()
			
			return if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then updateEventRsvpModule(p1, if p2 then experienceEventTypesModule.EventRsvpTypes.Going else experienceEventTypesModule.EventRsvpTypes.NotGoing):andThen(function(p4) --[[ line: 60 ]]
				-- upvalues: var12 (ref), p2 (ref), var10 (copy), p1 (ref)
				if var12 then
					var10.updateItem(p1, {
						id = var12.id,
						title = var12.title,
						subtitle = var12.subtitle,
						eventStart = var12.eventStart,
						eventEnd = var12.eventEnd,
						userRsvp = p2,
						mediaAssetId = var12.mediaAssetId,
						description = var12.description,
						rsvpCount = (var12.rsvpCount or 0) + (if p2 then 1 else -1)
					})
				end
				return p4 and p4.responseBody
			end):catch(function(p3) --[[ line: 78 ]]
				-- upvalues: var12 (ref), var10 (copy), p1 (ref), logResponseError (copy), experienceEventsUrlBuilderModule (copy), discoveryEventErrorLogger (copy), p2 (ref)
				if var12 then
					var10.updateItem(p1, var12)
				end
				local var13 = if type(p3) == "table" and p3.StatusCode then p3.StatusCode else nil
				local var14 = if type(p3) == "table" and p3.StatusMessage then p3.StatusMessage elseif type(p3) == "string" then p3 else nil
				logResponseError(experienceEventsUrlBuilderModule.RSVP_UPDATE_URL, { StatusCode = var13 })
				discoveryEventErrorLogger.reportError("patchRsvpStatus", "Error updating event RSVP", {
					eventId = p1,
					isRsvpGoing = p2,
					statusCode = var13,
					statusMessage = var14
				})
			end) else nil
		end,
		clear = var11.clear,
		dispose = var11.dispose
	}
end
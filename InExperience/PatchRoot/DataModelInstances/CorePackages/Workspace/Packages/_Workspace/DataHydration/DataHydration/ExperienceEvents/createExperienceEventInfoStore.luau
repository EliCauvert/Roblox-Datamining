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

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), experienceEventDerivedFieldsModule (ref), experienceEventTypesModule (ref), updateEventRsvpModule (ref), logResponseError (ref), experienceEventsUrlBuilderModule (ref), discoveryEventErrorLogger (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var1,
		fetchFn = function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	
	return {
		getExperienceEventInfo = var2.getCachedItem,
		getExperienceEventInfos = var2.getCachedItems,
		updateExperienceEventInfo = var1.updateItem,
		updateExperienceEventInfos = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then function(p1)
			-- upvalues: experienceEventDerivedFieldsModule (copy), var1 (ref)
			for i, v in p1 do
				p1[i] = experienceEventDerivedFieldsModule.enrichWithTimestamps(v)
			end
			var1.updateItems(p1)
		end else var1.updateItems,
		calculateDerivedField = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then experienceEventDerivedFieldsModule.calculateDerivedField else nil,
		patchRsvpStatus = function(p2, p3)
			-- upvalues: var2 (ref), experienceEventTypesModule (copy), updateEventRsvpModule (copy), var1 (ref), logResponseError (copy), experienceEventsUrlBuilderModule (copy), discoveryEventErrorLogger (copy), fFlagSduiExperienceDetailsSupport (copy), fFlagSduiEventDetailsSupport (copy)
			local var3 = var2.getCachedItem(p2).data()
			
			return if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then updateEventRsvpModule(p2, if p3 then experienceEventTypesModule.EventRsvpTypes.Going else experienceEventTypesModule.EventRsvpTypes.NotGoing):andThen(function(p4)
				-- upvalues: var3 (ref), p3 (ref), var1 (copy), p2 (ref)
				if var3 then
					var1.updateItem(p2, {
						id = var3.id,
						title = var3.title,
						subtitle = var3.subtitle,
						eventStart = var3.eventStart,
						eventEnd = var3.eventEnd,
						userRsvp = p3,
						mediaAssetId = var3.mediaAssetId,
						description = var3.description,
						rsvpCount = (var3.rsvpCount or 0) + (if p3 then 1 else -1)
					})
				end
				return p4 and p4.responseBody
			end):catch(function(p4)
				-- upvalues: var3 (ref), var1 (copy), p2 (ref), logResponseError (copy), experienceEventsUrlBuilderModule (copy), discoveryEventErrorLogger (copy), p3 (ref)
				if var3 then
					var1.updateItem(p2, var3)
				end
				local var4 = if type(p4) == "table" and p4.StatusCode then p4.StatusCode else nil
				local var5 = if type(p4) == "table" and p4.StatusMessage then p4.StatusMessage elseif type(p4) == "string" then p4 else nil
				logResponseError(experienceEventsUrlBuilderModule.RSVP_UPDATE_URL, { StatusCode = var4 })
				discoveryEventErrorLogger.reportError("patchRsvpStatus", "Error updating event RSVP", {
					eventId = p2,
					isRsvpGoing = p3,
					statusCode = var4,
					statusMessage = var5
				})
			end) else nil
		end,
		clear = var2.clear,
		dispose = var2.dispose
	}
end
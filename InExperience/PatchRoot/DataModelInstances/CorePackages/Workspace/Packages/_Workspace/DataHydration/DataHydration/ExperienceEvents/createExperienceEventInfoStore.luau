local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local ExperienceEventTypesModule = require(script.Parent.ExperienceEventTypes)
local ExperienceEventDerivedFieldsModule = require(script.Parent.ExperienceEventDerivedFields)
local ExperienceEventsUrlBuilderModule = require(script.Parent.ExperienceEventsUrlBuilder)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local UpdateEventRsvpModule = require(script.Parent.updateEventRsvp)

return function() --[[ Line: 26 | Named "createExperienceEventInfoStore" ]]
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy), ExperienceEventDerivedFieldsModule (copy), ExperienceEventTypesModule (copy), UpdateEventRsvpModule (copy), LogResponseErrorFunction (copy), ExperienceEventsUrlBuilderModule (copy), DiscoveryEventErrorLogger (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule,
		fetchFn = function(_) --[[ Line: 31 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end
	})
	
	return {
		getExperienceEventInfo = DataResolverModule.getCachedItem,
		getExperienceEventInfos = DataResolverModule.getCachedItems,
		updateExperienceEventInfo = DataCacheModule.updateItem,
		updateExperienceEventInfos = function(EnrichWithTimestampsResults) --[[ Line: 40 ]]
			-- upvalues: ExperienceEventDerivedFieldsModule (upval), DataCacheModule (copy)
			for i, enrichWithTimestampsResult in EnrichWithTimestampsResults do
				EnrichWithTimestampsResults[i] = ExperienceEventDerivedFieldsModule.enrichWithTimestamps(enrichWithTimestampsResult)
			end
			DataCacheModule.updateItems(EnrichWithTimestampsResults)
		end,
		calculateDerivedField = ExperienceEventDerivedFieldsModule.calculateDerivedField,
		patchRsvpStatus = function(EventId, IsRsvpGoing) --[[ Line: 47 ]]
			-- upvalues: DataResolverModule (copy), ExperienceEventTypesModule (upval), UpdateEventRsvpModule (upval), DataCacheModule (copy), LogResponseErrorFunction (upval), ExperienceEventsUrlBuilderModule (upval), DiscoveryEventErrorLogger (upval)
			local DataResult = DataResolverModule.getCachedItem(EventId).data()
			
			return (UpdateEventRsvpModule(EventId, if IsRsvpGoing then ExperienceEventTypesModule.EventRsvpTypes.Going else ExperienceEventTypesModule.EventRsvpTypes.NotGoing):andThen(function(Result) --[[ Line: 56 ]]
				-- upvalues: DataResult (copy), IsRsvpGoing (copy), DataCacheModule (upval), EventId (copy)
				if DataResult then
					DataCacheModule.updateItem(EventId, {
						id = DataResult.id,
						title = DataResult.title,
						subtitle = DataResult.subtitle,
						eventStart = DataResult.eventStart,
						eventEnd = DataResult.eventEnd,
						userRsvp = IsRsvpGoing,
						mediaAssetId = DataResult.mediaAssetId,
						description = DataResult.description,
						rsvpCount = (DataResult.rsvpCount or 0) + (if IsRsvpGoing then 1 else -1)
					})
				end
				return Result and Result.responseBody
			end):catch(function(Err) --[[ Line: 74 ]]
				-- upvalues: DataResult (copy), DataCacheModule (upval), EventId (copy), LogResponseErrorFunction (upval), ExperienceEventsUrlBuilderModule (upval), DiscoveryEventErrorLogger (upval), IsRsvpGoing (copy)
				if DataResult then
					DataCacheModule.updateItem(EventId, DataResult)
				end
				local StatusCode = if type(Err) == "table" and Err.StatusCode then Err.StatusCode else nil
				local StatusMessage = if type(Err) == "table" and Err.StatusMessage then Err.StatusMessage elseif type(Err) == "string" then Err else nil
				LogResponseErrorFunction(ExperienceEventsUrlBuilderModule.RSVP_UPDATE_URL, { StatusCode = StatusCode })
				DiscoveryEventErrorLogger.reportError("patchRsvpStatus", "Error updating event RSVP", {
					eventId = EventId,
					isRsvpGoing = IsRsvpGoing,
					statusCode = StatusCode,
					statusMessage = StatusMessage
				})
			end))
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end
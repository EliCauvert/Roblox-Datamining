local VirtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local RoduxModule = require(VirtualEventsState.Parent.Rodux)
local CryoModule = require(VirtualEventsState.Parent.Cryo)
local _ = require(VirtualEventsState.types)
local VirtualEventModel = require(VirtualEventsState.network).NetworkingVirtualEvents.VirtualEventModel
local LoggerModule = require(VirtualEventsState.logger)

return function(p1)
	-- upvalues: RoduxModule (copy), VirtualEventModel (copy), LoggerModule (copy), CryoModule (copy)
	return (RoduxModule.createReducer({}, {
		[p1.GetActiveVirtualEvents.Succeeded.name] = function(_, p2)
			-- upvalues: VirtualEventModel (upval), LoggerModule (upval)
			local FromResponseResults = {}
			
			for _, entry in p2.responseBody.data do
				local FromResponseResult = VirtualEventModel.fromResponse(entry)
				
				if FromResponseResult then
					if FromResponseResult.eventTime.startTime and FromResponseResult.eventTime.endTime then
						FromResponseResults[entry.id] = FromResponseResult
					else
						LoggerModule:debug("Discarding VirtualEvent with ID {} (malformed start or end time)", entry.id)
					end
				end
			end
			return FromResponseResults
		end,
		[p1.GetActiveVirtualEvents.Failed.name] = function(_, _)
			return {}
		end,
		[p1.GetVirtualEvent.Succeeded.name] = function(p3, p4)
			-- upvalues: VirtualEventModel (upval), CryoModule (upval)
			local FromResponseResults = {}
			local FromResponseResult = VirtualEventModel.fromResponse(p4.responseBody)
			
			if FromResponseResult then
				FromResponseResults[FromResponseResult.id] = FromResponseResult
			end
			return CryoModule.Dictionary.join(p3, FromResponseResults)
		end,
		[p1.GetVirtualEvent.Failed.name] = function(p3, _)
			return p3
		end,
		[p1.UpdateMyRsvpStatus.Succeeded.name] = function(p3, p4)
			-- upvalues: CryoModule (upval)
			local Id = p4.ids[1]
			local v1 = p3[Id]
			
			return if v1 then CryoModule.Dictionary.join(p3, {
				[Id] = CryoModule.Dictionary.join(v1, { userRsvpStatus = p4.postBody.rsvpStatus })
			}) else p3
		end
	}))
end
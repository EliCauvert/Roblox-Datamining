local virtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local roduxModule = require(virtualEventsState.Parent.Rodux)
local cryoModule = require(virtualEventsState.Parent.Cryo)
local _ = require(virtualEventsState.types)
local virtualEventModel = require(virtualEventsState.network).NetworkingVirtualEvents.VirtualEventModel
local loggerModule = require(virtualEventsState.logger)

return function(p1)
	-- upvalues: roduxModule (ref), virtualEventModel (ref), loggerModule (ref), cryoModule (ref)
	return roduxModule.createReducer({}, {
		[p1.GetActiveVirtualEvents.Succeeded.name] = function(_, p2)
			-- upvalues: virtualEventModel (copy), loggerModule (copy)
			local t = {}
			
			for i, v in p2.responseBody.data do
				local var1 = virtualEventModel.fromResponse(v)
				
				if var1 then
					if var1.eventTime.startTime and var1.eventTime.endTime then
						t[v.id] = var1
					else
						loggerModule:debug("Discarding VirtualEvent with ID {} (malformed start or end time)", v.id)
					end
				end
			end
			return t
		end,
		[p1.GetActiveVirtualEvents.Failed.name] = function(_, _)
			return {}
		end,
		[p1.GetVirtualEvent.Succeeded.name] = function(p3, p4)
			-- upvalues: virtualEventModel (copy), cryoModule (copy)
			local t = {}
			local var2 = virtualEventModel.fromResponse(p4.responseBody)
			
			if var2 then
				t[var2.id] = var2
			end
			return cryoModule.Dictionary.join(p3, t)
		end,
		[p1.GetVirtualEvent.Failed.name] = function(p3, _)
			return p3
		end,
		[p1.UpdateMyRsvpStatus.Succeeded.name] = function(p3, p4)
			-- upvalues: cryoModule (copy)
			local var2 = p4.ids[1]
			local var3 = p3[var2]
			
			return if var3 then cryoModule.Dictionary.join(p3, {
				[var2] = cryoModule.Dictionary.join(var3, { userRsvpStatus = p4.postBody.rsvpStatus })
			}) else p3
		end
	})
end
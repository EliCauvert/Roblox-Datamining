local virtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local roduxModule = require(virtualEventsState.Parent.Rodux)
local cryoModule = require(virtualEventsState.Parent.Cryo)
local _ = require(virtualEventsState.types)
local virtualEventModel = require(virtualEventsState.network).NetworkingVirtualEvents.VirtualEventModel
local loggerModule = require(virtualEventsState.logger)

return function(p0)
	-- upvalues: roduxModule (ref), virtualEventModel (ref), loggerModule (ref), cryoModule (ref)
	return roduxModule.createReducer({}, {
		[p0.GetActiveVirtualEvents.Succeeded.name] = function(_, p1)
			-- upvalues: virtualEventModel (copy), loggerModule (copy)
			local t = {}
			
			for i, v in p1.responseBody.data do
				local var5 = virtualEventModel.fromResponse(v)
				
				if var5 then
					if var5.eventTime.startTime and var5.eventTime.endTime then
						t[v.id] = var5
					else
						loggerModule:debug("Discarding VirtualEvent with ID {} (malformed start or end time)", v.id)
					end
				end
			end
			return t
		end,
		[p0.GetActiveVirtualEvents.Failed.name] = function(_, _)
			return {}
		end,
		[p0.GetVirtualEvent.Succeeded.name] = function(p2, p3)
			-- upvalues: virtualEventModel (copy), cryoModule (copy)
			local t = {}
			local var7 = virtualEventModel.fromResponse(p3.responseBody)
			
			if var7 then
				t[var7.id] = var7
			end
			return cryoModule.Dictionary.join(p2, t)
		end,
		[p0.GetVirtualEvent.Failed.name] = function(p4, _)
			return p4
		end,
		[p0.UpdateMyRsvpStatus.Succeeded.name] = function(p5, p6)
			-- upvalues: cryoModule (copy)
			local var8 = p6.ids[1]
			local var9 = p5[var8]
			
			return if var9 then cryoModule.Dictionary.join(p5, {
				[var8] = cryoModule.Dictionary.join(var9, { userRsvpStatus = p6.postBody.rsvpStatus })
			}) else p5
		end
	})
end
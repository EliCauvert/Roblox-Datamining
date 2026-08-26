local virtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local roduxModule = require(virtualEventsState.Parent.Rodux)
local cryoModule = require(virtualEventsState.Parent.Cryo)
local _ = require(virtualEventsState.Parent.NetworkingVirtualEvents)

return function(p1, p2)
	-- upvalues: roduxModule (ref), cryoModule (ref)
	return roduxModule.combineReducers({
		page = roduxModule.createReducer({ nextPageCursor = nil, prevPageCursor = nil }, {
			[p1.GetVirtualEventRsvps.Succeeded.name] = function(_, p3)
				return {
					nextPageCursor = p3.responseBody.nextPageCursor,
					prevPageCursor = p3.responseBody.prevPageCursor
				}
			end
		}),
		counters = roduxModule.createReducer({}, {
			[p1.GetVirtualEventRsvpCounts.Succeeded.name] = function(p3, p4)
				-- upvalues: cryoModule (copy)
				return cryoModule.Dictionary.join(p3, { [p4.ids[1]] = p4.responseBody.counters })
			end,
			[p1.GetVirtualEventRsvpCounts.Failed.name] = function(p3, _)
				return p3
			end,
			[p1.UpdateMyRsvpStatus.Succeeded.name] = function(p3, p4)
				-- upvalues: cryoModule (copy)
				local var1 = p4.ids[1]
				local var2 = p3[var1]
				
				if not var2 then
					return p3
				end
				local rsvpStatus = p4.postBody.rsvpStatus
				local var3 = 0
				
				if rsvpStatus == "going" then
					var3 = 1
				elseif rsvpStatus == "notGoing" then
					var3 = -1
				end
				return cryoModule.Dictionary.join(p3, {
					[var1] = cryoModule.Dictionary.join(var2, { going = math.clamp(var2.going + var3, 0, 1e999) })
				})
			end,
			[p1.UpdateMyRsvpStatus.Failed.name] = function(p3, _)
				return p3
			end
		}),
		byVirtualEventId = roduxModule.createReducer({}, {
			[p1.GetVirtualEventRsvps.Succeeded.name] = function(p3, p4)
				-- upvalues: cryoModule (copy)
				local var1 = p4.ids[1]
				local t = {}
				
				for i, v in p4.responseBody.data do
					t[tostring(v.userId)] = v
				end
				return cryoModule.Dictionary.join(p3, { [var1] = cryoModule.Dictionary.join(p3[var1] or {}, t) })
			end,
			[p1.GetVirtualEventRsvps.Failed.name] = function(p5, _)
				return p5
			end,
			[p1.UpdateMyRsvpStatus.Succeeded.name] = function(p5, p6)
				-- upvalues: p2 (ref), cryoModule (copy)
				local var2 = p6.ids[1]
				local var3 = if p2.LocalPlayer then p2.LocalPlayer.UserId else -1
				
				return cryoModule.Dictionary.join(p5, {
					[var2] = cryoModule.Dictionary.join(p5[var2] or {}, {
						[tostring(var3)] = { userId = var3, rsvpStatus = p6.postBody.rsvpStatus }
					})
				})
			end,
			[p1.UpdateMyRsvpStatus.Failed.name] = function(p5, _)
				return p5
			end
		})
	})
end
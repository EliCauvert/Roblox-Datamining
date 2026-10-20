local VirtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local RoduxModule = require(VirtualEventsState.Parent.Rodux)
local CryoModule = require(VirtualEventsState.Parent.Cryo)
local _ = require(VirtualEventsState.Parent.NetworkingVirtualEvents)

return function(p1, p2)
	-- upvalues: RoduxModule (copy), CryoModule (copy)
	return (RoduxModule.combineReducers({
		page = RoduxModule.createReducer({ nextPageCursor = nil, prevPageCursor = nil }, {
			[p1.GetVirtualEventRsvps.Succeeded.name] = function(_, p3)
				return {
					nextPageCursor = p3.responseBody.nextPageCursor,
					prevPageCursor = p3.responseBody.prevPageCursor
				}
			end
		}),
		counters = RoduxModule.createReducer({}, {
			[p1.GetVirtualEventRsvpCounts.Succeeded.name] = function(p3, p4)
				-- upvalues: CryoModule (upval)
				return CryoModule.Dictionary.join(p3, { [p4.ids[1]] = p4.responseBody.counters })
			end,
			[p1.GetVirtualEventRsvpCounts.Failed.name] = function(p3, _)
				return p3
			end,
			[p1.UpdateMyRsvpStatus.Succeeded.name] = function(p3, p4)
				-- upvalues: CryoModule (upval)
				local Id = p4.ids[1]
				local v1 = p3[Id]
				
				if v1 then
					local RsvpStatus = p4.postBody.rsvpStatus
					
					return CryoModule.Dictionary.join(p3, {
						[Id] = CryoModule.Dictionary.join(v1, {
							going = math.clamp(v1.going + (if RsvpStatus == "going" then 1 elseif RsvpStatus == "notGoing" then -1 else 0), 0, 1e999)
						})
					})
				else
					return p3
				end
			end,
			[p1.UpdateMyRsvpStatus.Failed.name] = function(p3, _)
				return p3
			end
		}),
		byVirtualEventId = RoduxModule.createReducer({}, {
			[p1.GetVirtualEventRsvps.Succeeded.name] = function(p3, p4)
				-- upvalues: CryoModule (upval)
				local Id = p4.ids[1]
				local t = {}
				
				for _, entry in p4.responseBody.data do
					t[tostring(entry.userId)] = entry
				end
				return CryoModule.Dictionary.join(p3, { [Id] = CryoModule.Dictionary.join(p3[Id] or {}, t) })
			end,
			[p1.GetVirtualEventRsvps.Failed.name] = function(p5, _)
				return p5
			end,
			[p1.UpdateMyRsvpStatus.Succeeded.name] = function(p5, p6)
				-- upvalues: p2 (copy), CryoModule (upval)
				local Id = p6.ids[1]
				local UserId = if p2.LocalPlayer then p2.LocalPlayer.UserId else -1
				
				return CryoModule.Dictionary.join(p5, {
					[Id] = CryoModule.Dictionary.join(p5[Id] or {}, {
						[tostring(UserId)] = { userId = UserId, rsvpStatus = p6.postBody.rsvpStatus }
					})
				})
			end,
			[p1.UpdateMyRsvpStatus.Failed.name] = function(p5, _)
				return p5
			end
		})
	}))
end
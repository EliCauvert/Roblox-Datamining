local virtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local roduxModule = require(virtualEventsState.Parent.Rodux)
local cryoModule = require(virtualEventsState.Parent.Cryo)
local _ = require(virtualEventsState.Parent.NetworkingVirtualEvents)

return function(p0, p1)
	-- upvalues: roduxModule (ref), cryoModule (ref)
	return roduxModule.combineReducers({
		page = roduxModule.createReducer({ nextPageCursor = nil, prevPageCursor = nil }, {
			[p0.GetVirtualEventRsvps.Succeeded.name] = function(_, p2)
				return {
					nextPageCursor = p2.responseBody.nextPageCursor,
					prevPageCursor = p2.responseBody.prevPageCursor
				}
			end
		}),
		counters = roduxModule.createReducer({}, {
			[p0.GetVirtualEventRsvpCounts.Succeeded.name] = function(p3, p4)
				-- upvalues: cryoModule (copy)
				return cryoModule.Dictionary.join(p3, { [p4.ids[1]] = p4.responseBody.counters })
			end,
			[p0.GetVirtualEventRsvpCounts.Failed.name] = function(p5, _)
				return p5
			end,
			[p0.UpdateMyRsvpStatus.Succeeded.name] = function(p6, p7)
				-- upvalues: cryoModule (copy)
				local var3 = p7.ids[1]
				local var4 = p6[var3]
				
				if not var4 then
					return p6
				end
				local rsvpStatus = p7.postBody.rsvpStatus
				local var5 = 0
				
				if rsvpStatus == "going" then
					var5 = 1
				elseif rsvpStatus == "notGoing" then
					var5 = -1
				end
				return cryoModule.Dictionary.join(p6, {
					[var3] = cryoModule.Dictionary.join(var4, { going = math.clamp(var4.going + var5, 0, 1e999) })
				})
			end,
			[p0.UpdateMyRsvpStatus.Failed.name] = function(p8, _)
				return p8
			end
		}),
		byVirtualEventId = roduxModule.createReducer({}, {
			[p0.GetVirtualEventRsvps.Succeeded.name] = function(p9, p10)
				-- upvalues: cryoModule (copy)
				local var6 = p10.ids[1]
				local t = {}
				
				for i, v in p10.responseBody.data do
					t[tostring(v.userId)] = v
				end
				return cryoModule.Dictionary.join(p9, { [var6] = cryoModule.Dictionary.join(p9[var6] or {}, t) })
			end,
			[p0.GetVirtualEventRsvps.Failed.name] = function(p11, _)
				return p11
			end,
			[p0.UpdateMyRsvpStatus.Succeeded.name] = function(p12, p13)
				-- upvalues: p1 (ref), cryoModule (copy)
				local var8 = p13.ids[1]
				local var9 = if p1.LocalPlayer then p1.LocalPlayer.UserId else -1
				
				return cryoModule.Dictionary.join(p12, {
					[var8] = cryoModule.Dictionary.join(p12[var8] or {}, {
						[tostring(var9)] = { userId = var9, rsvpStatus = p13.postBody.rsvpStatus }
					})
				})
			end,
			[p0.UpdateMyRsvpStatus.Failed.name] = function(p14, _)
				return p14
			end
		})
	})
end
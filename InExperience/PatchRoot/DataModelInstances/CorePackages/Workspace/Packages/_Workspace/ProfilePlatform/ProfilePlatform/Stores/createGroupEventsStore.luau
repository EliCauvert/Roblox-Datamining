local HttpService = game:GetService("HttpService")
local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local SignalsModule = require(Parent.Signals)
local HttpStoreModule = require(Parent.HttpStore)
local FFlagLuaAppUseAppHttpStore = require(Parent.SharedFlags).FFlagLuaAppUseAppHttpStore
local InternalHttpStoreModule = require(Parent.InternalHttpStore)
local _ = require(ProfilePlatform.Parent.GraphQLServer)
local Id = UrlBuilder.fromString("apis:virtual-events/v1/virtual-events/groups/{id}")
local Rsvps = UrlBuilder.fromString("apis:virtual-events/v1/virtual-events/{eventId}/rsvps")
local FFlagEnableCommunityProfileLoadingSkeletonsModule = require(ProfilePlatform.Flags.FFlagEnableCommunityProfileLoadingSkeletons)
local t = {}

return function(Id1)
	-- upvalues: InternalHttpStoreModule (copy), FFlagLuaAppUseAppHttpStore (copy), HttpStoreModule (copy), SignalsModule (copy), Id (copy), t (copy), HttpService (copy), FFlagEnableCommunityProfileLoadingSkeletonsModule (copy), Rsvps (copy)
	local HttpStore = InternalHttpStoreModule.GetHttpStore()
	
	if FFlagLuaAppUseAppHttpStore then
		local GetResult = HttpStoreModule.Instance.get()
		
		if GetResult then
			HttpStore = GetResult
		end
	end
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local Tbl = {}
	local Signal1, Signal2_1 = SignalsModule.createSignal(Tbl)
	
	local function _(Key, p1)
		-- upvalues: Tbl (ref), Signal2_1 (copy)
		local Copy = table.clone(Tbl)
		Copy[Key] = p1
		Signal2_1(Copy)
		Tbl = Copy
	end
	
	local Computed = SignalsModule.createComputed(function(p1)
		-- upvalues: Signal (copy), Id1 (copy), Id (upval), HttpStore (ref)
		return HttpStore.fetch(string.format("GetEvents_%d_%d", Id1, (Signal(p1))), { Method = "GET", Url = Id({ id = Id1 }) })
	end)
	local t1 = t
	local Effect = nil
	
	return {
		getEvents = SignalsModule.createComputed(function(p1)
			-- upvalues: Computed (copy), Signal1 (copy), HttpService (upval), t1 (ref)
			local v1 = Computed(p1)(p1)
			local SignalResult = Signal1(p1)
			
			if v1.status ~= "Success" then
				return if v1.status == "Failed" then {} else t1
			end
			local t = {}
			local Success, Result = pcall(HttpService.JSONDecode, HttpService, v1.response.Body)
			
			if Success and Result ~= nil and Result.data ~= nil then
				for i, entry in pairs(Result.data) do
					entry.universeId = tostring(entry.universeId)
					local SignalResultEntry = SignalResult[entry.id]
					
					if SignalResultEntry ~= nil then
						entry.userRsvpStatus = SignalResultEntry
					end
					t[i] = entry
				end
			end
			t1 = t
			
			return t
		end),
		isLoading = if FFlagEnableCommunityProfileLoadingSkeletonsModule then SignalsModule.createComputed(function(p2): boolean
			-- upvalues: Computed (copy)
			return Computed(p2)(p2).status == "Fetching"
		end) else nil,
		updateRsvpStatus = function(p2, RsvpStatus)
			-- upvalues: Rsvps (upval), HttpService (upval), HttpStore (ref), Tbl (ref), Signal2_1 (copy), Effect (ref), SignalsModule (upval)
			local FetchResult = HttpStore.fetch(string.format("UpdateEventRsvpStatus_%s_%s", p2.id, RsvpStatus), {
				Method = "POST",
				Url = Rsvps({ eventId = p2.id }),
				Body = HttpService:JSONEncode({ rsvpStatus = RsvpStatus }),
				Headers = { ["Content-Type"] = "application/json" }
			})
			local Entry = Tbl[p2.id]
			local Copy = table.clone(Tbl)
			Copy[p2.id] = RsvpStatus
			Signal2_1(Copy)
			Tbl = Copy
			
			if Effect then
				Effect()
			end
			Effect = SignalsModule.createEffect(function(p3)
				-- upvalues: FetchResult (copy), p2 (copy), Entry (copy), Tbl (upval), Signal2_1 (upval)
				if FetchResult(p3).status == "Failed" then
					local Copy = table.clone(Tbl)
					Copy[p2.id] = Entry
					Signal2_1(Copy)
					Tbl = Copy
				end
			end)
			
			return FetchResult
		end,
		refetch = function()
			-- upvalues: Signal2 (copy), Signal2_1 (copy)
			Signal2(function(p2: number): number
				return p2 + 1
			end)
			Signal2_1(function(_)
				return {}
			end)
		end
	}
end
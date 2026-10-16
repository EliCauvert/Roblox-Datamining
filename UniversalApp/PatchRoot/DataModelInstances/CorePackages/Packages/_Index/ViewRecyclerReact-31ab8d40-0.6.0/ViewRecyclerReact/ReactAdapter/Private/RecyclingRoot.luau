local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local RecyclableViewModule = require(script.Parent.RecyclableView)
local RecyclableViewHostModule = require(ViewRecyclerReact.ReactAdapter.RecyclableViewHost)
local RecyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local SignalsExperimentalModule = require(ViewRecyclerReact.Parent.SignalsExperimental)
local CreateElementFunction = require(ViewRecyclerReact.Parent.React).createElement

return {
	new = function(Callback) --[[ Line: 37 ]]
		-- upvalues: ViewRecyclerModule (copy), RecyclableViewRegistryModule (copy), RecyclableViewModule (copy), CreateElementFunction (copy), RecyclableViewHostModule (copy), SignalsExperimentalModule (copy)
		local Tbl = {}
		local Count = 1
		local Flag = false
		local Config = nil
		
		local function _() --[[ Line: 43 | Named "notifyChanged" ]]
			-- upvalues: Flag (ref), Callback (copy)
			if not Flag then
				Callback()
			end
		end
		
		local config = nil
		config = {
			allocateId = function(): number --[[ Line: 51 ]]
				-- upvalues: Flag (ref), Count (ref)
				assert(not Flag, "RecyclingRoot: cannot allocate after destroy")
				local Count1: number = Count
				Count += 1
				
				return Count1
			end,
			addHosts = function(List, Callback1, Callback2) --[[ Line: 57 ]]
				-- upvalues: Flag (ref), Tbl (copy), Callback (copy)
				assert(not Flag, "RecyclingRoot: cannot add hosts after destroy")
				local Flag1 = false
				
				for _, value in List do
					assert(Tbl[value] == nil, "RecyclingRoot: resource host is already registered")
					Tbl[value] = { key = Callback1(value), render = Callback2(value) }
					Flag1 = true
				end
				if Flag1 and not Flag then
					Callback()
				end
			end,
			removeHosts = function(List) --[[ Line: 72 ]]
				-- upvalues: Tbl (copy), Flag (ref), Callback (copy)
				local Flag1 = false
				
				for _, value in List do
					if Tbl[value] ~= nil then
						Tbl[value] = nil
						Flag1 = true
					end
				end
				if Flag1 and not Flag then
					Callback()
				end
			end
		}
		
		return {
			getScope = function(p1) --[[ Line: 86 ]]
				-- upvalues: Flag (ref), Config (ref), ViewRecyclerModule (upval), RecyclableViewRegistryModule (upval), RecyclableViewModule (upval), config (ref), CreateElementFunction (upval), RecyclableViewHostModule (upval), SignalsExperimentalModule (upval)
				assert(not Flag, "RecyclingRoot: cannot get a Recycling scope after destroy")
				
				if Config == nil then
					local MaxPoolSize = p1.maxPoolSize
					local RecyclingScope = ViewRecyclerModule.Adapter.createRecyclingScope({
						onPoolChanged = if p1.diagnostics == nil then nil else function(p2) --[[ Line: 96 ]]
							-- upvalues: p1 (copy), ViewRecyclerModule (upval)
							p1.diagnostics({
								kind = ViewRecyclerModule.Diagnostics.EventKind.PoolChanged,
								action = p2.action,
								itemViewType = p2.viewType,
								occupiedDelta = p2.occupiedDelta,
								vacantDelta = p2.vacantDelta,
								totalDelta = p2.totalDelta
							})
						end,
						adapter = {
							create = function(p2) --[[ Line: 107 ]]
								-- upvalues: RecyclableViewRegistryModule (upval), RecyclableViewModule (upval), config (upval)
								local Metadata = RecyclableViewRegistryModule.getMetadata(p2)
								assert(Metadata ~= nil, "RecyclingScope: cannot create an unregistered Recyclable view type")
								
								return RecyclableViewModule(config.allocateId(), p2, nil, Metadata.readiness, Metadata.hideWhilePending)
							end,
							destroy = function(p2) --[[ Line: 118 ]]
								p2.destroy()
							end,
							onCreated = function(p2) --[[ Line: 121 ]]
								-- upvalues: config (upval), CreateElementFunction (upval), RecyclableViewHostModule (upval)
								config.addHosts(p2, function(p3): string --[[ Line: 122 ]]
									return `RecyclableView{p3.id}`
								end, function(ItemView) --[[ Line: 124 ]]
									-- upvalues: CreateElementFunction (upval), RecyclableViewHostModule (upval)
									return function(CreatePortal) --[[ Line: 125 ]]
										-- upvalues: CreateElementFunction (upval), RecyclableViewHostModule (upval), ItemView (copy)
										return CreateElementFunction(RecyclableViewHostModule, { itemView = ItemView, createPortal = CreatePortal })
									end
								end)
							end,
							onEvicted = function(p2) --[[ Line: 133 ]]
								-- upvalues: config (upval)
								config.removeHosts(p2)
							end,
							batch = SignalsExperimentalModule.batch
						}
					})
					Config = {
						bind = function(Tbl) --[[ Line: 140 ]]
							-- upvalues: MaxPoolSize (ref), RecyclingScope (copy)
							local Copy = table.clone(Tbl)
							
							if Copy.updateCapacity then
								MaxPoolSize = Copy.capacity
								Copy.updateCapacity = nil
							elseif Copy.capacity == nil then
								Copy.capacity = MaxPoolSize
							else
								MaxPoolSize = Copy.capacity
							end
							return RecyclingScope.bind(Copy)
						end,
						dispose = RecyclingScope.dispose
					}
					
					return Config
				else
					return Config
				end
			end,
			getPortalChildren = function(p1) --[[ Line: 161 ]]
				-- upvalues: Tbl (copy)
				local RenderResults = {}
				
				for _, value in Tbl do
					RenderResults[value.key] = value.render(p1)
				end
				return RenderResults
			end,
			destroy = function() --[[ Line: 168 ]]
				-- upvalues: Flag (ref), Config (ref), Tbl (copy)
				if Flag then return end
				Flag = true
				
				if Config ~= nil then
					Config.dispose()
				end
				Config = nil
				table.clear(Tbl)
			end
		}
	end
}
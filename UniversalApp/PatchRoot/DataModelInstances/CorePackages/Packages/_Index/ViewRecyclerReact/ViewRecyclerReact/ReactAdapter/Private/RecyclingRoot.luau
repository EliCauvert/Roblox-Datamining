local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local CompositionPlacementModule = require(script.Parent.CompositionPlacement)
local RecyclableViewModule = require(script.Parent.RecyclableView)
local RecyclableViewHostModule = require(ViewRecyclerReact.ReactAdapter.RecyclableViewHost)
local RecyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local SignalsExperimentalModule = require(ViewRecyclerReact.Parent.SignalsExperimental)
local CreateElementFunction = require(ViewRecyclerReact.Parent.React).createElement
local RecyclingRootModule = {}

if require(script:FindFirstAncestor("ViewRecyclerReact").Flags).FFlagViewRecyclerReact08 then
	function RecyclingRootModule.new(Callback, MaxPoolSize)
		-- upvalues: ViewRecyclerModule (copy), RecyclableViewRegistryModule (copy), RecyclableViewModule (copy), CreateElementFunction (copy), RecyclableViewHostModule (copy), SignalsExperimentalModule (copy), CompositionPlacementModule (copy)
		local Tbl = {}
		local Count = 1
		local Flag = false
		local v1 = nil
		local MaxPoolSize1 = MaxPoolSize
		local List = {}
		local t = {}
		local config = {
			onPoolChanged = function(p1)
				-- upvalues: List (copy), ViewRecyclerModule (upval)
				if #List == 0 then return end
				local config = {
					kind = ViewRecyclerModule.Diagnostics.EventKind.PoolChanged,
					action = p1.action,
					itemViewType = p1.viewType,
					occupiedDelta = p1.occupiedDelta,
					vacantDelta = p1.vacantDelta,
					totalDelta = p1.totalDelta
				}
				
				for _, value in table.clone(List) do
					value(config)
				end
			end
		}
		local NewResult = nil
		
		local function _()
			-- upvalues: Flag (ref), Callback (copy)
			if not Flag then
				Callback()
			end
		end
		
		local config1 = nil
		config1 = {
			allocateId = function(): number
				-- upvalues: Flag (ref), Count (ref)
				assert(not Flag, "RecyclingRoot: cannot allocate after destroy")
				local Count1: number = Count
				Count += 1
				
				return Count1
			end,
			addHosts = function(List, Callback1, Callback2)
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
			removeHosts = function(List)
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
			getScope = function()
				-- upvalues: Flag (ref), v1 (ref), config (copy), RecyclableViewRegistryModule (upval), RecyclableViewModule (upval), config1 (ref), NewResult (ref), CreateElementFunction (upval), RecyclableViewHostModule (upval), SignalsExperimentalModule (upval), ViewRecyclerModule (upval), MaxPoolSize1 (ref), CompositionPlacementModule (upval)
				assert(not Flag, "RecyclingRoot: cannot get a Recycling scope after destroy")
				
				if v1 == nil then
					config.adapter = {
						create = function(p2)
							-- upvalues: RecyclableViewRegistryModule (upval), RecyclableViewModule (upval), config1 (upval), NewResult (upval)
							assert(RecyclableViewRegistryModule.isRegistered(p2), "RecyclingScope: cannot create an unregistered Recyclable view type")
							
							return RecyclableViewModule(config1.allocateId(), p2, nil, NewResult)
						end,
						destroy = function(p2)
							p2.destroy()
						end,
						onCreated = function(p2)
							-- upvalues: config1 (upval), CreateElementFunction (upval), RecyclableViewHostModule (upval)
							config1.addHosts(p2, function(p3): string
								return `RecyclableView{p3.id}`
							end, function(ItemView)
								-- upvalues: CreateElementFunction (upval), RecyclableViewHostModule (upval)
								return function(CreatePortal)
									-- upvalues: CreateElementFunction (upval), RecyclableViewHostModule (upval), ItemView (copy)
									return CreateElementFunction(RecyclableViewHostModule, { itemView = ItemView, createPortal = CreatePortal })
								end
							end)
						end,
						onEvicted = function(p2)
							-- upvalues: config1 (upval)
							config1.removeHosts(p2)
						end,
						batch = SignalsExperimentalModule.batch,
						isDestroyed = function(p2)
							return p2.isHostDestroyed()
						end
					}
					local RecyclingScope = ViewRecyclerModule.Adapter.createRecyclingScope(config)
					local config2 = {
						bind = function(Tbl)
							-- upvalues: MaxPoolSize1 (upval), RecyclingScope (copy)
							local Copy = table.clone(Tbl)
							Copy.capacity = MaxPoolSize1
							
							return RecyclingScope.bind(Copy)
						end,
						dispose = RecyclingScope.dispose
					}
					v1 = config2
					NewResult = CompositionPlacementModule.new(config2)
					
					return v1
				else
					return v1
				end
			end,
			setMaxPoolSize = function(Value)
				-- upvalues: MaxPoolSize1 (ref), v1 (ref)
				if Value == MaxPoolSize1 then return end
				MaxPoolSize1 = Value
				
				if v1 ~= nil then
					v1.bind({ releases = {}, requests = {} })
				end
			end,
			observePool = function(Value)
				-- upvalues: t (copy), List (copy)
				local Entry = t[Value]
				
				if Entry == nil then
					table.insert(List, Value)
				end
				t[Value] = (Entry or 0) + 1
				local Flag = true
				
				return function()
					-- upvalues: Flag (ref), t (upval), Value (copy), List (upval)
					if not Flag then return end
					Flag = false
					local EntryDelta = t[Value] - 1
					
					if EntryDelta > 0 then
						t[Value] = EntryDelta
						
						return
					else
						t[Value] = nil
						table.remove(List, (table.find(List, Value)))
					end
				end
			end,
			getPortalChildren = function(p2)
				-- upvalues: Tbl (copy)
				local RenderResults = {}
				
				for _, value in Tbl do
					RenderResults[value.key] = value.render(p2)
				end
				return RenderResults
			end,
			destroy = function()
				-- upvalues: Flag (ref), NewResult (ref), v1 (ref), Tbl (copy)
				if Flag then return end
				Flag = true
				
				if NewResult ~= nil then
					NewResult.destroy()
				end
				NewResult = nil
				
				if v1 ~= nil then
					v1.dispose()
				end
				v1 = nil
				table.clear(Tbl)
			end
		}
	end
	
	return RecyclingRootModule
else
	function RecyclingRootModule.new(Callback, _)
		-- upvalues: ViewRecyclerModule (copy), RecyclableViewRegistryModule (copy), RecyclableViewModule (copy), CreateElementFunction (copy), RecyclableViewHostModule (copy), SignalsExperimentalModule (copy)
		local Tbl = {}
		local Count = 1
		local Flag = false
		local Config = nil
		
		local function _()
			-- upvalues: Flag (ref), Callback (copy)
			if not Flag then
				Callback()
			end
		end
		
		local config = nil
		config = {
			allocateId = function(): number
				-- upvalues: Flag (ref), Count (ref)
				assert(not Flag, "RecyclingRoot: cannot allocate after destroy")
				local Count1: number = Count
				Count += 1
				
				return Count1
			end,
			addHosts = function(List, Callback1, Callback2)
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
			removeHosts = function(List)
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
			getScope = function(p2)
				-- upvalues: Flag (ref), Config (ref), ViewRecyclerModule (upval), RecyclableViewRegistryModule (upval), RecyclableViewModule (upval), config (ref), CreateElementFunction (upval), RecyclableViewHostModule (upval), SignalsExperimentalModule (upval)
				assert(not Flag, "RecyclingRoot: cannot get a Recycling scope after destroy")
				
				if Config == nil then
					local MaxPoolSize = p2.maxPoolSize
					local RecyclingScope = ViewRecyclerModule.Adapter.createRecyclingScope({
						onPoolChanged = if p2.diagnostics == nil then nil else function(p3)
							-- upvalues: p2 (copy), ViewRecyclerModule (upval)
							p2.diagnostics({
								kind = ViewRecyclerModule.Diagnostics.EventKind.PoolChanged,
								action = p3.action,
								itemViewType = p3.viewType,
								occupiedDelta = p3.occupiedDelta,
								vacantDelta = p3.vacantDelta,
								totalDelta = p3.totalDelta
							})
						end,
						adapter = {
							create = function(p3)
								-- upvalues: RecyclableViewRegistryModule (upval), RecyclableViewModule (upval), config (upval)
								local Metadata = RecyclableViewRegistryModule.getMetadata(p3)
								assert(Metadata ~= nil, "RecyclingScope: cannot create an unregistered Recyclable view type")
								
								return RecyclableViewModule(config.allocateId(), p3, nil, Metadata.readiness, Metadata.hideWhilePending)
							end,
							destroy = function(p3)
								p3.destroy()
							end,
							onCreated = function(p3)
								-- upvalues: config (upval), CreateElementFunction (upval), RecyclableViewHostModule (upval)
								config.addHosts(p3, function(p4): string
									return `RecyclableView{p4.id}`
								end, function(ItemView)
									-- upvalues: CreateElementFunction (upval), RecyclableViewHostModule (upval)
									return function(CreatePortal)
										-- upvalues: CreateElementFunction (upval), RecyclableViewHostModule (upval), ItemView (copy)
										return CreateElementFunction(RecyclableViewHostModule, { itemView = ItemView, createPortal = CreatePortal })
									end
								end)
							end,
							onEvicted = function(p3)
								-- upvalues: config (upval)
								config.removeHosts(p3)
							end,
							batch = SignalsExperimentalModule.batch
						}
					})
					Config = {
						bind = function(Tbl)
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
			getPortalChildren = function(p2)
				-- upvalues: Tbl (copy)
				local RenderResults = {}
				
				for _, value in Tbl do
					RenderResults[value.key] = value.render(p2)
				end
				return RenderResults
			end,
			destroy = function()
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
	
	return RecyclingRootModule
end
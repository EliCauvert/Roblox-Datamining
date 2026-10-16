local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local RecyclableViewHostModule = require(ViewRecyclerReact.ReactAdapter.RecyclableViewHost)
local RecyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local SignalsExperimentalModule = require(ViewRecyclerReact.Parent.SignalsExperimental)
local RecyclableViewModule = require(script.Parent.RecyclableView)
local CreateElementFunction = require(ViewRecyclerReact.Parent.React).createElement

return {
	new = function(Callback) --[[ Line: 41 ]]
		-- upvalues: CreateElementFunction (copy), RecyclableViewHostModule (copy), SignalsExperimentalModule (copy), ViewRecyclerModule (copy), RecyclableViewRegistryModule (copy), RecyclableViewModule (copy)
		local Tbl = {}
		local Count = 1
		local Flag = false
		local Config = nil
		
		local function _() --[[ Line: 47 | Named "notifyChanged" ]]
			-- upvalues: Flag (ref), Callback (copy)
			if not Flag then
				Callback()
			end
		end
		
		local config = nil
		config = {
			allocateId = function(): number --[[ Line: 55 ]]
				-- upvalues: Flag (ref), Count (ref)
				assert(not Flag, "RecyclingRoot: cannot allocate after destroy")
				local Count1: number = Count
				Count += 1
				
				return Count1
			end,
			addHosts = function(List, Callback1, Callback2) --[[ Line: 61 ]]
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
			removeHosts = function(List) --[[ Line: 76 ]]
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
			getScope = function(p1) --[[ Line: 90 ]]
				-- upvalues: Flag (ref), Config (ref), config (ref), CreateElementFunction (upval), RecyclableViewHostModule (upval), SignalsExperimentalModule (upval), ViewRecyclerModule (upval), RecyclableViewRegistryModule (upval), RecyclableViewModule (upval)
				assert(not Flag, "RecyclingRoot: cannot get a Recycling scope after destroy")
				
				if Config == nil then
					local Count = 0
					local List = {}
					local List1 = {}
					
					local function flushHosts() --[[ Line: 100 ]]
						-- upvalues: List1 (copy), config (upval), List (copy), CreateElementFunction (upval), RecyclableViewHostModule (upval)
						if #List1 > 0 then
							config.removeHosts(List1)
							
							for _, value in List1 do
								value.destroy()
							end
						end
						if #List > 0 then
							local List2 = {}
							local t = {}
							
							for _, value1 in List1 do
								t[value1] = true
							end
							for _, value2 in List do
								if not t[value2] then
									table.insert(List2, value2)
								end
							end
							if #List2 > 0 then
								config.addHosts(List2, function(p2): string --[[ Line: 119 ]]
									return `RecyclableView{p2.id}`
								end, function(ItemView) --[[ Line: 121 ]]
									-- upvalues: CreateElementFunction (upval), RecyclableViewHostModule (upval)
									return function(CreatePortal) --[[ Line: 122 ]]
										-- upvalues: CreateElementFunction (upval), RecyclableViewHostModule (upval), ItemView (copy)
										return CreateElementFunction(RecyclableViewHostModule, { itemView = ItemView, createPortal = CreatePortal })
									end
								end)
							end
						end
						table.clear(List)
						table.clear(List1)
					end
					
					local RecyclingScope = ViewRecyclerModule.Adapter.createRecyclingScope({
						maxPoolSize = p1.maxPoolSize,
						onPoolChanged = if p1.diagnostics == nil then nil else function(p2) --[[ Line: 151 ]]
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
							create = function(p2) --[[ Line: 162 ]]
								-- upvalues: RecyclableViewRegistryModule (upval), RecyclableViewModule (upval), config (upval), List (copy)
								local Metadata = RecyclableViewRegistryModule.getMetadata(p2)
								assert(Metadata ~= nil, "RecyclingScope: cannot create an unregistered Recyclable view type")
								local RecyclableViewModuleResult = RecyclableViewModule(config.allocateId(), p2, nil, Metadata.readiness, Metadata.hideWhilePending)
								table.insert(List, RecyclableViewModuleResult)
								
								return RecyclableViewModuleResult
							end,
							destroy = function(p2) --[[ Line: 175 ]]
								-- upvalues: List1 (copy)
								table.insert(List1, p2)
							end,
							batch = function(p2) --[[ Line: 135 ]]
								-- upvalues: Count (ref), SignalsExperimentalModule (upval), flushHosts (copy)
								Count += 1
								local Success, Result = pcall(SignalsExperimentalModule.batch, p2)
								Count -= 1
								
								if Count == 0 then
									flushHosts()
								end
								if not Success then
									error(Result, 0)
								end
							end
						}
					})
					Config = {
						exchange = function(p2, p3, p4) --[[ Line: 183 ]]
							-- upvalues: RecyclingScope (copy), Count (ref), flushHosts (copy)
							local ExchangeResult = RecyclingScope.exchange(p2, p3, p4)
							
							if Count == 0 then
								flushHosts()
							end
							return ExchangeResult
						end,
						batch = RecyclingScope.batch,
						isLeaseCurrent = RecyclingScope.isLeaseCurrent,
						setMaxPoolSize = function(p2) --[[ Line: 192 ]]
							-- upvalues: RecyclingScope (copy), Count (ref), flushHosts (copy)
							RecyclingScope.setMaxPoolSize(p2)
							
							if Count == 0 then
								flushHosts()
							end
						end,
						getScopeInventory = RecyclingScope.getScopeInventory,
						getVacantViews = RecyclingScope.getVacantViews,
						destroy = function() --[[ Line: 200 ]]
							-- upvalues: RecyclingScope (copy), Count (ref), flushHosts (copy)
							RecyclingScope.destroy()
							
							if Count == 0 then
								flushHosts()
							end
						end
					}
					
					return Config
				else
					return Config
				end
			end,
			getPortalChildren = function(p2) --[[ Line: 212 ]]
				-- upvalues: Tbl (copy)
				local RenderResults = {}
				
				for _, value in Tbl do
					RenderResults[value.key] = value.render(p2)
				end
				return RenderResults
			end,
			destroy = function() --[[ Line: 219 ]]
				-- upvalues: Flag (ref), Config (ref), Tbl (copy)
				if Flag then return end
				Flag = true
				
				if Config ~= nil then
					Config.destroy()
				end
				Config = nil
				table.clear(Tbl)
			end
		}
	end
}
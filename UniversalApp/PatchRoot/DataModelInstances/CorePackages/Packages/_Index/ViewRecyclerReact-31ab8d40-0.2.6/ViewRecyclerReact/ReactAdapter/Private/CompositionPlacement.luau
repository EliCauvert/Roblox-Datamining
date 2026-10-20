local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(script.Parent.HostPresentationPhase)
local PlacementKindModule = require(script.Parent.PlacementKind)
local _ = require(ViewRecyclerReact.Parent.React)
local _ = require(script.Parent.RecyclableViewRegistry)
local _ = require(ViewRecyclerReact.Parent.Signals)
local ReparentableHost = require(ViewRecyclerReact.Parent.ViewRecyclerRoblox).ReparentableHost
local ShallowTable = require(ViewRecyclerReact.Parent.ViewRecycler).Adapter._Private.ShallowTable
local Frozen = table.freeze({ "key", "generation" })

local function _(p1, p2): string
	return `{#p1}:{p1}:{p2}`
end

return {
	new = function(p1, Callback)
		-- upvalues: ReparentableHost (copy), ShallowTable (copy), Frozen (copy), PlacementKindModule (copy)
		local Tbl = {}
		local self = setmetatable({}, { __mode = "k" })
		local Count = 1
		local Tbl1 = {}
		local Tbl2 = {}
		local Flag = false
		local Flag1 = false
		local v1 = nil
		local self1 = setmetatable({}, { __mode = "k" })
		
		local function getPortState(View)
			-- upvalues: self1 (copy), Tbl (copy), ReparentableHost (upval), ShallowTable (upval), Frozen (upval)
			local SelfEntry = self1[View]
			
			if SelfEntry == nil then
				local config = {
					pendingAssignment = nil,
					pendingPlacementId = nil,
					currentPlacementId = nil,
					currentPlaceholder = nil,
					currentAutomaticSize = nil,
					port = nil,
					view = View
				}
				config.port = {
					apply = function(p2)
						-- upvalues: config (ref), Tbl (upval), View (copy), ReparentableHost (upval), ShallowTable (upval), Frozen (upval)
						if p2 == nil then
							config.pendingAssignment = nil
							config.pendingPlacementId = nil
							local CurrentPlacementId = config.currentPlacementId
							config.currentPlacementId = nil
							config.currentPlaceholder = nil
							config.currentAutomaticSize = nil
							local Entry = if CurrentPlacementId == nil then nil else Tbl[CurrentPlacementId]
							
							if Entry ~= nil and Entry.view == View then
								Entry.view = nil
							end
							local PortalFrameResult = View.portalFrame(false)
							
							if PortalFrameResult ~= nil then
								ReparentableHost.detach(PortalFrameResult)
								PortalFrameResult.AnchorPoint = Vector2.zero
								PortalFrameResult.Position = UDim2.new()
								PortalFrameResult.Size = UDim2.new()
								PortalFrameResult.AutomaticSize = Enum.AutomaticSize.None
							end
							return
						else
							local PendingAssignment = config.pendingAssignment or View.signal(false)
							local PendingPlacementId = config.pendingPlacementId or config.currentPlacementId
							assert(PendingAssignment ~= nil, "CompositionPlacement: placement attach or update requires an Assignment")
							assert(PendingPlacementId ~= nil, "CompositionPlacement: placement requires a destination")
							
							if p2.assignment == nil or not ShallowTable.containsEqual(p2.assignment, PendingAssignment, Frozen) then return end
							config.pendingAssignment = nil
							config.pendingPlacementId = nil
							local CurrentPlacementId = config.currentPlacementId
							
							if CurrentPlacementId ~= nil and CurrentPlacementId ~= PendingPlacementId then
								local Entry1 = Tbl[CurrentPlacementId]
								
								if Entry1 ~= nil and Entry1.view == View then
									Entry1.view = nil
								end
							end
							config.currentPlacementId = PendingPlacementId
							local Entry = Tbl[PendingPlacementId]
							
							if Entry ~= nil then
								Entry.view = View
							end
							local Host = p2.host
							assert(Host ~= nil, "CompositionPlacement: cannot place a destroyed Recyclable view")
							local Value = PendingAssignment.value
							
							if config.currentPlaceholder ~= Value.placeholder or config.currentAutomaticSize ~= Value.automaticSize or Host.Parent ~= Value.placeholder then
								ReparentableHost.place(Host, Value)
								config.currentPlaceholder = Value.placeholder
								config.currentAutomaticSize = Value.automaticSize
							end
							Host.Visible = p2.visible
						end
					end
				}
				self1[View] = config
				
				return config
			else
				return SelfEntry
			end
		end
		
		local function _(View, PendingAssignment)
			-- upvalues: getPortState (copy), PlacementKindModule (upval)
			if PendingAssignment == nil then
				View.bindPlacement(nil, nil)
				
				return
			else
				local PortState = getPortState(View)
				PortState.pendingAssignment = PendingAssignment
				PortState.pendingPlacementId = PendingAssignment.adapterData.placementId
				View.bindPlacement(PlacementKindModule.Composition, PortState.port)
			end
		end
		
		local _ = function(Key)
			-- upvalues: Tbl2 (copy), Flag (ref), Flag1 (ref), Callback (copy)
			Tbl2[Key] = true
			
			if not Flag and not Flag1 then
				Flag = true
				Callback()
				
				return
			end
		end
		
		local function ensureReconciler()
			-- upvalues: v1 (ref), p1 (copy), getPortState (copy), PlacementKindModule (upval)
			local v2 = v1
			
			if v2 == nil then
				local t = {}
				local t1 = {}
				local Count = 1
				
				local function assignmentFor(Desired, Generation)
					-- upvalues: Count (ref)
					local Generation1: number = Generation
					
					if Generation1 == nil then
						Generation1 = Count
						Count += 1
					end
					return {
						key = Desired.key,
						index = Desired.index,
						value = Desired.value,
						generation = Generation1,
						adapterData = { placementId = Desired.placementId }
					}
				end
				
				local config = {
					update = function(List)
						-- upvalues: t (ref), assignmentFor (copy), p1 (upval), t1 (copy), getPortState (upval), PlacementKindModule (upval)
						local t2 = {}
						
						for _, value in t do
							t2[value.desired.key] = value
						end
						local t3 = {}
						local List1 = {}
						local List2 = {}
						local List3 = {}
						local List4 = {}
						
						for _, Desired in List do
							assert(t3[Desired.key] == nil, `CompositionPlacement: duplicate key "{Desired.key}"`)
							t3[Desired.key] = true
							local Entry = t2[Desired.key]
							
							if Entry == nil or Entry.viewType ~= Desired.viewType then
								table.insert(List2, { viewType = Desired.viewType })
								table.insert(List3, { desired = Desired, viewType = Desired.viewType })
							else
								t2[Desired.key] = nil
								
								if Entry.desired ~= Desired then
									Entry.assignment = assignmentFor(Desired, Entry.assignment.generation)
									table.insert(List4, { view = Entry.view, assignment = Entry.assignment })
								end
								Entry.desired = Desired
								table.insert(List3, Entry)
							end
						end
						for _, value1 in t do
							if t2[value1.desired.key] == value1 then
								table.insert(List1, { view = value1.view, leaseToken = value1.leaseToken })
							end
						end
						local ExchangeResult = p1.exchange(t1, List1, List2)
						local Count = 1
						local t4 = {}
						
						for _, value3 in List3 do
							if value3.view == nil then
								local AcquiredEntry = ExchangeResult.acquired[Count]
								Count += 1
								value3.view = AcquiredEntry.view
								value3.leaseToken = AcquiredEntry.leaseToken
								value3.assignment = assignmentFor(value3.desired)
								table.insert(List4, {
									view = AcquiredEntry.view,
									assignment = value3.assignment
								})
							end
							t4[value3.view] = true
						end
						for _, value4 in List1 do
							if not t4[value4.view] then
								table.insert(List4, { assignment = nil, view = value4.view })
							end
						end
						t = List3
						
						for _, value2 in List4 do
							local View = value2.view
							local Assignment = value2.assignment
							
							if Assignment == nil then
								View.bindPlacement(nil, nil)
							else
								local PortState = getPortState(View)
								PortState.pendingAssignment = Assignment
								PortState.pendingPlacementId = Assignment.adapterData.placementId
								View.bindPlacement(PlacementKindModule.Composition, PortState.port)
							end
						end
						for _, value5 in List4 do
							value5.view.set(value5.assignment)
						end
					end,
					getViews = function()
						-- upvalues: t (ref)
						local List = {}
						
						for _, value in t do
							table.insert(List, value.view)
						end
						return List
					end
				}
				v1 = config
				
				return config
			else
				return v2
			end
		end
		
		return {
			register = function(ViewType, Key, ParentSignal, Props, Placeholder)
				-- upvalues: Flag1 (ref), self (copy), Count (ref), Tbl (copy), Tbl2 (copy), Flag (ref), Callback (copy), getPortState (copy), Tbl1 (copy)
				assert(not Flag1, "CompositionPlacement: cannot register after destroy")
				local SelfEntry = self[Key]
				
				if SelfEntry == nil then
					SelfEntry = Count
					Count += 1
					self[Key] = SelfEntry
				end
				assert(Tbl[SelfEntry] == nil, "CompositionPlacement: placement is already registered")
				Tbl[SelfEntry] = {
					view = nil,
					viewType = ViewType,
					parentSignal = ParentSignal,
					props = Props,
					placeholder = Placeholder
				}
				Tbl2[SelfEntry] = true
				
				if not Flag and not Flag1 then
					Flag = true
					Callback()
				end
				local Flag2 = true
				
				return {
					setPlaceholder = function(Placeholder)
						-- upvalues: Flag2 (ref), Flag1 (upval), Tbl (upval), SelfEntry (ref), getPortState (upval), Tbl2 (upval), Flag (upval), Callback (upval)
						if not Flag2 or Flag1 then return end
						local Entry = Tbl[SelfEntry]
						
						if Entry == nil then return end
						local Placeholder1 = Entry.placeholder
						
						if Placeholder1 == Placeholder then return end
						if Placeholder1 ~= nil and Entry.view ~= nil then
							getPortState(Entry.view).port.apply(nil)
						end
						Entry.placeholder = Placeholder
						Tbl2[SelfEntry] = true
						
						if not Flag then
							if Flag1 then return end
							Flag = true
							Callback()
						end
					end,
					setProps = function(Props)
						-- upvalues: Flag2 (ref), Flag1 (upval), Tbl (upval), SelfEntry (ref), Tbl2 (upval), Flag (upval), Callback (upval)
						if not Flag2 or Flag1 then return end
						local Entry = Tbl[SelfEntry]
						
						if Entry == nil then return end
						Entry.props = Props
						Tbl2[SelfEntry] = true
						
						if not Flag then
							if Flag1 then return end
							Flag = true
							Callback()
						end
					end,
					unregister = function()
						-- upvalues: Flag2 (ref), Flag1 (upval), Tbl (upval), SelfEntry (ref), getPortState (upval), Tbl1 (upval), Tbl2 (upval), Flag (upval), Callback (upval)
						if not Flag2 then return end
						Flag2 = false
						
						if Flag1 then return end
						local Entry = Tbl[SelfEntry]
						
						if Entry == nil then return end
						if Entry.view ~= nil then
							getPortState(Entry.view).port.apply(nil)
						end
						Tbl[SelfEntry] = nil
						Tbl1[SelfEntry] = nil
						Tbl2[SelfEntry] = true
						
						if not Flag then
							if Flag1 then return end
							Flag = true
							Callback()
						end
					end
				}
			end,
			flush = function()
				-- upvalues: Flag (ref), Flag1 (ref), Tbl (copy), Tbl1 (copy), Tbl2 (copy), v1 (ref), ensureReconciler (copy)
				if not Flag or Flag1 then return end
				Flag = false
				local List = {}
				
				for PlacementId, value in Tbl do
					local Entry = Tbl1[PlacementId]
					
					if Tbl2[PlacementId] or Entry == nil then
						local ParentSignalResult = value.parentSignal(false)
						local Placeholder = value.placeholder
						Entry = nil
						
						if ParentSignalResult ~= nil and Placeholder ~= nil then
							local Key = ParentSignalResult.key
							Entry = {
								key = `{#Key}:{Key}:{PlacementId}`,
								viewType = value.viewType,
								index = ParentSignalResult.index,
								placementId = PlacementId,
								value = {
									props = value.props,
									placeholder = Placeholder,
									automaticSize = Enum.AutomaticSize.XY
								}
							}
						end
						Tbl1[PlacementId] = Entry
					end
					if Entry ~= nil then
						table.insert(List, Entry)
					end
				end
				table.clear(Tbl2)
				
				if #List > 0 or v1 ~= nil then
					ensureReconciler().update(List)
				end
			end,
			destroy = function()
				-- upvalues: Flag1 (ref), Flag (ref), v1 (ref), Tbl (copy), Tbl1 (copy), Tbl2 (copy), self1 (copy)
				if Flag1 then return end
				Flag1 = true
				Flag = false
				
				if v1 ~= nil then
					v1.update({})
				end
				table.clear(Tbl)
				table.clear(Tbl1)
				table.clear(Tbl2)
				table.clear(self1)
			end
		}
	end
}
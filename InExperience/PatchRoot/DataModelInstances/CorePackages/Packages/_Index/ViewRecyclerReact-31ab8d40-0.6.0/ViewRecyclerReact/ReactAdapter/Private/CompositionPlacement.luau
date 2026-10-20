local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local PlacementKindModule = require(script.Parent.PlacementKind)
local _ = require(ViewRecyclerReact.Parent.React)
local RecyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)
local Frozen = table.freeze({})

local function _(p1, p2): string
	return `{#p1}:{p1}:{p2}`
end

return {
	new = function(RecyclingScope)
		-- upvalues: ViewRecyclerModule (copy), RecyclableViewRegistryModule (copy), PlacementKindModule (copy), SignalsModule (copy), Frozen (copy)
		local SlotBinder = ViewRecyclerModule.Adapter.createSlotBinder({
			recyclingScope = RecyclingScope,
			prepareDesiredAssignment = function(p1)
				local Value = p1.value
				local Key = Value.parentAssignment.key
				
				return {
					key = `{#Key}:{Key}:{tonumber(p1.key)}`,
					value = Value.itemSignal
				}
			end
		})
		local Tbl = {}
		local Tbl1 = {}
		local self = setmetatable({}, { __mode = "k" })
		local Count = 1
		local Tbl2 = {}
		local Flag = false
		local Count1 = 0
		local Flag1 = false
		local Flag2 = false
		local Tbl3 = {}
		local Tbl4 = {}
		local self1 = setmetatable({}, { __mode = "k" })
		local Flush = nil
		local v1 = nil
		local v2 = nil
		local CompositionPlacement = nil
		
		local function _(p1)
			-- upvalues: Tbl4 (copy)
			local Entry = Tbl4[p1]
			
			if Entry ~= nil then
				for i in Entry do
					i()
				end
			end
		end
		
		local function detachDependency(Key)
			-- upvalues: self1 (copy), Tbl3 (copy), Tbl4 (copy)
			local SelfEntry = self1[Key]
			
			if SelfEntry == nil then return end
			self1[Key] = nil
			local Entry = Tbl3[SelfEntry]
			
			if Entry ~= nil then
				Entry[Key] = nil
				
				if next(Entry) == nil then
					Tbl3[SelfEntry] = nil
				end
			end
			local Entry1 = Tbl4[SelfEntry]
			
			if Entry1 ~= nil then
				for i in Entry1 do
					i()
				end
			end
		end
		
		local function attachDependency(ParentAssignment, Placement, Key)
			-- upvalues: RecyclableViewRegistryModule (upval), self1 (copy), Tbl3 (copy), Tbl4 (copy)
			local Metadata = RecyclableViewRegistryModule.getMetadata(Placement.viewType)
			
			if Metadata == nil or not Metadata.contributesToParentMeasurement then
				local SelfEntry = self1[Key]
				
				if SelfEntry == nil then return end
				self1[Key] = nil
				local Entry = Tbl3[SelfEntry]
				
				if Entry ~= nil then
					Entry[Key] = nil
					
					if next(Entry) == nil then
						Tbl3[SelfEntry] = nil
					end
				end
				local Entry1 = Tbl4[SelfEntry]
				
				if Entry1 ~= nil then
					for i in Entry1 do
						i()
					end
				end
				return
			else
				if self1[Key] == ParentAssignment then return end
				local SelfEntry = self1[Key]
				
				if SelfEntry ~= nil then
					self1[Key] = nil
					local Entry = Tbl3[SelfEntry]
					
					if Entry ~= nil then
						Entry[Key] = nil
						
						if next(Entry) == nil then
							Tbl3[SelfEntry] = nil
						end
					end
					local Entry2 = Tbl4[SelfEntry]
					
					if Entry2 ~= nil then
						for i1 in Entry2 do
							i1()
						end
					end
				end
				local Entry1 = Tbl3[ParentAssignment]
				
				if Entry1 == nil then
					Entry1 = {}
					Tbl3[ParentAssignment] = Entry1
				end
				Entry1[Key] = true
				self1[Key] = ParentAssignment
				local Entry = Tbl4[ParentAssignment]
				
				if Entry ~= nil then
					for i2 in Entry do
						i2()
					end
				end
			end
		end
		
		local function desiredFor(PlacementId)
			-- upvalues: Tbl (copy)
			local Entry = Tbl[PlacementId]
			
			if Entry == nil then
				return nil
			else
				local ParentSignalResult = Entry.parentSignal(false)
				local ActiveFunction = Entry.active
				local NoActiveFunction = ActiveFunction == nil or (if type(ActiveFunction) == "function" then ActiveFunction(false) else ActiveFunction)
				
				return if NoActiveFunction and ParentSignalResult ~= nil and Entry.placeholder ~= nil then {
					placementId = PlacementId,
					placement = Entry,
					parentAssignment = ParentSignalResult,
					placeholder = Entry.placeholder
				} else nil
			end
		end
		
		local function makeState(p2, Assignment)
			-- upvalues: PlacementKindModule (upval), CompositionPlacement (ref), attachDependency (copy), detachDependency (copy)
			local ParentAssignment = p2.parentAssignment
			local Placement = p2.placement
			
			return table.freeze({
				index = nil,
				assignment = Assignment,
				destination = table.freeze({
					kind = PlacementKindModule.Composition,
					placementId = p2.placementId,
					placeholder = p2.placeholder,
					automaticSize = Enum.AutomaticSize.XY,
					compositionPlacement = CompositionPlacement,
					attachMeasurementDependency = function(Key)
						-- upvalues: attachDependency (upval), ParentAssignment (copy), Placement (copy)
						attachDependency(ParentAssignment, Placement, Key)
					end,
					detachMeasurementDependency = detachDependency
				})
			})
		end
		
		local function reconcileDirty()
			-- upvalues: Tbl2 (copy), desiredFor (copy), Tbl1 (copy), SlotBinder (copy), Flag1 (ref), makeState (copy)
			local List = {}
			
			for i in Tbl2 do
				table.insert(List, i)
			end
			table.sort(List)
			local t = {}
			local List1 = {}
			local List2 = {}
			
			for _, PlacementId in List do
				local DesiredForResult = desiredFor(PlacementId)
				local Entry = Tbl1[PlacementId]
				
				if DesiredForResult ~= nil then
					t[PlacementId] = DesiredForResult
					table.insert(List2, {
						key = tostring(PlacementId),
						value = if Entry == nil or Entry.source.parentAssignment ~= DesiredForResult.parentAssignment or Entry.source.itemSignal ~= DesiredForResult.placement.itemSignal then table.freeze({
							parentAssignment = DesiredForResult.parentAssignment,
							itemSignal = DesiredForResult.placement.itemSignal
						}) else Entry.source,
						viewType = DesiredForResult.placement.viewType,
						placementId = PlacementId
					})
				elseif Entry ~= nil then
					table.insert(List1, (tostring(PlacementId)))
				end
			end
			table.clear(Tbl2)
			local Success, Result = pcall(SlotBinder.apply, List1, List2)
			
			if not Success then
				for _, value in List do
					Tbl2[value] = true
				end
				error(Result, 0)
			end
			for _, value1 in List do
				if t[value1] == nil then
					Tbl1[value1] = nil
				end
			end
			local t1 = {}
			
			for _, value2 in Result.entered do
				Tbl1[value2.placementId] = { state = nil, view = value2.view, source = value2.value }
				t1[value2.view] = true
			end
			for _, value3 in Result.updated do
				Tbl1[value3.placementId].source = value3.value
			end
			Flag1 = true
			
			for _, value4 in Result.departed do
				value4.transition(nil)
			end
			for _, value5 in List do
				local Entry = t[value5]
				local Entry1 = Tbl1[value5]
				
				if Entry ~= nil and Entry1 ~= nil then
					local Assignment = SlotBinder.get((tostring(value5))).assignment
					local State = Entry1.state
					
					if t1[Entry1.view] or State == nil or State.assignment ~= Assignment or State.destination.placeholder ~= Entry.placeholder then
						local State1 = makeState(Entry, Assignment)
						Entry1.state = State1
						Entry1.view.transition(State1)
					end
				end
			end
			Flag1 = false
		end
		
		Flush = function()
			-- upvalues: Flag2 (ref), Flag (ref), Flag1 (ref), Tbl2 (copy), reconcileDirty (copy)
			if Flag2 or Flag then return end
			assert(not Flag1, "CompositionPlacement: cannot flush after a publication failure")
			Flag = true
			local Success, Result = pcall(function()
				-- upvalues: Tbl2 (upval), reconcileDirty (upval)
				while next(Tbl2) ~= nil do
					reconcileDirty()
				end
			end)
			Flag = false
			
			if not Success then
				error(Result, 0)
			end
		end
		
		v1 = function()
			-- upvalues: Flag2 (ref), Tbl2 (copy), Count1 (ref), Flag (ref), Flush (ref)
			if not Flag2 and next(Tbl2) ~= nil and Count1 == 0 and not Flag then
				Flush()
			end
		end
		
		local _ = function(Key)
			-- upvalues: Flag2 (ref), Tbl2 (copy), v1 (ref)
			if not Flag2 then
				Tbl2[Key] = true
				v1()
			end
		end
		
		v2 = function(p2)
			-- upvalues: Count1 (ref), v1 (ref)
			Count1 += 1
			local Packed = table.pack(pcall(p2))
			Count1 -= 1
			
			if not Packed[1] then
				error(Packed[2], 0)
			end
			v1()
			
			return table.unpack(Packed, 2, Packed.n)
		end
		
		CompositionPlacement = {
			register = function(ViewType, p2, Callback, ItemSignal, Placeholder, Active)
				-- upvalues: v2 (ref), Flag2 (ref), self (copy), Count (ref), Tbl (copy), SignalsModule (upval), Tbl2 (copy), v1 (ref)
				return v2(function()
					-- upvalues: Flag2 (upval), self (upval), p2 (copy), Count (upval), Tbl (upval), ViewType (copy), Callback (copy), ItemSignal (copy), Placeholder (copy), Active (copy), SignalsModule (upval), Tbl2 (upval), v1 (upval), v2 (upval)
					assert(not Flag2, "CompositionPlacement: cannot register after destroy")
					local SelfEntry = self[p2]
					
					if SelfEntry == nil then
						SelfEntry = Count
						Count += 1
						self[p2] = SelfEntry
					end
					assert(Tbl[SelfEntry] == nil, "CompositionPlacement: placement is already registered")
					local config = {
						disposeActiveEffect = nil,
						disposeParentAssignmentEffect = nil,
						viewType = ViewType,
						parentSignal = Callback,
						itemSignal = ItemSignal,
						placeholder = Placeholder,
						active = Active
					}
					Tbl[SelfEntry] = config
					
					local function _()
						-- upvalues: config (copy), SignalsModule (upval), SelfEntry (ref), Flag2 (upval), Tbl2 (upval), v1 (upval)
						if type(config.active) == "function" then
							config.disposeActiveEffect = SignalsModule.createEffect(function(p3)
								-- upvalues: config (upval), SelfEntry (upval), Flag2 (upval), Tbl2 (upval), v1 (upval)
								config.active(p3)
								local v3 = SelfEntry
								
								if not Flag2 then
									Tbl2[v3] = true
									v1()
								end
							end)
						end
					end
					
					if type(config.active) == "function" then
						config.disposeActiveEffect = SignalsModule.createEffect(function(p3)
							-- upvalues: config (copy), SelfEntry (ref), Flag2 (upval), Tbl2 (upval), v1 (upval)
							config.active(p3)
							local v3 = SelfEntry
							
							if not Flag2 then
								Tbl2[v3] = true
								v1()
							end
						end)
					end
					local v3 = nil
					local Flag = false
					config.disposeParentAssignmentEffect = SignalsModule.createEffect(function(p3)
						-- upvalues: Callback (upval), Flag (ref), v3 (ref), SelfEntry (ref), Flag2 (upval), Tbl2 (upval), v1 (upval)
						local CallbackResult = Callback(p3)
						
						if not Flag or v3 ~= CallbackResult then
							Flag = true
							v3 = CallbackResult
							local SelfEntry1 = SelfEntry
							
							if not Flag2 then
								Tbl2[SelfEntry1] = true
								v1()
							end
						end
					end)
					local SelfEntry1: number = SelfEntry
					
					if not Flag2 then
						Tbl2[SelfEntry1] = true
						v1()
					end
					local Flag1 = true
					
					return {
						setActive = function(Active)
							-- upvalues: v2 (upval), Flag1 (ref), Flag2 (upval), config (copy), SignalsModule (upval), SelfEntry (ref), Tbl2 (upval), v1 (upval)
							v2(function()
								-- upvalues: Flag1 (upval), Flag2 (upval), config (upval), Active (copy), SignalsModule (upval), SelfEntry (upval), Tbl2 (upval), v1 (upval)
								if not Flag1 or Flag2 or config.active == Active then return end
								if config.disposeActiveEffect ~= nil then
									config.disposeActiveEffect()
									config.disposeActiveEffect = nil
								end
								config.active = Active
								
								if type(config.active) == "function" then
									config.disposeActiveEffect = SignalsModule.createEffect(function(p3)
										-- upvalues: config (upval), SelfEntry (upval), Flag2 (upval), Tbl2 (upval), v1 (upval)
										config.active(p3)
										local v4 = SelfEntry
										
										if not Flag2 then
											Tbl2[v4] = true
											v1()
										end
									end)
								end
								local SelfEntry1 = SelfEntry
								
								if not Flag2 then
									Tbl2[SelfEntry1] = true
									v1()
								end
							end)
						end,
						setPlaceholder = function(Placeholder)
							-- upvalues: v2 (upval), Flag1 (ref), Flag2 (upval), config (copy), SelfEntry (ref), Tbl2 (upval), v1 (upval)
							v2(function()
								-- upvalues: Flag1 (upval), Flag2 (upval), config (upval), Placeholder (copy), SelfEntry (upval), Tbl2 (upval), v1 (upval)
								if Flag1 and not Flag2 and config.placeholder ~= Placeholder then
									config.placeholder = Placeholder
									local SelfEntry1 = SelfEntry
									
									if not Flag2 then
										Tbl2[SelfEntry1] = true
										v1()
									end
								end
							end)
						end,
						setItemSignal = function(ItemSignal)
							-- upvalues: v2 (upval), Flag1 (ref), Flag2 (upval), config (copy), SelfEntry (ref), Tbl2 (upval), v1 (upval)
							v2(function()
								-- upvalues: Flag1 (upval), Flag2 (upval), config (upval), ItemSignal (copy), SelfEntry (upval), Tbl2 (upval), v1 (upval)
								if Flag1 and not Flag2 and config.itemSignal ~= ItemSignal then
									config.itemSignal = ItemSignal
									local SelfEntry1 = SelfEntry
									
									if not Flag2 then
										Tbl2[SelfEntry1] = true
										v1()
									end
								end
							end)
						end,
						unregister = function()
							-- upvalues: v2 (upval), Flag1 (ref), Flag2 (upval), config (copy), Tbl (upval), SelfEntry (ref), Tbl2 (upval), v1 (upval)
							v2(function()
								-- upvalues: Flag1 (upval), Flag2 (upval), config (upval), Tbl (upval), SelfEntry (upval), Tbl2 (upval), v1 (upval)
								if not Flag1 then return end
								Flag1 = false
								
								if Flag2 then return end
								if config.disposeActiveEffect ~= nil then
									config.disposeActiveEffect()
								end
								if config.disposeParentAssignmentEffect ~= nil then
									config.disposeParentAssignmentEffect()
								end
								Tbl[SelfEntry] = nil
								local SelfEntry1 = SelfEntry
								
								if not Flag2 then
									Tbl2[SelfEntry1] = true
									v1()
								end
							end)
						end
					}
				end)
			end,
			getMeasurementDependencies = function(p2)
				-- upvalues: Tbl3 (copy), Frozen (upval)
				local Entry = Tbl3[p2]
				
				if Entry == nil then
					return Frozen
				end
				local List = {}
				
				for i in Entry do
					table.insert(List, i)
				end
				return List
			end,
			subscribeMeasurementDependencies = function(Key, Key1)
				-- upvalues: Flag2 (ref), Tbl4 (copy)
				assert(not Flag2, "CompositionPlacement: cannot subscribe after destroy")
				local Entry = Tbl4[Key]
				
				if Entry == nil then
					Entry = {}
					Tbl4[Key] = Entry
				end
				Entry[Key1] = true
				local Flag = true
				
				return function()
					-- upvalues: Flag (ref), Entry (ref), Key1 (copy), Tbl4 (upval), Key (copy)
					if Flag then
						Flag = false
						Entry[Key1] = nil
						
						if next(Entry) == nil then
							Tbl4[Key] = nil
						end
					end
				end
			end,
			flush = Flush,
			destroy = function()
				-- upvalues: Flag2 (ref), Tbl2 (copy), Tbl (copy), Tbl1 (copy), SlotBinder (copy), Tbl3 (copy), Tbl4 (copy), self1 (copy)
				if Flag2 then return end
				Flag2 = true
				table.clear(Tbl2)
				
				for _, value in Tbl do
					if value.disposeActiveEffect ~= nil then
						value.disposeActiveEffect()
					end
					if value.disposeParentAssignmentEffect ~= nil then
						value.disposeParentAssignmentEffect()
					end
				end
				for _, value1 in Tbl1 do
					value1.view.transition(nil)
				end
				SlotBinder.destroy()
				table.clear(Tbl)
				table.clear(Tbl1)
				table.clear(Tbl3)
				table.clear(Tbl4)
				table.clear(self1)
			end
		}
		
		return CompositionPlacement
	end
}
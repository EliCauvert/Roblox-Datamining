local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecyclerReact").Flags).FFlagViewRecyclerReact08
local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local DestinationModule = require(script.Parent.Destination)
local PlacementModule = require(script.Parent.Placement)
local PlacementKindModule = require(script.Parent.PlacementKind)
local _ = require(ViewRecyclerReact.Parent.React)
local _ = require(script.Parent.RecyclableView)
local _ = require(script.Parent.RecyclableViewRegistry)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)

local function _(p1, p2): string
	return `{#p1}:{p1}:{p2}`
end

return {
	new = function(RecyclingScope)
		-- upvalues: FFlagViewRecyclerReact08 (copy), PlacementModule (copy), ViewRecyclerModule (copy), DestinationModule (copy), PlacementKindModule (copy), SignalsModule (copy)
		local NewResult = nil
		local SlotBinder = nil
		
		if FFlagViewRecyclerReact08 then
			NewResult = PlacementModule.new(RecyclingScope, { name = "CompositionPlacement", namespace = "composition" })
		else
			SlotBinder = ViewRecyclerModule.Adapter.createSlotBinder({
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
		end
		local Tbl1 = {}
		local Frozens = nil
		local Tbl = nil
		local v1 = nil
		
		if FFlagViewRecyclerReact08 then
			Frozens = {}
			Tbl = {}
		else
			v1 = {}
		end
		local self = setmetatable({}, { __mode = "k" })
		local Count = 1
		local Tbl2 = {}
		local Flag = false
		local Count1 = 0
		local Flag1 = if FFlagViewRecyclerReact08 then nil else false
		local Flag2 = false
		local v2 = nil
		local v3 = nil
		local v4 = nil
		local CompositionPlacement = nil
		local Callback1: ((any) -> any)? = nil
		local Callback2: ((any) -> any)? = nil
		local Callback: ((any, any) -> any)? = nil
		
		if FFlagViewRecyclerReact08 then
			Callback1 = function(PlacementId)
				-- upvalues: Tbl1 (copy), Frozens (ref), DestinationModule (upval), Tbl (ref)
				local Entry = Tbl1[PlacementId]
				
				if Entry == nil then
					return nil
				end
				local ParentSignalResult = Entry.parentSignal(false)
				local ViewTypeResult = Entry.viewType(false)
				local Placeholder = Entry.placeholder
				
				if ViewTypeResult == nil or ParentSignalResult == nil or Placeholder == nil then
					return nil
				end
				local Frozen = Frozens[PlacementId]
				
				if Frozen == nil or Frozen.placeholder ~= Placeholder then
					Frozen = table.freeze({
						kind = DestinationModule.Kind.Composition,
						placementId = PlacementId,
						placeholder = Placeholder,
						automaticSize = Enum.AutomaticSize.XY
					})
					Frozens[PlacementId] = Frozen
				end
				local Entry1 = Tbl[PlacementId]
				local Key = ParentSignalResult.key
				
				return {
					key = tostring(PlacementId),
					viewType = ViewTypeResult,
					value = Entry.itemSignal,
					assignmentKey = `{#Key}:{Key}:{PlacementId}`,
					changed = Entry1 ~= nil and Entry1 ~= ParentSignalResult,
					destination = Frozen
				}, ParentSignalResult
			end
		else
			Callback2 = function(PlacementId)
				-- upvalues: Tbl1 (copy)
				local Entry = Tbl1[PlacementId]
				
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
			
			Callback = function(p1, Assignment)
				-- upvalues: PlacementKindModule (upval), CompositionPlacement (ref)
				return table.freeze({
					index = nil,
					assignment = Assignment,
					destination = table.freeze({
						kind = PlacementKindModule.Composition,
						placementId = p1.placementId,
						placeholder = p1.placeholder,
						automaticSize = Enum.AutomaticSize.XY,
						compositionPlacement = CompositionPlacement
					})
				})
			end
		end
		local function reconcileDirty()
			-- upvalues: Tbl2 (copy), FFlagViewRecyclerReact08 (upval), Callback1 (ref), Frozens (ref), Callback2 (ref), v1 (ref), NewResult (ref), SlotBinder (ref), Tbl (ref), Flag1 (ref), Callback (ref)
			local List = {}
			
			for i in Tbl2 do
				table.insert(List, i)
			end
			table.sort(List)
			local T = if FFlagViewRecyclerReact08 then nil else {}
			local List1 = {}
			local List2 = {}
			local T1 = if FFlagViewRecyclerReact08 then {} else nil
			for _, PlacementId in List do
				if FFlagViewRecyclerReact08 then
					local CallbackResult, CallbackResult2 = Callback1(PlacementId)
					
					if CallbackResult == nil then
						Frozens[PlacementId] = nil
						table.insert(List1, (tostring(PlacementId)))
						continue
					else
						table.insert(List2, CallbackResult)
						T1[PlacementId] = CallbackResult2
						continue
					end
				else
					local CallbackResult1 = Callback2(PlacementId)
					local v5 = v1[PlacementId]
					
					if CallbackResult1 ~= nil then
						T[PlacementId] = CallbackResult1
						table.insert(List2, {
							key = tostring(PlacementId),
							value = if v5 == nil or v5.source.parentAssignment ~= CallbackResult1.parentAssignment or v5.source.itemSignal ~= CallbackResult1.placement.itemSignal then table.freeze({
								parentAssignment = CallbackResult1.parentAssignment,
								itemSignal = CallbackResult1.placement.itemSignal
							}) else v5.source,
							viewType = CallbackResult1.placement.viewType,
							placementId = PlacementId
						})
						continue
					elseif v5 ~= nil then
						table.insert(List1, (tostring(PlacementId)))
					end
				end
			end
			table.clear(Tbl2)
			local v6 = nil
			local v7 = nil
			local v8 = nil
			local v9 = nil
			
			if FFlagViewRecyclerReact08 then
				v6, v55 = pcall(NewResult.exchange, List1, List2)
			else
				v8, v57 = pcall(SlotBinder.apply, List1, List2)
			end
			if not (if FFlagViewRecyclerReact08 then v6 else v8) then
				for _, value1 in List do
					Tbl2[value1] = true
				end
				error(if FFlagViewRecyclerReact08 then v7 else v9, 0)
			end
			for _, value3 in List do
				if FFlagViewRecyclerReact08 then
					Tbl[value3] = T1[value3]
				elseif T[value3] == nil then
					v1[value3] = nil
				end
			end
			if not FFlagViewRecyclerReact08 then
				local t = {}
				
				for _, value4 in v9.entered do
					v1[value4.placementId] = { state = nil, view = value4.view, source = value4.value }
					t[value4.view] = true
				end
				for _, value in v9.updated do
					v1[value.placementId].source = value.value
				end
				Flag1 = true
				
				for _, value5 in v9.departed do
					value5.transition(nil)
				end
				for _, value2 in List do
					local Entry = T[value2]
					local v10 = v1[value2]
					
					if Entry ~= nil and v10 ~= nil then
						local Assignment = SlotBinder.get((tostring(value2))).assignment
						local State = v10.state
						
						if t[v10.view] or State == nil or State.assignment ~= Assignment or State.destination.placeholder ~= Entry.placeholder then
							local CallbackResult3 = Callback(Entry, Assignment)
							v10.state = CallbackResult3
							v10.view.transition(CallbackResult3)
						end
					end
				end
				Flag1 = false
			end
		end
		
		v2 = function()
			-- upvalues: Flag2 (ref), Flag (ref), FFlagViewRecyclerReact08 (upval), Flag1 (ref), Tbl2 (copy), reconcileDirty (copy)
			if Flag2 or Flag then return end
			if not FFlagViewRecyclerReact08 then
				assert(not Flag1, "CompositionPlacement: cannot flush after a publication failure")
			end
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
		
		v3 = function()
			-- upvalues: Flag2 (ref), Tbl2 (copy), Count1 (ref), Flag (ref), v2 (ref)
			if not Flag2 and next(Tbl2) ~= nil and Count1 == 0 and not Flag then
				v2()
			end
		end
		
		local function _(Key)
			-- upvalues: Flag2 (ref), Tbl2 (copy), v3 (ref)
			if not Flag2 then
				Tbl2[Key] = true
				v3()
			end
		end
		
		local MarkDirtyOnChange = if FFlagViewRecyclerReact08 then function(p1, Callback)
			-- upvalues: SignalsModule (upval), Flag2 (ref), Tbl2 (copy), v3 (ref)
			local v11 = nil
			local Flag = false
			
			return SignalsModule.createEffect(function(p2)
				-- upvalues: Callback (copy), Flag (ref), v11 (ref), p1 (copy), Flag2 (upval), Tbl2 (upval), v3 (upval)
				local CallbackResult = Callback(p2)
				
				if not Flag or v11 ~= CallbackResult then
					Flag = true
					v11 = CallbackResult
					
					if not Flag2 then
						Tbl2[p1] = true
						v3()
					end
				end
			end)
		end else nil
		
		v4 = function(p1)
			-- upvalues: Count1 (ref), v3 (ref)
			Count1 += 1
			local Packed = table.pack(pcall(p1))
			Count1 -= 1
			
			if not Packed[1] then
				error(Packed[2], 0)
			end
			v3()
			
			return table.unpack(Packed, 2, Packed.n)
		end
		
		CompositionPlacement = {
			register = if FFlagViewRecyclerReact08 then function(ViewType, p1, ParentSignal, ItemSignal, Placeholder)
				-- upvalues: v4 (ref), Flag2 (ref), self (copy), Count (ref), Tbl1 (copy), MarkDirtyOnChange (ref), Tbl2 (copy), v3 (ref)
				return v4(function()
					-- upvalues: Flag2 (upval), self (upval), p1 (copy), Count (upval), Tbl1 (upval), ViewType (copy), ParentSignal (copy), ItemSignal (copy), Placeholder (copy), MarkDirtyOnChange (upval), Tbl2 (upval), v3 (upval), v4 (upval)
					assert(not Flag2, "CompositionPlacement: cannot register after destroy")
					local SelfEntry = self[p1]
					
					if SelfEntry == nil then
						SelfEntry = Count
						Count += 1
						self[p1] = SelfEntry
					end
					assert(Tbl1[SelfEntry] == nil, "CompositionPlacement: placement is already registered")
					local config = {
						disposeViewTypeEffect = nil,
						disposeParentAssignmentEffect = nil,
						viewType = ViewType,
						parentSignal = ParentSignal,
						itemSignal = ItemSignal,
						placeholder = Placeholder
					}
					Tbl1[SelfEntry] = config
					config.disposeViewTypeEffect = MarkDirtyOnChange(SelfEntry, ViewType)
					config.disposeParentAssignmentEffect = MarkDirtyOnChange(SelfEntry, ParentSignal)
					local SelfEntry1: number = SelfEntry
					
					if not Flag2 then
						Tbl2[SelfEntry1] = true
						v3()
					end
					local Flag = true
					
					return {
						setViewType = function(ViewType)
							-- upvalues: v4 (upval), Flag (ref), Flag2 (upval), config (copy), MarkDirtyOnChange (upval), SelfEntry (ref)
							v4(function()
								-- upvalues: Flag (upval), Flag2 (upval), config (upval), ViewType (copy), MarkDirtyOnChange (upval), SelfEntry (upval)
								if not Flag or Flag2 or config.viewType == ViewType then return end
								if config.disposeViewTypeEffect ~= nil then
									config.disposeViewTypeEffect()
								end
								config.viewType = ViewType
								config.disposeViewTypeEffect = MarkDirtyOnChange(SelfEntry, ViewType)
							end)
						end,
						setPlaceholder = function(Placeholder)
							-- upvalues: v4 (upval), Flag (ref), Flag2 (upval), config (copy), SelfEntry (ref), Tbl2 (upval), v3 (upval)
							v4(function()
								-- upvalues: Flag (upval), Flag2 (upval), config (upval), Placeholder (copy), SelfEntry (upval), Tbl2 (upval), v3 (upval)
								if Flag and not Flag2 and config.placeholder ~= Placeholder then
									config.placeholder = Placeholder
									local SelfEntry1 = SelfEntry
									
									if not Flag2 then
										Tbl2[SelfEntry1] = true
										v3()
									end
								end
							end)
						end,
						setItemSignal = function(ItemSignal)
							-- upvalues: v4 (upval), Flag (ref), Flag2 (upval), config (copy), SelfEntry (ref), Tbl2 (upval), v3 (upval)
							v4(function()
								-- upvalues: Flag (upval), Flag2 (upval), config (upval), ItemSignal (copy), SelfEntry (upval), Tbl2 (upval), v3 (upval)
								if Flag and not Flag2 and config.itemSignal ~= ItemSignal then
									config.itemSignal = ItemSignal
									local SelfEntry1 = SelfEntry
									
									if not Flag2 then
										Tbl2[SelfEntry1] = true
										v3()
									end
								end
							end)
						end,
						unregister = function()
							-- upvalues: v4 (upval), Flag (ref), Flag2 (upval), config (copy), Tbl1 (upval), SelfEntry (ref), Tbl2 (upval), v3 (upval)
							v4(function()
								-- upvalues: Flag (upval), Flag2 (upval), config (upval), Tbl1 (upval), SelfEntry (upval), Tbl2 (upval), v3 (upval)
								if not Flag then return end
								Flag = false
								
								if Flag2 then return end
								if config.disposeViewTypeEffect ~= nil then
									config.disposeViewTypeEffect()
								end
								if config.disposeParentAssignmentEffect ~= nil then
									config.disposeParentAssignmentEffect()
								end
								Tbl1[SelfEntry] = nil
								local SelfEntry1 = SelfEntry
								
								if not Flag2 then
									Tbl2[SelfEntry1] = true
									v3()
								end
							end)
						end
					}
				end)
			end else function(ViewType, p1, Callback, ItemSignal, Placeholder, Active)
				-- upvalues: v4 (ref), Flag2 (ref), self (copy), Count (ref), Tbl1 (copy), SignalsModule (upval), Tbl2 (copy), v3 (ref)
				return v4(function()
					-- upvalues: Flag2 (upval), self (upval), p1 (copy), Count (upval), Tbl1 (upval), ViewType (copy), Callback (copy), ItemSignal (copy), Placeholder (copy), Active (copy), SignalsModule (upval), Tbl2 (upval), v3 (upval), v4 (upval)
					assert(not Flag2, "CompositionPlacement: cannot register after destroy")
					local SelfEntry = self[p1]
					
					if SelfEntry == nil then
						SelfEntry = Count
						Count += 1
						self[p1] = SelfEntry
					end
					assert(Tbl1[SelfEntry] == nil, "CompositionPlacement: placement is already registered")
					local config = {
						disposeActiveEffect = nil,
						disposeParentAssignmentEffect = nil,
						viewType = ViewType,
						parentSignal = Callback,
						itemSignal = ItemSignal,
						placeholder = Placeholder,
						active = Active
					}
					Tbl1[SelfEntry] = config
					
					local function _()
						-- upvalues: config (copy), SignalsModule (upval), SelfEntry (ref), Flag2 (upval), Tbl2 (upval), v3 (upval)
						if type(config.active) == "function" then
							config.disposeActiveEffect = SignalsModule.createEffect(function(p2)
								-- upvalues: config (upval), SelfEntry (upval), Flag2 (upval), Tbl2 (upval), v3 (upval)
								config.active(p2)
								local v11 = SelfEntry
								
								if not Flag2 then
									Tbl2[v11] = true
									v3()
								end
							end)
						end
					end
					
					if type(config.active) == "function" then
						config.disposeActiveEffect = SignalsModule.createEffect(function(p2)
							-- upvalues: config (copy), SelfEntry (ref), Flag2 (upval), Tbl2 (upval), v3 (upval)
							config.active(p2)
							local v11 = SelfEntry
							
							if not Flag2 then
								Tbl2[v11] = true
								v3()
							end
						end)
					end
					local v11 = nil
					local Flag = false
					config.disposeParentAssignmentEffect = SignalsModule.createEffect(function(p2)
						-- upvalues: Callback (upval), Flag (ref), v11 (ref), SelfEntry (ref), Flag2 (upval), Tbl2 (upval), v3 (upval)
						local CallbackResult = Callback(p2)
						
						if not Flag or v11 ~= CallbackResult then
							Flag = true
							v11 = CallbackResult
							local SelfEntry1 = SelfEntry
							
							if not Flag2 then
								Tbl2[SelfEntry1] = true
								v3()
							end
						end
					end)
					local SelfEntry1: number = SelfEntry
					
					if not Flag2 then
						Tbl2[SelfEntry1] = true
						v3()
					end
					local Flag1 = true
					
					return {
						setActive = function(Active)
							-- upvalues: v4 (upval), Flag1 (ref), Flag2 (upval), config (copy), SignalsModule (upval), SelfEntry (ref), Tbl2 (upval), v3 (upval)
							v4(function()
								-- upvalues: Flag1 (upval), Flag2 (upval), config (upval), Active (copy), SignalsModule (upval), SelfEntry (upval), Tbl2 (upval), v3 (upval)
								if not Flag1 or Flag2 or config.active == Active then return end
								if config.disposeActiveEffect ~= nil then
									config.disposeActiveEffect()
									config.disposeActiveEffect = nil
								end
								config.active = Active
								
								if type(config.active) == "function" then
									config.disposeActiveEffect = SignalsModule.createEffect(function(p2)
										-- upvalues: config (upval), SelfEntry (upval), Flag2 (upval), Tbl2 (upval), v3 (upval)
										config.active(p2)
										local v12 = SelfEntry
										
										if not Flag2 then
											Tbl2[v12] = true
											v3()
										end
									end)
								end
								local SelfEntry1 = SelfEntry
								
								if not Flag2 then
									Tbl2[SelfEntry1] = true
									v3()
								end
							end)
						end,
						setPlaceholder = function(Placeholder)
							-- upvalues: v4 (upval), Flag1 (ref), Flag2 (upval), config (copy), SelfEntry (ref), Tbl2 (upval), v3 (upval)
							v4(function()
								-- upvalues: Flag1 (upval), Flag2 (upval), config (upval), Placeholder (copy), SelfEntry (upval), Tbl2 (upval), v3 (upval)
								if Flag1 and not Flag2 and config.placeholder ~= Placeholder then
									config.placeholder = Placeholder
									local SelfEntry1 = SelfEntry
									
									if not Flag2 then
										Tbl2[SelfEntry1] = true
										v3()
									end
								end
							end)
						end,
						setItemSignal = function(ItemSignal)
							-- upvalues: v4 (upval), Flag1 (ref), Flag2 (upval), config (copy), SelfEntry (ref), Tbl2 (upval), v3 (upval)
							v4(function()
								-- upvalues: Flag1 (upval), Flag2 (upval), config (upval), ItemSignal (copy), SelfEntry (upval), Tbl2 (upval), v3 (upval)
								if Flag1 and not Flag2 and config.itemSignal ~= ItemSignal then
									config.itemSignal = ItemSignal
									local SelfEntry1 = SelfEntry
									
									if not Flag2 then
										Tbl2[SelfEntry1] = true
										v3()
									end
								end
							end)
						end,
						unregister = function()
							-- upvalues: v4 (upval), Flag1 (ref), Flag2 (upval), config (copy), Tbl1 (upval), SelfEntry (ref), Tbl2 (upval), v3 (upval)
							v4(function()
								-- upvalues: Flag1 (upval), Flag2 (upval), config (upval), Tbl1 (upval), SelfEntry (upval), Tbl2 (upval), v3 (upval)
								if not Flag1 then return end
								Flag1 = false
								
								if Flag2 then return end
								if config.disposeActiveEffect ~= nil then
									config.disposeActiveEffect()
								end
								if config.disposeParentAssignmentEffect ~= nil then
									config.disposeParentAssignmentEffect()
								end
								Tbl1[SelfEntry] = nil
								local SelfEntry1 = SelfEntry
								
								if not Flag2 then
									Tbl2[SelfEntry1] = true
									v3()
								end
							end)
						end
					}
				end)
			end,
			destroy = function()
				-- upvalues: Flag2 (ref), Tbl2 (copy), FFlagViewRecyclerReact08 (upval), Tbl1 (copy), NewResult (ref), v1 (ref), SlotBinder (ref), Frozens (ref), Tbl (ref)
				if Flag2 then return end
				Flag2 = true
				table.clear(Tbl2)
				
				if FFlagViewRecyclerReact08 then
					for _, value in Tbl1 do
						if value.disposeViewTypeEffect ~= nil then
							value.disposeViewTypeEffect()
						end
						if value.disposeParentAssignmentEffect ~= nil then
							value.disposeParentAssignmentEffect()
						end
					end
					NewResult.destroy()
				else
					for _, value1 in Tbl1 do
						if value1.disposeActiveEffect ~= nil then
							value1.disposeActiveEffect()
						end
						if value1.disposeParentAssignmentEffect ~= nil then
							value1.disposeParentAssignmentEffect()
						end
					end
					for _, value2 in v1 do
						value2.view.transition(nil)
					end
					SlotBinder.destroy()
				end
				table.clear(Tbl1)
				table.clear(if FFlagViewRecyclerReact08 then Frozens else v1)
				
				if FFlagViewRecyclerReact08 then
					table.clear(Tbl)
				end
			end,
			flush = if FFlagViewRecyclerReact08 then nil else v2
		}
		
		return CompositionPlacement
	end
}
local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local DestinationModule = require(script.Parent.Destination)
local _ = require(script.Parent.RecyclableView)
local _ = require(script.Parent.RecyclableViewRegistry)
local SignalsExperimentalModule = require(ViewRecyclerReact.Parent.SignalsExperimental)

return {
	new = function(RecyclingScope, p1)
		-- upvalues: ViewRecyclerModule (copy), DestinationModule (copy), SignalsExperimentalModule (copy)
		local Name = p1.name
		local Namespace = p1.namespace
		local SlotBinder = ViewRecyclerModule.Adapter.createSlotBinder({
			recyclingScope = RecyclingScope,
			name = Name,
			prepareDesiredAssignment = function(p2)
				-- upvalues: Namespace (copy)
				return {
					key = p2.assignmentKey or Namespace .. ":" .. p2.key,
					value = p2.value
				}
			end
		})
		local Tbl = {}
		local Flag = false
		local Flag1 = false
		local Flag2 = false
		
		local function publish(Departed, List)
			-- upvalues: SlotBinder (copy), Tbl (copy), DestinationModule (upval)
			for _, value in Departed do
				value.transition(nil)
			end
			for _, value1 in List do
				local Key = value1.key
				local GetResult = SlotBinder.get(Key)
				local View = GetResult.view
				local Entry = Tbl[Key]
				
				if Entry == nil or Entry.view ~= View or Entry.assignment ~= GetResult.assignment or Entry.destination ~= value1.destination then
					Entry = {
						view = View,
						assignment = GetResult.assignment,
						destination = value1.destination
					}
					Tbl[Key] = Entry
					View.transition(table.freeze({
						index = nil,
						assignment = GetResult.assignment,
						destination = value1.destination
					}))
				end
				local Geometry = value1.geometry
				local PortalFrameResult = View.portalFrame(false)
				
				if Geometry ~= nil and PortalFrameResult ~= nil then
					assert(value1.destination.kind == DestinationModule.Kind.Rect, "Placement: geometry requires a Rect Destination")
					local Entry1 = Entry
					local Position = Geometry.position
					local Size = Geometry.size
					
					if Entry1.position ~= Position then
						Entry1.position = Position
						PortalFrameResult.Position = UDim2.fromOffset(Position.X, Position.Y)
					end
					if Entry1.size ~= Size then
						Entry1.size = Size
						PortalFrameResult.Size = UDim2.fromOffset(Size.X, Size.Y)
					end
					if Entry1.zIndex ~= Geometry.zIndex then
						Entry1.zIndex = Geometry.zIndex
						PortalFrameResult.ZIndex = Geometry.zIndex
					end
				end
			end
		end
		
		local function apply(List, Entry)
			-- upvalues: Tbl (copy), SlotBinder (copy), Flag1 (ref), SignalsExperimentalModule (upval), publish (copy)
			local Buffer = table.create(#Entry)
			
			for i, value in Entry do
				local Key = value.key
				local AssignmentKey = value.assignmentKey
				local IsChanged = value.changed == true
				
				if AssignmentKey ~= nil then
					local Entry1 = Tbl[Key]
					IsChanged = IsChanged or Entry1 ~= nil and Entry1.assignment.key ~= AssignmentKey
				end
				Buffer[i] = {
					key = Key,
					value = value.value,
					viewType = value.viewType,
					changed = IsChanged,
					assignmentKey = AssignmentKey
				}
			end
			local SyncResult = nil
			
			if List == nil then
				SyncResult = SlotBinder.sync(Buffer)
				
				for i1 in Tbl do
					if SlotBinder.get(i1) == nil then
						Tbl[i1] = nil
					end
				end
			else
				SyncResult = SlotBinder.apply(List, Buffer)
				
				for _, value1 in List do
					if SlotBinder.get(value1) == nil then
						Tbl[value1] = nil
					end
				end
			end
			Flag1 = true
			
			if #SyncResult.departed + #Entry > 1 or Entry[1] ~= nil and Entry[1].geometry ~= nil then
				SignalsExperimentalModule.batch(function()
					-- upvalues: publish (upval), SyncResult (ref), Entry (copy)
					publish(SyncResult.departed, Entry)
				end)
			else
				publish(SyncResult.departed, Entry)
			end
			Flag1 = false
		end
		
		local function exchange(p2, p3)
			-- upvalues: Flag2 (ref), Name (copy), Flag (ref), Flag1 (ref), apply (copy)
			if Flag2 then
				error(`{Name}: cannot place views after destruction`)
			elseif Flag then
				error(`{Name}: cannot place views reentrantly`)
			elseif Flag1 then
				error(`{Name}: cannot place views after a publication failure`)
			end
			Flag = true
			local Success, Result = pcall(apply, p2, p3)
			Flag = false
			
			if not Success then
				error(Result, 0)
			end
		end
		
		local function releaseAll()
			-- upvalues: Flag (ref), Name (copy), Tbl (copy), SlotBinder (copy), SignalsExperimentalModule (upval)
			assert(not Flag, `{Name}: cannot release views during placement`)
			table.clear(Tbl)
			local ReleaseAllResult = SlotBinder.releaseAll()
			SignalsExperimentalModule.batch(function()
				-- upvalues: ReleaseAllResult (copy)
				for _, value in ReleaseAllResult do
					value.transition(nil)
				end
			end)
		end
		
		return {
			exchange = exchange,
			sync = function(p2)
				-- upvalues: exchange (copy)
				exchange(nil, p2)
			end,
			releaseAll = function()
				-- upvalues: Flag2 (ref), releaseAll (copy)
				if not Flag2 then
					releaseAll()
				end
			end,
			hasDestroyedView = function(): boolean
				-- upvalues: Tbl (copy)
				for _, value in Tbl do
					if value.view.isHostDestroyed() then
						return true
					end
				end
				return false
			end,
			destroy = function()
				-- upvalues: Flag2 (ref), releaseAll (copy), SlotBinder (copy)
				if not Flag2 then
					releaseAll()
					SlotBinder.destroy()
					Flag2 = true
					
					return
				end
			end
		}
	end
}
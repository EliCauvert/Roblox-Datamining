local _ = require("./control_types")
local ActivationModule = require("./activation")
local CollectionPaintModule = require("./collection_paint")
local _ = require("./collection_reorder")
local CollectionPolicyModule = require("./collection_policy")
local TravelEngineModule = require("./travel_engine")
local CoreModule = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./engine_types")
local _ = require("./collection_types")
local CollectionStateModule = require("./collection_state")
local _ = require("./collection_slots")
local CollectionHighlightModule = require("./collection_highlight")

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: CollectionHighlightModule (copy), CollectionPolicyModule (copy), ActivationModule (copy), CoreModule (copy), CollectionStateModule (copy), TravelEngineModule (copy), CollectionPaintModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local ReadSourceFunction = p1.readSource
	local Observe = p1.observe
	local TypesUDim2 = p1.types.UDim2
	local TypesUDim = p1.types.UDim
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local GuiService = p1.config.guiService
	local Spec = p3.spec
	local Tree = p3.tree
	local HasFocus: boolean = GuiService == nil and Spec.focus ~= nil or GuiService ~= nil and Spec.mode ~= "all"
	local RowSignals = p3.rowSignals
	local Kind = p3.kind
	local SourceFunction = p3.source
	local Viewport = p3.viewport
	local Cross = p3.cross
	local MountedVersion = p3.mountedVersion
	local Status = p3.status
	local Controls = p3.controls
	local Coordinator = p3.coordinator
	local SelectionMode = p3.selectionMode
	local IsNotNone: boolean = Spec.selectionIndicator ~= false and SelectionMode ~= "none"
	local CollectionHighlightModuleResult = CollectionHighlightModule(Compose, p3.selection, Spec.selection ~= nil or SelectionMode ~= "none", function(p7, p8, p9)
		-- upvalues: IsNotNone (copy)
		local IsNotNone1 = p8 ~= "none"
		local IsOnly = p8 == "only"
		local IsNotNone2 = if p9 == nil then nil else p9 ~= "none"
		local Hit = p7.hit
		
		if Hit then
			if p7.onlySelected and (p9 == nil or p9 == "only" ~= IsOnly) then
				Hit:SetAttribute("FacetOnlySelected", IsOnly)
			end
			if IsNotNone2 ~= IsNotNone1 then
				Hit:SetAttribute("FacetSelected", IsNotNone1)
			end
		end
		if IsNotNone and IsNotNone2 == true ~= IsNotNone1 then
			if IsNotNone1 then
				p7.logical:AddTag("facet-selected")
			else
				p7.logical:RemoveTag("facet-selected")
			end
		end
		local Selected = p7.selected
		
		if Selected then
			Selected:set(IsNotNone1)
		end
	end)
	local Measured = p3.measured
	local ContainsCards = p3.containsCards
	local Horizontal = p3.horizontal
	local ReducedFunction = p3.reduced
	local IsValue = Compose.isValue(Spec.contentOverflow) or type(Spec.contentOverflow) == "function"
	local Mounted = p3.mounted
	local CellEdits = p3.cellEdits
	local Placed = p3.placed
	local PoolOwner = p3.poolOwner
	local Preparing = p3.preparing
	local Waiting = p3.waiting
	local CrossEdgeFunction = p3.crossEdge
	local FullSizesFunction = p3.fullSizes
	local FromScaleResult = TypesUDim2.fromScale(1, 1)
	local FromScaleResult1 = TypesUDim2.fromScale(0.5, 0.5)
	local NewTypesVector = TypesVector2.new(0.5, 0.5)
	local self = setmetatable({}, { __mode = "k" })
	
	local function keysOf(Key)
		-- upvalues: self (copy), p3 (copy)
		local SelfEntry = self[Key]
		
		if SelfEntry == nil then
			local Buffer = table.create(#Key)
			local Index = {}
			
			for i, value in Key do
				local KeyOfResult = p3.keyOf(value, i)
				Buffer[i] = KeyOfResult
				Index[KeyOfResult] = i
			end
			SelfEntry = { keys = Buffer, index = Index }
			self[Key] = SelfEntry
		end
		return SelfEntry
	end
	
	local function _select(PeekResult, p7, Input, p8)
		-- upvalues: CollectionPolicyModule (upval), Spec (copy), ActivationModule (upval), p4 (copy), ReadFunction (copy), TypesEnum (copy), p3 (copy), SelectionMode (copy)
		if CollectionPolicyModule.disabled(Spec.disabled, p7:peek()) or ActivationModule.consumed(Input) then return end
		if p4 and Spec.onActivate == nil and ReadFunction(Spec.editing) ~= true and p4.pickUp(PeekResult, Input) then return end
		local IsUserInputTypeMatch: boolean = Input ~= nil and Input.UserInputType == TypesEnum.UserInputType.MouseButton1
		local v1: boolean = IsUserInputTypeMatch and (p8 or 0) >= 2
		
		if not v1 then
			p3.selectRow(PeekResult, p7:peek(), Input)
		end
		local IsReadResult: boolean = SelectionMode ~= "none" and ReadFunction(Spec.editing) == true
		
		if Spec.onActivate and not IsReadResult and (SelectionMode == "none" or not IsUserInputTypeMatch or v1) then
			Spec.onActivate(p7:peek(), PeekResult, Input, p8)
		end
	end
	
	local function captureSelection(Parent, PeekResult)
		-- upvalues: p3 (copy), Mounted (copy)
		local Scope = p3.scope
		
		if Scope == nil then return end
		p3.focusActive:set(true)
		p3.focusOwned = true
		local FocusedPath = {}
		local Parent1 = Parent
		while Parent1 and Parent1 ~= Mounted[PeekResult] do
			table.insert(FocusedPath, 1, Parent1.Name)
			Parent1 = Parent1.Parent
		end
		p3.focusedPath = FocusedPath
		Scope.focus(PeekResult)
	end
	
	local function wireSelection(Object, p7, Hit)
		-- upvalues: Runtime (copy), captureSelection (copy), wireSelection (copy)
		if Object ~= Hit and Object:IsA("GuiObject") and (Object.Selectable or Object:IsA("GuiButton") or Object:IsA("TextBox")) then
			Runtime.connect(Object, "SelectionGained", function()
				-- upvalues: captureSelection (upval), Object (copy), p7 (copy)
				captureSelection(Object, p7:peek())
			end)
		end
		for _, child in Object:GetChildren() do
			wireSelection(child, p7, Hit)
		end
	end
	
	local P5 = p6 or (if Spec.reorderable or Spec.drag then p4 else nil)
	local NoRowDrop: boolean = Spec.recycle ~= false and (Spec.slots == nil and (Tree == nil and (p4 == nil and (p6 == nil and Spec.rowActions == nil))) and Spec.rowDrop == nil)
	local NoSlots: boolean = if p4 == nil then p6 ~= nil and Spec.slots == nil else Spec.slots == nil
	
	local function peek(p8)
		return p8:peek()
	end
	
	local HasArrival = Spec.arrival ~= nil
	local SourceResult = if HasArrival then SourceFunction(peek) else nil
	local Tbl = {}
	local OnFrameResult = nil
	
	local function syncArrivals(p8)
		-- upvalues: SourceResult (ref), keysOf (copy), Tbl (copy), OnFrameResult (ref), p3 (copy)
		local SourceResult1 = SourceResult
		
		if SourceResult1 == nil or p8 == SourceResult1 then return end
		SourceResult = p8
		local Index = keysOf(SourceResult1).index
		
		for _, key in keysOf(p8).keys do
			if Index[key] == nil then
				Tbl[key] = true
			end
		end
		if OnFrameResult == nil and next(Tbl) ~= nil then
			OnFrameResult = p3.frames.onFrame(function()
				-- upvalues: Tbl (upval), OnFrameResult (upval)
				table.clear(Tbl)
				
				if OnFrameResult then
					OnFrameResult()
					OnFrameResult = nil
				end
			end)
		end
	end
	
	if HasArrival then
		Compose.watch(function(p9)
			-- upvalues: syncArrivals (copy), SourceFunction (copy)
			syncArrivals(SourceFunction(p9))
		end)
		Compose.cleanup(function()
			-- upvalues: OnFrameResult (ref)
			if OnFrameResult then
				OnFrameResult()
				OnFrameResult = nil
			end
		end)
	end
	local function _(Key): boolean
		-- upvalues: syncArrivals (copy), SourceFunction (copy), peek (copy), Tbl (copy), ReadFunction (copy), Spec (copy), ReducedFunction (copy)
		syncArrivals(SourceFunction(peek))
		Tbl[Key] = nil
		
		return Tbl[Key] == true and (ReadFunction(Spec.arrival) == "rise" and not ReducedFunction())
	end
	
	local v1 = nil
	
	local function bump(p9: number): number
		return p9 + 1
	end
	
	local function lower(p9: number): number
		return (math.max(0, p9 - 1))
	end
	
	local function restoreParent(p9)
		-- upvalues: v1 (ref), CoreModule (upval), PoolOwner (copy), MountedVersion (copy), bump (copy)
		local Node = p9.node
		local Parking = p9.parking
		local Parent = if Parking then Parking.parent else nil
		
		if Node.Parent and Parent == nil then
			p9.previousParent = Node.Parent
		end
		if Parking and Parent and v1 ~= p9 and not CoreModule.owner.isDisposed(PoolOwner) and Node.Parent == nil then
			local v2 = v1
			v1 = p9
			v1 = v2
			
			if not pcall(function()
				-- upvalues: Node (copy), Parent (copy)
				Node.Parent = Parent
			end) then
				Parking.parent = nil
			end
		end
		if p9.live then
			MountedVersion:update(bump)
		end
	end
	
	local _ = function(p9)
		-- upvalues: restoreParent (copy)
		return p9.node.AncestryChanged:Connect(function()
			-- upvalues: restoreParent (upval), p9 (copy)
			restoreParent(p9)
		end)
	end
	
	local function releaseRow(p9)
		local StopFunction: () -> () = p9.stop
		
		if StopFunction == nil then return end
		p9.stop = nil
		local Restore = p9.restore
		local Parking = p9.parking
		p9.parking = nil
		
		if Restore then
			Restore:Disconnect()
		end
		if Parking and Parking.destroyed then
			Parking.destroyed:Disconnect()
		end
		StopFunction()
		p9.lease.release()
	end
	
	local function follow(p9, Held)
		-- upvalues: Mounted (copy), Placed (copy), CellEdits (copy), GuiService (copy), CollectionStateModule (upval), p1 (copy), p3 (copy), CollectionHighlightModuleResult (copy), Tree (copy), Spec (copy), CollectionPolicyModule (upval), MountedVersion (copy), bump (copy)
		local Held1 = p9.held
		
		if Held1 == Held then return end
		local Node = p9.node
		
		if Held1 ~= nil then
			if Mounted[Held1] == Node then
				Mounted[Held1] = nil
				Placed[Held1] = nil
				CellEdits[Held1] = nil
			end
			if GuiService and CollectionStateModule.belongsTo(p1.selection.get(), Node) then
				p3.focusOwned = true
				p1.selection.set(nil)
			end
			local ArriveFunction: (any) -> () = p9.arrive
			
			if ArriveFunction then
				ArriveFunction(Held)
			end
		end
		p9.held = Held
		local RekeyFunction: (any) -> () = p9.rekey
		
		if RekeyFunction then
			RekeyFunction(Held)
		end
		Node.Name = tostring(Held)
		local Edits = p9.edits
		Mounted[Held] = Node
		Placed[Held] = p9.placement
		CellEdits[Held] = Edits
		
		if Held1 ~= nil then
			local Marked = p9.marked
			
			if Marked then
				CollectionHighlightModuleResult.move(Marked, Held)
			end
			if Tree == nil and Spec.disabled ~= nil then
				Node.Interactable = not CollectionPolicyModule.disabled(Spec.disabled, p9.item:peek())
			end
			MountedVersion:update(bump)
		end
	end
	
	local function retireRow(p9)
		-- upvalues: GuiService (copy), CollectionStateModule (upval), p1 (copy), p3 (copy), Mounted (copy), Placed (copy), CellEdits (copy), Preparing (copy), Waiting (copy), lower (copy), SourceFunction (copy), peek (copy), keysOf (copy), Viewport (copy), Controls (copy), Spec (copy), CoreModule (upval), PoolOwner (copy), restoreParent (copy), releaseRow (copy)
		p9.live = false
		local Node = p9.node
		local Held = p9.held
		local Paint = p9.paint
		
		if GuiService and CollectionStateModule.belongsTo(p1.selection.get(), Node) then
			p3.focusOwned = true
			p1.selection.set(nil)
		end
		if Held ~= nil and Mounted[Held] == Node then
			Mounted[Held] = nil
			Placed[Held] = nil
			CellEdits[Held] = nil
		end
		p3.slotKeys[Node] = nil
		
		if Preparing[Node] then
			Preparing[Node] = nil
			Waiting:update(lower)
		end
		local SourceResult = SourceFunction(peek)
		local KeysOfResult = keysOf(SourceResult)
		local HasIndexEntry: boolean = Held ~= nil and KeysOfResult.index[Held] ~= nil
		local Flag = false
		
		if not HasIndexEntry then
			local PeekResult = Viewport:peek()
			
			for i, key in KeysOfResult.keys do
				if Mounted[key] == nil then
					local PlacementOfFunction = Controls.placementOf
					local PlacementOfResult = if PlacementOfFunction then PlacementOfFunction(i) else nil
					
					if Spec.mode == "all" or PeekResult.size <= 0 or PlacementOfResult ~= nil and PeekResult.offset < PlacementOfResult.offset + PlacementOfResult.size and PlacementOfResult.offset < PeekResult.offset + PeekResult.size then
						Flag = true
						break
					end
				end
			end
		end
		if HasIndexEntry or not Flag or Paint == nil or not Paint.painted or CoreModule.owner.isDisposed(PoolOwner) or #SourceResult <= 0 then
			releaseRow(p9)
			
			return
		end
		local Parking = {
			destroyed = nil,
			parent = Node.Parent or (p9.previousParent or p3.rowParent)
		}
		p9.parking = Parking
		
		if p9.restore == nil then
			p9.restore = p9.node.AncestryChanged:Connect(function()
				-- upvalues: restoreParent (upval), p9 (copy)
				restoreParent(p9)
			end)
		end
		Parking.destroyed = Node.Destroying:Connect(function()
			-- upvalues: Parking (copy)
			Parking.parent = nil
		end)
		Node.Parent = Parking.parent
		p9.content.Interactable = false
		
		p3.retiring[Node] = function()
			-- upvalues: releaseRow (upval), p9 (copy)
			releaseRow(p9)
		end
	end
	
	local function row(Item, Placement, CellResult, p10)
		-- upvalues: p3 (copy), Runtime (copy), NoSlots (copy), Compose (copy), Spec (copy), P5 (copy), TypesVector2 (copy), p4 (copy), TravelEngineModule (upval), p1 (copy), ReducedFunction (copy), Tree (copy), Kind (copy), Viewport (copy), HasArrival (copy), syncArrivals (copy), SourceFunction (copy), peek (copy), Tbl (copy), ReadFunction (copy), CollectionPolicyModule (upval), PoolOwner (copy), Horizontal (copy), TypesUDim2 (copy), ContainsCards (copy), ActivationModule (upval), ReadSourceFunction (copy), p2 (copy), Coordinator (copy), Measured (copy), FromScaleResult (copy), IsValue (copy), _select (copy), SelectionMode (copy), Host (copy), NewTypesVector (copy), FromScaleResult1 (copy), HasFocus (copy), captureSelection (copy), IsNotNone (copy), Observe (copy), CrossEdgeFunction (copy), TypesEnum (copy), TypesUDim (copy), CollectionHighlightModuleResult (copy), RowSignals (copy), restoreParent (copy), wireSelection (copy), follow (copy), CollectionPaintModule (upval), Preparing (copy), Waiting (copy), retireRow (copy)
		local AcquireResult = p3.pool.acquire()
		local Node = AcquireResult.value.node
		Runtime.borrow(Node)
		local v2 = nil
		local CellResult1 = if p10 or NoSlots then nil else Compose.cell(Item:peek())
		local CellResult1_1 = CellResult1 or Item
		local v3 = nil
		local v4 = 0
		local Callback = nil
		local Rekey: ((any) -> ())? = nil
		local Callback1: ((any, any) -> ())? = nil
		
		if (Spec.slots ~= nil or Spec.drag ~= nil or Spec.drop ~= nil) and P5 == nil then
			local CellResult2 = Compose.cell(TypesVector2.new(Placement:peek().crossOffset, Placement:peek().offset))
			v3 = CellResult2
			local FormulaResult = Placement
			
			if p4 and (Spec.drag or Spec.drop) then
				local v5 = p4
				FormulaResult = Compose.formula(function(Callback)
					-- upvalues: v5 (copy), CellResult (copy), Placement (copy)
					return v5.placement(Callback(CellResult), Callback(Placement), Callback)
				end)
			end
			local TravelEngineModuleResult = TravelEngineModule(p1, {
				motion = "spring",
				initial = { Placement:peek().crossOffset, Placement:peek().offset },
				target = function()
					-- upvalues: FormulaResult (ref)
					local PeekResult = FormulaResult:peek()
					
					return { PeekResult.crossOffset, PeekResult.offset }
				end,
				sample = function(Entry)
					-- upvalues: CellResult2 (copy), TypesVector2 (upval)
					CellResult2:set(TypesVector2.new(Entry[1], Entry[2]))
				end,
				reduced = ReducedFunction,
				duration = p1.metric("motion.durations.travel"),
				ease = p1.motionEase("travel"),
				spring = p1.motionSpring("travel")
			})
			Compose.watch(function(Callback: (any) -> ())
				-- upvalues: FormulaResult (ref), TravelEngineModuleResult (copy)
				Callback(FormulaResult)
				TravelEngineModuleResult.retarget()
			end)
		elseif P5 == nil and Tree == nil and Kind == "list" then
			local OnFrameResult: (() -> ())? = nil
			Compose.cleanup(function()
				-- upvalues: OnFrameResult (ref)
				if OnFrameResult then
					OnFrameResult()
					OnFrameResult = nil
				end
			end)
			local PeekResult = Placement:peek()
			local PeekResult1 = CellResult:peek()
			
			local function _(p11)
				-- upvalues: v4 (ref), Callback (ref)
				if v4 ~= p11 then
					v4 = p11
					
					if Callback then
						Callback()
					end
				end
			end
			
			Rekey = function(p11)
				-- upvalues: PeekResult1 (ref), OnFrameResult (ref), v4 (ref), Callback (ref)
				if p11 ~= PeekResult1 then
					PeekResult1 = p11
					
					if OnFrameResult then
						OnFrameResult()
						OnFrameResult = nil
					end
					if v4 ~= 0 then
						v4 = 0
						
						if Callback then
							Callback()
						end
					end
				end
			end
			
			Callback1 = function(p11, PeekResult2)
				-- upvalues: PeekResult (ref), v4 (ref), PeekResult1 (ref), OnFrameResult (ref), Viewport (upval), ReducedFunction (upval), p1 (upval), p3 (upval), Callback (ref)
				local OffsetDelta = PeekResult.offset + v4 - p11.offset
				local IsPeekResultMatch: boolean = p11.index ~= PeekResult.index and PeekResult2 == PeekResult1
				
				if PeekResult2 ~= PeekResult1 then
					if OnFrameResult then
						OnFrameResult()
						OnFrameResult = nil
					end
					v4 = 0
				end
				PeekResult = p11
				PeekResult1 = PeekResult2
				
				if not IsPeekResultMatch or Viewport:peek().size < math.abs(OffsetDelta) or ReducedFunction() then return end
				if OnFrameResult then
					OnFrameResult()
					OnFrameResult = nil
				end
				local Smallest = 0
				local MotionDurationsGlide = p1.metric("motion.durations.glide")
				local Present = p1.motionEase("present")
				v4 = OffsetDelta
				OnFrameResult = p3.frames.onFrame(function(p12: number)
					-- upvalues: Smallest (ref), MotionDurationsGlide (copy), OffsetDelta (copy), Present (copy), v4 (upval), Callback (upval), OnFrameResult (upval)
					Smallest = math.min(MotionDurationsGlide, Smallest + p12)
					local ScaledOffsetDelta = OffsetDelta * (1 - Present(Smallest / MotionDurationsGlide))
					
					if v4 ~= ScaledOffsetDelta then
						v4 = ScaledOffsetDelta
						
						if Callback then
							Callback()
						end
					end
					if MotionDurationsGlide <= Smallest and OnFrameResult then
						OnFrameResult()
						OnFrameResult = nil
					end
				end)
			end
		end
		local HasArrival1: boolean = HasArrival
		
		if HasArrival1 then
			local PeekResult2 = CellResult:peek()
			syncArrivals(SourceFunction(peek))
			Tbl[PeekResult2] = nil
			HasArrival1 = Tbl[PeekResult2] == true and (ReadFunction(Spec.arrival) == "rise" and not ReducedFunction())
		end
		local CellResult3 = if HasArrival then Compose.cell(if HasArrival1 then 0 else 1) else nil
		local NoDisabled = Tree == nil and Spec.disabled == nil or Compose.formula(function(Callback): boolean
			-- upvalues: Tree (upval), CellResult (copy), CollectionPolicyModule (upval), Spec (upval), CellResult1_1 (copy)
			return if Tree == nil then not CollectionPolicyModule.disabled(Spec.disabled, Callback(CellResult1_1)) else Tree.visible(Callback(CellResult), Callback) and not CollectionPolicyModule.disabled(Spec.disabled, Callback(CellResult1_1))
		end)
		local Edits = {}
		local Object = nil
		local v6 = nil
		local CellResult4 = if HasArrival then Compose.cell(false) else nil
		local Marked = nil
		local Content = nil
		local config = {
			paint = nil,
			held = nil,
			parking = nil,
			restore = nil,
			live = true,
			arrive = nil,
			node = Node,
			lease = AcquireResult,
			stop = Compose.withOwner(PoolOwner, function()
				-- upvalues: Runtime (upval), v2 (ref), Compose (upval), Node (copy), CellResult (copy), Tree (upval), NoDisabled (copy), P5 (upval), Placement (copy), CellResult3 (copy), p1 (upval), Horizontal (upval), TypesUDim2 (upval), Spec (upval), v4 (ref), v3 (ref), Callback (ref), Callback1 (ref), CellResult1_1 (copy), Object (ref), Kind (upval), ReadFunction (upval), ContainsCards (upval), ActivationModule (upval), CollectionPolicyModule (upval), ReadSourceFunction (upval), Edits (copy), p3 (upval), v6 (ref), p2 (upval), Coordinator (upval), p4 (upval), Measured (upval), FromScaleResult (upval), IsValue (upval), _select (upval), SelectionMode (upval), Host (upval), NewTypesVector (upval), FromScaleResult1 (upval), HasFocus (upval), captureSelection (upval), TypesVector2 (upval), IsNotNone (upval), Observe (upval), CrossEdgeFunction (upval), TypesEnum (upval), TypesUDim (upval), CellResult4 (copy), Content (ref), Marked (ref), CollectionHighlightModuleResult (upval)
				return Runtime.mount(function()
					-- upvalues: v2 (upval), Compose (upval), Node (upval), CellResult (upval), Tree (upval), NoDisabled (upval), Runtime (upval), P5 (upval), Placement (upval), CellResult3 (upval), p1 (upval), Horizontal (upval), TypesUDim2 (upval), Spec (upval), v4 (upval), v3 (upval), Callback (upval), Callback1 (upval), CellResult1_1 (upval), Object (upval), Kind (upval), ReadFunction (upval), ContainsCards (upval), ActivationModule (upval), CollectionPolicyModule (upval), ReadSourceFunction (upval), Edits (upval), p3 (upval), v6 (upval), p2 (upval), Coordinator (upval), p4 (upval), Measured (upval), FromScaleResult (upval), IsValue (upval), _select (upval), SelectionMode (upval), Host (upval), NewTypesVector (upval), FromScaleResult1 (upval), HasFocus (upval), captureSelection (upval), TypesVector2 (upval), IsNotNone (upval), Observe (upval), CrossEdgeFunction (upval), TypesEnum (upval), TypesUDim (upval), CellResult4 (upval), Content (upval), Marked (upval), CollectionHighlightModuleResult (upval)
					v2 = assert(Compose.currentOwner())
					Node.Name = tostring(CellResult:peek())
					Node.ClipsDescendants = Tree ~= nil
					
					if NoDisabled == true then
						Node.Interactable = true
					else
						Runtime.decorate(Node, { Interactable = NoDisabled })
					end
					local config = {
						index = -1,
						main = 1e999,
						cross = 1e999,
						size = -1,
						crossSize = -1
					}
					local PositionResult = if P5 then P5.position(CellResult:peek(), Placement, function(Vector)
						-- upvalues: CellResult3 (upval), p1 (upval), config (copy), Node (upval), Horizontal (upval), TypesUDim2 (upval)
						local NewY = Vector.Y + (if CellResult3 then (1 - CellResult3:peek()) * p1.metric("motion.distances.rowArrival") else 0)
						
						if config.main ~= NewY or config.cross ~= Vector.X then
							config.main = NewY
							config.cross = Vector.X
							Node.Position = if Horizontal then TypesUDim2.fromOffset(NewY, Vector.X) else TypesUDim2.fromOffset(Vector.X, NewY)
						end
					end, Spec.reducedMotion) else nil
					
					local function apply(PeekResult, Callback)
						-- upvalues: v4 (upval), v3 (upval), CellResult3 (upval), p1 (upval), config (copy), Node (upval), PositionResult (copy), Horizontal (upval), TypesUDim2 (upval)
						local NewOffset = PeekResult.offset + v4
						local CrossOffset = PeekResult.crossOffset
						
						if v3 then
							local CallbackResult = if Callback then Callback(v3) else v3:peek()
							NewOffset = CallbackResult.Y
							CrossOffset = CallbackResult.X
						end
						if CellResult3 then
							NewOffset += (1 - (if Callback then Callback(CellResult3) else CellResult3:peek())) * p1.metric("motion.distances.rowArrival", Callback)
						end
						if config.index ~= PeekResult.index then
							config.index = PeekResult.index
							Node.LayoutOrder = PeekResult.index
						end
						if PositionResult == nil and (config.main ~= NewOffset or config.cross ~= CrossOffset) then
							config.main = NewOffset
							config.cross = CrossOffset
							Node.Position = if Horizontal then TypesUDim2.fromOffset(NewOffset, CrossOffset) else TypesUDim2.fromOffset(CrossOffset, NewOffset)
						end
						if config.size ~= PeekResult.size or config.crossSize ~= PeekResult.crossSize then
							local CrossSize = PeekResult.crossSize
							config.size = PeekResult.size
							config.crossSize = CrossSize
							Node.Size = if Horizontal then TypesUDim2.fromOffset(PeekResult.size, PeekResult.crossSize) else TypesUDim2.fromOffset(PeekResult.crossSize, PeekResult.size)
						end
					end
					
					Callback = function()
						-- upvalues: apply (copy), Placement (upval)
						apply(Placement:peek())
					end
					
					if PositionResult or CellResult3 or v3 then
						Compose.owner.watchTerminal(v2, function(Callback)
							-- upvalues: Placement (upval), PositionResult (copy), CellResult3 (upval), Callback1 (upval), CellResult (upval), apply (copy)
							local CallbackResult = Callback(Placement)
							
							if PositionResult then
								if CellResult3 then
									Callback(CellResult3)
								end
								PositionResult(CallbackResult)
							end
							if Callback1 then
								Callback1(CallbackResult, Callback(CellResult))
							end
							apply(CallbackResult, Callback)
						end)
					else
						Compose.owner.watchStatic(v2, Placement, function(p11)
							-- upvalues: Callback1 (upval), CellResult (upval), apply (copy)
							if Callback1 then
								Callback1(p11, CellResult:peek())
							end
							apply(p11)
						end)
					end
					local WrapResult = assert(Spec.render)(CellResult1_1, Placement, CellResult)
					
					if Tree and not Tree.columnar then
						WrapResult = Tree.wrap(WrapResult, CellResult1_1, CellResult:peek())
					end
					Object = WrapResult
					
					if WrapResult:GetAttribute("FacetBody") ~= nil and (Kind == "grid" or ReadFunction(Spec.contentOverflow) ~= "clip") then
						ContainsCards:set(true)
					end
					for _, value in ActivationModule.edits(WrapResult) do
						local Copy = table.clone(value)
						
						function Copy.enabled(p11): boolean
							-- upvalues: value (copy), CollectionPolicyModule (upval), Spec (upval), ReadSourceFunction (upval), CellResult1_1 (upval)
							return value.enabled(p11) and not CollectionPolicyModule.disabled(Spec.disabled, ReadSourceFunction(CellResult1_1, p11))
						end
						
						table.insert(Edits, Copy)
					end
					if not p3.actionsWrapped and (Spec.rowActions ~= nil or #Edits > 0) then
						local ActionsResult, ActionsResult2 = CollectionPolicyModule.actions(p1, Spec, CellResult1_1, CellResult:peek(), WrapResult, p2.RowActions, Coordinator, Kind == "grid")
						v6 = ActionsResult2
						WrapResult = ActionsResult
					end
					if p4 then
						WrapResult = p4.wrap(WrapResult, CellResult1_1, CellResult:peek())
						local PressFunction = p4.press
						Compose.cleanup(ActivationModule.providePress(WrapResult, function(p11)
							-- upvalues: PressFunction (copy), CellResult (upval)
							PressFunction(CellResult:peek(), p11)
						end))
					end
					local Hit = nil
					local v7 = nil
					local Attributes = { FacetCollectionRow = true }
					local Surface = {
						Name = "Content",
						Size = if Tree then function(Callback)
							-- upvalues: ReadFunction (upval), Spec (upval), Measured (upval), CellResult (upval), TypesUDim2 (upval)
							local ReadResult: number = ReadFunction(Spec.itemSize or 40, Callback)
							assert(type(ReadResult) == "number", "Facet.Outline requires a numeric itemSize")
							local CallbackResultEntry = Callback(Measured)[Callback(CellResult)]
							
							if Spec.measured ~= nil then
								local ReadResultEntry = ReadFunction(Spec.measured, Callback)[Callback(CellResult)]
								
								if ReadResultEntry ~= nil then
									CallbackResultEntry = ReadResultEntry
								end
							end
							return TypesUDim2.new(1, 0, 0, (math.max(ReadResult, CallbackResultEntry or 0)))
						end else FromScaleResult,
						BackgroundTransparency = 1,
						Attributes = Attributes,
						ClipsDescendants = if IsValue then function(p11): boolean
							-- upvalues: ReadFunction (upval), Spec (upval)
							return ReadFunction(Spec.contentOverflow, p11) == "clip"
						end else ReadFunction(Spec.contentOverflow) == "clip",
						WrapResult
					}
					
					if Spec.onSelectionChange or Spec.onActivate or Spec.selection or Spec.selectionMode or Spec.rowDrop or #Edits > 0 or p4 then
						local v8 = nil
						
						local function activate(Input, p11)
							-- upvalues: ActivationModule (upval), v8 (ref), _select (upval), CellResult (upval), CellResult1_1 (upval)
							if not ActivationModule.intercepted(v8, Input) then
								_select(CellResult:peek(), CellResult1_1, Input, p11)
							end
						end
						
						v8 = Host.TextButton("RowHit")({
							Text = "",
							BackgroundTransparency = 1,
							Selectable = true,
							AnchorPoint = NewTypesVector,
							Position = FromScaleResult1,
							Size = FromScaleResult,
							Interactable = NoDisabled,
							Activated = activate,
							SelectionGained = if HasFocus then function()
								-- upvalues: captureSelection (upval), v8 (ref), CellResult (upval)
								captureSelection(v8, CellResult:peek())
							end else nil,
							Attributes = { FacetSelectionRequired = SelectionMode ~= "none" }
						})
						Hit = v8
						v7 = activate
						ActivationModule.offer(v8, activate)
						
						if ActivationModule.pressable(WrapResult) then
							local function pressed(p11)
								-- upvalues: ActivationModule (upval), WrapResult (copy)
								ActivationModule.press(WrapResult, p11)
							end
							
							Runtime.connect(v8, "InputBegan", pressed)
							Compose.cleanup(ActivationModule.providePress(v8, pressed))
						end
						if p4 and p1.config.inputParent and p1.config.inputParent:IsA("PluginGui") then
							Runtime.connect(v8, "MouseButton1Down", function(p11, p12)
								-- upvalues: p4 (copy), TypesVector2 (upval)
								p4.mouseDown(TypesVector2.new(p11, p12))
							end)
							Runtime.connect(v8, "InputEnded", p4.finish)
						end
						Surface[2] = Surface[1]
						Surface[1] = v8
					end
					local IsNotClip: boolean = Tree == nil and (WrapResult:GetAttribute("FacetBody") ~= nil and ReadFunction(Spec.contentOverflow) ~= "clip")
					
					if IsNotNone and not IsNotClip then
						Surface.BackgroundTransparency = nil
					end
					local Surface1 = Surface
					local FrameResult = nil
					
					if IsNotClip then
						local AbsoluteSizeResult = Observe.AbsoluteSize(WrapResult)
						local UIScale = WrapResult:FindFirstChildWhichIsA("UIScale")
						local ScaleResult = if UIScale then Observe.Scale(UIScale) else nil
						
						local function edges(Callback)
							-- upvalues: ReadFunction (upval), Spec (upval), p3 (upval), ScaleResult (copy), AbsoluteSizeResult (copy), Horizontal (upval), p1 (upval), CrossEdgeFunction (upval)
							if ReadFunction(Spec.contentOverflow, Callback) == "clip" then
								return 0, 0
							end
							local Largest = math.max(Callback(p3.unitSize).X * (if ScaleResult then Callback(ScaleResult) else 1), 0.001)
							local CallbackResult = Callback(AbsoluteSizeResult)
							local Largest1 = math.max(p3.mainEdge(Callback), (math.ceil((if Horizontal then CallbackResult.X else CallbackResult.Y) / Largest * math.max(0, p1.metric("motion.materialize.lift", Callback) - 1))))
							local Largest2 = if Horizontal then Largest1 else CrossEdgeFunction(Callback)
							
							if Horizontal then
								return Largest2, (CrossEdgeFunction(Callback))
							else
								return Largest2, Largest1
							end
						end
						
						Surface.Name = "Surface"
						Surface.Attributes = nil
						Surface.AutomaticSize = if Horizontal then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.Y
						FrameResult = Host.Frame(Surface)
						
						local function crossPadding(p11)
							-- upvalues: edges (copy), TypesUDim (upval)
							return TypesUDim.new(0, (edges(p11)))
						end
						
						local function mainPadding(p11)
							-- upvalues: edges (copy), TypesUDim (upval)
							local _, EdgesResult2 = edges(p11)
							
							return TypesUDim.new(0, EdgesResult2)
						end
						
						Surface1 = {
							Name = "Content",
							BackgroundTransparency = 1,
							Attributes = Attributes,
							Position = function(p11)
								-- upvalues: edges (copy), TypesUDim2 (upval)
								local EdgesResult, EdgesResult2 = edges(p11)
								
								return TypesUDim2.fromOffset(-EdgesResult, -EdgesResult2)
							end,
							Size = function(p11)
								-- upvalues: edges (copy), TypesUDim2 (upval)
								local EdgesResult, EdgesResult2 = edges(p11)
								
								return TypesUDim2.new(1, EdgesResult * 2, 1, 2 * EdgesResult2)
							end,
							Host.UIPadding({
								PaddingLeft = crossPadding,
								PaddingRight = crossPadding,
								PaddingTop = mainPadding,
								PaddingBottom = mainPadding
							}),
							FrameResult
						}
					end
					if CellResult4 and CellResult3 then
						function Surface1.GroupTransparency(Callback): number
							-- upvalues: CellResult4 (copy), CellResult3 (copy)
							return if Callback(CellResult4) then 1 - Callback(CellResult3) else 1
						end
					else
						Surface1.GroupTransparency = 1
					end
					Surface1.Attributes = { FacetCollectionRow = true, FacetCollectionReady = false }
					local ReadResult = ReadFunction(Spec.contentOverflow)
					Surface1.AutomaticSize = if Tree == nil and ReadResult ~= "clip" then if ReadResult == "grow" and not IsNotClip then TypesEnum.AutomaticSize.XY elseif Horizontal then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.None
					Content = if Tree then p1.fade(Surface1) else Host.CanvasGroup(Surface1)
					local FrameResult1 = FrameResult or Content
					CollectionPolicyModule.drop(p1, Spec, CellResult1_1, CellResult:peek(), FrameResult1, Kind == "grid" or Horizontal, Hit)
					local CellResult1 = if IsNotNone and (not IsNotClip and p1.config.theme ~= nil) then Compose.cell(false) else nil
					
					if IsNotNone and not IsNotClip then
						p1.styled(FrameResult1, "TableRow")
						
						if Kind == "grid" or Horizontal then
							p1.skin(FrameResult1, "control", { selected = CellResult1 })
						end
					end
					local Config = if Hit or IsNotNone then {
						hit = Hit,
						logical = FrameResult1,
						selected = CellResult1,
						onlySelected = p4 ~= nil or #Edits > 0
					} else nil
					
					if Config then
						Marked = Config
						CollectionHighlightModuleResult.track(Config, CellResult:peek())
						Compose.cleanup(function()
							-- upvalues: Hit (ref), v7 (ref), ActivationModule (upval), CollectionHighlightModuleResult (upval), Config (copy)
							if Hit and v7 then
								ActivationModule.withdraw(Hit, v7)
							end
							CollectionHighlightModuleResult.forget(Config)
						end)
					end
					return Content
				end, Node)
			end),
			content = Content,
			previousParent = Node.Parent,
			item = Item,
			placement = Placement,
			edits = Edits,
			marked = Marked,
			rekey = Rekey
		}
		
		if RowSignals then
			config.restore = config.node.AncestryChanged:Connect(function()
				-- upvalues: restoreParent (upval), config (copy)
				restoreParent(config)
			end)
		end
		if HasFocus then
			wireSelection(Content, CellResult, if Marked then Marked.hit else nil)
		end
		p3.slotKeys[Node] = CellResult
		local Arrive: ((any) -> ())? = nil
		
		if CellResult3 and CellResult4 then
			local CellResult5 = CellResult3
			local CellResult6 = CellResult4
			local OnFrameResult1: (() -> ())? = nil
			Compose.cleanup(function()
				-- upvalues: OnFrameResult1 (ref), CellResult5 (copy)
				if OnFrameResult1 then
					OnFrameResult1()
					OnFrameResult1 = nil
				end
				CellResult5:set(1)
			end)
			
			local _ = function()
				-- upvalues: p1 (upval), OnFrameResult1 (ref), p3 (upval), CellResult6 (copy), CellResult5 (copy)
				local Smallest = 0
				local MotionDurationsRowArrival = p1.metric("motion.durations.rowArrival")
				local Present = p1.motionEase("present")
				OnFrameResult1 = p3.frames.onFrame(function(p11: number)
					-- upvalues: CellResult6 (upval), Smallest (ref), MotionDurationsRowArrival (copy), CellResult5 (upval), Present (copy), OnFrameResult1 (upval)
					if not CellResult6:peek() then return end
					Smallest = math.min(MotionDurationsRowArrival, Smallest + p11)
					CellResult5:set(Present(Smallest / MotionDurationsRowArrival))
					
					if MotionDurationsRowArrival <= Smallest then
						if OnFrameResult1 then
							OnFrameResult1()
							OnFrameResult1 = nil
						end
						CellResult5:set(1)
					end
				end)
			end
			
			Arrive = function(Key)
				-- upvalues: OnFrameResult1 (ref), CellResult5 (copy), syncArrivals (upval), SourceFunction (upval), peek (upval), Tbl (upval), ReadFunction (upval), Spec (upval), ReducedFunction (upval), p1 (upval), p3 (upval), CellResult6 (copy)
				if OnFrameResult1 then
					OnFrameResult1()
					OnFrameResult1 = nil
				end
				CellResult5:set(1)
				syncArrivals(SourceFunction(peek))
				Tbl[Key] = nil
				
				if Tbl[Key] == true and (ReadFunction(Spec.arrival) == "rise" and not ReducedFunction()) then
					CellResult5:set(0)
					local Smallest = 0
					local MotionDurationsRowArrival = p1.metric("motion.durations.rowArrival")
					local Present = p1.motionEase("present")
					OnFrameResult1 = p3.frames.onFrame(function(p11: number)
						-- upvalues: CellResult6 (upval), Smallest (ref), MotionDurationsRowArrival (copy), CellResult5 (upval), Present (copy), OnFrameResult1 (upval)
						if not CellResult6:peek() then return end
						Smallest = math.min(MotionDurationsRowArrival, Smallest + p11)
						CellResult5:set(Present(Smallest / MotionDurationsRowArrival))
						
						if MotionDurationsRowArrival <= Smallest then
							if OnFrameResult1 then
								OnFrameResult1()
								OnFrameResult1 = nil
							end
							CellResult5:set(1)
						end
					end)
				end
			end
			
			if HasArrival1 then
				local Smallest = 0
				local MotionDurationsRowArrival = p1.metric("motion.durations.rowArrival")
				local Present = p1.motionEase("present")
				OnFrameResult1 = p3.frames.onFrame(function(p11: number)
					-- upvalues: CellResult6 (copy), Smallest (ref), MotionDurationsRowArrival (copy), CellResult5 (copy), Present (copy), OnFrameResult1 (ref)
					if not CellResult6:peek() then return end
					Smallest = math.min(MotionDurationsRowArrival, Smallest + p11)
					CellResult5:set(Present(Smallest / MotionDurationsRowArrival))
					
					if MotionDurationsRowArrival <= Smallest then
						if OnFrameResult1 then
							OnFrameResult1()
							OnFrameResult1 = nil
						end
						CellResult5:set(1)
					end
				end)
			end
		end
		config.arrive = Arrive
		local v7 = assert(Compose.currentOwner())
		
		if CellResult1 then
			Compose.owner.watchTerminal(v7, function(Callback)
				-- upvalues: CellResult1 (copy), Item (copy)
				CellResult1:set(Callback(Item))
			end)
		end
		if p10 then
			Compose.owner.watchStatic(v7, CellResult, function(Held)
				-- upvalues: follow (upval), config (copy)
				follow(config, Held)
			end)
		else
			follow(config, CellResult:peek())
		end
		local v8 = nil
		local AutomaticSize = Object.AutomaticSize
		local IsNotClip: boolean = if Object:FindFirstChildWhichIsA("UIListLayout") == nil and not Object:IsA("GuiButton") and not Object:IsA("TextLabel") then Object:IsA("TextBox") and (if AutomaticSize == TypesEnum.AutomaticSize.XY then ReadFunction(Spec.contentOverflow) ~= "clip" else AutomaticSize == (if Horizontal then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.Y) and ReadFunction(Spec.contentOverflow) ~= "clip") elseif AutomaticSize == TypesEnum.AutomaticSize.XY then ReadFunction(Spec.contentOverflow) ~= "clip" else AutomaticSize == (if Horizontal then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.Y) and ReadFunction(Spec.contentOverflow) ~= "clip"
		
		if Spec.measure or Tree and not Tree.columnar or Spec.measure == nil and Tree == nil and Kind == "list" and IsNotClip then
			local NoTree: boolean = Spec.measure == nil and Tree == nil
			local AbsoluteSizeResult1 = if NoTree then nil else Observe.AbsoluteSize(Object)
			local UIScale = Object:FindFirstChildWhichIsA("UIScale")
			local LayoutUnit = if Object:GetAttribute("FacetBody") then Object:FindFirstChild("LayoutUnit") else nil
			local LayoutUnit1 = if UIScale then if LayoutUnit and LayoutUnit:IsA("Frame") then LayoutUnit else Host.Frame({
				Name = "MeasurementUnit",
				Visible = false,
				Size = TypesUDim2.fromOffset(1, 1)
			}) else nil
			
			if LayoutUnit1 then
				LayoutUnit1.Parent = Object
			end
			local AbsoluteSizeResult = if LayoutUnit1 then Observe.AbsoluteSize(LayoutUnit1) else nil
			local ScaleResult = if UIScale then Observe.Scale(UIScale) else nil
			local Body = if Kind == "grid" and not Horizontal and Spec.measure == true and Tree == nil then Object:FindFirstChild("Body") else nil
			local UIListLayout = if Body and Object:GetAttribute("FacetBody") ~= nil then Body:FindFirstChildWhichIsA("UIListLayout") else nil
			local Callback2: ((any) -> number)? = nil
			
			if Body and UIListLayout and Body:IsA("GuiObject") then
				local AbsoluteSizeResult2 = Observe.AbsoluteSize(Body)
				local AbsoluteContentSizeResult = Observe.AbsoluteContentSize(UIListLayout)
				local AbsoluteSizeResult3 = Observe.AbsoluteSize(Object)
				local AbsoluteSizeResult4 = Observe.AbsoluteSize(Node)
				local UIPadding = Body:FindFirstChildWhichIsA("UIPadding")
				
				Callback2 = function(Callback): number
					-- upvalues: p3 (upval), UIPadding (copy), AbsoluteSizeResult2 (copy), AbsoluteContentSizeResult (copy)
					local X = Callback(p3.unitSize).X
					
					return (math.max(0, Callback(AbsoluteSizeResult2).Y - Callback(AbsoluteContentSizeResult).Y - (if UIPadding then (UIPadding.PaddingTop.Offset + UIPadding.PaddingBottom.Offset) * X else 0)))
				end
				
				local RowFloor = Host.UISizeConstraint({ Name = "RowFloor" })
				RowFloor.Parent = Body
				Compose.watch(function(Callback)
					-- upvalues: p3 (upval), AbsoluteSizeResult3 (copy), AbsoluteSizeResult2 (copy), AbsoluteSizeResult4 (copy), TypesVector2 (upval), RowFloor (copy)
					local X: number = Callback(p3.unitSize).X
					
					if X <= 0 then return end
					local NewTypesVector = TypesVector2.new(0, (math.max(0, (math.floor((Callback(AbsoluteSizeResult4).Y - (Callback(AbsoluteSizeResult3).Y - Callback(AbsoluteSizeResult2).Y)) / X)))))
					
					if RowFloor.MinSize ~= NewTypesVector then
						RowFloor.MinSize = NewTypesVector
					end
				end)
			end
			local function measure(Callback, p11)
				-- upvalues: CellResult (copy), Spec (upval), Tree (upval), Object (ref), Horizontal (upval), TypesEnum (upval), p3 (upval), ScaleResult (copy), AbsoluteSizeResult (copy), AbsoluteSizeResult1 (copy), Callback2 (ref), p4 (upval), v6 (ref), ReadFunction (upval), Measured (upval)
				Callback(CellResult)
				
				if Spec.measure == nil and Tree == nil then
					local AutomaticSize = Object.AutomaticSize
					
					if AutomaticSize ~= (if Horizontal then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.Y) and AutomaticSize ~= TypesEnum.AutomaticSize.XY then return end
				end
				local X = Callback(p3.unitSize).X
				
				if X <= 0 then
					X = 1
				end
				local CallbackResult = if ScaleResult then Callback(ScaleResult) else 1
				local X1 = if AbsoluteSizeResult then Callback(AbsoluteSizeResult).X else 0
				local Largest = math.max(if X1 > 0 then X1 else CallbackResult * X, 0.001)
				local P58 = p11 or Callback(assert(AbsoluteSizeResult1))
				local Rounded = math.round(((if Horizontal then P58.X else P58.Y) - (if Callback2 and not Horizontal then Callback2(Callback) else 0)) / Largest + (if p4 and not Horizontal then Callback(p4.header) else 0) + (if v6 and not Horizontal then Callback(v6) else 0))
				
				if Spec.measure == nil and Tree == nil and ReadFunction(Spec.contentOverflow, Callback) ~= "clip" then
					local ReadResult: number = ReadFunction(Spec.itemSize or 40, Callback)
					
					if type(ReadResult) == "number" then
						Rounded = math.max(ReadResult, Rounded)
					end
				end
				local PeekResultEntry: number = Measured:peek()[CellResult:peek()]
				local HasFacetLiftingAttribute: boolean = CallbackResult ~= 1 and Object:GetAttribute("FacetLifting") ~= nil
				
				if PeekResultEntry and (HasFacetLiftingAttribute or CallbackResult ~= 1 and math.abs(Rounded - PeekResultEntry) <= 1) then return end
				if Rounded > 0 and PeekResultEntry ~= Rounded then
					local Copy = table.clone(Measured:peek())
					Copy[CellResult:peek()] = Rounded
					Measured:set(Copy)
				end
			end
			
			if NoTree then
				v8 = measure
			else
				Compose.watch(function(p11)
					-- upvalues: measure (copy)
					measure(p11)
				end)
			end
		end
		local Settle = nil
		local Paint = {
			painted = false,
			ready = Compose.withOwner(v2, function()
				-- upvalues: CollectionPaintModule (upval), p1 (upval), v8 (ref), Object (ref), Content (ref), Tree (upval), Spec (upval), RowSignals (upval), Settle (ref)
				local CollectionPaintModuleResult, CollectionPaintModuleResult2 = CollectionPaintModule(p1, if v8 then Object else Content, v8, Tree == nil and (Spec.measure == true or v8 ~= nil), RowSignals)
				Settle = CollectionPaintModuleResult2
				
				return CollectionPaintModuleResult
			end),
			content = Content,
			placement = Placement,
			shown = CellResult4,
			settle = Settle
		}
		Preparing[Node] = Paint
		Waiting:update(function(p11: number): number
			return p11 + 1
		end)
		config.paint = Paint
		Compose.cleanup(function()
			-- upvalues: retireRow (upval), config (copy)
			retireRow(config)
		end)
		
		return Node
	end
	
	local _ = function(p11, p12: number)
		return if p12 > 1 then math.floor(p11 / p12) else p11 / p12
	end
	
	local _ = function(p11)
		-- upvalues: ReadFunction (copy), Spec (copy)
		local ReadResult = ReadFunction(Spec.itemSize or 40, p11)
		assert(type(ReadResult) == "number", "Facet collection requires a numeric itemSize")
		
		return ReadResult
	end
	
	return function(Follow)
		-- upvalues: NoRowDrop (copy), row (copy), Compose (copy), Spec (copy), Viewport (copy), Status (copy), Controls (copy), FullSizesFunction (copy), Tree (copy), ReadFunction (copy), Kind (copy), p3 (copy), Cross (copy), CrossEdgeFunction (copy), SourceFunction (copy), p5 (copy)
		local Render = if NoRowDrop then nil else function(Item, Placement, p11)
			-- upvalues: row (upval), Compose (upval)
			return (row(Item, Placement, Compose.cell(p11), false))
		end
		
		local function ordered(p11)
			-- upvalues: Compose (upval), Spec (upval), Viewport (upval), Status (upval), Controls (upval), FullSizesFunction (upval), Tree (upval), ReadFunction (upval), Follow (copy), Kind (upval), p3 (upval), Cross (upval), CrossEdgeFunction (upval)
			return Compose.OrderedCollection({
				from = p11.from,
				key = p11.key,
				mode = Spec.mode or "windowed",
				direction = Spec.direction or "vertical",
				viewport = Viewport,
				status = Status,
				controls = Controls,
				overscan = Spec.overscan or 2,
				measured = Compose.formula(function(p12)
					-- upvalues: FullSizesFunction (upval), Tree (upval), ReadFunction (upval), Spec (upval)
					local FullSizesResult = FullSizesFunction(p12)
					
					if Tree then
						local SizesFunction = Tree.sizes
						local ReadResult = ReadFunction(Spec.itemSize or 40, p12)
						assert(type(ReadResult) == "number", "Facet collection requires a numeric itemSize")
						
						return (SizesFunction(p12, FullSizesResult, ReadResult, ReadFunction(Spec.gap or 0, p12)))
					else
						return FullSizesResult
					end
				end),
				follow = Follow,
				followThreshold = Spec.followThreshold,
				layout = function(Callback)
					-- upvalues: Spec (upval), ReadFunction (upval), Kind (upval), p3 (upval), Cross (upval), CrossEdgeFunction (upval), Tree (upval)
					if Spec.minColumns ~= nil then
						local ReadResult: number = ReadFunction(Spec.minColumns, Callback)
						assert(type(ReadResult) == "number" and (Spec.minColumnWidth ~= nil and (Spec.columns == nil and ReadResult >= 1 and ReadResult % 1 == 0)), "Facet minColumns needs minColumnWidth, a positive whole number and no columns")
					end
					if Spec.minColumnWidth ~= nil then
						local ReadResult: number = ReadFunction(Spec.minColumnWidth, Callback)
						assert(type(ReadResult) == "number" and (Kind == "grid" and (Spec.columns == nil and ReadResult > 0)) and ReadResult < 1e999, "Facet minColumnWidth needs a grid, a positive width and no columns")
					end
					local GridColumnsResult: number = p3.gridColumns(Callback, (math.max(0, Callback(Cross) - 2 * CrossEdgeFunction(Callback))))
					local ReadResult = ReadFunction(Spec.gap or 0, Callback)
					local ReadResult1 = ReadFunction(Spec.crossGap or ReadResult, Callback)
					local config = { kind = Kind, columns = GridColumnsResult }
					local CardLayoutResult = nil
					
					if p3.cardsMode then
						CardLayoutResult = p3.cardLayout(Callback)
					else
						CardLayoutResult = ReadFunction(Spec.itemSize or 40, Callback)
						assert(type(CardLayoutResult) == "number", "Facet collection requires a numeric itemSize")
					end
					config.itemSize = CardLayoutResult
					config.gap = if Tree then 0 else ReadResult
					config.crossGap = ReadResult1
					local CallbackResultDelta = Callback(Cross) - 2 * CrossEdgeFunction(Callback) - ReadResult1 * (GridColumnsResult - 1)
					config.crossSize = math.max(0, if GridColumnsResult > 1 then math.floor(CallbackResultDelta / GridColumnsResult) else CallbackResultDelta / GridColumnsResult)
					
					return config
				end,
				render = p11.render,
				recycle = p11.recycle
			})
		end
		
		if Spec.slots == nil then
			local KeyOfResults = {}
			
			return ordered({
				from = Compose.formula(function(p11)
					-- upvalues: SourceFunction (upval), KeyOfResults (ref), p3 (upval)
					local SourceResult = SourceFunction(p11)
					local Buffer = table.create(#SourceResult)
					KeyOfResults = table.create(#SourceResult)
					
					for i, value in SourceResult do
						table.insert(Buffer, value)
						KeyOfResults[#Buffer] = p3.keyOf(value, i)
					end
					return Buffer
				end),
				key = function(_, p12)
					-- upvalues: KeyOfResults (ref)
					return KeyOfResults[p12]
				end,
				render = Render,
				recycle = if NoRowDrop then function(Item, Placement, p12)
					-- upvalues: row (upval)
					return (row(Item, Placement, p12, true))
				end else nil
			})
		else
			local KeyOfResults = ordered
			
			return KeyOfResults({
				from = assert(p5.source),
				key = function(p12, _)
					return p12.key
				end,
				render = assert(p5.wrap)(assert(Render))
			})
		end
	end
end
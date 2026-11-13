local _ = require("./drag_types")
local _ = require("./environment_types")
local _ = require("./collection_reorder_state")

return function(p1, ScrollFrame)
	local Ctx = p1.ctx
	local Spec = p1.spec
	local ReadFunction = Ctx.read
	local ReadSourceFunction = Ctx.readSource
	local Moving = p1.moving
	local Incoming = p1.incoming
	local Drag = p1.drag
	local Source = p1.source
	local Controls = p1.controls
	local ReservedSlots = p1.reservedSlots
	local CollectionId = p1.collectionId
	local ItemOfFunction = p1.itemOf
	local LocationFunction = p1.location
	local Horizontal = p1.horizontal
	local ScaleOfFunction = p1.scaleOf
	local AlongBodyFunction = p1.alongBody
	local AxisFunction = p1.axis
	local CrossAxisFunction = p1.crossAxis
	local Focus = p1.focus
	local Copy = if Spec.drop then table.clone(Spec.drop) else {}
	local AcceptsFunction = Copy.accepts
	local OnDropFunction = Copy.onDrop
	local OnUpdateFunction = Copy.onUpdate
	
	if ReservedSlots and Copy.landing == nil then
		function Copy.landing(p2)
			-- upvalues: Drag (copy), p1 (copy), Controls (copy), ReadFunction (copy), ReservedSlots (copy), ScaleOfFunction (copy), ScrollFrame (copy), Horizontal (copy)
			local PeekResult = Drag.state:peek()
			local RecallResult = p1.recall(if PeekResult then PeekResult.payload else nil)
			local v1 = if RecallResult == nil then nil else assert(Controls.indexOfKey)(RecallResult)
			
			if v1 == nil and p2.insertion then
				local SlotGapResult, SlotGapResult2 = p1.slotGap(if PeekResult then PeekResult.payload else nil, p2.insertion)
				
				if SlotGapResult and SlotGapResult2 then
					v1 = if SlotGapResult2 < SlotGapResult then SlotGapResult - 1 else SlotGapResult
				else
					local BeforeKey = p2.insertion.beforeKey
					v1 = if BeforeKey == nil then nil else assert(Controls.indexOfKey)(BeforeKey)
				end
			end
			local v2 = assert(Controls.placementOf)(v1 or #ReadFunction(ReservedSlots) + 1)
			local ScaleOfResult = ScaleOfFunction(ScrollFrame)
			local Items = ScrollFrame:FindFirstChild("Items")
			local AbsolutePosition = if Items then Items.AbsolutePosition else ScrollFrame.AbsolutePosition - ScrollFrame.CanvasPosition * ScaleOfResult
			
			return {
				x = AbsolutePosition.X + (if Horizontal then v2.offset else v2.crossOffset) * ScaleOfResult,
				y = AbsolutePosition.Y + (if Horizontal then v2.crossOffset else v2.offset) * ScaleOfResult,
				w = (if Horizontal then v2.size else v2.crossSize) * ScaleOfResult,
				h = (if Horizontal then v2.crossSize else v2.size) * ScaleOfResult
			}
		end
	end
	local t = {}
	local v1 = nil
	local v2 = nil
	local List = {}
	
	local function indexRows(List1, Keys)
		-- upvalues: v1 (ref), v2 (ref), Moving (copy), List (ref), p1 (copy)
		if List1 ~= v1 or Keys ~= v2 then
			v1 = List1
			v2 = Keys
			local PeekResult = Moving:peek()
			
			if PeekResult and PeekResult.keys == Keys then
				List = PeekResult.remaining
				
				return
			end
			List = {}
			local t = {}
			
			for _, key in Keys do
				t[key] = true
			end
			for i, value in List1 do
				local KeyOfResult = p1.keyOf(value, i)
				
				if not t[KeyOfResult] then
					table.insert(List, KeyOfResult)
				end
			end
		end
	end
	
	local function pointerSlot(Position): number
		-- upvalues: ScrollFrame (copy), ScaleOfFunction (copy), AxisFunction (copy), CrossAxisFunction (copy), List (ref), Controls (copy), p1 (copy)
		local v3 = 0
		local v4 = 1e999
		local v5 = 1e999
		
		if Position then
			local PositionDelta = Position - ScrollFrame.AbsolutePosition
			local CanvasPosition = ScrollFrame.CanvasPosition
			local ScaleOfResult = ScaleOfFunction(ScrollFrame)
			v4 = AxisFunction(PositionDelta) / ScaleOfResult + AxisFunction(CanvasPosition)
			v5 = CrossAxisFunction(PositionDelta) / ScaleOfResult + CrossAxisFunction(CanvasPosition)
		end
		local v6 = 1
		local CountList = #List
		while v6 <= CountList do
			local Floored = math.floor((v6 + CountList) / 2)
			local v7 = assert(Controls.placementOf)(assert((assert(Controls.indexOfKey)(List[Floored]))))
			
			if if p1.grid then v7.offset + v7.size <= v4 or v7.offset <= v4 and (v4 < v7.offset + v7.size and v7.crossOffset + v7.crossSize / 2 <= v5) else v4 >= v7.offset + v7.size / 2 then
				v3 = Floored
				v6 = Floored + 1
			else
				CountList = Floored - 1
			end
		end
		return v3
	end
	
	local function insertion(p2, p3)
		-- upvalues: ReadSourceFunction (copy), Source (copy), CollectionId (copy), Moving (copy), Drag (copy), ScrollFrame (copy), t (copy), indexRows (copy), pointerSlot (copy), List (ref)
		local IsMove: boolean = type(p2) == "table" and p2.collection == CollectionId and p3.operation == "move"
		local PeekResult = Moving:peek()
		local PeekResult1 = Drag.state:peek()
		indexRows(ReadSourceFunction(Source), if PeekResult and PeekResult1 and PeekResult1.source == ScrollFrame and p3.operation == "move" then PeekResult.keys else IsMove and p2.keys or t)
		local PeekResult2 = if PeekResult and PeekResult.keyboard and IsMove then PeekResult.slot:peek() else pointerSlot(p3.position)
		
		if p3.insertion then
			local BeforeKey = p3.insertion.beforeKey
			local AfterKey = p3.insertion.afterKey
			local FoundIndex = if BeforeKey == nil then nil else table.find(List, BeforeKey)
			local FoundIndex1 = if AfterKey == nil then nil else table.find(List, AfterKey)
			
			if (BeforeKey ~= nil or AfterKey ~= nil) and (FoundIndex == nil and FoundIndex1 == nil) then
				p3.invalid = "The insertion neighbors were removed"
				
				return
			end
			PeekResult2 = if FoundIndex then FoundIndex - 1 else FoundIndex1 or 0
		end
		p3.insertion = {
			collection = CollectionId,
			beforeKey = List[PeekResult2 + 1],
			afterKey = List[PeekResult2],
			slot = PeekResult2
		}
	end
	
	p1.setPointerSlot(function(p2)
		-- upvalues: Moving (copy), indexRows (copy), ReadSourceFunction (copy), Source (copy), pointerSlot (copy)
		local PeekResult = Moving:peek()
		
		if PeekResult == nil then
			return nil
		else
			indexRows(ReadSourceFunction(Source), PeekResult.keys)
			
			return (pointerSlot(p2))
		end
	end)
	
	local function localMove(p2, p3): boolean
		-- upvalues: CollectionId (copy), Spec (copy), ItemOfFunction (copy)
		if type(p2) ~= "table" or p2.collection ~= CollectionId or not Spec.onReorder or p3.operation ~= "move" then
			return false
		end
		if type(p2.keys) ~= "table" or #p2.keys == 0 then
			return false
		end
		for _, key in p2.keys do
			if ItemOfFunction(key) == nil then
				return false
			end
		end
		return true
	end
	
	Copy.propose = insertion
	
	function Copy.accepts(p4, p5)
		-- upvalues: ReadSourceFunction (copy), p1 (copy), localMove (copy), LocationFunction (copy), AcceptsFunction (copy), OnDropFunction (copy)
		if p5.invalid then
			return false, p5.invalid
		elseif ReadSourceFunction(p1.sort) ~= nil then
			return false, "Clear sorting before inserting items"
		elseif localMove(p4, p5) then
			if not LocationFunction then
				return true, nil
			end
			local LocationResult = LocationFunction(p4.keys, p5.insertion.slot)
			
			if LocationResult then
				return LocationResult, nil
			else
				return LocationResult, "Move items within the same folder"
			end
		elseif AcceptsFunction then
			return AcceptsFunction(p4, p5)
		else
			return OnDropFunction ~= nil, "This collection does not accept these items"
		end
	end
	
	function Copy.onDrop(p4, p5)
		-- upvalues: localMove (copy), p1 (copy), OnDropFunction (copy)
		if localMove(p4, p5) then
			p1.commitLocal(p4.keys, p5.insertion.slot)
			
			return true
		else
			return if OnDropFunction then OnDropFunction(p4, p5) else false
		end
	end
	
	local OnLeaveFunction = Copy.onLeave
	
	function Copy.onLeave(p4)
		-- upvalues: Incoming (copy), p1 (copy), OnLeaveFunction (copy)
		Incoming:set(nil)
		p1.place(false)
		
		if OnLeaveFunction then
			OnLeaveFunction(p4)
		end
	end
	
	function Copy.onUpdate(p4, p5, p6, p7)
		-- upvalues: Drag (copy), Incoming (copy), ScrollFrame (copy), Moving (copy), p1 (copy), OnUpdateFunction (copy)
		local PeekResult = Drag.state:peek()
		Incoming:set(if p6 and PeekResult and PeekResult.source ~= ScrollFrame then p5.insertion else nil)
		local PeekResult1 = Moving:peek()
		local Insertion = p5.insertion
		
		if PeekResult1 and not PeekResult1.keyboard and Insertion then
			PeekResult1.slot:set((math.clamp(Insertion.slot, 0, #PeekResult1.remaining)))
		end
		p1.place(p6)
		
		if OnUpdateFunction then
			OnUpdateFunction(p4, p5, p6, p7)
		end
	end
	
	Copy.autoscroll = Spec.autoscroll
	
	function Copy.scroll(p4, p5): boolean
		-- upvalues: ScaleOfFunction (copy), ScrollFrame (copy), AxisFunction (copy), AlongBodyFunction (copy), ReadSourceFunction (copy), Source (copy), Controls (copy), p1 (copy), Moving (copy)
		local AxisResultRatio = AxisFunction(ScrollFrame.AbsoluteWindowSize) / ScaleOfFunction(ScrollFrame)
		local Smallest = math.min(40, AxisResultRatio / 4)
		local AlongBodyResult: number = AlongBodyFunction(ScrollFrame, p4)
		local AlongBodyResultRatio = if Smallest <= 0 or AlongBodyResult < 0 or AxisResultRatio < AlongBodyResult then 0 elseif AlongBodyResult < Smallest then -(Smallest - AlongBodyResult) / Smallest elseif AxisResultRatio - Smallest < AlongBodyResult then (AlongBodyResult - AxisResultRatio + Smallest) / Smallest else 0
		local Source1 = ReadSourceFunction(Source)
		local v8 = if #Source1 > 0 then assert(Controls.placementOf)(#Source1) else nil
		local Largest: number = if v8 then math.max(0, v8.offset + v8.size - AxisResultRatio) else 0
		local AxisResult = AxisFunction(ScrollFrame.CanvasPosition)
		local ClampedValue = math.clamp(AxisResult + AlongBodyResultRatio * 600 * p5, 0, Largest)
		
		if ClampedValue == AxisResult then
			return false
		end
		p1.canvasOffset(ScrollFrame, ClampedValue)
		
		if Moving:peek() then
			p1.movePointer(p4)
		end
		return true
	end
	
	if Spec.drop or Spec.onReorder then
		Copy.feedback = false
		Drag.register(ScrollFrame, Copy)
	end
	Drag.own(ScrollFrame)
	Ctx.Compose.watch(function(Callback)
		-- upvalues: Focus (copy), Drag (copy), ScrollFrame (copy)
		local CallbackResult = Callback(Focus)
		local PeekResult = Drag.state:peek()
		
		if PeekResult and PeekResult.source == ScrollFrame and PeekResult.mode == "armed" then
			Drag.hover(Drag.targetOf(CallbackResult), nil)
		end
	end)
end
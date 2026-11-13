local _ = require("./control_types")
local CollectionPolicyModule = require("./collection_policy")
local ActivationModule = require("./activation")
local ScrollLockModule = require("./scroll_lock")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./collection_types")
local GestureServiceModule = require("./gesture_service")
local _ = require("./gesture_arbitration")
local DragSessionModule = require("./drag_session")
local _ = require("./drag_types")
local _ = require("./environment_types")
local ReducedFunction = require("./motion").reduced
local _ = require("./drag_lift")
local DynamicModule = require("../vendor/compose/core/dynamic")
local CloneFunction = table.clone

return function(Ctx, p1, Spec, Source, Callback2, Controls, Callback1, Selection, Sort, Editing, Grid, Callback, InstantLayout, ReservedSlots)
	-- upvalues: DragSessionModule (copy), GestureServiceModule (copy), ReducedFunction (copy), CollectionPolicyModule (copy), DynamicModule (copy), ScrollLockModule (copy), ActivationModule (copy), CloneFunction (copy)
	local Compose = Ctx.Compose
	local ReadFunction = Ctx.read
	local ReadSourceFunction = Ctx.readSource
	local TypesVector2 = Ctx.types.Vector2
	local TypesEnum = Ctx.types.Enum
	local CellResult = Compose.cell(nil)
	local v1 = nil
	local CellResult1 = Compose.cell(nil)
	local FormulaResult = Compose.formula(function(Callback): boolean
		-- upvalues: CellResult (copy)
		return Callback(CellResult) ~= nil
	end)
	local FormulaResult1 = Compose.formula(function(Callback)
		-- upvalues: CellResult (copy)
		local CallbackResult = Callback(CellResult)
		
		return CallbackResult ~= nil and CallbackResult.keyboard
	end)
	local CellResult2 = Compose.cell(false)
	local CellResult3 = Compose.cell(nil)
	local IsReorderable: boolean = Spec.reorderable == true or Spec.drag ~= nil
	local DragSessionModuleResult = DragSessionModule(Ctx)
	local GestureServiceModuleResult = GestureServiceModule(Ctx)
	local CollectionId = Spec.collectionId or Source
	local RowNodes = {}
	
	local function Callback3() end
	
	local function PointerSlot()
		return nil
	end
	
	local function Placement() end
	
	local IsDeletable = Spec.deletable == true
	local PreferredInputResult = if Ctx.config.userInputService then Ctx.observe.PreferredInput(Ctx.config.userInputService) else nil
	local FormulaResult2 = Compose.formula(function(Callback): boolean
		-- upvalues: PreferredInputResult (copy), ReadFunction (copy), Editing (copy)
		return (if PreferredInputResult then Callback(PreferredInputResult) else nil) == nil or ReadFunction(Editing, Callback) == true
	end)
	local SelectionMode = Spec.selectionMode or (if Spec.selection or Spec.onSelectionChange then "single" else "none")
	local IsMultiple: boolean = Spec.selectionIndicator ~= false and (SelectionMode == "multiple" or SelectionMode ~= "none" and not IsDeletable)
	local NoIsMultiple: boolean = IsDeletable and not IsMultiple
	local FormulaResult3 = Compose.formula(function(Callback): boolean
		-- upvalues: IsMultiple (copy), ReadFunction (copy), Editing (copy), PreferredInputResult (copy), TypesEnum (copy)
		return IsMultiple and (ReadFunction(Editing, Callback) == true and (PreferredInputResult == nil or Callback(PreferredInputResult) ~= TypesEnum.PreferredInput.KeyboardAndMouse))
	end)
	local FormulaResult4 = Compose.formula(function(Callback): number
		-- upvalues: NoIsMultiple (copy), FormulaResult2 (copy), FormulaResult3 (copy)
		return if NoIsMultiple and Callback(FormulaResult2) or Callback(FormulaResult3) then 44 else 0
	end)
	local FormulaResult5 = Compose.formula(function(Callback): number
		-- upvalues: IsReorderable (copy), FormulaResult2 (copy)
		return if IsReorderable and Callback(FormulaResult2) then 44 else 0
	end)
	local FormulaResult6 = Compose.formula(function(Callback): number
		-- upvalues: PreferredInputResult (copy), Editing (copy), IsMultiple (copy), IsReorderable (copy), IsDeletable (copy), TypesEnum (copy), Grid (copy), FormulaResult4 (copy), FormulaResult5 (copy)
		local CallbackResult = if PreferredInputResult then Callback(PreferredInputResult) else nil
		local IsCallbackResultMatch: boolean = Editing ~= nil and (if IsMultiple or IsReorderable then CallbackResult == TypesEnum.PreferredInput.Touch or CallbackResult == TypesEnum.PreferredInput.Gamepad else IsDeletable and (CallbackResult == TypesEnum.PreferredInput.Touch or CallbackResult == TypesEnum.PreferredInput.Gamepad))
		
		return if Grid then math.max(Callback(FormulaResult4), Callback(FormulaResult5), if IsCallbackResultMatch then 44 else 0) else 0
	end)
	local ReducedResult = ReducedFunction(Ctx)
	local IsHorizontal = Spec.direction == "horizontal"
	
	local function axis(Vector)
		-- upvalues: IsHorizontal (copy)
		return if IsHorizontal then Vector.X else Vector.Y
	end
	
	local function crossAxis(Vector)
		-- upvalues: IsHorizontal (copy)
		return if IsHorizontal then Vector.Y else Vector.X
	end
	
	local v2 = assert(Compose.currentOwner())
	local WithOwnerResult = nil
	
	local function scaleOf(ScrollFrame)
		-- upvalues: WithOwnerResult (ref), Compose (copy), v2 (copy), Ctx (copy)
		if WithOwnerResult == nil then
			local LayoutUnit = ScrollFrame:FindFirstChild("LayoutUnit")
			
			if LayoutUnit and LayoutUnit:IsA("GuiObject") then
				WithOwnerResult = Compose.withOwner(v2, function()
					-- upvalues: Ctx (upval), LayoutUnit (copy)
					return Ctx.observe.AbsoluteSize(LayoutUnit)
				end)
			end
		end
		local X = if WithOwnerResult then WithOwnerResult:peek().X else 0
		
		return if X > 0 then X else 1
	end
	
	local function alongBody(Frame, Vector)
		-- upvalues: IsHorizontal (copy), scaleOf (copy)
		local AbsolutePosition = Frame.AbsolutePosition
		
		return ((if IsHorizontal then Vector.X else Vector.Y) - (if IsHorizontal then AbsolutePosition.X else AbsolutePosition.Y)) / scaleOf(Frame)
	end
	
	local function canvasOffset(ScrollFrame, p2)
		-- upvalues: IsHorizontal (copy), TypesVector2 (copy)
		ScrollFrame.CanvasPosition = if IsHorizontal then TypesVector2.new(p2, ScrollFrame.CanvasPosition.Y) else TypesVector2.new(ScrollFrame.CanvasPosition.X, p2)
	end
	
	local UserInputService = Ctx.config.userInputService
	local Gesture = {
		captured = nil,
		recycled = false,
		selectedPickup = false,
		lastTap = nil,
		pendingInput = nil,
		pickupPosition = nil,
		origin = nil,
		travel = 0,
		keyboardTarget = nil,
		touchKey = nil,
		touchOrigin = nil,
		pressTransfer = nil,
		releaseScrollers = nil,
		gestureOwner = nil
	}
	local self = setmetatable({}, { __mode = "k" })
	local GuiService = Ctx.config.guiService
	local ObserveResult = if GuiService and GuiService.GetPropertyChangedSignal then Ctx.selection.observe() else Compose.cell(nil)
	
	local function disarm()
		-- upvalues: Gesture (copy)
		Gesture.touchKey = nil
		Gesture.touchOrigin = nil
		
		if Gesture.touchHold then
			Gesture.touchHold:Disconnect()
			Gesture.touchHold = nil
		end
	end
	
	Compose.cleanup(disarm)
	local Lifts = {}
	local CellResult4 = Compose.cell(1)
	local Key = nil
	
	local function settle()
		-- upvalues: Key (ref), Lifts (copy)
		local Key1 = Key
		Key = nil
		local Lift = if Key1 == nil then nil else Lifts[Key1]
		
		if Lift then
			Lift.release()
		end
	end
	
	local function lift(p2, p3)
		-- upvalues: Key (ref), Lifts (copy), CellResult4 (copy)
		local Key1 = Key
		Key = nil
		local Lift = if Key1 == nil then nil else Lifts[Key1]
		
		if Lift then
			Lift.release()
		end
		local Lift1 = Lifts[p2]
		
		if Lift1 ~= nil and p3 ~= nil and p3 ~= 1 then
			CellResult4:set(p3)
			Key = p2
			Lift1.press()
			
			return
		end
	end
	
	local function clearMove()
		-- upvalues: Gesture (copy), GestureServiceModuleResult (copy), CellResult (copy), GuiService (copy), Ctx (copy), Key (ref), Lifts (copy), Controls (copy), Callback1 (copy), IsHorizontal (copy), scaleOf (copy), TypesVector2 (copy), v1 (ref), Placement (ref), CellResult1 (copy), RowNodes (copy)
		if Gesture.gestureOwner then
			GestureServiceModuleResult.cancelOwner(Gesture.gestureOwner)
			Gesture.gestureOwner = nil
		end
		local PeekResult = CellResult:peek()
		local GetResult = GuiService and Ctx.selection.get()
		local IsGetResultMatch: boolean = PeekResult ~= nil and (PeekResult.keyboard and GetResult == Gesture.keyboardTarget)
		Gesture.captured = nil
		Gesture.pressTransfer = nil
		Gesture.selectedPickup = false
		Gesture.touchKey = nil
		Gesture.touchOrigin = nil
		
		if Gesture.touchHold then
			Gesture.touchHold:Disconnect()
			Gesture.touchHold = nil
		end
		local Key1 = Key
		Key = nil
		local Lift = if Key1 == nil then nil else Lifts[Key1]
		
		if Lift then
			Lift.release()
		end
		if Gesture.releaseScrollers then
			Gesture.releaseScrollers()
			Gesture.releaseScrollers = nil
		end
		if IsGetResultMatch and PeekResult and GuiService then
			Ctx.selection.set(nil)
			local v3 = assert(Controls.indexOfKey)(PeekResult.key)
			
			if v3 then
				local CallbackResult = Callback1()
				local AbsoluteWindowSize = CallbackResult.AbsoluteWindowSize
				local Center = assert(Controls.offsetOf)(v3, "center", (if IsHorizontal then AbsoluteWindowSize.X else AbsoluteWindowSize.Y) / scaleOf(CallbackResult))
				CallbackResult.CanvasPosition = if IsHorizontal then TypesVector2.new(Center, CallbackResult.CanvasPosition.Y) else TypesVector2.new(CallbackResult.CanvasPosition.X, Center)
			end
		end
		CellResult:set(nil)
		v1 = nil
		Placement(false)
		CellResult1:set(nil)
		
		if PeekResult and PeekResult.preview then
			PeekResult.preview:Destroy()
		end
		if IsGetResultMatch and PeekResult and GuiService then
			local RowNode = RowNodes[PeekResult.key]
			local Move = RowNode and RowNode:FindFirstChild("Move")
			
			if Move and Move:IsA("GuiObject") and Move.Visible then
				Ctx.selection.set(Move)
			end
		end
	end
	
	Callback3 = clearMove
	
	local function cancel()
		-- upvalues: DragSessionModuleResult (copy), Callback1 (copy), clearMove (copy)
		local PeekResult = DragSessionModuleResult.state:peek()
		
		if PeekResult and PeekResult.executing then return end
		if PeekResult and PeekResult.source == Callback1() then
			DragSessionModuleResult.finish(false, "Cancelled")
		end
		clearMove()
	end
	
	Compose.cleanup(cancel)
	
	local function movable(p2): boolean
		-- upvalues: CollectionPolicyModule (upval), Spec (copy)
		return CollectionPolicyModule.allows(Spec.movable, p2) and not CollectionPolicyModule.disabled(Spec.disabled, p2)
	end
	
	local FormulaResult7 = if Spec.selectionFrom == nil and ReservedSlots == nil then nil else Compose.formula(function(p2)
		-- upvalues: ReadFunction (copy), Spec (copy), Source (copy), Callback2 (copy)
		local t = {}
		local SelectionFrom = Spec.selectionFrom or Source
		for i, value in ReadFunction(SelectionFrom, p2) do
			t[Callback2(value, i)] = value
		end
		return t
	end)
	
	local function itemOf(p3)
		-- upvalues: FormulaResult7 (copy), Controls (copy), ReadSourceFunction (copy), Source (copy)
		if FormulaResult7 then
			return FormulaResult7:peek()[p3]
		else
			local v3 = assert(Controls.indexOfKey)(p3)
			
			return if v3 then ReadSourceFunction(Source)[v3] else nil
		end
	end
	
	local function recall(p3, Callback)
		-- upvalues: ReservedSlots (copy), DynamicModule (upval), ReadFunction (copy), DragSessionModuleResult (copy), FormulaResult7 (copy), Callback1 (copy)
		if ReservedSlots == nil or type(p3) ~= "table" then
			return nil
		end
		local Keys = DynamicModule.raw(p3, "keys")
		local RawResult = if type(Keys) == "table" then DynamicModule.raw(Keys, 1) else nil
		local v3 = nil
		
		for _, value in ReadFunction(ReservedSlots, Callback) do
			if value == RawResult then
				v3 = value
				break
			end
		end
		if v3 == nil then
			return nil
		else
			local CallbackResult = if Callback then Callback(DragSessionModuleResult.state) else DragSessionModuleResult.state:peek()
			
			return if (if Callback then Callback(assert(FormulaResult7)) else assert(FormulaResult7):peek())[v3] == nil or CallbackResult ~= nil and CallbackResult.source == Callback1() then v3 else nil
		end
	end
	
	local function slotGap(p4, p5, Callback)
		-- upvalues: ReservedSlots (copy), DynamicModule (upval), FormulaResult7 (copy), ReadFunction (copy), Controls (copy)
		if ReservedSlots == nil then
			return nil, nil
		end
		local Keys = if type(p4) == "table" then DynamicModule.raw(p4, "keys") else nil
		
		if type(Keys) == "table" and #Keys > 1 then
			return nil, nil
		end
		local CallbackResult = if Callback then Callback(assert(FormulaResult7)) else assert(FormulaResult7):peek()
		local ReadResult = ReadFunction(ReservedSlots, Callback)
		local BeforeKey = p5.beforeKey
		local v4 = nil
		
		if BeforeKey == nil then
			local v5 = 0
			
			for i, value1 in ReadResult do
				if CallbackResult[value1] ~= nil then
					v5 = i
				end
			end
			v4 = v5 + 1
		else
			for _, value in ReadResult do
				if value == BeforeKey then
					v4 = assert(Controls.indexOfKey)(value)
					break
				end
			end
		end
		if v4 == nil then
			return nil, nil
		end
		local v6: number? = nil
		
		for i1, value2 in ReadResult do
			if CallbackResult[value2] == nil and (v6 == nil or math.abs(i1 - v4) < math.abs(v6 - v4)) then
				v6 = i1
			end
		end
		return v4, v6
	end
	
	local function begin(Key1, p6, p7, Enabled)
		-- upvalues: Gesture (copy), DragSessionModuleResult (copy), Callback1 (copy), IsReorderable (copy), ReadSourceFunction (copy), Sort (copy), Spec (copy), CellResult (copy), RowNodes (copy), GestureServiceModuleResult (copy), Source (copy), Selection (copy), Callback2 (copy), CollectionPolicyModule (upval), ReadFunction (copy), CollectionId (copy), TypesEnum (copy), ScrollLockModule (upval), ActivationModule (upval), Compose (copy), CloneFunction (upval), Key (ref), Lifts (copy), CellResult2 (copy), TypesVector2 (copy), FormulaResult7 (copy), Controls (copy), Callback3 (ref), CellResult1 (copy), v1 (ref), Placement (ref), Ctx (copy)
		Gesture.lastTap = nil
		local PeekResult = DragSessionModuleResult.state:peek()
		
		if PeekResult and PeekResult.source ~= Callback1() then return end
		if not IsReorderable or ReadSourceFunction(Sort) ~= nil or not Spec.onReorder and not Spec.drag or p6 ~= nil and Gesture.captured ~= nil and CellResult:peek() ~= nil then return end
		if p6 and Gesture.pendingInput then
			local RowNode = RowNodes[Key1]
			local GetResult = GestureServiceModuleResult.get(Gesture.pendingInput)
			
			if GetResult and (GetResult.owner ~= RowNode or GetResult.kind ~= "pending" and GetResult.kind ~= "drag") then return end
			if RowNode then
				if not GetResult then
					GestureServiceModuleResult.begin(Gesture.pendingInput, RowNode, Gesture.pickupPosition or p6, { pickup = "immediate" })
				end
				if not GestureServiceModuleResult.claim(Gesture.pendingInput, RowNode, "drag") then return end
				Gesture.gestureOwner = RowNode
			end
		end
		local Source1 = ReadSourceFunction(Source)
		local Source2 = ReadSourceFunction(Selection)
		
		for i, value in Source1 do
			if Callback2(value, i) == Key1 then
				if CollectionPolicyModule.allows(Spec.movable, value) and not CollectionPolicyModule.disabled(Spec.disabled, value) then break end
				return
			end
		end
		local Keys = {}
		local Included = {}
		local Items = {}
		local SelectionFrom = Spec.selectionFrom or Source
		for i1, value1 in ReadFunction(SelectionFrom) do
			local CallbackResult = Callback2(value1, i1)
			
			if CollectionPolicyModule.allows(Spec.movable, value1) and not CollectionPolicyModule.disabled(Spec.disabled, value1) and (CallbackResult == Key1 or Source2[Key1] and Source2[CallbackResult]) then
				table.insert(Keys, CallbackResult)
				table.insert(Items, value1)
				Included[CallbackResult] = true
				
				if not Source2[Key1] then break end
			end
		end
		local PressTransfer = if p6 == nil and not Enabled then nil else Gesture.pressTransfer
		
		if PressTransfer and PressTransfer.key == Key1 and PressTransfer.pointer == Gesture.pendingInput then
			Keys = table.clone(PressTransfer.keys)
			Items = table.clone(PressTransfer.items)
			table.clear(Included)
			
			for _, key in Keys do
				Included[key] = true
			end
		end
		local Remaining = {}
		local Count = 0
		local Flag = false
		
		for i2, value2 in Source1 do
			local CallbackResult = Callback2(value2, i2)
			
			if Included[CallbackResult] then
				Flag = true
			else
				table.insert(Remaining, CallbackResult)
				
				if not Flag then
					Count += 1
				end
			end
		end
		if #Keys > 0 then
			local Options = if PressTransfer and PressTransfer.key == Key1 and PressTransfer.pointer == Gesture.pendingInput then PressTransfer.options elseif Spec.drag then Spec.drag(Items, Keys) else {
				payload = { collection = CollectionId, keys = Keys, items = Items },
				operations = { "move" }
			}
			
			if Enabled and not Options.armOnTap then return end
			local IsNotUserInputStateMatch: boolean = Gesture.pendingInput ~= nil and (Gesture.pendingInput.UserInputState ~= TypesEnum.UserInputState.End and Gesture.pendingInput.UserInputState ~= TypesEnum.UserInputState.Cancel)
			Gesture.captured = if p6 and IsNotUserInputStateMatch then Gesture.pendingInput else nil
			local RowNode = RowNodes[Key1]
			
			if Gesture.captured and Gesture.captured.UserInputType == TypesEnum.UserInputType.Touch and RowNode and not Gesture.releaseScrollers then
				Gesture.releaseScrollers = ScrollLockModule.holdAncestors(RowNode)
			end
			Gesture.recycled = false
			ActivationModule.consume(Gesture.captured)
			local config = {
				preview = if Options.preview then Options.preview:Clone() else nil,
				key = Key1,
				keys = Keys,
				included = Included,
				remaining = Remaining,
				slot = Compose.cell(Count),
				pointer = p6 ~= nil,
				keyboard = p6 == nil,
				tap = Enabled == true
			}
			local ValidFunction = Options.valid
			local OnEndFunction = Options.onEnd
			local CloneResult = CloneFunction(Options)
			CloneResult.mark = false
			local Lift = if Key == Key1 then Lifts[Key1] else nil
			
			if Lift then
				CloneResult.liftValue = Lift.value
				CloneResult.liftCarry = Lift.carry
			end
			CellResult2:set(false)
			
			if Spec.drag and (Spec.onReorder or Spec.drop) then
				CloneResult.navigationHint = "Y: choose destination"
			end
			local RowNode1 = RowNodes[Key1]
			local NewAbsolutePosition = if RowNode1 then RowNode1.AbsolutePosition + RowNode1.AbsoluteSize / 2 else p6
			
			function CloneResult.returnPosition()
				-- upvalues: RowNodes (upval), Key1 (copy), NewAbsolutePosition (copy), TypesVector2 (upval)
				local RowNode = RowNodes[Key1]
				
				return if RowNode and RowNode.Parent then RowNode.AbsolutePosition + RowNode.AbsoluteSize / 2 else NewAbsolutePosition or TypesVector2.zero
			end
			
			function CloneResult.valid(): boolean
				-- upvalues: ValidFunction (copy), Keys (ref), FormulaResult7 (upval), Controls (upval), ReadSourceFunction (upval), Source (upval), CollectionPolicyModule (upval), Spec (upval)
				if ValidFunction and not ValidFunction() then
					return false
				end
				for _, key in Keys do
					local PeekResultEntry = nil
					if FormulaResult7 then
						PeekResultEntry = FormulaResult7:peek()[key]
					else
						local v7 = assert(Controls.indexOfKey)(key)
						PeekResultEntry = if v7 then ReadSourceFunction(Source)[v7] else nil
					end
					if PeekResultEntry == nil or (not CollectionPolicyModule.allows(Spec.movable, PeekResultEntry) or CollectionPolicyModule.disabled(Spec.disabled, PeekResultEntry)) then
						return false
					end
				end
				return true
			end
			
			function CloneResult.onEnd(p8, p9)
				-- upvalues: Callback3 (upval), OnEndFunction (copy)
				Callback3()
				
				if OnEndFunction then
					OnEndFunction(p8, p9)
				end
			end
			
			DragSessionModuleResult.begin(Callback1(), CloneResult, if p6 then "pointer" else "armed", Gesture.captured, false, if RowNode1 then {
				position = if p6 then Gesture.pickupPosition or p6 else RowNode1.AbsolutePosition + RowNode1.AbsoluteSize / 2,
				source = RowNode1
			} else nil)
			CellResult1:set(p6)
			v1 = Source1
			CellResult:set(config)
			
			if p6 then
				DragSessionModuleResult.update(p6)
			end
			local PeekResult1 = DragSessionModuleResult.state:peek()
			Placement(PeekResult1 ~= nil and (PeekResult1.target == Callback1() and PeekResult1.accepted == true))
			
			if p6 == nil and not p7 and Gesture.keyboardTarget and Gesture.keyboardTarget.Visible and Ctx.config.guiService then
				Ctx.selection.set(Gesture.keyboardTarget)
			end
		end
	end
	
	local function commitLocal(List, p8: number)
		-- upvalues: Callback (copy), Spec (copy), ReadSourceFunction (copy), Source (copy), Callback2 (copy), CollectionPolicyModule (upval)
		if Callback then
			local CallbackResult, CallbackResult2, CallbackResult3 = Callback(List, p8)
			
			if CallbackResult then
				assert(Spec.onReorder)(List, CallbackResult2, CallbackResult3)
			end
			return
		else
			local Source1 = ReadSourceFunction(Source)
			local t = {}
			local List1 = {}
			
			for _, value in List do
				t[value] = true
			end
			for i, value1 in Source1 do
				local CallbackResult1 = Callback2(value1, i)
				
				if not t[CallbackResult1] then
					table.insert(List1, CallbackResult1)
				end
			end
			local Count = 0
			
			for i1, value2 in Source1 do
				local CallbackResult4 = Callback2(value2, i1)
				
				if t[CallbackResult4] then
					Count += 1
					table.insert(List1, p8 + Count, CallbackResult4)
				end
			end
			for i2, value3 in Source1 do
				if (not CollectionPolicyModule.allows(Spec.movable, value3) or CollectionPolicyModule.disabled(Spec.disabled, value3)) and Callback2(value3, i2) ~= List1[i2] then return end
			end
			for i3, value4 in Source1 do
				if Callback2(value4, i3) ~= List1[i3] then
					assert(Spec.onReorder)(List, p8)
					break
				end
			end
		end
	end
	
	local function commit()
		-- upvalues: CellResult (copy), DragSessionModuleResult (copy), Callback1 (copy)
		local PeekResult = CellResult:peek()
		
		if PeekResult == nil then return end
		local PeekResult1 = DragSessionModuleResult.state:peek()
		
		if PeekResult.keyboard and (PeekResult1 == nil or PeekResult1.target == nil) then
			DragSessionModuleResult.commit(Callback1())
			
			return
		else
			DragSessionModuleResult.commit(nil)
		end
	end
	
	local function movePointer(p9)
		-- upvalues: CellResult (copy), CellResult1 (copy), DragSessionModuleResult (copy), Callback1 (copy), PointerSlot (ref), Placement (ref)
		local PeekResult = CellResult:peek()
		
		if PeekResult == nil then return end
		CellResult1:set(p9)
		
		if not PeekResult.pointer then
			local Copy = table.clone(PeekResult)
			Copy.pointer = true
			CellResult:set(Copy)
		end
		DragSessionModuleResult.update(p9)
		local PeekResult1 = DragSessionModuleResult.state:peek()
		local PeekResult11 = CellResult:peek()
		
		if PeekResult1 and PeekResult1.target ~= Callback1() and PeekResult11 then
			local PointerSlotResult = PointerSlot(p9)
			
			if PointerSlotResult then
				PeekResult11.slot:set(PointerSlotResult)
				Placement(nil)
			end
		end
	end
	
	local function step(p9, p10)
		-- upvalues: CellResult (copy), DragSessionModuleResult (copy), Grid (copy), Controls (copy), ReadSourceFunction (copy), Source (copy), Callback1 (copy), IsHorizontal (copy), scaleOf (copy), TypesVector2 (copy)
		local PeekResult = CellResult:peek()
		local PeekResult1 = DragSessionModuleResult.state:peek()
		
		if PeekResult and (not PeekResult1 or not PeekResult1.pending) then
			local PeekResult2 = PeekResult.slot:peek()
			local ClampedValue = math.clamp(PeekResult2 + p9, 0, #PeekResult.remaining)
			
			if Grid and p10 then
				local function point(PeekResult1: number)
					-- upvalues: PeekResult (copy), Controls (upval), ReadSourceFunction (upval), Source (upval)
					local RemainingEntry = PeekResult.remaining[PeekResult1 + 1]
					local v7 = assert(Controls.placementOf)((if RemainingEntry then assert(Controls.indexOfKey)(RemainingEntry) else #ReadSourceFunction(Source)) or 1)
					
					return v7.offset, v7.crossOffset + (if RemainingEntry then 0 else v7.crossSize)
				end
				
				local PointResult, PointResult2 = point(PeekResult2)
				local NavigationCross = PeekResult.navigationCross or PointResult2
				local v7 = 1e999
				local v8 = 1e999
				ClampedValue = PeekResult2
				PeekResult.navigationCross = NavigationCross
				
				for i = 0, #PeekResult.remaining do
					local PointResult1, PointResult2_1 = point(i)
					local ScaledPointResult = (PointResult1 - PointResult) * p9
					local Magnitude = math.abs(PointResult2_1 - NavigationCross)
					
					if ScaledPointResult > 0 and (ScaledPointResult < v7 or ScaledPointResult == v7 and Magnitude < v8) then
						v7 = ScaledPointResult
						v8 = Magnitude
						ClampedValue = i
					end
				end
			else
				PeekResult.navigationCross = nil
			end
			PeekResult.slot:set(ClampedValue)
			local CallbackResult = Callback1()
			local RemainingEntry = PeekResult.remaining[ClampedValue + 1] or PeekResult.remaining[ClampedValue]
			local v9 = if RemainingEntry then assert(Controls.indexOfKey)(RemainingEntry) else nil
			
			if v9 then
				local AbsoluteWindowSize = CallbackResult.AbsoluteWindowSize
				local Center = assert(Controls.offsetOf)(v9, "center", (if IsHorizontal then AbsoluteWindowSize.X else AbsoluteWindowSize.Y) / scaleOf(CallbackResult))
				CallbackResult.CanvasPosition = if IsHorizontal then TypesVector2.new(Center, CallbackResult.CanvasPosition.Y) else TypesVector2.new(CallbackResult.CanvasPosition.X, Center)
			end
			if PeekResult.keyboard then
				DragSessionModuleResult.hover(CallbackResult, nil)
			end
		end
	end
	
	Compose.watch(function(p11)
		-- upvalues: ReadSourceFunction (copy), Source (copy), Sort (copy), ReservedSlots (copy), ReadFunction (copy), CellResult (copy), Spec (copy), Callback2 (copy), CollectionPolicyModule (upval), DragSessionModuleResult (copy), Callback1 (copy), clearMove (copy), v1 (ref), Placement (ref)
		local Source1 = ReadSourceFunction(Source, p11)
		local Source2 = ReadSourceFunction(Sort, p11)
		
		if ReservedSlots then
			ReadFunction(ReservedSlots, p11)
		end
		local PeekResult = CellResult:peek()
		
		if PeekResult then
			local Count = 0
			local SelectionFrom = Spec.selectionFrom or Source
			for i, value in ReadFunction(SelectionFrom, p11) do
				if PeekResult.included[Callback2(value, i)] and (CollectionPolicyModule.allows(Spec.movable, value) and not CollectionPolicyModule.disabled(Spec.disabled, value)) then
					Count += 1
				end
			end
			if Source2 == nil and Count == #PeekResult.keys then
				if Source1 ~= v1 then
					local Copy = table.clone(PeekResult)
					v1 = Source1
					Copy.remaining = {}
					
					for i1, value1 in Source1 do
						local CallbackResult = Callback2(value1, i1)
						
						if not Copy.included[CallbackResult] then
							table.insert(Copy.remaining, CallbackResult)
						end
					end
					Copy.slot:set((math.min(Copy.slot:peek(), #Copy.remaining)))
					CellResult:set(Copy)
				end
			else
				local PeekResult1 = DragSessionModuleResult.state:peek()
				
				if not PeekResult1 or not PeekResult1.executing then
					if PeekResult1 and PeekResult1.source == Callback1() then
						DragSessionModuleResult.finish(false, "Cancelled")
					end
					clearMove()
				end
			end
		end
		Placement(nil)
	end)
	local CellResults = {}
	setmetatable(CellResults, { __mode = "v" })
	
	local function leads(Key)
		-- upvalues: CellResults (copy), CellResult (copy), Compose (copy)
		local CellResult1 = CellResults[Key]
		
		if CellResult1 == nil then
			local PeekResult = CellResult:peek()
			local CellResult2 = Compose.cell(PeekResult ~= nil and PeekResult.key == Key)
			CellResult1 = CellResult2
			CellResults[Key] = CellResult2
		end
		return CellResult1
	end
	
	local FormulaResult8 = Compose.formula(function(Callback)
		-- upvalues: CellResult (copy)
		local CallbackResult = Callback(CellResult)
		
		return if CallbackResult then CallbackResult.included else nil
	end)
	local v10 = nil
	local Key1 = nil
	
	local function _(p12, Value)
		-- upvalues: RowNodes (copy)
		local RowNode = RowNodes[p12]
		
		if RowNode then
			RowNode:SetAttribute("FacetDragging", Value)
			local Cells = RowNode:FindFirstChild("Cells")
			
			if Cells and Cells:IsA("GuiObject") then
				Cells.Visible = not Value
			end
		end
	end
	
	Compose.watch(function(Callback)
		-- upvalues: FormulaResult8 (copy), CellResult (copy), Key1 (ref), CellResults (copy), v10 (ref), RowNodes (copy)
		local CallbackResult = Callback(FormulaResult8)
		local PeekResult = CellResult:peek()
		local Key = if PeekResult then PeekResult.key else nil
		
		if Key ~= Key1 then
			local CellResult1 = if Key1 == nil then nil else CellResults[Key1]
			local CellResult2 = if Key == nil then nil else CellResults[Key]
			Key1 = Key
			
			if CellResult1 then
				CellResult1:set(false)
			end
			if CellResult2 then
				CellResult2:set(true)
			end
		end
		local v11 = v10
		
		if CallbackResult == v11 then return end
		v10 = CallbackResult
		
		if v11 then
			for i in v11 do
				if not CallbackResult or not CallbackResult[i] then
					local RowNode = RowNodes[i]
					
					if RowNode then
						RowNode:SetAttribute("FacetDragging", false)
						local Cells = RowNode:FindFirstChild("Cells")
						
						if Cells and Cells:IsA("GuiObject") then
							Cells.Visible = true
						end
					end
				end
			end
		end
		if CallbackResult then
			for i1, value in CallbackResult do
				if value then
					local RowNode = RowNodes[i1]
					
					if RowNode then
						RowNode:SetAttribute("FacetDragging", true)
						local Cells = RowNode:FindFirstChild("Cells")
						
						if Cells and Cells:IsA("GuiObject") then
							Cells.Visible = false
						end
					end
				end
			end
		end
	end)
	local InputParent = Ctx.config.inputParent
	
	if InputParent and not InputParent:IsA("PluginGui") then
		InputParent = nil
	end
	local function chosen(Callback, p12, p13)
		-- upvalues: ReadSourceFunction (copy), Selection (copy), ReadFunction (copy), Spec (copy), Source (copy), Callback2 (copy), Editing (copy), Callback1 (copy), ObserveResult (copy), self (copy)
		local List = {}
		local Source1 = ReadSourceFunction(Selection, Callback)
		local SelectionFrom = p13 and Spec.selectionFrom or Source
		for i, value in ReadFunction(SelectionFrom, Callback) do
			local CallbackResult = Callback2(value, i)
			
			if Source1[CallbackResult] then
				table.insert(List, CallbackResult)
			end
		end
		if #List == 0 and not p12 and ReadFunction(Editing, Callback) == true then
			local CallbackResult = Callback1()
			local CallbackResult1 = if Callback then Callback(ObserveResult) else ObserveResult:peek()
			
			if CallbackResult1 and not CallbackResult1:IsDescendantOf(CallbackResult) then
				CallbackResult1 = nil
			end
			while CallbackResult1 and CallbackResult1 ~= CallbackResult and #List == 0 do
				local SelfEntry = self[CallbackResult1]
				
				if SelfEntry == nil then
					for _, child in CallbackResult1:GetChildren() do
						SelfEntry = self[child]
						
						if SelfEntry ~= nil then break end
					end
				end
				if SelfEntry ~= nil then
					table.insert(List, SelfEntry)
				end
				CallbackResult1 = CallbackResult1.Parent
			end
		end
		return List
	end
	
	local _ = function(p14)
		-- upvalues: Ctx (copy), ObserveResult (copy), Callback1 (copy), IsDeletable (copy), CellResult (copy), chosen (copy)
		return function(Callback): boolean
			-- upvalues: p14 (copy), Ctx (upval), ObserveResult (upval), Callback1 (upval), IsDeletable (upval), CellResult (upval), chosen (upval)
			if not p14 then
				local Source = Ctx.readSource(ObserveResult, Callback)
				while Source do
					if Source:GetAttribute("FacetSelectionOwner") ~= true then
						Source = Source.Parent
						continue
					elseif Source ~= Callback1() then
						return false
					else
						break
					end
				end
			end
			return IsDeletable and ((if Callback then Callback(CellResult) else CellResult:peek()) == nil and #chosen(Callback, p14, true) > 0)
		end
	end
	
	local v12 = false
	
	local function CanDelete(Callback): boolean
		-- upvalues: v12 (copy), Ctx (copy), ObserveResult (copy), Callback1 (copy), IsDeletable (copy), CellResult (copy), chosen (copy)
		if not v12 then
			local Source = Ctx.readSource(ObserveResult, Callback)
			while Source do
				if Source:GetAttribute("FacetSelectionOwner") ~= true then
					Source = Source.Parent
					continue
				elseif Source ~= Callback1() then
					return false
				else
					break
				end
			end
		end
		return IsDeletable and ((if Callback then Callback(CellResult) else CellResult:peek()) == nil and #chosen(Callback, v12, true) > 0)
	end
	
	local v13 = true
	
	return {
		ctx = Ctx,
		UI = p1,
		spec = Spec,
		source = Source,
		keyOf = Callback2,
		controls = Controls,
		bodyOf = Callback1,
		selection = Selection,
		sort = Sort,
		editing = Editing,
		grid = Grid,
		location = Callback,
		instantLayout = InstantLayout,
		reservedSlots = ReservedSlots,
		gesture = Gesture,
		moving = CellResult,
		active = FormulaResult,
		keyboard = FormulaResult1,
		pointerPosition = CellResult1,
		choosingDestination = CellResult2,
		incoming = CellResult3,
		reorderable = IsReorderable,
		drag = DragSessionModuleResult,
		arbiter = GestureServiceModuleResult,
		collectionId = CollectionId,
		rowNodes = RowNodes,
		deletable = IsDeletable,
		preferred = PreferredInputResult,
		controlsShown = FormulaResult2,
		mode = SelectionMode,
		marked = IsMultiple,
		minusShown = NoIsMultiple,
		markShown = FormulaResult3,
		leading = FormulaResult4,
		trailing = FormulaResult5,
		header = FormulaResult6,
		motionReduced = ReducedResult,
		horizontal = IsHorizontal,
		axis = axis,
		crossAxis = crossAxis,
		scaleOf = scaleOf,
		alongBody = alongBody,
		canvasOffset = canvasOffset,
		input = UserInputService,
		rowKeys = self,
		gui = GuiService,
		focus = ObserveResult,
		pluginGui = InputParent,
		disarm = disarm,
		lifts = Lifts,
		liftScale = CellResult4,
		lift = lift,
		settle = settle,
		cancel = cancel,
		movable = movable,
		leads = leads,
		itemOf = itemOf,
		recall = recall,
		slotGap = slotGap,
		begin = begin,
		commitLocal = commitLocal,
		commit = commit,
		movePointer = movePointer,
		setPointerSlot = function(Value)
			-- upvalues: PointerSlot (ref)
			PointerSlot = Value
		end,
		place = function(p15)
			-- upvalues: Placement (ref)
			Placement(p15)
		end,
		setPlacement = function(Value)
			-- upvalues: Placement (ref)
			Placement = Value
		end,
		step = step,
		chosen = chosen,
		canDelete = CanDelete,
		canDeleteSelected = function(Callback): boolean
			-- upvalues: v13 (copy), Ctx (copy), ObserveResult (copy), Callback1 (copy), IsDeletable (copy), CellResult (copy), chosen (copy)
			if not v13 then
				local Source = Ctx.readSource(ObserveResult, Callback)
				while Source do
					if Source:GetAttribute("FacetSelectionOwner") ~= true then
						Source = Source.Parent
						continue
					elseif Source ~= Callback1() then
						return false
					else
						break
					end
				end
			end
			return IsDeletable and ((if Callback then Callback(CellResult) else CellResult:peek()) == nil and #chosen(Callback, v13, true) > 0)
		end,
		remove = function(p15)
			-- upvalues: chosen (copy), ReadFunction (copy), Spec (copy), Source (copy), Callback2 (copy), CollectionPolicyModule (upval)
			local List = {}
			
			for _, value in chosen(nil, p15, true) do
				local SelectionFrom = Spec.selectionFrom or Source
				for i, value1 in ReadFunction(SelectionFrom) do
					if Callback2(value1, i) == value and CollectionPolicyModule.allows(Spec.rowDeletable, value1) and not CollectionPolicyModule.disabled(Spec.disabled, value1) then
						table.insert(List, value)
					end
				end
			end
			if #List > 0 and Spec.onDelete then
				Spec.onDelete(List)
			end
		end
	}
end
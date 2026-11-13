local PointerDragModule = require("./pointer_drag")
local CollectionPolicyModule = require("./collection_policy")
local ActivationModule = require("./activation")
local ScrollLockModule = require("./scroll_lock")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local DragPointerModule = require("./drag_pointer")
local _ = require("./collection_reorder_state")
local _ = require("./collection_reorder_pointer")
local DragLiftModule = require("./drag_lift")

return function(p1, p2)
	-- upvalues: PointerDragModule (copy), DragPointerModule (copy), ActivationModule (copy), ScrollLockModule (copy), CollectionPolicyModule (copy), DragLiftModule (copy)
	local Ctx = p1.ctx
	local UI = p1.UI
	local Spec = p1.spec
	local Gesture = p1.gesture
	local Compose = Ctx.Compose
	local Host = Ctx.Host
	local ReadFunction = Ctx.read
	local PointerDragModuleResult = PointerDragModule(Ctx)
	local TypesUDim2 = Ctx.types.UDim2
	local TypesVector2 = Ctx.types.Vector2
	local TypesEnum = Ctx.types.Enum
	local Moving = p1.moving
	local Selection = p1.selection
	local Sort = p1.sort
	local Grid = p1.grid
	local Reorderable = p1.reorderable
	local Preferred = p1.preferred
	local ControlsShown = p1.controlsShown
	local Leading = p1.leading
	local Trailing = p1.trailing
	local Header = p1.header
	local Mode = p1.mode
	local MinusShown = p1.minusShown
	local NoMinusShown: boolean = p1.editing == nil and not MinusShown
	local FromOffsetResult = if Grid then TypesUDim2.fromOffset(0, Header:peek()) else TypesUDim2.fromOffset(Leading:peek(), 0)
	local NewTypesUDim = if Grid then TypesUDim2.new(1, 0, 1, -Header:peek()) else TypesUDim2.new(1, -Leading:peek() - Trailing:peek(), 1, 0)
	local RowNodes = p1.rowNodes
	local RowKeys = p1.rowKeys
	local Gui = p1.gui
	local MovableFunction = p1.movable
	local BeginFunction = p1.begin
	local CommitFunction = p1.commit
	local MovePointerFunction = p1.movePointer
	local AxisFunction = p1.axis
	local CrossAxisFunction = p1.crossAxis
	local ObserveResult = if Ctx.config.guiService then Ctx.selection.observe() else nil
	local Snappy = Ctx.motionSpring("snappy")
	local SpringResult = Ctx.runtime.spring(function(Callback)
		-- upvalues: Leading (copy)
		return Callback(Leading)
	end, { period = Snappy.period, damping = Snappy.damping })
	local SpringResult1 = Ctx.runtime.spring(function(Callback)
		-- upvalues: Trailing (copy)
		return Callback(Trailing)
	end, { period = Snappy.period, damping = Snappy.damping })
	local t = {}
	local v1 = false
	local IsNotGamepadMatch = false
	local v2 = false
	local v3 = nil
	
	local function refresh(p3, p4)
		-- upvalues: v2 (ref), MovableFunction (copy), Reorderable (copy), IsNotGamepadMatch (ref), v1 (ref), v3 (ref)
		local MovableResult = v2 and (if p4 == nil then MovableFunction(p3.current:peek()) else MovableFunction(p4))
		local Handle = p3.handle
		
		if Handle and MovableResult ~= p3.enabled then
			p3.enabled = MovableResult
			Handle.Interactable = MovableResult
			Handle.Selectable = MovableResult
			
			if MovableResult then
				Handle:RemoveTag("facet-disabled")
			else
				Handle:AddTag("facet-disabled")
			end
		end
		local IsNotGamepadMatch1 = Reorderable and (MovableResult and IsNotGamepadMatch)
		
		if p3.detector and p3.rowEnabled ~= IsNotGamepadMatch1 then
			p3.rowEnabled = IsNotGamepadMatch1
			p3.detector.Enabled = IsNotGamepadMatch1
		end
		local Inverted: boolean = MovableResult and (v1 and not (Handle and rawequal(Handle, v3)))
		
		if p3.handleDetector and p3.handleEnabled ~= Inverted then
			p3.handleEnabled = Inverted
			p3.handleDetector.Enabled = Inverted
		end
	end
	
	Compose.watch(function(Callback)
		-- upvalues: Preferred (copy), v1 (ref), v2 (ref), PointerDragModuleResult (copy), Sort (copy), IsNotGamepadMatch (ref), TypesEnum (copy), v3 (ref), ObserveResult (copy), Spec (copy), Ctx (copy), p1 (copy), t (copy), refresh (copy)
		local CallbackResult = if Preferred then Callback(Preferred) else nil
		local PointerDragModuleResultResult = PointerDragModuleResult(Callback)
		local NoCallbackResult = Callback(Sort) == nil
		v1 = PointerDragModuleResultResult
		v2 = NoCallbackResult
		IsNotGamepadMatch = v1 and (CallbackResult ~= TypesEnum.PreferredInput.Touch and CallbackResult ~= TypesEnum.PreferredInput.Gamepad)
		v3 = if CallbackResult == TypesEnum.PreferredInput.Gamepad and ObserveResult then Callback(ObserveResult) else nil
		local t1 = {}
		
		if Spec.movable ~= nil or Spec.disabled ~= nil then
			for i, value in Ctx.readSource(p1.source, Callback) do
				t1[p1.keyOf(value, i)] = value
			end
		end
		for i1, value1 in t do
			refresh(value1, t1[i1])
		end
	end)
	
	return function(Button, Current, Key, p3)
		-- upvalues: RowKeys (copy), t (copy), Compose (copy), Moving (copy), CommitFunction (copy), BeginFunction (copy), MinusShown (copy), ControlsShown (copy), p1 (copy), Host (copy), Grid (copy), TypesEnum (copy), TypesVector2 (copy), DragPointerModule (upval), Ctx (copy), Gesture (copy), Gui (copy), MovePointerFunction (copy), ActivationModule (upval), MovableFunction (copy), ReadFunction (copy), Sort (copy), TypesUDim2 (copy), v2 (ref), refresh (copy), ScrollLockModule (upval), Reorderable (copy), CollectionPolicyModule (upval), Spec (copy), UI (copy), Mode (copy), Selection (copy), Trailing (copy), Snappy (copy), SpringResult1 (copy), Leading (copy), SpringResult (copy), NoMinusShown (copy), FromOffsetResult (copy), Header (copy), NewTypesUDim (copy), RowNodes (copy), AxisFunction (copy), CrossAxisFunction (copy), DragLiftModule (upval), p2 (copy)
		RowKeys[Button] = Key
		local config = { current = Current }
		t[Key] = config
		Compose.cleanup(function()
			-- upvalues: t (upval), Key (copy), config (copy)
			if t[Key] == config then
				t[Key] = nil
			end
		end)
		local PeekResult = Moving:peek()
		local IsIncludedEntry: boolean = PeekResult ~= nil and PeekResult.included[Key] == true
		local v4 = nil
		
		local function _()
			-- upvalues: Moving (upval), CommitFunction (upval), BeginFunction (upval), Key (copy)
			if Moving:peek() then
				CommitFunction()
				
				return
			else
				BeginFunction(Key)
			end
		end
		
		local Keyboard = false
		local CellResult = if MinusShown then Compose.cell(false) else nil
		
		if CellResult then
			Compose.watch(function(Callback)
				-- upvalues: ControlsShown (upval), CellResult (copy)
				if not Callback(ControlsShown) then
					CellResult:set(false)
				end
			end)
		end
		local function makeHandle()
			-- upvalues: p1 (upval), Key (copy), Host (upval), Grid (upval), TypesEnum (upval), TypesVector2 (upval), DragPointerModule (upval), Ctx (upval), Moving (upval), Gesture (upval), Keyboard (ref), BeginFunction (upval), Gui (upval), v4 (ref), MovePointerFunction (upval), CommitFunction (upval), ActivationModule (upval), MovableFunction (upval), Current (copy), ReadFunction (upval), Sort (upval), CellResult (copy), ControlsShown (upval), TypesUDim2 (upval), v2 (upval), Compose (upval), RowKeys (upval), config (copy), refresh (upval), ScrollLockModule (upval)
			local LeadsResult = p1.leads(Key)
			local UIDragDetectorResult = Host.UIDragDetector({
				Archivable = false,
				Enabled = false,
				DragStyle = if Grid then TypesEnum.UIDragDetectorDragStyle.TranslatePlane else TypesEnum.UIDragDetectorDragStyle.TranslateLine,
				DragAxis = if p1.horizontal then TypesVector2.new(1, 0) else TypesVector2.new(0, 1),
				ResponseStyle = TypesEnum.UIDragDetectorResponseStyle.CustomOffset,
				DragStart = function(p4)
					-- upvalues: DragPointerModule (upval), Ctx (upval), Moving (upval), Gesture (upval), Keyboard (upval), BeginFunction (upval), Key (upval), Gui (upval), v4 (upval)
					local DragPointerModuleResult = DragPointerModule(Ctx, p4)
					local PeekResult = Moving:peek()
					Gesture.origin = DragPointerModuleResult
					Gesture.travel = 0
					Gesture.pickupPosition = DragPointerModuleResult
					Keyboard = PeekResult ~= nil and PeekResult.keyboard
					
					if not Keyboard then
						BeginFunction(Key, DragPointerModuleResult)
						Gesture.selectedPickup = Moving:peek() ~= nil and (Gui ~= nil and (v4 ~= nil and rawequal(Ctx.selection.get(), v4)))
					end
				end,
				DragContinue = function(p4)
					-- upvalues: DragPointerModule (upval), Ctx (upval), Gesture (upval), Keyboard (upval), MovePointerFunction (upval)
					local DragPointerModuleResult = DragPointerModule(Ctx, p4)
					
					if Gesture.origin then
						Gesture.travel = math.max(Gesture.travel, (DragPointerModuleResult - Gesture.origin).Magnitude)
					end
					if not Keyboard or Gesture.travel >= 3 then
						MovePointerFunction(DragPointerModuleResult)
					end
				end,
				DragEnd = function()
					-- upvalues: Gesture (upval), Keyboard (upval), CommitFunction (upval), p1 (upval), Moving (upval), BeginFunction (upval), Key (upval)
					local IsTravelBelow: boolean = Gesture.origin ~= nil and Gesture.travel < 3
					Gesture.origin = nil
					
					if Keyboard then
						Keyboard = false
						CommitFunction()
						
						return
					end
					if not IsTravelBelow then
						CommitFunction()
						
						return
					end
					p1.cancel()
					
					if Moving:peek() then
						CommitFunction()
						
						return
					else
						BeginFunction(Key)
					end
				end
			})
			local Handle = nil
			
			local function activate(Input, p4)
				-- upvalues: ActivationModule (upval), Handle (ref), MovableFunction (upval), Current (upval), ReadFunction (upval), Sort (upval), Ctx (upval), TypesEnum (upval), Moving (upval), CommitFunction (upval), BeginFunction (upval), Key (upval)
				if ActivationModule.consumed(Input) or ActivationModule.intercepted(Handle, Input) or not MovableFunction(Current:peek()) or ReadFunction(Sort) ~= nil or not Ctx.available(Handle) then return end
				if Input == nil or Input.UserInputType ~= TypesEnum.UserInputType.MouseButton1 and Input.UserInputType ~= TypesEnum.UserInputType.Touch then
					if Moving:peek() then
						CommitFunction()
					else
						BeginFunction(Key)
					end
				end
				ActivationModule.notify(Handle, Input, p4)
			end
			
			Handle = Ctx.styled(Host.TextButton({
				Name = "Move",
				Archivable = false,
				Visible = p1.editing == nil and CellResult == nil or function(Callback): boolean
					-- upvalues: ControlsShown (upval), CellResult (upval)
					return Callback(ControlsShown) and (CellResult == nil or not Callback(CellResult))
				end,
				AnchorPoint = TypesVector2.new(1, 0),
				Position = TypesUDim2.fromScale(1, 0),
				Size = if Grid then TypesUDim2.fromOffset(44, 44) else TypesUDim2.new(0, 44, 1, 0),
				AutomaticSize = TypesEnum.AutomaticSize.None,
				Text = "",
				AutoButtonColor = false,
				Selectable = v2 and MovableFunction(Current:peek()),
				Interactable = v2 and MovableFunction(Current:peek()),
				Attributes = {
					appearance = "utility",
					controlSize = "regular",
					role = "default",
					label = "",
					selected = false,
					busy = false
				},
				Ctx.icon(function(Callback): string
					-- upvalues: LeadsResult (copy), Grid (upval)
					return if Callback(LeadsResult) then "checkmark" elseif Grid then "view.grid" else "menu"
				end, {
					Name = "ReorderIcon",
					AnchorPoint = TypesVector2.new(0.5, 0.5),
					Position = TypesUDim2.fromScale(0.5, 0.5)
				}),
				Activated = activate,
				UIDragDetectorResult
			}), "button")
			Handle:AddTag("facet-appearance-utility")
			local HapticResult = Ctx.haptic(nil)
			
			if HapticResult then
				Handle.PressHapticEffect = HapticResult
			end
			ActivationModule.mark(Handle)
			Compose.cleanup(ActivationModule.provide(Handle, activate))
			v4 = Handle
			RowKeys[Handle] = Key
			config.handle = Handle
			config.handleDetector = UIDragDetectorResult
			config.enabled = nil
			config.handleEnabled = nil
			refresh(config)
			Compose.cleanup(function()
				-- upvalues: config (upval), Handle (ref), v4 (upval)
				if config.handle == Handle then
					config.handle = nil
					config.handleDetector = nil
					v4 = nil
				end
			end)
			
			if Handle then
				Ctx.runtime.connect(Handle, "InputBegan", function(Input)
					-- upvalues: TypesEnum (upval), Gesture (upval), Moving (upval), ActivationModule (upval), ScrollLockModule (upval), Handle (ref)
					if Input.UserInputType == TypesEnum.UserInputType.MouseButton1 or Input.UserInputType == TypesEnum.UserInputType.Touch then
						Gesture.pendingInput = Input
						local PeekResult = Moving:peek()
						
						if PeekResult and PeekResult.pointer and Gesture.captured == nil then
							Gesture.captured = Input
							ActivationModule.consume(Input)
							
							if Input.UserInputType == TypesEnum.UserInputType.Touch and not Gesture.releaseScrollers then
								Gesture.releaseScrollers = ScrollLockModule.holdAncestors(Handle)
							end
						end
					end
				end)
			end
			return Handle
		end
		
		local Handle = if Reorderable then if p1.editing == nil then if ControlsShown:peek() then makeHandle() else nil else Compose.show(ControlsShown, makeHandle) else nil
		
		local function deletableRow(Callback): boolean
			-- upvalues: Current (copy), CollectionPolicyModule (upval), Spec (upval)
			local CallbackResult = Callback(Current)
			
			return CollectionPolicyModule.allows(Spec.rowDeletable, CallbackResult) and not CollectionPolicyModule.disabled(Spec.disabled, CallbackResult)
		end
		
		local function rightOf(Callback)
			-- upvalues: CellResult (copy), Trailing (upval)
			return if CellResult and Callback(CellResult) then 88 else Callback(Trailing)
		end
		
		local SpringResult2 = if MinusShown then Ctx.runtime.spring(rightOf, { period = Snappy.period, damping = Snappy.damping }) else SpringResult1
		
		local function edges(Callback)
			-- upvalues: p1 (upval), TypesVector2 (upval), Leading (upval), CellResult (copy), Trailing (upval), SpringResult (upval), SpringResult2 (copy)
			return if p1.instantLayout or p1.motionReduced(Callback) then TypesVector2.new(Callback(Leading), if CellResult and Callback(CellResult) then 88 else Callback(Trailing)) else TypesVector2.new(Callback(SpringResult), Callback(SpringResult2))
		end
		
		local config1 = {
			Name = "Reorderable",
			Size = TypesUDim2.fromScale(1, 1),
			BackgroundTransparency = if p3 then nil else 1,
			Attributes = { FacetDragging = IsIncludedEntry },
			Host.Frame("Cells")({
				Visible = not IsIncludedEntry,
				Position = if NoMinusShown then FromOffsetResult else function(Callback)
					-- upvalues: Grid (upval), TypesUDim2 (upval), Header (upval), edges (copy)
					return if Grid then TypesUDim2.fromOffset(0, Callback(Header)) else TypesUDim2.fromOffset(math.floor(edges(Callback).X + 0.5), 0)
				end,
				Size = if NoMinusShown then NewTypesUDim else function(Callback)
					-- upvalues: edges (copy), Grid (upval), TypesUDim2 (upval), Header (upval)
					local EdgesResult = edges(Callback)
					
					return if Grid then TypesUDim2.new(1, 0, 1, -Callback(Header)) else TypesUDim2.new(1, -math.floor(EdgesResult.X + EdgesResult.Y + 0.5), 1, 0)
				end,
				BackgroundTransparency = 1,
				Button
			})
		}
		
		for _, value in {
			Handle,
			if MinusShown then UI.Button({
				Name = "Minus",
				Archivable = false,
				label = "−",
				name = "Delete",
				shape = "circle",
				role = "destructive",
				AnchorPoint = TypesVector2.new(0.5, 0.5),
				Position = if Grid then TypesUDim2.fromOffset(22, 22) else TypesUDim2.new(0, 22, 0.5, 0),
				Size = TypesUDim2.fromOffset(28, 28),
				Visible = ControlsShown,
				enabled = deletableRow,
				onActivate = function()
					-- upvalues: CellResult (copy)
					assert(CellResult):set(not assert(CellResult):peek())
				end
			}) else nil,
			if MinusShown then UI.Button({
				Name = "Delete",
				Archivable = false,
				label = "Delete",
				role = "destructive",
				AnchorPoint = TypesVector2.new(1, 0),
				Position = TypesUDim2.fromScale(1, 0),
				Size = if Grid then TypesUDim2.fromOffset(88, 44) else TypesUDim2.new(0, 88, 1, 0),
				AutomaticSize = TypesEnum.AutomaticSize.None,
				Visible = function(Callback)
					-- upvalues: ControlsShown (upval), CellResult (copy)
					return Callback(ControlsShown) and (CellResult ~= nil and Callback(CellResult))
				end,
				enabled = deletableRow,
				onActivate = function()
					-- upvalues: CellResult (copy), Spec (upval), Key (copy)
					assert(CellResult):set(false)
					
					if Spec.onDelete then
						Spec.onDelete({ Key })
					end
				end
			}) else nil,
			if p1.marked then Ctx.styled(Host.Frame("SelectMark")({
				Archivable = false,
				AnchorPoint = TypesVector2.new(0.5, 0.5),
				Position = if Grid then TypesUDim2.fromOffset(22, 22) else TypesUDim2.new(0, 22, 0.5, 0),
				Size = TypesUDim2.fromOffset(18, 18),
				BackgroundTransparency = 1,
				Selectable = false,
				Visible = p1.markShown,
				Ctx.corner(if Mode == "multiple" then 3 else 9),
				if Mode == "multiple" then Ctx.icon("checkmark", {
					Name = "Check",
					AnchorPoint = TypesVector2.new(0.5, 0.5),
					Position = TypesUDim2.fromScale(0.5, 0.5),
					Size = TypesUDim2.fromOffset(14, 14),
					Visible = function(Callback): boolean
						-- upvalues: Selection (upval), Key (copy)
						return Callback(Selection)[Key] == true
					end
				}) else Ctx.styled(Host.Frame("Dot")({
					AnchorPoint = TypesVector2.new(0.5, 0.5),
					Position = TypesUDim2.fromScale(0.5, 0.5),
					Size = TypesUDim2.fromOffset(8, 8),
					Visible = function(Callback): boolean
						-- upvalues: Selection (upval), Key (copy)
						return Callback(Selection)[Key] == true
					end,
					Ctx.corner(4)
				}), "fill")
			}), "radio-mark") else nil
		} do
			if value then
				config1[#config1 + 1] = value
			end
		end
		local FrameResult = Host.Frame(config1)
		RowNodes[Key] = FrameResult
		local v5 = nil
		local Flag = false
		
		local function continueRowDrag(PickupPosition)
			-- upvalues: v5 (ref), Moving (upval), Grid (upval), Spec (upval), AxisFunction (upval), CrossAxisFunction (upval), Flag (ref), Gesture (upval), TypesEnum (upval), BeginFunction (upval), Key (copy), MovePointerFunction (upval)
			if v5 and not Moving:peek() and (PickupPosition - v5).Magnitude >= 6 and (Grid or Spec.drag ~= nil or math.abs(CrossAxisFunction(PickupPosition) - CrossAxisFunction(v5)) <= math.abs(AxisFunction(PickupPosition) - AxisFunction(v5))) then
				Flag = true
				
				if Gesture.pendingInput == nil or Gesture.pendingInput.UserInputType ~= TypesEnum.UserInputType.Touch then
					BeginFunction(Key, PickupPosition)
				end
			end
			if Moving:peek() then
				MovePointerFunction(PickupPosition)
			end
		end
		
		local FacetCollectionDrag = Host.UIDragDetector({
			Name = "FacetCollectionDrag",
			Archivable = false,
			Enabled = false,
			DragStyle = TypesEnum.UIDragDetectorDragStyle.TranslatePlane,
			ResponseStyle = TypesEnum.UIDragDetectorResponseStyle.CustomOffset,
			DragStart = function(p4)
				-- upvalues: DragPointerModule (upval), Ctx (upval), v5 (ref), Flag (ref), Gesture (upval)
				local DragPointerModuleResult = DragPointerModule(Ctx, p4)
				v5 = DragPointerModuleResult
				Flag = false
				Gesture.pickupPosition = DragPointerModuleResult
			end,
			DragContinue = function(p4)
				-- upvalues: continueRowDrag (copy), DragPointerModule (upval), Ctx (upval)
				continueRowDrag(DragPointerModule(Ctx, p4))
			end,
			DragEnd = function(p4)
				-- upvalues: v5 (ref), Flag (ref), continueRowDrag (copy), DragPointerModule (upval), Ctx (upval), Moving (upval), Gesture (upval), TypesEnum (upval), CommitFunction (upval), Button (copy), ActivationModule (upval), FrameResult (copy), Key (copy)
				if p4 and v5 and not Flag then
					continueRowDrag(DragPointerModule(Ctx, p4))
				end
				local IsNotUserInputStateMatch: boolean = v5 ~= nil and (not Flag and (not Moving:peek() and (Gesture.pendingInput ~= nil and Gesture.pendingInput.UserInputState ~= TypesEnum.UserInputState.Cancel)))
				local v6 = v5
				v5 = nil
				
				if not IsNotUserInputStateMatch then
					Gesture.lastTap = nil
				end
				if Gesture.captured == nil and Moving:peek() then
					CommitFunction()
					
					return
				end
				if not IsNotUserInputStateMatch or not Button:IsA("GuiButton") or ActivationModule.consumed(Gesture.pendingInput) then
					if IsNotUserInputStateMatch and not ActivationModule.consumed(Gesture.pendingInput) then
						local Parent = FrameResult.Parent
						local RowHit = if Parent then Parent:FindFirstChild("RowHit") else nil
						
						if RowHit then
							local Frames = Ctx.runtime.host.frames
							local NowResult = if Frames then Frames.now() else os.clock()
							local LastTap = Gesture.lastTap
							local Position = assert(v6)
							local IsMagnitudeBelow: boolean = LastTap ~= nil and (LastTap.key == Key and NowResult - LastTap.at <= 0.5 and (Position - LastTap.position).Magnitude <= 6)
							Gesture.lastTap = if IsMagnitudeBelow then nil else { key = Key, position = Position, at = NowResult }
							local RowHit1 = RowHit
							local BasePlayerGui = FrameResult:FindFirstAncestorWhichIsA("BasePlayerGui")
							
							if BasePlayerGui and BasePlayerGui:IsA("BasePlayerGui") and not IsMagnitudeBelow then
								for _, value in BasePlayerGui:GetGuiObjectsAtPosition(Position.X, Position.Y) do
									if value.Name == "EditLabel" and value:IsDescendantOf(FrameResult) then
										RowHit1 = value
										break
									end
								end
							end
							ActivationModule.trigger(RowHit1, Gesture.pendingInput, if IsMagnitudeBelow then 2 else 1)
							ActivationModule.consume(Gesture.pendingInput)
						end
					end
				elseif ActivationModule.trigger(Button, Gesture.pendingInput, 0) then
					ActivationModule.consume(Gesture.pendingInput)
					
					return
				end
			end
		})
		config.detector = FacetCollectionDrag
		refresh(config)
		FacetCollectionDrag.Parent = Button
		Compose.cleanup(ActivationModule.provideDrag(FrameResult, function(p5, PickupPosition): boolean
			-- upvalues: v5 (ref), Gesture (upval), TypesEnum (upval), continueRowDrag (copy), Moving (upval), MovePointerFunction (upval), CommitFunction (upval)
			if p5 == "start" then
				v5 = PickupPosition
				Gesture.pickupPosition = PickupPosition
			elseif p5 == "move" and PickupPosition then
				if Gesture.pendingInput and Gesture.pendingInput.UserInputType == TypesEnum.UserInputType.MouseButton1 then
					continueRowDrag(PickupPosition)
				elseif Moving:peek() then
					MovePointerFunction(PickupPosition)
				end
				if Moving:peek() then
					return true
				end
			elseif p5 == "end" then
				v5 = nil
				
				if Moving:peek() then
					CommitFunction()
					
					return true
				end
			end
			return false
		end))
		
		if Spec.drag then
			local DragLiftModuleResult = DragLiftModule(Ctx, Button, p1.liftScale)
			p1.lifts[Key] = DragLiftModuleResult
			Compose.cleanup(function()
				-- upvalues: p1 (upval), Key (copy), DragLiftModuleResult (copy)
				if p1.lifts[Key] == DragLiftModuleResult then
					p1.lifts[Key] = nil
				end
			end)
		end
		Compose.cleanup(function()
			-- upvalues: RowNodes (upval), Key (copy), FrameResult (copy), Gesture (upval), p1 (upval), Moving (upval)
			if RowNodes[Key] == FrameResult then
				if Gesture.touchKey == Key then
					p1.disarm()
				end
				RowNodes[Key] = nil
				local PeekResult = Moving:peek()
				
				if PeekResult and PeekResult.key == Key then
					Gesture.recycled = true
				end
			end
		end)
		Ctx.runtime.connect(Button, "InputBegan", function(p5)
			-- upvalues: p2 (upval), Key (copy)
			p2.press(Key, p5)
		end)
		
		if Button:IsA("GuiButton") and p1.pluginGui then
			Ctx.runtime.connect(Button, "MouseButton1Down", function(p5, p6)
				-- upvalues: p2 (upval), TypesVector2 (upval)
				p2.mouseDown(TypesVector2.new(p5, p6))
			end)
			Ctx.runtime.connect(Button, "InputEnded", function(p5)
				-- upvalues: p2 (upval)
				p2.finish(p5)
			end)
		end
		RowKeys[FrameResult] = Key
		
		return FrameResult
	end
end
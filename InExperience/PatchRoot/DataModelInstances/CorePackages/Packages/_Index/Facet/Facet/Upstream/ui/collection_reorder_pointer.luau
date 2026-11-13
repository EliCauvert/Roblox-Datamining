local ActivationModule = require("./activation")
local _ = require("../vendor/compose/core")
local _ = require("./drag_types")
local DragPointerModule = require("./drag_pointer")
local _ = require("./collection_reorder_state")

return function(p1)
	-- upvalues: ActivationModule (copy), DragPointerModule (copy)
	local Ctx = p1.ctx
	local Spec = p1.spec
	local Gesture = p1.gesture
	local ReadFunction = Ctx.read
	local ReadSourceFunction = Ctx.readSource
	local TypesVector2 = Ctx.types.Vector2
	local TypesEnum = Ctx.types.Enum
	local Moving = p1.moving
	local Source = p1.source
	local Reorderable = p1.reorderable
	local Arbiter = p1.arbiter
	local Grid = p1.grid
	local PluginGui = p1.pluginGui
	local Editing = p1.editing
	local DisarmFunction = p1.disarm
	local BeginFunction = p1.begin
	local AxisFunction = p1.axis
	local MovePointerFunction = p1.movePointer
	local CancelFunction = p1.cancel
	local CommitFunction = p1.commit
	local Input = p1.input
	local v1 = nil
	local NewResult = nil
	local v2 = nil
	local NewTypesVector = TypesVector2.new()
	
	local function moveMouse(NewResult1)
		-- upvalues: v1 (ref), NewResult (ref), Gesture (copy), Grid (copy), AxisFunction (copy), BeginFunction (copy), ActivationModule (upval), Moving (copy), MovePointerFunction (copy)
		if v1 ~= nil and NewResult ~= nil and Gesture.captured == nil and (if Grid then (NewResult1 - NewResult).Magnitude else math.abs(AxisFunction(NewResult1) - AxisFunction(NewResult))) >= 6 then
			local v3 = v1
			v1 = nil
			NewResult = nil
			BeginFunction(v3, NewResult1)
			ActivationModule.consume(Gesture.pendingInput)
		end
		local PeekResult = Moving:peek()
		
		if PeekResult and PeekResult.pointer and not PeekResult.keyboard then
			MovePointerFunction(NewResult1)
		end
	end
	
	return {
		mouseDown = function(PickupPosition)
			-- upvalues: PluginGui (copy), v2 (ref), Gesture (copy), NewResult (ref), NewTypesVector (ref), TypesVector2 (copy)
			if PluginGui then
				v2 = PickupPosition
				Gesture.pickupPosition = PickupPosition
				
				if Gesture.pendingInput then
					NewResult = PickupPosition
					NewTypesVector = PickupPosition - TypesVector2.new(Gesture.pendingInput.Position.X, Gesture.pendingInput.Position.Y)
				end
			end
		end,
		press = function(TouchKey, Input1)
			-- upvalues: Reorderable (copy), Moving (copy), Gesture (copy), p1 (copy), TypesEnum (copy), Spec (copy), ReadSourceFunction (copy), ReadFunction (copy), Source (copy), Arbiter (copy), TypesVector2 (copy), Grid (copy), PluginGui (copy), ActivationModule (upval), v1 (ref), NewResult (ref), v2 (ref), NewTypesVector (ref), Editing (copy), DisarmFunction (copy), DragPointerModule (upval), Ctx (copy), BeginFunction (copy), Input (copy)
			local Position = Input1.Position
			
			if not Reorderable or Position == nil or Moving:peek() ~= nil then return end
			if Gesture.touchOrigin then return end
			local RowNode = p1.rowNodes[TouchKey]
			local IsUserInputTypeMatch = Input1.UserInputType == TypesEnum.UserInputType.Touch
			local Options = nil
			
			if (IsUserInputTypeMatch or Input1.UserInputType == TypesEnum.UserInputType.MouseButton1) and Spec.drag then
				local Items = {}
				local Keys = {}
				local Source1 = ReadSourceFunction(p1.selection)
				local SelectionFrom = Spec.selectionFrom or Source
				for i, value in ReadFunction(SelectionFrom) do
					local KeyOfResult = p1.keyOf(value, i)
					
					if p1.movable(value) and (KeyOfResult == TouchKey or Source1[TouchKey] and Source1[KeyOfResult]) then
						table.insert(Items, value)
						table.insert(Keys, KeyOfResult)
					end
				end
				if #Keys > 0 then
					Options = table.clone(Spec.drag(Items, Keys))
					Gesture.pressTransfer = {
						key = TouchKey,
						pointer = Input1,
						options = Options,
						keys = Keys,
						items = Items
					}
				elseif IsUserInputTypeMatch then return end
			end
			local Options1 = if IsUserInputTypeMatch then Options else nil
			
			if RowNode and (Input1.UserInputType == TypesEnum.UserInputType.MouseButton1 or Input1.UserInputType == TypesEnum.UserInputType.Touch) then
				if not Arbiter.begin(Input1, RowNode, TypesVector2.new(Position.X, Position.Y), {
					scroll = true,
					pickup = if IsUserInputTypeMatch then Options1 and Options1.touchPickup or "longPress" else "immediate",
					axis = Options1 and Options1.touchDragAxis or (if Grid then "XY" elseif p1.horizontal then "X" else "Y")
				}) then return end
				Gesture.gestureOwner = RowNode
			end
			if Input1.UserInputType == TypesEnum.UserInputType.MouseButton1 then
				if PluginGui then
					ActivationModule.release(Input1)
				end
				v1 = TouchKey
				NewResult = TypesVector2.new(Position.X, Position.Y)
				Gesture.pendingInput = Input1
				
				if PluginGui and v2 then
					NewResult = v2
					NewTypesVector = v2 - TypesVector2.new(Position.X, Position.Y)
				end
				Gesture.pickupPosition = NewResult
			else
				if not IsUserInputTypeMatch or Editing ~= nil and Editing ~= false then return end
				DisarmFunction()
				Gesture.touchKey = TouchKey
				Gesture.touchOrigin = TypesVector2.new(Position.X, Position.Y)
				Gesture.pendingInput = Input1
				Gesture.pickupPosition = Gesture.touchOrigin
				
				if RowNode then
					Gesture.touchHold = RowNode.TouchLongPress:Connect(function(Entry, Begin)
						-- upvalues: TypesEnum (upval), Gesture (upval), TouchKey (copy), Moving (upval), TypesVector2 (upval), DragPointerModule (upval), Ctx (upval), p1 (upval), BeginFunction (upval)
						if Begin ~= TypesEnum.UserInputState.Begin or Gesture.touchKey ~= TouchKey or Moving:peek() ~= nil then return end
						local NewTypesVector = if Gesture.pendingInput then TypesVector2.new(Gesture.pendingInput.Position.X, Gesture.pendingInput.Position.Y) elseif Entry[1] then DragPointerModule(Ctx, Entry[1]) else Gesture.touchOrigin
						p1.disarm()
						
						if NewTypesVector then
							BeginFunction(TouchKey, NewTypesVector)
						end
					end)
				end
			end
			if Input and Options then
				p1.lift(TouchKey, Options.previewScale)
			end
		end,
		finish = function(Input)
			-- upvalues: TypesEnum (copy), PluginGui (copy), Gesture (copy), moveMouse (copy), TypesVector2 (copy), NewTypesVector (ref), v1 (ref), NewResult (ref), v2 (ref), Moving (copy), p1 (copy), CancelFunction (copy), CommitFunction (copy)
			if Input.UserInputType ~= TypesEnum.UserInputType.MouseButton1 then return end
			if PluginGui and Input == Gesture.pendingInput and Input.UserInputState ~= TypesEnum.UserInputState.Cancel then
				moveMouse(TypesVector2.new(Input.Position.X, Input.Position.Y) + NewTypesVector)
			end
			v1 = nil
			NewResult = nil
			v2 = nil
			NewTypesVector = TypesVector2.new()
			local PeekResult = Moving:peek()
			
			if PeekResult == nil then
				p1.settle()
			end
			if PeekResult and PeekResult.pointer and not PeekResult.keyboard then
				if Input.UserInputState == TypesEnum.UserInputState.Cancel then
					CancelFunction()
					
					return
				end
				CommitFunction()
			end
		end,
		listen = function(p2)
			-- upvalues: PluginGui (copy), Ctx (copy), moveMouse (copy), TypesVector2 (copy), v1 (ref), NewResult (ref), CancelFunction (copy), Input (copy), ActivationModule (upval), Gesture (copy), TypesEnum (copy), Arbiter (copy), DisarmFunction (copy), BeginFunction (copy), MovePointerFunction (copy), p1 (copy), Grid (copy), AxisFunction (copy), Moving (copy), CommitFunction (copy)
			if PluginGui then
				Ctx.runtime.connect(p2, "MouseMoved", function(p3, p4)
					-- upvalues: moveMouse (upval), TypesVector2 (upval)
					moveMouse(TypesVector2.new(p3, p4))
				end)
				Ctx.runtime.connect(PluginGui, "WindowFocusReleased", function()
					-- upvalues: v1 (upval), NewResult (upval), CancelFunction (upval)
					v1 = nil
					NewResult = nil
					CancelFunction()
				end)
			end
			if Input then
				Ctx.runtime.connect(Input, "InputBegan", ActivationModule.release)
				Ctx.runtime.connect(Input, "InputChanged", function(Input)
					-- upvalues: Gesture (upval), TypesEnum (upval), Arbiter (upval), TypesVector2 (upval), DisarmFunction (upval), BeginFunction (upval), MovePointerFunction (upval), p1 (upval), PluginGui (upval), v1 (upval), NewResult (upval), Grid (upval), AxisFunction (upval), CancelFunction (upval)
					if Gesture.pendingInput and Input.UserInputType == TypesEnum.UserInputType.MouseMovement then
						Arbiter.move(Gesture.pendingInput, TypesVector2.new(Input.Position.X, Input.Position.Y))
					end
					if Gesture.touchOrigin and Input == Gesture.pendingInput then
						local NewTypesVector = TypesVector2.new(Input.Position.X, Input.Position.Y)
						local MoveResult = Arbiter.move(Input, NewTypesVector)
						
						if MoveResult == "drag" and Gesture.touchKey ~= nil then
							local TouchKey = Gesture.touchKey
							DisarmFunction()
							BeginFunction(TouchKey, NewTypesVector)
							MovePointerFunction(NewTypesVector)
							
							return
						elseif MoveResult == "scroll" or MoveResult == "pan" or (NewTypesVector - Gesture.touchOrigin).Magnitude > 10 then
							DisarmFunction()
							p1.settle()
						end
						return
					elseif PluginGui == nil or v1 == nil or NewResult == nil or Gesture.captured ~= nil or Input.UserInputType ~= TypesEnum.UserInputType.MouseMovement then
						if Gesture.captured and (Input == Gesture.captured or Gesture.captured.UserInputType == TypesEnum.UserInputType.MouseButton1 and Input.UserInputType == TypesEnum.UserInputType.MouseMovement) then
							if Input.UserInputState == TypesEnum.UserInputState.Cancel then
								CancelFunction()
								
								return
							end
							local NewTypesVector = TypesVector2.new(Input.Position.X, Input.Position.Y)
							
							if Gesture.origin then
								Gesture.travel = math.max(Gesture.travel, (NewTypesVector - Gesture.origin).Magnitude)
							end
							MovePointerFunction(NewTypesVector)
						end
						return
					else
						local NewTypesVector = TypesVector2.new(Input.Position.X, Input.Position.Y)
						
						if (if Grid then (NewTypesVector - NewResult).Magnitude else math.abs(AxisFunction(NewTypesVector) - AxisFunction(NewResult))) >= 6 then
							local v3 = v1
							v1 = nil
							NewResult = nil
							BeginFunction(v3, NewTypesVector)
							MovePointerFunction(NewTypesVector)
						end
					end
				end)
				Ctx.runtime.connect(Input, "InputEnded", function(Input)
					-- upvalues: Gesture (upval), Arbiter (upval), TypesEnum (upval), v1 (upval), NewResult (upval), DisarmFunction (upval), Moving (upval), p1 (upval), CancelFunction (upval), CommitFunction (upval)
					if Gesture.gestureOwner then
						Arbiter.finish(Input, Gesture.gestureOwner, Input.UserInputState == TypesEnum.UserInputState.Cancel)
					end
					if Input.UserInputType == TypesEnum.UserInputType.MouseButton1 then
						v1 = nil
						NewResult = nil
					end
					if Gesture.touchOrigin and Input == Gesture.pendingInput then
						DisarmFunction()
					end
					if Moving:peek() == nil and (Input == Gesture.pendingInput or Input.UserInputType == TypesEnum.UserInputType.MouseButton1) then
						p1.settle()
					end
					if Gesture.captured and (Input == Gesture.captured or Gesture.captured.UserInputType == TypesEnum.UserInputType.MouseButton1 and Input.UserInputType == TypesEnum.UserInputType.MouseButton1) then
						if Input.UserInputState == TypesEnum.UserInputState.Cancel then
							CancelFunction()
							
							return
						end
						CommitFunction()
					end
				end)
				Ctx.runtime.connect(Input, "WindowFocusReleased", CancelFunction)
				local UchEnabled = Ctx.observe.TouchEnabled(Input)
				local MouseEnabledResult = Ctx.observe.MouseEnabled(Input)
				local KeyboardEnabledResult = Ctx.observe.KeyboardEnabled(Input)
				local GamepadEnabledResult = Ctx.observe.GamepadEnabled(Input)
				Ctx.Compose.watch(function(Callback)
					-- upvalues: Moving (upval), Gesture (upval), TypesEnum (upval), UchEnabled (copy), MouseEnabledResult (copy), KeyboardEnabledResult (copy), GamepadEnabledResult (copy), CancelFunction (upval)
					local CallbackResult = Callback(Moving)
					
					if CallbackResult and (Gesture.captured and Gesture.captured.UserInputType == TypesEnum.UserInputType.Touch and Callback(UchEnabled) == false or Gesture.captured and Gesture.captured.UserInputType == TypesEnum.UserInputType.MouseButton1 and Callback(MouseEnabledResult) == false or CallbackResult.keyboard and Callback(KeyboardEnabledResult) == false and Callback(GamepadEnabledResult) == false and (not CallbackResult.tap or Callback(UchEnabled) == false)) then
						CancelFunction()
					end
				end)
			end
		end
	}
end
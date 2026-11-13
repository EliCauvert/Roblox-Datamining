local _ = require("../vendor/compose/core")
local _ = require("./collection_reorder_state")
local ActivationModule = require("./activation")

return function(p1, p2, Ancestor)
	-- upvalues: ActivationModule (copy)
	local Ctx = p1.ctx
	local Spec = p1.spec
	local Gesture = p1.gesture
	local TypesEnum = Ctx.types.Enum
	local Moving = p1.moving
	local ChoosingDestination = p1.choosingDestination
	local Drag = p1.drag
	local Focus = p1.focus
	local RowNodes = p1.rowNodes
	local Gui = p1.gui
	local Horizontal = p1.horizontal
	local Reorderable = p1.reorderable
	local Deletable = p1.deletable
	local BeginFunction = p1.begin
	local StepFunction = p1.step
	local CommitFunction = p1.commit
	local ChosenFunction = p1.chosen
	local Active = p1.active
	local Keyboard = p1.keyboard
	
	if Reorderable and (p1.preferred == nil or p1.editing ~= nil and p1.editing ~= false) then
		local function focusedHandle(Callback)
			-- upvalues: Focus (copy), p1 (copy), RowNodes (copy)
			local CallbackResult = if Callback then Callback(Focus) else Focus:peek()
			local RowKey = if CallbackResult then p1.rowKeys[CallbackResult] else nil
			
			return if CallbackResult and RowKey ~= nil and CallbackResult.Parent == RowNodes[RowKey] and CallbackResult:IsA("TextButton") then CallbackResult else nil
		end
		
		Ctx.action(p2, "ReorderHandlePickUp", { TypesEnum.KeyCode.Return }, function(p3)
			-- upvalues: focusedHandle (copy)
			local FocusedHandleResult = focusedHandle(p3)
			
			return FocusedHandleResult ~= nil and FocusedHandleResult.Interactable
		end, function()
			-- upvalues: focusedHandle (copy), ActivationModule (upval)
			local FocusedHandleResult = focusedHandle(nil)
			
			if FocusedHandleResult then
				ActivationModule.trigger(FocusedHandleResult, nil, nil)
			end
		end, {
			priority = 5000,
			conditional = {
				binding = TypesEnum.KeyCode.Space,
				when = function(p3)
					-- upvalues: focusedHandle (copy), Ctx (copy)
					local FocusedHandleResult = focusedHandle(p3)
					
					return FocusedHandleResult ~= nil and Ctx.spaceActivates(FocusedHandleResult)(p3)
				end
			}
		})
	end
	local FormulaResult = Ctx.Compose.formula(function(Callback)
		-- upvalues: Keyboard (copy), Focus (copy), Spec (copy), ChoosingDestination (copy), Gesture (copy), Ancestor (copy)
		if Callback(Keyboard) then
			local CallbackResult = Callback(Focus)
			
			return if Spec.onReorder == nil then Spec.drop ~= nil and (not Callback(ChoosingDestination) and (CallbackResult == nil or (CallbackResult == Gesture.keyboardTarget or CallbackResult:IsDescendantOf(Ancestor)))) else not Callback(ChoosingDestination) and (CallbackResult == nil or (CallbackResult == Gesture.keyboardTarget or CallbackResult:IsDescendantOf(Ancestor)))
		else
			return false
		end
	end)
	
	if Spec.drag then
		local function focusedKey(Callback)
			-- upvalues: Focus (copy), RowNodes (copy)
			local CallbackResult = if Callback then Callback(Focus) else Focus:peek()
			
			if not CallbackResult then
				return nil
			end
			for i, rowNode in RowNodes do
				if rowNode.Parent and CallbackResult:IsDescendantOf(rowNode.Parent) then
					return i
				end
			end
			return nil
		end
		
		Ctx.action(p2, "CollectionPickUp", { TypesEnum.KeyCode.Return, TypesEnum.KeyCode.ButtonA }, function(Callback): boolean
			-- upvalues: Active (copy), Drag (copy), focusedKey (copy)
			return not Callback(Active) and (Callback(Drag.state) == nil and focusedKey(Callback) ~= nil)
		end, function()
			-- upvalues: focusedKey (copy), BeginFunction (copy)
			local FocusedKeyResult = focusedKey(nil)
			
			if FocusedKeyResult ~= nil then
				BeginFunction(FocusedKeyResult)
			end
		end, { priority = 400 })
	end
	if Spec.drag and (Spec.onReorder or Spec.drop) then
		Ctx.action(p2, "ChooseDropDestination", { TypesEnum.KeyCode.ButtonY }, function(Callback): boolean
			-- upvalues: Keyboard (copy), Drag (copy)
			if Callback(Keyboard) then
				local CallbackResult = Callback(Drag.state)
				
				return CallbackResult ~= nil and not CallbackResult.pending
			else
				return false
			end
		end, function()
			-- upvalues: ChoosingDestination (copy), Gui (copy), Moving (copy), RowNodes (copy), Ctx (copy), Gesture (copy), Drag (copy), Focus (copy)
			ChoosingDestination:set(not ChoosingDestination:peek())
			
			if Gui then
				local PeekResult = Moving:peek()
				local RowNode = PeekResult and RowNodes[PeekResult.key]
				local RowHit = RowNode and (RowNode.Parent and RowNode.Parent:FindFirstChild("RowHit"))
				Ctx.selection.set(if ChoosingDestination:peek() and RowHit and RowHit:IsA("GuiObject") then RowHit else Gesture.keyboardTarget)
			end
			local PeekResult = Drag.state:peek()
			
			if PeekResult then
				PeekResult.spec.navigationHint = if ChoosingDestination:peek() then "Y: reorder here" else "Y: choose destination"
				Drag.hover(Drag.targetOf(Focus:peek()), nil)
			end
		end, { priority = 400 })
	end
	local List = if Horizontal then { TypesEnum.KeyCode.Right, TypesEnum.KeyCode.DPadRight } else { TypesEnum.KeyCode.Down, TypesEnum.KeyCode.DPadDown }
	Ctx.action(p2, "ReorderUp", if Horizontal then { TypesEnum.KeyCode.Left, TypesEnum.KeyCode.DPadLeft } else { TypesEnum.KeyCode.Up, TypesEnum.KeyCode.DPadUp }, FormulaResult, function()
		-- upvalues: StepFunction (copy)
		StepFunction(-1, true)
	end, { priority = 400, capture = true })
	Ctx.action(p2, "ReorderDown", List, FormulaResult, function()
		-- upvalues: StepFunction (copy)
		StepFunction(1, true)
	end, { priority = 400, capture = true })
	
	if p1.grid then
		Ctx.action(p2, "ReorderCrossEarlier", if Horizontal then { TypesEnum.KeyCode.Up, TypesEnum.KeyCode.DPadUp } else { TypesEnum.KeyCode.Left, TypesEnum.KeyCode.DPadLeft }, FormulaResult, function()
			-- upvalues: StepFunction (copy)
			StepFunction(-1)
		end, { priority = 400, capture = true })
		Ctx.action(p2, "ReorderCrossLater", if Horizontal then { TypesEnum.KeyCode.Down, TypesEnum.KeyCode.DPadDown } else { TypesEnum.KeyCode.Right, TypesEnum.KeyCode.DPadRight }, FormulaResult, function()
			-- upvalues: StepFunction (copy)
			StepFunction(1)
		end, { priority = 400, capture = true })
	end
	Ctx.action(p2, "ReorderCancel", { TypesEnum.KeyCode.Escape, TypesEnum.KeyCode.ButtonB }, Active, p1.cancel, { priority = 400 })
	Ctx.action(p2, "ReorderDrop", { TypesEnum.KeyCode.Return, TypesEnum.KeyCode.ButtonA }, function(Callback): boolean
		-- upvalues: Keyboard (copy), ChoosingDestination (copy), Spec (copy)
		return Callback(Keyboard) and (not Callback(ChoosingDestination) and (Spec.onReorder ~= nil or Spec.drop ~= nil))
	end, CommitFunction, { priority = 400 })
	
	if Reorderable and (Spec.selection ~= nil or (p1.mode ~= "none" or p1.editing ~= nil and p1.editing ~= false)) then
		local function _(p3)
			-- upvalues: ChosenFunction (copy), BeginFunction (copy), StepFunction (copy), CommitFunction (copy)
			local ChosenResult = ChosenFunction()
			
			if #ChosenResult > 0 then
				BeginFunction(ChosenResult[1], nil, true)
				StepFunction(p3)
				CommitFunction()
			end
		end
		
		local FormulaResult1 = Ctx.Compose.formula(function(Callback): boolean
			-- upvalues: Active (copy), ChosenFunction (copy)
			return not Callback(Active) and #ChosenFunction(Callback) > 0
		end)
		Ctx.action(p2, "MoveRowsEarlier", { TypesEnum.KeyCode.ButtonL1 }, FormulaResult1, function()
			-- upvalues: ChosenFunction (copy), BeginFunction (copy), StepFunction (copy), CommitFunction (copy)
			local ChosenResult = ChosenFunction()
			
			if #ChosenResult > 0 then
				BeginFunction(ChosenResult[1], nil, true)
				StepFunction(-1)
				CommitFunction()
			end
		end, { priority = 400 })
		Ctx.action(p2, "MoveRowsLater", { TypesEnum.KeyCode.ButtonR1 }, FormulaResult1, function()
			-- upvalues: ChosenFunction (copy), BeginFunction (copy), StepFunction (copy), CommitFunction (copy)
			local ChosenResult = ChosenFunction()
			
			if #ChosenResult > 0 then
				BeginFunction(ChosenResult[1], nil, true)
				StepFunction(1)
				CommitFunction()
			end
		end, { priority = 400 })
	end
	if Deletable then
		Ctx.action(p2, "DeleteRows", {
			TypesEnum.KeyCode.Delete,
			TypesEnum.KeyCode.Backspace,
			TypesEnum.KeyCode.ButtonX
		}, p1.canDelete, function()
			-- upvalues: p1 (copy)
			p1.remove(false)
		end, { priority = 400 })
	end
end
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./collection_types")
local ActivationModule = require("./activation")
local CollectionPolicyModule = require("./collection_policy")
local _ = require("./collection_props")
local _ = require("./control_types")
local _ = require("./input_props")
local _ = require("./navigation_props")
local config = { text = true, number = true, toggle = true, menu = true }
local list = {
	"options", "min", "max", "step", "draft", "validate", "editLabel", "editable"
}

return function(p1, p2)
	-- upvalues: config (copy), ActivationModule (copy), CollectionPolicyModule (copy), list (copy)
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local ReadFunction1 = p1.read
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	p2.CellEditor = p1.construct("CellEditor", function(p3)
		-- upvalues: config (upval), Compose (copy), ReadFunction (copy), p2 (copy), TypesUDim2 (copy), TypesEnum (copy), p1 (copy), ActivationModule (upval), ReadFunction1 (copy), TypesUDim (copy), CollectionPolicyModule (upval), TypesVector2 (copy)
		assert(config[p3.editor], "Facet CellEditor: editor must be text, number, toggle or menu")
		assert(type(p3.onChange) == "function", "Facet CellEditor needs onChange")
		assert(p3.editor ~= "menu" or p3.options ~= nil, "Facet CellEditor: menu needs options")
		assert(p3.draft == nil or (p3.editor == "text" or p3.editor == "number"), "Facet CellEditor: only text and number accept a draft")
		assert(p3.editing == nil or (p3.editor == "text" or p3.editor == "number"), "Facet CellEditor: only text and number accept editing")
		local Draft = p3.draft or Compose.cell(nil)
		local CellResult = Compose.cell("")
		local Editing = p3.editing or Compose.cell(false)
		local Flag = true
		Compose.cleanup(function()
			-- upvalues: Flag (ref)
			Flag = false
		end)
		
		local function enabled(p4): boolean
			-- upvalues: ReadFunction (upval), p3 (copy)
			return ReadFunction(p3.enabled, p4) ~= false and ReadFunction(p3.busy, p4) ~= true
		end
		
		local function value(p4)
			-- upvalues: ReadFunction (upval), p3 (copy)
			return ReadFunction(p3.value, p4)
		end
		
		local function _(p4): string
			return if p4 == nil then "" else tostring(p4)
		end
		
		local _ = function(p4)
			-- upvalues: p3 (copy)
			return if p3.editor == "number" then tonumber(p4.text) else p4.text
		end
		
		local function propose(p4)
			-- upvalues: Flag (ref), ReadFunction (upval), p3 (copy), CellResult (copy), Draft (copy)
			if not Flag or (ReadFunction(p3.enabled, nil) == false or ReadFunction(p3.busy, nil) == true) then return end
			local ValidateResult = if p3.validate then p3.validate(p4) else nil
			
			if ValidateResult then
				CellResult:set(ValidateResult)
				local PeekResult = Draft:peek()
				
				if PeekResult then
					local Copy = table.clone(PeekResult)
					Copy.error = ValidateResult
					Draft:set(Copy)
				end
				return
			else
				CellResult:set("")
				
				if p4 ~= ReadFunction(p3.value, nil) then
					p3.onChange(p4)
				end
				if ReadFunction(p3.value, nil) == p4 then
					Draft:set(nil)
					
					return
				end
				if ReadFunction(p3.busy) ~= true then
					CellResult:set("Change not accepted. Try again or cancel.")
					local PeekResult = Draft:peek()
					
					if PeekResult then
						local Copy = table.clone(PeekResult)
						Copy.error = CellResult:peek()
						Draft:set(Copy)
					end
				end
			end
		end
		
		local v1 = nil
		local FormulaResult = nil
		local Editor = nil
		
		if p3.editor == "toggle" then
			Editor = p2.Toggle({
				Name = "Editor",
				presentation = "checkbox",
				appearance = "plain",
				label = "",
				name = p3.label,
				value = function(p4): boolean
					-- upvalues: ReadFunction (upval), p3 (copy)
					return ReadFunction(p3.value, p4) == true
				end,
				onChange = propose,
				enabled = enabled
			})
		elseif p3.editor == "menu" then
			local CellResult1 = Compose.cell(value())
			Compose.watch(function(p4)
				-- upvalues: CellResult1 (copy), value (copy)
				CellResult1:set(value(p4))
			end)
			Editor = p2.Picker({
				Name = "Editor",
				style = "menu",
				appearance = "utility",
				options = p3.options,
				selected = CellResult1,
				enabled = enabled,
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				onChanging = function(p4): boolean
					-- upvalues: propose (copy)
					propose(p4)
					
					return false
				end
			})
		else
			local CellResult2 = Compose.cell("")
			local CellResult3 = Compose.cell(tonumber(value()) or 0)
			Compose.watch(function(Callback)
				-- upvalues: ReadFunction (upval), p3 (copy), Draft (copy), CellResult2 (copy), CellResult3 (copy), CellResult (copy)
				local ReadResult = ReadFunction(p3.value, Callback)
				local CallbackResult = Callback(Draft)
				
				if CallbackResult and (if p3.editor == "number" then tonumber(CallbackResult.text) else CallbackResult.text) == ReadResult then
					Draft:set(nil)
					CallbackResult = nil
				end
				CellResult2:set(if CallbackResult then CallbackResult.text elseif ReadResult == nil then "" else tostring(ReadResult))
				CellResult3:set(tonumber(ReadResult) or 0)
				CellResult:set(if CallbackResult then CallbackResult.error or (if CallbackResult.original == ReadResult then "" else "Value changed elsewhere. Cancel to use the latest value.") else "")
			end)
			local config1 = {
				Name = "Editor",
				appearance = "utility",
				controlSize = "compact",
				value = CellResult2,
				Attributes = {
					AccessibleLabel = p3.label or (p3.editLabel or "Edit value")
				},
				readOnly = function(p4): boolean
					-- upvalues: ReadFunction (upval), p3 (copy)
					return not (ReadFunction(p3.enabled, p4) ~= false and ReadFunction(p3.busy, p4) ~= true)
				end,
				Selectable = enabled,
				Interactable = enabled,
				errorText = CellResult,
				Visible = Editing,
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				onChange = function(Text)
					-- upvalues: Flag (ref), CellResult2 (copy), Draft (copy), ReadFunction (upval), p3 (copy)
					if Flag then
						CellResult2:set(Text)
						local PeekResult = Draft:peek()
						Draft:set({
							text = Text,
							original = if PeekResult then PeekResult.original else ReadFunction(p3.value, nil)
						})
						
						return
					end
				end,
				onCommit = propose,
				onCancel = function()
					-- upvalues: Draft (copy), CellResult (copy), Editing (copy)
					Draft:set(nil)
					CellResult:set("")
					Editing:set(false)
				end,
				FocusLost = function()
					-- upvalues: CellResult (copy), ReadFunction (upval), p3 (copy), Editing (copy)
					if CellResult:peek() == "" and ReadFunction(p3.busy) ~= true then
						Editing:set(false)
					end
				end,
				Focused = function()
					-- upvalues: Editing (copy)
					Editing:set(true)
				end
			}
			local EffectiveInputResult = p1.effectiveInput()
			FormulaResult = Compose.formula(function(p4)
				-- upvalues: TypesUDim2 (upval), p1 (upval), EffectiveInputResult (copy)
				return TypesUDim2.new(1, 0, 0, (math.max(p1.controlSize("compact", "height", p4), p1.controlSize("compact", "iconSize", p4), if EffectiveInputResult(p4) == "KeyboardAndMouse" then 0 else math.max(44, p1.metric("targetSizes.minimum", p4)))))
			end)
			local EditLabel = nil
			
			local function rowHit()
				-- upvalues: EditLabel (ref)
				local Parent = EditLabel.Parent
				local RowHit = nil
				while Parent and not Parent:IsA("LayerCollector") do
					RowHit = Parent:FindFirstChild("RowHit")
					
					if RowHit and RowHit:IsA("GuiObject") then
						return RowHit
					end
					Parent = Parent.Parent
				end
				return nil
			end
			
			local function activate(Input, Largest)
				-- upvalues: ActivationModule (upval), rowHit (copy), p1 (upval), TypesEnum (upval), ReadFunction (upval), p3 (copy), Editing (copy)
				if ActivationModule.consumed(Input) then return end
				local RowHitResult = rowHit()
				local UserInputService = p1.config.userInputService
				local v2 = false
				
				if UserInputService then
					for _, value in {
						TypesEnum.KeyCode.LeftControl, TypesEnum.KeyCode.RightControl,
						TypesEnum.KeyCode.LeftMeta, TypesEnum.KeyCode.RightMeta,
						TypesEnum.KeyCode.LeftShift, TypesEnum.KeyCode.RightShift
					} do
						v2 = v2 or UserInputService:IsKeyDown(value)
					end
				end
				if v2 or (ReadFunction(p3.enabled, nil) == false or ReadFunction(p3.busy, nil) == true or RowHitResult ~= nil and (not Input or Input.UserInputType ~= TypesEnum.UserInputType.MouseButton1)) or RowHitResult ~= nil and (Largest or 0) ~= 0 or RowHitResult ~= nil and not RowHitResult.Interactable or RowHitResult ~= nil and RowHitResult:GetAttribute("FacetSelectionRequired") ~= false and RowHitResult:GetAttribute("FacetOnlySelected") ~= true then
					if RowHitResult then
						ActivationModule.trigger(RowHitResult, Input, Largest)
					end
				else
					Editing:set(true)
				end
				ActivationModule.consume(Input)
			end
			
			EditLabel = p1.Host.TextButton({
				Name = "EditLabel",
				Text = "",
				BackgroundTransparency = 1,
				AutoButtonColor = false,
				Selectable = false,
				Attributes = {
					AccessibleLabel = function(p4)
						-- upvalues: ReadFunction1 (upval), p3 (copy)
						return ReadFunction1(p3.label or (p3.editLabel or "Edit value"), p4)
					end
				},
				Size = TypesUDim2.fromScale(1, 1),
				Activated = function(Input, p4)
					-- upvalues: activate (copy)
					activate(Input, (math.max(0, (p4 or 1) - 1)))
				end
			})
			p1.runtime.connect(EditLabel, "AncestryChanged", function()
				-- upvalues: EditLabel (ref), rowHit (copy)
				EditLabel.Selectable = rowHit() == nil
			end)
			Compose.cleanup(ActivationModule.provide(EditLabel, function(Input, p4)
				-- upvalues: activate (copy)
				activate(Input, p4)
			end))
			v1 = p1.styled(p1.text({
				Name = "Value",
				Text = function(p4): string
					-- upvalues: ReadFunction (upval), p3 (copy)
					local ReadResult = ReadFunction(p3.value, p4)
					
					return if ReadResult == nil then "" else tostring(ReadResult)
				end,
				Visible = function(Callback): boolean
					-- upvalues: Editing (copy)
					return not Callback(Editing)
				end,
				Size = function(Callback)
					-- upvalues: TypesUDim2 (upval), FormulaResult (ref)
					return TypesUDim2.new(1, 0, 0, Callback(assert(FormulaResult)).Y.Offset)
				end,
				AutomaticSize = TypesEnum.AutomaticSize.None,
				BackgroundTransparency = 1,
				TextWrapped = false,
				TextTruncate = TypesEnum.TextTruncate.AtEnd,
				TextYAlignment = TypesEnum.TextYAlignment.Center,
				p1.Host.UIPadding({
					PaddingLeft = TypesUDim.new(0, 10),
					PaddingRight = TypesUDim.new(0, 10)
				}),
				EditLabel
			}), "Text")
			local CellResult4 = Compose.cell(false)
			Compose.watch(function(Callback)
				-- upvalues: Editing (copy), CellResult4 (copy)
				if Callback(Editing) then
					CellResult4:set(true)
				end
			end)
			Editor = p1.Host.Frame({
				Name = "EditorHost",
				BackgroundTransparency = 1,
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				Visible = Editing,
				Compose.show(CellResult4, function()
					-- upvalues: p3 (copy), config1 (copy), CellResult3 (copy), p2 (upval), Flag (ref), Editing (copy), ReadFunction (upval), CollectionPolicyModule (upval), p1 (upval), TypesEnum (upval), Compose (upval), rowHit (copy), EditLabel (ref)
					local NumberInputResult = nil
					
					if p3.editor == "number" then
						config1.numericValue = CellResult3
						local Max = p3.max
						local Step = p3.step
						config1.min = p3.min
						config1.max = Max
						config1.step = Step
						NumberInputResult = p2.NumberInput(config1)
					else
						NumberInputResult = p2.TextInput(config1)
					end
					local NumberInputResult1 = if NumberInputResult:IsA("TextBox") then NumberInputResult else NumberInputResult:FindFirstChildWhichIsA("TextBox", true)
					assert(NumberInputResult1 and NumberInputResult1:IsA("TextBox"))
					
					local function focus()
						-- upvalues: Flag (upval), Editing (upval), ReadFunction (upval), p3 (upval), NumberInputResult1 (copy), CollectionPolicyModule (upval), p1 (upval), TypesEnum (upval)
						if Flag and Editing:peek() and (ReadFunction(p3.enabled, nil) ~= false and ReadFunction(p3.busy, nil) ~= true and NumberInputResult1:FindFirstAncestorWhichIsA("LayerCollector") and CollectionPolicyModule.selectionVisible(NumberInputResult1) and not NumberInputResult1:IsFocused()) then
							local UserInputService = p1.config.userInputService
							
							if p1.config.guiService and (UserInputService == nil or UserInputService.PreferredInput ~= TypesEnum.PreferredInput.Touch) then
								p1.selection.set(NumberInputResult1)
							end
							NumberInputResult1:CaptureFocus()
						end
					end
					
					local function requestFocus()
						-- upvalues: focus (copy)
						if task and task.defer then
							task.defer(focus)
							
							return
						else
							focus()
						end
					end
					
					local v3 = false
					Compose.watch(function(Callback)
						-- upvalues: Editing (upval), ReadFunction (upval), p3 (upval), focus (copy), NumberInputResult1 (copy), p1 (upval), v3 (ref), NumberInputResult (ref), rowHit (upval), EditLabel (upval), CollectionPolicyModule (upval)
						local CallbackResult = Callback(Editing)
						
						if ReadFunction(p3.enabled, Callback) == false and CallbackResult then
							CallbackResult = false
							Editing:set(false)
						end
						if CallbackResult then
							if task and task.defer then
								task.defer(focus)
							else
								focus()
							end
						elseif NumberInputResult1:IsFocused() then
							NumberInputResult1:ReleaseFocus()
						end
						local GuiService = p1.config.guiService
						
						if v3 and not CallbackResult and GuiService then
							local GetResult = p1.selection.get()
							
							if GetResult and (GetResult == NumberInputResult1 or GetResult:IsDescendantOf(NumberInputResult)) then
								local RowHitResult = rowHit() or EditLabel
								p1.selection.set(if RowHitResult.Selectable and CollectionPolicyModule.selectionVisible(RowHitResult) then RowHitResult else nil)
							end
						end
						v3 = CallbackResult
					end)
					p1.runtime.connect(NumberInputResult1, "AncestryChanged", requestFocus)
					local AbsolutePositionResult = p1.observe.AbsolutePosition(NumberInputResult1)
					local AbsoluteSizeResult = p1.observe.AbsoluteSize(NumberInputResult1)
					Compose.watch(function(Callback: (any) -> ())
						-- upvalues: AbsolutePositionResult (copy), AbsoluteSizeResult (copy), Editing (upval), focus (copy)
						Callback(AbsolutePositionResult)
						Callback(AbsoluteSizeResult)
						
						if Editing:peek() then
							if task and task.defer then
								task.defer(focus)
								
								return
							end
							focus()
						end
					end)
					
					return NumberInputResult
				end)
			})
		end
		local FrameResult = p1.Host.Frame(p1.props(p3, {
			"editor", "value", "onChange", "draft", "editing", "editLabel", "validate",
			"label", "enabled", "busy", "options", "min", "max", "step"
		}, {
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Editor,
			v1,
			if FormulaResult then p1.Host.UISizeConstraint({
				Name = "FieldSize",
				MinSize = function(Callback)
					-- upvalues: TypesVector2 (upval), FormulaResult (ref)
					return TypesVector2.new(0, Callback(assert(FormulaResult)).Y.Offset)
				end
			}) else nil
		}))
		
		if p3.editor == "text" or p3.editor == "number" then
			Compose.cleanup(ActivationModule.provideEdit(FrameResult, {
				label = p3.editLabel or "Edit value",
				enabled = enabled,
				onActivate = function()
					-- upvalues: ReadFunction (upval), p3 (copy), Editing (copy)
					if ReadFunction(p3.enabled, nil) ~= false and ReadFunction(p3.busy, nil) ~= true then
						Editing:set(true)
					end
				end
			}))
		end
		return FrameResult
	end)
	
	return {
		check = function(List, Callback)
			-- upvalues: list (upval), config (upval)
			for _, value in List do
				assert(value.align == nil or (value.align == "start" or (value.align == "center" or value.align == "end")), "Facet Table: align must be start, center or end")
				local Editor = value.editor
				
				if Editor ~= nil then
					assert(config[Editor] and value.render == nil, `Facet UI.Table: column '{value.id}' editor must be text, number, toggle or menu, without render`)
					assert(Editor ~= "menu" or type(value.options) == "table", `Facet UI.Table: menu column '{value.id}' needs options`)
					assert(type(Callback) == "function", "Facet UI.Table: an editor column needs onCellChange")
					continue
				end
				for _, value1 in list do
					assert(value[value1] == nil, `Facet UI.Table: column '{value.id}' sets {value1} without an editor`)
				end
			end
		end,
		render = function(p4, Callback, Callback1, Callback2)
			-- upvalues: p2 (copy), ReadFunction1 (copy), CollectionPolicyModule (upval)
			return function(p5, _, p6)
				-- upvalues: p2 (upval), p4 (copy), ReadFunction1 (upval), Callback (copy), Callback1 (copy), Callback2 (copy), CollectionPolicyModule (upval)
				return p2.CellEditor({
					Name = "CellEditor",
					editor = assert(p4.editor),
					label = p4.label or p4.id,
					editLabel = p4.editLabel or function(p7): string
						-- upvalues: ReadFunction1 (upval), p4 (upval)
						return "Edit " .. ReadFunction1(p4.label or p4.id, p7)
					end,
					value = function(Callback1)
						-- upvalues: Callback (upval), p5 (copy)
						return Callback(Callback1(p5))
					end,
					onChange = function(p7)
						-- upvalues: Callback1 (upval), p6 (copy), p4 (upval)
						Callback1(p6, p4.id, p7)
					end,
					draft = if p4.draft then p4.draft(p6) else nil,
					validate = p4.validate,
					enabled = function(Callback)
						-- upvalues: Callback2 (upval), CollectionPolicyModule (upval), p4 (upval), p5 (copy)
						return Callback2(Callback) and CollectionPolicyModule.allows(p4.editable, Callback(p5))
					end,
					options = p4.options,
					min = p4.min,
					max = p4.max,
					step = p4.step
				})
			end
		end
	}
end
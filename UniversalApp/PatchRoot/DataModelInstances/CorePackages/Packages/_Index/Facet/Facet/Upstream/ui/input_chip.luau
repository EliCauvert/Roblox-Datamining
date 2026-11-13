local _ = require("./input_kit")
local _ = require("./input_types")
local _ = require("./types")
local _ = require("./control_types")
local _ = require("./input_props")
local _ = require("../vendor/compose/core")

return function(p1, p2, p3)
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local EnabledFunction = p3.enabled
	p2.Chip = p1.construct("Chip", function(Tbl)
		-- upvalues: p3 (copy), ReadFunction (copy), p1 (copy), EnabledFunction (copy), TypesEnum (copy), TypesVector2 (copy), TypesUDim2 (copy), p2 (copy), Compose (copy)
		assert(Tbl.selected == nil or (p3.writable(Tbl.selected) or type(Tbl.onToggle) == "function"), "Facet.Chip: read-only selected requires onToggle")
		assert(Tbl.selected ~= nil or Tbl.onRemove, "Facet.Chip: selected or onRemove is required")
		assert(Tbl.editing == nil or Tbl.onRemove ~= nil, "Facet UI.Chip: editing requires onRemove")
		
		if Tbl.selected ~= nil and Tbl.onRemove ~= nil and Tbl.editing == nil then
			error("Facet UI.Chip: a selectable chip with onRemove requires editing, the caller's edit-mode cell", 0)
		end
		local HasOnRemove = Tbl.onRemove ~= nil
		
		local function _(p4): boolean
			-- upvalues: HasOnRemove (copy), Tbl (copy), ReadFunction (upval)
			return if HasOnRemove then Tbl.selected == nil or ReadFunction(Tbl.editing, p4) == true else false
		end
		
		local Copy = table.clone(Tbl)
		Copy.onToggle = nil
		Copy.onRemove = nil
		Copy.editing = nil
		Copy.removeLabel = nil
		Copy.removeFocusFallback = nil
		Copy.leading = nil
		Copy.trailing = nil
		Copy.ref = nil
		local Value = nil
		local v1 = nil
		local GuiService = p1.config.services.GuiService
		
		local function candidate()
			-- upvalues: Value (ref), p1 (upval), ReadFunction (upval), Tbl (copy)
			if Value.Parent then
				local Children = Value.Parent:GetChildren()
				local t = {}
				
				for i, child in Children do
					t[child] = i
				end
				table.sort(Children, function(A: Frame, B: Frame): boolean
					-- upvalues: t (copy)
					local LayoutOrder = if A:IsA("GuiObject") then A.LayoutOrder else 0
					local LayoutOrder1 = if B:IsA("GuiObject") then B.LayoutOrder else 0
					
					return if LayoutOrder == LayoutOrder1 then t[A] < t[B] else LayoutOrder < LayoutOrder1
				end)
				local FoundIndex: number? = table.find(Children, Value)
				
				local function _(p4)
					-- upvalues: Children (copy), p1 (upval)
					local Child = Children[p4]
					
					return if Child and Child:IsA("GuiObject") and Child:GetAttribute("editing") ~= nil and Child.Selectable and p1.available(Child) then Child else nil
				end
				
				if FoundIndex then
					local Child1 = nil
					for i1 = FoundIndex + 1, #Children do
						local Child = Children[i1]
						Child1 = if Child and Child:IsA("GuiObject") and Child:GetAttribute("editing") ~= nil and Child.Selectable and p1.available(Child) then Child else nil
						
						if Child1 then
							return Child1
						end
					end
					local Child2 = nil
					for i2 = FoundIndex - 1, 1, -1 do
						local Child = Children[i2]
						Child2 = if Child and Child:IsA("GuiObject") and Child:GetAttribute("editing") ~= nil and Child.Selectable and p1.available(Child) then Child else nil
						
						if Child2 then
							return Child2
						end
					end
				end
			end
			return ReadFunction(Tbl.removeFocusFallback)
		end
		
		local function restore()
			-- upvalues: GuiService (copy), v1 (ref), p1 (upval), Value (ref)
			if GuiService and v1 and v1.Parent and (p1.selection.get() == Value or p1.selection.get() == nil) then
				p1.selection.set(v1)
			end
			v1 = nil
		end
		
		local function remove()
			-- upvalues: EnabledFunction (upval), Tbl (copy), p1 (upval), Value (ref), GuiService (copy), v1 (ref), candidate (copy)
			if not EnabledFunction(Tbl) or not p1.available(Value) then return end
			if GuiService and p1.selection.get() == Value then
				v1 = candidate()
			end
			assert(Tbl.onRemove)()
			
			if Value.Parent == nil then
				if GuiService and v1 and v1.Parent and (p1.selection.get() == Value or p1.selection.get() == nil) then
					p1.selection.set(v1)
				end
				v1 = nil
			end
		end
		
		function Copy.onActivate()
			-- upvalues: HasOnRemove (copy), Tbl (copy), ReadFunction (upval), remove (copy)
			if if HasOnRemove then Tbl.selected == nil or ReadFunction(Tbl.editing, nil) == true else false then
				remove()
				
				return
			end
			if Tbl.selected then
				local Inverted = not ReadFunction(Tbl.selected)
				
				if Tbl.onToggle then
					Tbl.onToggle(Inverted)
					
					return
				end
				Tbl.selected:set(Inverted)
			end
		end
		
		function Copy.Selectable(p4)
			-- upvalues: Tbl (copy), HasOnRemove (copy), EnabledFunction (upval)
			return if Tbl.selected == nil then HasOnRemove and EnabledFunction(Tbl, p4) else EnabledFunction(Tbl, p4)
		end
		
		if Copy.haptic == nil and Tbl.selected ~= nil then
			Copy.haptic = true
		end
		if Tbl.leading or Tbl.trailing or HasOnRemove then
			Copy.Text = ""
			local List = {}
			
			if Tbl.leading then
				table.insert(List, Tbl.leading)
			end
			table.insert(List, p1.text({
				Name = "Title",
				Text = Tbl.label or "",
				AutomaticSize = TypesEnum.AutomaticSize.XY
			}, nil, "control"))
			
			if Tbl.trailing then
				table.insert(List, Tbl.trailing)
			end
			if HasOnRemove then
				table.insert(List, p1.text({
					Name = "Remove",
					Text = "×",
					Visible = function(p4): boolean
						-- upvalues: HasOnRemove (copy), Tbl (copy), ReadFunction (upval)
						return if HasOnRemove then Tbl.selected == nil or ReadFunction(Tbl.editing, p4) == true else false
					end,
					AutomaticSize = TypesEnum.AutomaticSize.XY
				}, nil, "control"))
			end
			local RowResult = p1.row(List, {
				Name = "Content",
				AnchorPoint = TypesVector2.new(0, 0.5),
				Position = TypesUDim2.fromScale(0, 0.5)
			})
			assert(RowResult:FindFirstChildWhichIsA("UIListLayout")).VerticalAlignment = TypesEnum.VerticalAlignment.Center
			Copy[#Copy + 1] = RowResult
		end
		if Copy.haptic == nil and Tbl.selected ~= nil then
			Copy.haptic = true
		end
		Value = p1.styled(p2.Button(Copy), "chip")
		Value:AddTag("facet-selection-mark")
		
		if HasOnRemove then
			p3.attributes(Value, {
				AccessibleLabel = function(p4)
					-- upvalues: HasOnRemove (copy), Tbl (copy), ReadFunction (upval), p1 (upval)
					return if if HasOnRemove then Tbl.selected == nil or ReadFunction(Tbl.editing, p4) == true else false then ReadFunction(Tbl.removeLabel, p4) or p1.phrase("Facet.RemoveItem", "Remove {item}", { item = ReadFunction(Tbl.label, p4) or "" }, p4) else ReadFunction(Tbl.label, p4) or ""
				end,
				editing = function(p4): boolean
					-- upvalues: HasOnRemove (copy), Tbl (copy), ReadFunction (upval)
					return if HasOnRemove then Tbl.selected == nil or ReadFunction(Tbl.editing, p4) == true else false
				end
			})
			local Flag = false
			
			local function removalHeld(): boolean
				-- upvalues: p1 (upval), TypesEnum (upval)
				local UserInputService = p1.config.services.UserInputService
				
				if UserInputService == nil or UserInputService == nil or UserInputService.IsKeyDown == nil then
					return false
				end
				if UserInputService:IsKeyDown(TypesEnum.KeyCode.Delete) or UserInputService:IsKeyDown(TypesEnum.KeyCode.Backspace) then
					return true
				end
				if UserInputService.GetConnectedGamepads == nil or UserInputService.IsGamepadButtonDown == nil then
					return false
				end
				for _, connectedGamepad in UserInputService:GetConnectedGamepads() do
					if UserInputService:IsGamepadButtonDown(connectedGamepad, TypesEnum.KeyCode.ButtonX) then
						return true
					end
				end
				return false
			end
			
			local ObserveResult = if GuiService then p1.selection.observe() else Compose.cell(nil)
			local v2 = false
			Compose.watch(function(Callback)
				-- upvalues: ObserveResult (copy), Value (ref), v2 (ref), Flag (ref), removalHeld (copy)
				local IsCallbackResultMatch = Callback(ObserveResult) == Value
				
				if IsCallbackResultMatch and not v2 then
					Flag = removalHeld()
				end
				v2 = IsCallbackResultMatch
			end)
			p1.action(Value, "RemoveChip", {
				TypesEnum.KeyCode.Delete,
				TypesEnum.KeyCode.Backspace,
				TypesEnum.KeyCode.ButtonX
			}, function(Callback)
				-- upvalues: ObserveResult (copy), Value (ref), HasOnRemove (copy), Tbl (copy), ReadFunction (upval), EnabledFunction (upval)
				return Callback(ObserveResult) == Value and (if HasOnRemove then (Tbl.selected == nil or ReadFunction(Tbl.editing, Callback) == true) and EnabledFunction(Tbl, Callback) else false)
			end, function()
				-- upvalues: Flag (ref), remove (copy)
				if not Flag then
					remove()
					
					return
				end
			end, {
				priority = 100,
				onReleased = function()
					-- upvalues: Flag (ref)
					Flag = false
				end
			})
		end
		Compose.cleanup(restore)
		
		return Value
	end)
end
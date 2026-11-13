local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./input_types")
local _ = require("../vendor/compose/core")
local _ = require("./navigation_props")
local NavMenuPanelModule = require("./nav_menu_panel")

return function(p1, p2, p3)
	-- upvalues: NavMenuPanelModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local NavMenuPanelModuleResult = NavMenuPanelModule(p1, p2, p3)
	
	local function _(p4, Text)
		assert(type(p4) == "table" and type(p4.set) == "function", Text .. " requires a writable Compose cell")
	end
	
	p2.ComboBox = p1.construct("ComboBox", function(p4)
		-- upvalues: ReadFunction (copy), Compose (copy), p3 (copy), ReadFunction (copy), ReadFunction (copy), p2 (copy), TypesUDim2 (copy), TypesEnum (copy), Host (copy), p1 (copy), NavMenuPanelModuleResult (copy), Runtime (copy)
		local Value = p4.value
		assert(type(Value) == "table" and type(Value.set) == "function", "ComboBox.value requires a writable Compose cell")
		local Text = p4.text
		assert(type(Text) == "table" and type(Text.set) == "function", "ComboBox.text requires a writable Compose cell")
		assert(type(p4.value:peek()) == "string", "ComboBox.value must be a string")
		assert(type(ReadFunction(p4.options)) == "table", "ComboBox requires options")
		assert(type(p4.acceptCustom) == "function", "ComboBox requires acceptCustom")
		local CellResult = Compose.cell("")
		local Flag = true
		Compose.cleanup(function()
			-- upvalues: Flag (ref)
			Flag = false
		end)
		local CellResult1 = Compose.cell(false)
		local CellResult2 = Compose.cell(false)
		local Flag1 = false
		local v1 = nil
		local GuiService = p3.service("GuiService")
		
		local function close()
			-- upvalues: CellResult1 (copy)
			CellResult1:set(false)
		end
		
		local function label(PeekResult)
			-- upvalues: ReadFunction (upval), p4 (copy), ReadFunction (upval)
			for _, value in ReadFunction(p4.options) do
				if (value.value or value.id) == PeekResult then
					return ReadFunction(value.label)
				end
			end
			return PeekResult
		end
		
		local function update(p5)
			-- upvalues: CellResult1 (copy), CellResult (copy), p4 (copy), label (copy)
			CellResult1:set(false)
			CellResult:set("")
			p4.text:set(label(p5))
			
			if p5 ~= p4.value:peek() then
				p4.value:set(p5)
				
				if p4.onChange then
					p4.onChange(p5)
				end
			end
		end
		
		local function commit(p5, p6)
			-- upvalues: Flag1 (ref), ReadFunction (upval), p4 (copy), ReadFunction (upval), CellResult (copy), update (copy), Flag (ref)
			if Flag1 or ReadFunction(p4.enabled) == false or p6 == "focusLost" and p4.commitOnFocusLost ~= true then return end
			for _, value in ReadFunction(p4.options) do
				if ReadFunction(value.label) == p5 then
					if ReadFunction(value.enabled) == false then
						CellResult:set("This option is unavailable.")
						
						return
					else
						update(value.value or value.id)
						
						return
					end
				end
			end
			local Success, Result, Result3 = pcall(p4.acceptCustom, p5)
			
			if not Flag or ReadFunction(p4.enabled) == false then return end
			if Success and Result == true then
				update(p5)
				
				return
			else
				CellResult:set(Result3 or "This value is not accepted.")
			end
		end
		
		local TextBox = p2.TextInput("Editor")({
			value = p4.text,
			placeholder = p4.placeholder,
			enabled = p4.enabled,
			Size = TypesUDim2.new(1, -60, 1, 0),
			AutomaticSize = TypesEnum.AutomaticSize.None,
			onCommit = function(p7, p8)
				-- upvalues: commit (copy), CellResult1 (copy)
				commit(p7, p8)
				
				if p8 == "submit" then
					CellResult1:set(false)
				end
			end,
			onCancel = function()
				-- upvalues: CellResult1 (copy), p4 (copy), label (copy), CellResult (copy)
				CellResult1:set(false)
				p4.text:set(label(p4.value:peek()))
				CellResult:set("")
			end,
			onChange = function(p7)
				-- upvalues: p4 (copy), CellResult1 (copy)
				p4.text:set(p7)
				CellResult1:set(true)
			end,
			Focused = function()
				-- upvalues: CellResult2 (copy)
				CellResult2:set(true)
			end,
			FocusLost = function()
				-- upvalues: CellResult2 (copy)
				CellResult2:set(false)
			end
		})
		assert(TextBox:IsA("TextBox"), "Facet ComboBox: the editor is a TextBox")
		
		local function _()
			-- upvalues: ReadFunction (upval), p4 (copy), CellResult1 (copy)
			if ReadFunction(p4.enabled) ~= false then
				CellResult1:set(true)
			end
		end
		
		local Frame = Host.Frame("Row")({
			BackgroundTransparency = 1,
			Size = TypesUDim2.new(1, 0, 0, 44),
			TextBox,
			(Host.Frame("Suggestions")({
				BackgroundTransparency = 1,
				Position = TypesUDim2.new(1, -56, 0, 0),
				Size = TypesUDim2.new(0, 56, 1, 0),
				p2.Button("Trigger")({
					label = "",
					icon = "chevron.down",
					enabled = p4.enabled,
					Size = TypesUDim2.fromScale(1, 1),
					AutomaticSize = TypesEnum.AutomaticSize.None,
					Attributes = { FacetLabel = "Suggestions" },
					onActivate = function()
						-- upvalues: CellResult1 (copy), ReadFunction (upval), p4 (copy)
						if CellResult1:peek() then
							CellResult1:set(false)
							
							return
						end
						if ReadFunction(p4.enabled) ~= false then
							CellResult1:set(true)
						end
					end
				})
			}))
		})
		local ColumnResult = p1.column({
			Frame,
			Compose.show(function(Callback): boolean
				-- upvalues: CellResult (copy)
				return Callback(CellResult) ~= ""
			end, function()
				-- upvalues: p1 (upval), CellResult (copy), TypesEnum (upval)
				return p1.text({
					Name = "Validation",
					TextWrapped = true,
					LayoutOrder = 2,
					Text = CellResult,
					AutomaticSize = TypesEnum.AutomaticSize.XY
				})
			end)
		}, p1.props(p4, {
			"value", "text", "options", "enabled", "acceptCustom", "onChange",
			"commitOnFocusLost", "placeholder"
		}, {
			Name = "ComboBox",
			Size = TypesUDim2.new(1, 0, 0, 44),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		}))
		local AvailableResult = p3.available(ColumnResult)
		Compose.watch(function(Callback)
			-- upvalues: AvailableResult (copy), ReadFunction (upval), p4 (copy), CellResult1 (copy)
			if not Callback(AvailableResult) or ReadFunction(p4.enabled, Callback) == false then
				CellResult1:set(false)
			end
		end)
		
		local function Items(Callback)
			-- upvalues: p4 (copy), ReadFunction (upval), ReadFunction (upval), update (copy)
			local List = {}
			local Lowered = string.lower(Callback(p4.text))
			
			for _, value in ReadFunction(p4.options, Callback) do
				if string.find(string.lower(ReadFunction(value.label, Callback)), Lowered, 1, true) then
					table.insert(List, {
						id = value.id or tostring(value.value),
						label = value.label,
						enabled = value.enabled,
						onSelect = function()
							-- upvalues: update (upval), value (copy)
							update(value.value or value.id)
						end
					})
				end
			end
			return List
		end
		
		p3.attach(ColumnResult, {
			p3.overlay(Frame, function(Callback): boolean
				-- upvalues: CellResult1 (copy), Items (copy)
				return Callback(CellResult1) and #Items(Callback) > 0
			end, function()
				-- upvalues: Items (copy), NavMenuPanelModuleResult (upval), close (copy), Frame (copy), v1 (ref), Compose (upval), GuiService (copy), p3 (upval), p1 (upval), ColumnResult (copy), TextBox (copy), Runtime (upval), TypesEnum (upval), CellResult1 (copy)
				local NavMenuPanelModuleResultResult = NavMenuPanelModuleResult({ presentation = "menu", items = Items }, close, Frame, true)
				v1 = NavMenuPanelModuleResultResult
				Compose.cleanup(function()
					-- upvalues: GuiService (upval), p3 (upval), p1 (upval), NavMenuPanelModuleResultResult (copy), ColumnResult (upval), TextBox (upval), v1 (upval)
					if GuiService and p3.within(p1.selection.get(), NavMenuPanelModuleResultResult) then
						p1.selection.set(if p1.available(ColumnResult) then TextBox else nil)
					end
					v1 = nil
				end)
				local UserInputService = p3.service("UserInputService")
				
				if UserInputService then
					Runtime.connect(UserInputService, "InputBegan", function(Input)
						-- upvalues: TypesEnum (upval), NavMenuPanelModuleResultResult (copy), Frame (upval), CellResult1 (upval)
						if Input.UserInputType ~= TypesEnum.UserInputType.MouseButton1 and Input.UserInputType ~= TypesEnum.UserInputType.Touch then return end
						local function _(Frame: Frame): boolean
							-- upvalues: Input (copy)
							local AbsolutePosition = Frame.AbsolutePosition
							local AbsoluteSize = Frame.AbsoluteSize
							local Position = Input.Position
							
							return AbsolutePosition.X <= Position.X and (AbsolutePosition.Y <= Position.Y and Position.X <= AbsolutePosition.X + AbsoluteSize.X) and Position.Y <= AbsolutePosition.Y + AbsoluteSize.Y
						end
						
						local MenuPanel = NavMenuPanelModuleResultResult:FindFirstChild("MenuPanel")
						local AbsolutePosition = Frame.AbsolutePosition
						local AbsoluteSize = Frame.AbsoluteSize
						local Position = Input.Position
						
						if (AbsolutePosition.X > Position.X or (AbsolutePosition.Y > Position.Y or (Position.X > AbsolutePosition.X + AbsoluteSize.X or Position.Y > AbsolutePosition.Y + AbsoluteSize.Y))) and MenuPanel and MenuPanel:IsA("GuiObject") then
							local AbsolutePosition1 = MenuPanel.AbsolutePosition
							local AbsoluteSize1 = MenuPanel.AbsoluteSize
							local Position1 = Input.Position
							
							if AbsolutePosition1.X > Position1.X or (AbsolutePosition1.Y > Position1.Y or (Position1.X > AbsolutePosition1.X + AbsoluteSize1.X or Position1.Y > AbsolutePosition1.Y + AbsoluteSize1.Y)) then
								CellResult1:set(false)
							end
						end
					end)
				end
				return NavMenuPanelModuleResultResult
			end),
			Compose.show(function(Callback)
				-- upvalues: CellResult2 (copy), CellResult1 (copy)
				return Callback(CellResult2) or Callback(CellResult1)
			end, function()
				-- upvalues: p1 (upval), ColumnResult (copy), TypesEnum (upval), CellResult2 (copy), ReadFunction (upval), p4 (copy), CellResult1 (copy), v1 (ref), Compose (upval), Items (copy), p3 (upval), GuiService (copy), Flag1 (ref), TextBox (copy), label (copy), CellResult (copy), Host (upval)
				p1.action(ColumnResult, "ComboSuggestions", { TypesEnum.KeyCode.Down, TypesEnum.KeyCode.DPadDown }, CellResult2, function()
					-- upvalues: ReadFunction (upval), p4 (upval), CellResult1 (upval), v1 (upval), Compose (upval), Items (upval), p3 (upval), GuiService (upval), Flag1 (upval), TextBox (upval), p1 (upval)
					if ReadFunction(p4.enabled) ~= false then
						CellResult1:set(true)
					end
					local v2 = v1
					local FirstSelectableResult = nil
					
					if v2 then
						for _, value in Compose.sample(Items) do
							if value.divider ~= true and ReadFunction(value.enabled) ~= false then
								FirstSelectableResult = p3.firstSelectable(v2, value.id)
								
								if FirstSelectableResult then break end
							else
								continue
							end
						end
					end
					if FirstSelectableResult and GuiService then
						Flag1 = true
						TextBox:ReleaseFocus(false)
						Flag1 = false
						p1.selection.set(FirstSelectableResult)
					end
				end, { priority = 11000 })
				p1.action(ColumnResult, "ComboCancel", { TypesEnum.KeyCode.Escape, TypesEnum.KeyCode.ButtonB }, CellResult1, function()
					-- upvalues: CellResult1 (upval), p4 (upval), label (upval), CellResult (upval), p1 (upval), ColumnResult (upval), TextBox (upval)
					CellResult1:set(false)
					p4.text:set(label(p4.value:peek()))
					CellResult:set("")
					
					if p1.available(ColumnResult) then
						TextBox:CaptureFocus()
					end
				end, { priority = 11000 })
				
				return Host.Folder({})
			end)
		})
		
		return ColumnResult
	end)
end
local _ = require("./types")
local _ = require("./navigation_types")
local ActivationModule = require("./activation")
local _ = require("../vendor/compose/core")
local _ = require("./control_types")
local _ = require("./input_props")
local _ = require("./navigation_props")
local NavMenuItemsModule = require("./nav_menu_items")
local NavMenuPanelModule = require("./nav_menu_panel")
local NavPickerModule = require("./nav_picker")
local NavSplitButtonModule = require("./nav_split_button")
local NavComboBoxModule = require("./nav_combo_box")

return function(p1, p2, p3)
	-- upvalues: NavMenuItemsModule (copy), NavMenuPanelModule (copy), ActivationModule (copy), NavPickerModule (copy), NavSplitButtonModule (copy), NavComboBoxModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local NavMenuItemsModuleResult = NavMenuItemsModule(p1)
	local CheckWidthFunction = NavMenuItemsModuleResult.checkWidth
	local MenuItemsFunction = NavMenuItemsModuleResult.menuItems
	local AdviceFunction = NavMenuItemsModuleResult.advice
	local NavMenuPanelModuleResult = NavMenuPanelModule(p1, p2, p3)
	local list = {
		"items", "query", "label", "disclosure", "trigger", "triggers", "presentation",
		"backLabel", "onOpen", "onClose", "closeButton", "enabled", "isPresented",
		"edge", "align", "width", "maxHeight", "controls"
	}
	
	local function buildMenu(Frame, p4)
		-- upvalues: ReadFunction (copy), MenuItemsFunction (copy), CheckWidthFunction (copy), AdviceFunction (copy), Compose (copy), TypesEnum (copy), TypesUDim2 (copy), p1 (copy), ReadFunction (copy), TypesVector2 (copy), p2 (copy), Host (copy), list (copy), Runtime (copy), p3 (copy), ActivationModule (upval), NavMenuPanelModuleResult (copy)
		assert(Frame.closeButton == nil or type(Frame.closeButton) == "boolean", "Facet UI.Menu: closeButton must be a boolean")
		assert(Frame.items ~= nil, "Menu requires items")
		MenuItemsFunction(ReadFunction(Frame.items))
		assert(Frame.edge == nil or table.find({ "top", "bottom", "leading", "trailing" }, Frame.edge), "Facet UI.Menu: edge must be top, bottom, leading or trailing")
		assert(Frame.align == nil or table.find({ "start", "center", "end" }, Frame.align), "Facet UI.Menu: align must be start, center or end")
		assert(Frame.maxHeight == nil or type(Frame.maxHeight) == "number" and Frame.maxHeight > 0 and Frame.maxHeight < 1e999, "Facet UI.Menu: maxHeight must be a finite number of pixels above 0")
		CheckWidthFunction(ReadFunction(Frame.width))
		
		if Frame.controls then
			function Frame.controls.diagnostics()
				-- upvalues: AdviceFunction (upval), ReadFunction (copy), Frame (copy)
				return AdviceFunction(ReadFunction(Frame.items), "items", 0, {})
			end
		end
		if Frame.label ~= nil and Frame.trigger ~= nil then
			error("Facet UI.Menu: give label or trigger, not both", 0)
		end
		local IsPresented = Frame.isPresented or Compose.cell(false)
		local CellResult = Compose.cell(nil)
		local Enabled = false
		
		local function _(p5)
			-- upvalues: Enabled (ref), Frame (copy)
			if p5 == Enabled then return end
			Enabled = p5
			
			if p5 and Frame.onOpen then
				Frame.onOpen()
				
				return
			end
			if not p5 and Frame.onClose then
				Frame.onClose()
			end
		end
		
		local function close()
			-- upvalues: IsPresented (copy), Enabled (ref), Frame (copy)
			if IsPresented:peek() then
				IsPresented:set(false)
			end
			if Enabled == false then return end
			Enabled = false
			
			if Frame.onClose then
				Frame.onClose()
			end
		end
		
		local function open()
			-- upvalues: ReadFunction (upval), Frame (copy), IsPresented (copy), Enabled (ref)
			if ReadFunction(Frame.enabled) == false or IsPresented:peek() then return end
			IsPresented:set(true)
			
			if Enabled == true then return end
			Enabled = true
			
			if Frame.onOpen then
				Frame.onOpen()
				
				return
			end
		end
		
		Compose.watch(function(Callback)
			-- upvalues: IsPresented (copy), CellResult (copy), Enabled (ref), Frame (copy)
			local CallbackResult = Callback(IsPresented)
			
			if not CallbackResult then
				CellResult:set(nil)
			end
			if CallbackResult == Enabled then return end
			Enabled = CallbackResult
			
			if CallbackResult and Frame.onOpen then
				Frame.onOpen()
				
				return
			end
			if not CallbackResult and Frame.onClose then
				Frame.onClose()
			end
		end)
		Compose.cleanup(function()
			-- upvalues: Enabled (ref), Frame (copy)
			if Enabled == false then return end
			Enabled = false
			
			if Frame.onClose then
				Frame.onClose()
			end
		end)
		local Triggers = Frame.triggers or {
			"activate",
			"secondary",
			"longPress",
			"keyboard",
			"gamepad"
		}
		
		local _ = function(Value): boolean
			-- upvalues: Triggers (copy)
			return table.find(Triggers, Value) ~= nil
		end
		
		local TriggerResult = if type(Frame.trigger) == "function" then Frame.trigger() else Frame.trigger
		local FrameResult = nil
		local Object = nil
		local AutomaticSize = Frame.AutomaticSize or (if Frame.Size == nil then TypesEnum.AutomaticSize.XY else TypesEnum.AutomaticSize.None)
		
		if TriggerResult == nil then
			local HasFoundIndex = table.find(Triggers, "activate") ~= nil
			local Label = {
				Name = "Trigger",
				label = Frame.label or "Menu",
				enabled = Frame.enabled,
				onActivate = if HasFoundIndex then open else nil
			}
			
			if Frame.Size ~= nil then
				Label.AutomaticSize = AutomaticSize
				
				function Label.Size(p5)
					-- upvalues: ReadFunction (upval), AutomaticSize (copy), TypesEnum (upval), TypesUDim2 (upval), p1 (upval)
					local ReadResult = ReadFunction(AutomaticSize, p5)
					local IsReadResultMatch: boolean = ReadResult == TypesEnum.AutomaticSize.X or ReadResult == TypesEnum.AutomaticSize.XY
					local IsReadResultMatch1: boolean = ReadResult == TypesEnum.AutomaticSize.Y or ReadResult == TypesEnum.AutomaticSize.XY
					
					return TypesUDim2.new(if IsReadResultMatch then 0 else 1, 0, if IsReadResultMatch1 then 0 else 1, if IsReadResultMatch1 then p1.controlSize(nil, "height", p5) else 0)
				end
				
				Label.TextTruncate = TypesEnum.TextTruncate.AtEnd
				Label.TextWrapped = false
				Label.ClipsDescendants = true
				Label.Attributes = {
					FacetLabel = function(p5)
						-- upvalues: ReadFunction (upval), Label (copy)
						return ReadFunction(Label.label, p5)
					end
				}
			end
			if Frame.disclosure then
				Label[#Label + 1] = p1.icon("chevron.up.chevron.down", {
					Name = "Disclosure",
					BackgroundTransparency = 1,
					Size = TypesUDim2.fromOffset(12, 12),
					AnchorPoint = TypesVector2.new(1, 0.5),
					Position = TypesUDim2.new(1, 20, 0.5, 0)
				})
			end
			local ButtonResult = p2.Button(Label)
			
			if Frame.disclosure then
				ButtonResult:AddTag("facet-disclosure")
			end
			Object = ButtonResult
		else
			Object = TriggerResult
		end
		if TriggerResult == nil or p4 then
			FrameResult = Host.Frame(p1.props(Frame, list, {
				Name = "Menu",
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromOffset(0, 0),
				AutomaticSize = AutomaticSize,
				Object
			}))
		else
			FrameResult = TriggerResult
			local PropsResult = p1.props(Frame, list, {})
			local t = {}
			local List = {}
			
			for i, value in PropsResult do
				if type(i) == "number" then
					local PropsResultEntry = PropsResult[i]
					
					if PropsResultEntry ~= nil then
						table.insert(List, PropsResultEntry)
					end
				elseif type(i) == "string" then
					t[i] = value
				end
			end
			if next(t) ~= nil then
				Runtime.decorate(Object, t)
			end
			if #List > 0 then
				p3.attach(Object, List)
			end
		end
		if TriggerResult ~= nil and table.find(Triggers, "activate") ~= nil then
			if ActivationModule.marked(Object) then
				Compose.cleanup(ActivationModule.listen(Object, open))
			else
				Runtime.connect(Object, "Activated", open)
			end
		end
		local AvailableResult = p3.available(FrameResult)
		local Flag = false
		Compose.watch(function(Callback)
			-- upvalues: AvailableResult (copy), Flag (ref), ReadFunction (upval), Frame (copy), IsPresented (copy), Enabled (ref)
			local CallbackResult = Callback(AvailableResult)
			
			if CallbackResult then
				Flag = true
			end
			if Flag and (not CallbackResult or ReadFunction(Frame.enabled, Callback) == false) then
				if IsPresented:peek() then
					IsPresented:set(false)
				end
				if Enabled == false then return end
				Enabled = false
				
				if Frame.onClose then
					Frame.onClose()
				end
			end
		end)
		
		if table.find(Triggers, "secondary") ~= nil then
			local function secondary(Input)
				-- upvalues: ReadFunction (upval), Frame (copy), TypesEnum (upval), ActivationModule (upval), TypesVector2 (upval), Object (ref), p3 (upval), CellResult (copy), IsPresented (copy), Enabled (ref)
				if ReadFunction(Frame.enabled) == false then return end
				if Input.UserInputType == TypesEnum.UserInputType.MouseButton2 and not ActivationModule.consumed(Input) then
					local NewTypesVector = TypesVector2.new(Input.Position.X, Input.Position.Y)
					local ScreenGui = Object:FindFirstAncestorWhichIsA("ScreenGui")
					local GuiService = p3.service("GuiService")
					
					if ScreenGui and ScreenGui.IgnoreGuiInset and GuiService then
						NewTypesVector += GuiService:GetGuiInset()
					end
					CellResult:set(NewTypesVector)
					
					if ReadFunction(Frame.enabled) ~= false and not IsPresented:peek() then
						IsPresented:set(true)
						
						if Enabled ~= true then
							Enabled = true
							
							if Frame.onOpen then
								Frame.onOpen()
							end
						end
					end
					if IsPresented:peek() then
						ActivationModule.consume(Input)
					end
				end
			end
			
			local InputBeganConnections = {}
			
			local function attach(Gui)
				-- upvalues: InputBeganConnections (copy), secondary (copy)
				if Gui:IsA("GuiObject") and not InputBeganConnections[Gui] then
					InputBeganConnections[Gui] = Gui.InputBegan:Connect(secondary)
				end
			end
			
			local Gui1 = Object
			
			if Gui1:IsA("GuiObject") and not InputBeganConnections[Gui1] then
				InputBeganConnections[Gui1] = Gui1.InputBegan:Connect(secondary)
			end
			for _, Gui in Object:GetDescendants() do
				if Gui:IsA("GuiObject") and not InputBeganConnections[Gui] then
					InputBeganConnections[Gui] = Gui.InputBegan:Connect(secondary)
				end
			end
			Runtime.connect(Object, "DescendantAdded", attach)
			Runtime.connect(Object, "DescendantRemoving", function(Key)
				-- upvalues: InputBeganConnections (copy)
				if InputBeganConnections[Key] then
					InputBeganConnections[Key]:Disconnect()
					InputBeganConnections[Key] = nil
				end
			end)
			Compose.cleanup(function()
				-- upvalues: InputBeganConnections (copy)
				for _, inputBeganConnection in InputBeganConnections do
					inputBeganConnection:Disconnect()
				end
			end)
		end
		if table.find(Triggers, "longPress") ~= nil then
			Runtime.connect(Object, "TouchLongPress", function(_, Begin)
				-- upvalues: TypesEnum (upval), ReadFunction (upval), Frame (copy), IsPresented (copy), Enabled (ref)
				if Begin == TypesEnum.UserInputState.Begin and ReadFunction(Frame.enabled) ~= false then
					if IsPresented:peek() then return end
					IsPresented:set(true)
					
					if Enabled == true then return end
					Enabled = true
					
					if Frame.onOpen then
						Frame.onOpen()
						
						return
					end
				end
			end)
		end
		local ObserveResult = if p3.service("GuiService") then p1.selection.observe() else Compose.cell(nil)
		local List = {}
		
		if table.find(Triggers, "keyboard") ~= nil then
			table.insert(List, TypesEnum.KeyCode.Menu)
			List[#List + 1] = {
				KeyCode = TypesEnum.KeyCode.F10,
				PrimaryModifier = TypesEnum.KeyCode.LeftShift
			}
			List[#List + 1] = {
				KeyCode = TypesEnum.KeyCode.F10,
				PrimaryModifier = TypesEnum.KeyCode.RightShift
			}
		end
		if table.find(Triggers, "gamepad") ~= nil then
			table.insert(List, TypesEnum.KeyCode.ButtonY)
		end
		if #List > 0 then
			p1.action(FrameResult, "Menu", List, function(Callback)
				-- upvalues: p3 (upval), ObserveResult (copy), FrameResult (ref)
				return p3.within(Callback(ObserveResult), FrameResult)
			end, open, { priority = 1200 })
		end
		local Menu = p1.motionTiming("menu")
		p3.attach(FrameResult, {
			p3.overlay(FrameResult, IsPresented, function(p5)
				-- upvalues: Compose (upval), CellResult (copy), IsPresented (copy), NavMenuPanelModuleResult (upval), Frame (copy), close (copy), Object (ref), Menu (copy)
				local CellResult1 = Compose.cell(CellResult:peek())
				Compose.watch(function(Callback)
					-- upvalues: IsPresented (upval), CellResult1 (copy), CellResult (upval)
					if Callback(IsPresented) then
						CellResult1:set(Callback(CellResult))
					end
				end)
				
				return NavMenuPanelModuleResult(Frame, close, Object, nil, p5, Menu, CellResult1, if Frame.closeButton == nil then "automatic" else Frame.closeButton)
			end, { motion = Menu })
		})
		
		return FrameResult
	end
	
	p2.Menu = p1.construct("Menu", function(Frame)
		-- upvalues: buildMenu (copy)
		return (buildMenu(Frame, false))
	end)
	NavPickerModule(p1, p2, p3, buildMenu)
	NavSplitButtonModule(p1, p2, p3, buildMenu)
	NavComboBoxModule(p1, p2, p3)
end
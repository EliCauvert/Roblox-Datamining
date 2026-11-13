local _ = require("./types")
local _ = require("./command_types")
local CoreModule = require("../vendor/compose/core")
local GestureServiceModule = require("./gesture_service")
local self = setmetatable({}, { __mode = "k" })

return function(Key, p1)
	-- upvalues: self (copy), GestureServiceModule (copy), CoreModule (copy)
	local Compose = Key.Compose
	local Runtime = Key.runtime
	local UserInputService = Key.config.userInputService
	local GuiService = Key.config.guiService
	local SelfEntry = self[Key]
	
	if SelfEntry == nil then
		SelfEntry = Compose.cell({})
		self[Key] = SelfEntry
	end
	function p1.commandScope(Node, p2)
		-- upvalues: GestureServiceModule (upval), Key (copy), Compose (copy), UserInputService (copy), GuiService (copy), Runtime (copy), CoreModule (upval), SelfEntry (copy)
		local GestureServiceModuleResult = GestureServiceModule(Key)
		local FacetCommandScopeRequiresAComposeOwner = assert(Compose.currentOwner(), "Facet commandScope requires a Compose owner")
		local CellResult = Compose.cell(nil)
		local CellResult1 = Compose.cell(0)
		local CellResult2 = Compose.cell(UserInputService ~= nil and not not UserInputService:GetFocusedTextBox())
		local ObserveResult = if GuiService then Key.selection.observe() else Compose.cell(nil)
		local Actions = {}
		
		local function refresh()
			-- upvalues: CellResult1 (copy)
			CellResult1:update(function(p3: number): number
				return p3 + 1
			end)
		end
		
		local function available(Node1, Callback): boolean
			-- upvalues: Node (copy), Key (upval)
			if Node.Parent == nil or not Key.available(Node1, Callback) then
				return false
			end
			local Gui = Node1
			while Gui do
				if Gui:IsA("GuiObject") then
					local CallbackResult = if Callback then Callback(Key.observe.Interactable(Gui)) else Gui.Interactable
					
					if not (if Callback then Callback(Key.observe.Visible(Gui)) else Gui.Visible) or not CallbackResult then
						return false
					end
				end
				if Gui == Node then
					return true
				end
				Gui = Gui.Parent
			end
			return false
		end
		
		local function targetKey(Callback)
			-- upvalues: CellResult1 (copy), ObserveResult (copy), available (copy), Key (upval), p2 (copy), Node (copy)
			Callback(CellResult1)
			local CallbackResult = Callback(ObserveResult)
			
			if CallbackResult == nil or not available(CallbackResult, Callback) then
				return nil
			end
			local ReadResult = Key.read(p2.targets, Callback)
			local Parent = CallbackResult
			while Parent do
				for _, value in ReadResult do
					if value.node == Parent and available(value.node, Callback) then
						return value.key
					end
				end
				if Parent == Node then break end
				Parent = Parent.Parent
			end
			return nil
		end
		
		Runtime.connect(Node, "AncestryChanged", refresh)
		Compose.watch(function(p3)
			-- upvalues: CellResult (copy), targetKey (copy)
			CellResult:set((targetKey(p3)))
		end)
		
		if UserInputService then
			Runtime.connect(UserInputService, "TextBoxFocused", function()
				-- upvalues: CellResult2 (copy)
				CellResult2:set(true)
			end)
			Runtime.connect(UserInputService, "TextBoxFocusReleased", function()
				-- upvalues: CellResult2 (copy), UserInputService (copy)
				CellResult2:set(not not UserInputService:GetFocusedTextBox())
			end)
		end
		local config = {
			node = Node,
			active = function(Callback)
				-- upvalues: CoreModule (upval), FacetCommandScopeRequiresAComposeOwner (copy), CellResult (copy), CellResult2 (copy), Key (upval), p2 (copy), Node (copy)
				return not CoreModule.owner.isDisposed(FacetCommandScopeRequiresAComposeOwner) and (Callback(CellResult) ~= nil and (not Callback(CellResult2) and (Key.read(p2.enabled, Callback) ~= false and Key.available(Node, Callback))))
			end
		}
		SelfEntry:update(function(Tbl)
			-- upvalues: config (copy)
			local Copy = table.clone(Tbl)
			table.insert(Copy, config)
			
			return Copy
		end)
		Compose.cleanup(function()
			-- upvalues: SelfEntry (upval), config (copy), CellResult (copy)
			SelfEntry:update(function(List)
				-- upvalues: config (upval)
				local List1 = {}
				
				for _, value in List do
					if value ~= config then
						table.insert(List1, value)
					end
				end
				return List1
			end)
			CellResult:set(nil)
		end)
		
		local function wins(Callback): boolean
			-- upvalues: config (copy), SelfEntry (upval), Node (copy)
			if not config.active(Callback) then
				return false
			end
			for _, value in Callback(SelfEntry) do
				if value ~= config and value.node:IsDescendantOf(Node) and value.active(Callback) then
					return false
				end
			end
			return true
		end
		
		local function selectable(Gui)
			-- upvalues: available (copy), selectable (copy)
			if Gui:IsA("GuiObject") and not available(Gui) then
				return nil
			end
			if Gui:IsA("GuiObject") and Gui.Selectable then
				return Gui
			end
			local SelectableResult = nil
			for _, child in Gui:GetChildren() do
				SelectableResult = selectable(child)
				
				if SelectableResult then
					return SelectableResult
				end
			end
			return nil
		end
		
		local v1 = nil
		Compose.watch(function(p3)
			-- upvalues: Key (upval), p2 (copy), v1 (ref), CoreModule (upval), FacetCommandScopeRequiresAComposeOwner (copy), Compose (upval), Runtime (upval), refresh (copy), GestureServiceModuleResult (copy), GuiService (upval), available (copy), selectable (copy), CellResult1 (copy)
			local ReadResult = Key.read(p2.targets, p3)
			
			if v1 then
				CoreModule.owner.dispose(v1)
			end
			local Child = CoreModule.owner.createChild(FacetCommandScopeRequiresAComposeOwner)
			v1 = Child
			Compose.withOwner(Child, function()
				-- upvalues: ReadResult (copy), Runtime (upval), refresh (upval), GestureServiceModuleResult (upval), GuiService (upval), Key (upval), p2 (upval), available (upval), selectable (upval)
				local t = {}
				local t1 = {}
				
				for _, value in ReadResult do
					assert(not t[value.key] and not t1[value.node], "Facet commandScope targets must have unique keys and nodes")
					t[value.key] = true
					t1[value.node] = true
					Runtime.connect(value.node, "AncestryChanged", refresh)
					Runtime.connect(value.node, "SelectionGained", refresh)
					Runtime.connect(value.node, "InputBegan", function(Input)
						-- upvalues: GestureServiceModuleResult (upval), value (copy), GuiService (upval), Key (upval), p2 (upval), available (upval), selectable (upval)
						local GetResult = GestureServiceModuleResult.get(Input)
						
						if GetResult and GetResult.owner ~= value.node and not GetResult.owner:IsDescendantOf(value.node) then return end
						if GuiService and Key.effectiveInput()() ~= "Touch" and Key.read(p2.enabled) ~= false and available(value.node) and (Input.UserInputType == Key.types.Enum.UserInputType.Touch or Input.UserInputType == Key.types.Enum.UserInputType.MouseButton1) then
							local SelectableResult = selectable(value.node)
							
							if SelectableResult then
								Key.selection.set(SelectableResult)
							end
						end
					end)
				end
			end)
			CellResult1:update(function(p4: number): number
				return p4 + 1
			end)
		end)
		Compose.cleanup(function()
			-- upvalues: v1 (ref), CoreModule (upval)
			if v1 then
				CoreModule.owner.dispose(v1)
			end
		end)
		local t = {}
		
		for _, enumItem in Key.types.Enum.KeyCode:GetEnumItems() do
			t[enumItem.Name] = true
		end
		local t1 = {}
		local t2 = {}
		
		for _, command in p2.commands do
			assert(command.id ~= "" and not t1[command.id], "Facet commandScope command ids must be unique")
			assert(#command.keys > 0, "Facet commandScope commands require keys")
			t1[command.id] = true
			
			for _, key in command.keys do
				assert(t[key], "Facet commandScope has an unknown KeyCode")
				assert(not t2[key], "Facet commandScope keys belong to one command")
				t2[key] = true
			end
			Actions[command.id] = Key.action(Node, command.id, command.keys, function(p4): boolean
				-- upvalues: wins (copy), Key (upval), command (copy)
				return wins(p4) and Key.read(command.enabled, p4) ~= false
			end, function()
				-- upvalues: CellResult (copy), UserInputService (upval), command (copy)
				local PeekResult = CellResult:peek()
				
				if PeekResult ~= nil and (not UserInputService or not UserInputService:GetFocusedTextBox()) then
					command.onInvoke(PeekResult)
				end
			end, {
				group = "Commands",
				priority = 1500,
				sink = true,
				capture = true
			})
		end
		return {
			current = CellResult,
			actions = Actions,
			focus = function(Key1): boolean
				-- upvalues: CoreModule (upval), FacetCommandScopeRequiresAComposeOwner (copy), GuiService (upval), Key (upval), p2 (copy), selectable (copy)
				if CoreModule.owner.isDisposed(FacetCommandScopeRequiresAComposeOwner) or GuiService == nil or Key.read(p2.enabled) == false then
					return false
				end
				local SelectableResult = nil
				for _, value in Key.read(p2.targets) do
					if value.key == Key1 then
						SelectableResult = selectable(value.node)
						
						if SelectableResult then
							Key.selection.set(SelectableResult)
							
							return true
						end
					end
				end
				return false
			end,
			clear = function()
				-- upvalues: CoreModule (upval), FacetCommandScopeRequiresAComposeOwner (copy), GuiService (upval), CellResult (copy), Key (upval)
				if not CoreModule.owner.isDisposed(FacetCommandScopeRequiresAComposeOwner) and GuiService and CellResult:peek() ~= nil then
					Key.selection.set(nil)
				end
			end
		}
	end
end
local CoreModule = require("../vendor/compose/core")
local _ = require("./types")
local ReservedKeysModule = require("./reserved_keys")

return function(p1, p2)
	-- upvalues: ReservedKeysModule (copy), CoreModule (copy)
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local Host = p1.Host
	local TypesEnum = p1.types.Enum
	
	local function _(Input)
		-- upvalues: TypesEnum (copy), p1 (copy)
		return if type(Input) == "string" then assert(TypesEnum.KeyCode:FromName(Input), `Facet action: unknown key '{Input}'`) elseif type(Input) == "table" then p1.read(Input.KeyCode) else Input
	end
	
	local self = setmetatable({}, { __index = TypesEnum.KeyCode })
	local t = {}
	
	function p1.whenSelected(Key, p3, Callback: () -> ())
		-- upvalues: Runtime (copy), t (copy), Compose (copy), p1 (copy)
		assert(Runtime.host.observation, "Roblox property observation is required")
		local Entry = t[Key]
		
		if Entry == nil then
			local config = { count = 0, stop = nil, waiting = {} }
			t[Key] = config
			Entry = config
		end
		local Entry1 = Entry
		Compose.cleanup(function()
			-- upvalues: Entry1 (copy), p3 (copy), Callback (copy)
			if Entry1.waiting[p3] == Callback then
				Entry1.waiting[p3] = nil
				Entry1.count -= 1
				
				if Entry1.count == 0 and Entry1.stop then
					Entry1.stop()
					Entry1.stop = nil
				end
			end
		end)
		Entry1.waiting[p3] = Callback
		Entry1.count += 1
		
		if Entry1.stop == nil then
			Entry1.stop = p1.selection.changed(function()
				-- upvalues: p1 (upval), Entry1 (copy)
				local WaitingEntry: () -> () = Entry1.waiting[p1.selection.get()]
				
				if WaitingEntry then
					WaitingEntry()
				end
			end)
		end
		if rawequal(p1.selection.get(), p3) then
			Callback()
		end
	end
	
	local self1 = setmetatable({}, { __mode = "k" })
	
	function p1.shiftRoute(Key, p3)
		-- upvalues: self1 (copy), Compose (copy)
		self1[Key] = p3
		Compose.cleanup(function()
			-- upvalues: self1 (upval), Key (copy), p3 (copy)
			if self1[Key] == p3 then
				self1[Key] = nil
			end
		end)
	end
	
	function p1.shiftActivation(Parent, InputObject)
		-- upvalues: p2 (copy), TypesEnum (copy), self1 (copy)
		local UserInputService = p2.userInputService
		
		if not UserInputService or type(InputObject) ~= "table" and (typeof(InputObject) ~= "Instance" or not InputObject:IsA("InputObject")) or InputObject.KeyCode ~= TypesEnum.KeyCode.Return then
			return nil
		end
		local Success, Result = pcall(function()
			-- upvalues: UserInputService (copy), TypesEnum (upval)
			return UserInputService:IsKeyDown(TypesEnum.KeyCode.LeftShift) or UserInputService:IsKeyDown(TypesEnum.KeyCode.RightShift)
		end)
		
		if not Success or not Result then
			return nil
		end
		local Parent1 = Parent
		local SelfEntry = nil
		while Parent1 do
			SelfEntry = self1[Parent1]
			
			if SelfEntry then
				return SelfEntry
			end
			Parent1 = Parent1.Parent
		end
		return nil
	end
	
	p1.modalScopes = Compose.cell({})
	p1.modalReturn = {}
	p1.modalPortals = Compose.cell({})
	
	function p1.modalPortal(Node, Anchor)
		-- upvalues: p1 (copy), Compose (copy)
		local config = { node = Node, anchor = Anchor }
		local Copy = table.clone(p1.modalPortals:peek())
		table.insert(Copy, config)
		p1.modalPortals:set(Copy)
		Compose.cleanup(function()
			-- upvalues: p1 (upval), config (copy)
			local List = {}
			
			for _, value in p1.modalPortals:peek() do
				if value ~= config then
					table.insert(List, value)
				end
			end
			p1.modalPortals:set(List)
		end)
	end
	
	local function withinModal(Node, p3)
		-- upvalues: p1 (copy)
		local Source = p1.readSource(p1.modalScopes, p3)
		local SourceEntry = Source[#Source]
		
		if SourceEntry == nil then
			return true
		else
			local Source1 = p1.readSource(p1.modalPortals, p3)
			
			local function inside(Object, p4): boolean
				-- upvalues: SourceEntry (copy), Source1 (copy), inside (copy)
				if not Object or p4[Object] then
					return false
				end
				p4[Object] = true
				
				if Object == SourceEntry or Object:IsDescendantOf(SourceEntry) then
					return true
				end
				for _, value in Source1 do
					if (Object == value.node or Object:IsDescendantOf(value.node)) and inside(value.anchor, p4) then
						return true
					end
				end
				return false
			end
			
			return (inside(Node, {}))
		end
	end
	
	p1.withinModal = withinModal
	local self2 = setmetatable({}, { __mode = "kv" })
	local self3 = setmetatable({}, { __mode = "kv" })
	local self4 = setmetatable({}, { __mode = "k" })
	
	function p1.available(Node, p4)
		-- upvalues: self2 (copy), self3 (copy), self4 (copy), withinModal (copy)
		local Parent = Node
		while Parent do
			local SelfEntry = self2[Parent]
			local SelfEntry1 = if SelfEntry == nil then self3[Parent] else nil
			
			if SelfEntry == nil and SelfEntry1 == nil and not self4[Parent] then
				if Parent:IsA("GuiObject") then
					SelfEntry = Parent
					self2[Parent] = Parent
				elseif Parent:IsA("LayerCollector") then
					SelfEntry1 = Parent
					self3[Parent] = Parent
				else
					self4[Parent] = true
				end
			end
			if SelfEntry then
				if not SelfEntry.Visible or not SelfEntry.Interactable then
					return false
				end
			elseif SelfEntry1 and not SelfEntry1.Enabled then
				return false
			end
			Parent = Parent.Parent
		end
		return (withinModal(Node, p4))
	end
	
	function p1.reserveKeys(p5)
		-- upvalues: p2 (copy), Compose (copy), ReservedKeysModule (upval), self (copy)
		local UserInputService = p2.userInputService
		
		if UserInputService ~= nil then
			Compose.cleanup(ReservedKeysModule.add(UserInputService, self, p5))
			
			return
		end
	end
	
	function p1.navigationGamepads()
		-- upvalues: p2 (copy), TypesEnum (copy)
		local UserInputService = p2.userInputService
		
		if UserInputService and UserInputService.GetNavigationGamepads then
			local NavigationGamepads = UserInputService:GetNavigationGamepads()
			
			if #NavigationGamepads > 0 then
				return NavigationGamepads
			end
		end
		local LastInputType = if UserInputService and UserInputService.GetLastInputType then UserInputService:GetLastInputType() else nil
		
		return if LastInputType and string.find(LastInputType.Name, "^Gamepad") then { LastInputType } else { TypesEnum.UserInputType.Gamepad1 }
	end
	
	local self5 = setmetatable({}, { __mode = "k" })
	
	function p1.action(Node, Name, Inputs, p5, Callback, p6)
		-- upvalues: Compose (copy), self5 (copy), CoreModule (upval), p2 (copy), p1 (copy), Runtime (copy), TypesEnum (copy), Host (copy), withinModal (copy), ReservedKeysModule (upval)
		local P22 = p6 or {}
		local FacetActionRequiresAComposeOwner = assert(Compose.currentOwner(), "Facet action requires a Compose owner")
		local SelfEntry = self5[FacetActionRequiresAComposeOwner]
		
		if SelfEntry == nil then
			local self = setmetatable({}, { __mode = "k" })
			self5[FacetActionRequiresAComposeOwner] = self
			SelfEntry = self
		end
		local SelfEntry1 = SelfEntry[Node]
		
		if SelfEntry1 == nil then
			local CellResult = Compose.cell(nil)
			local CellResult1 = Compose.cell(false)
			local v1 = nil
			
			local function locate()
				-- upvalues: CoreModule (upval), FacetActionRequiresAComposeOwner (copy), v1 (ref), p2 (upval), Node (copy), CellResult (copy), CellResult1 (copy), Compose (upval), p1 (upval)
				if CoreModule.owner.isDisposed(FacetActionRequiresAComposeOwner) then return end
				if v1 then
					CoreModule.owner.dispose(v1)
					v1 = nil
				end
				local InputParent = p2.inputParent
				
				if InputParent == nil then
					local Parent = Node
					while Parent and not Parent:IsA("LayerCollector") do
						Parent = Parent.Parent
					end
					if Parent == nil then
						CellResult:set(nil)
						CellResult1:set(false)
						
						return
					end
				end
				local Child = CoreModule.owner.createChild(FacetActionRequiresAComposeOwner)
				v1 = Child
				Compose.withOwner(Child, function()
					-- upvalues: Node (upval), p1 (upval), InputParent (copy), CellResult (upval), Compose (upval), CellResult1 (upval)
					local List = {}
					local Parent = Node
					local v2 = nil
					while Parent do
						if Parent:IsA("GuiObject") then
							table.insert(List, p1.observe.Visible(Parent))
							table.insert(List, p1.observe.Interactable(Parent))
						elseif Parent:IsA("LayerCollector") then
							v2 = Parent
							table.insert(List, p1.observe.Enabled(Parent))
							break
						end
						Parent = Parent.Parent
					end
					CellResult:set(if InputParent then InputParent else v2)
					Compose.watch(function(Callback)
						-- upvalues: List (copy), CellResult1 (upval)
						local Flag = true
						
						for _, value in List do
							if Callback(value) == false then
								Flag = false
							end
						end
						CellResult1:set(Flag)
					end)
				end)
			end
			
			locate()
			Runtime.connect(Node, "AncestryChanged", locate)
			local config = {
				parent = CellResult,
				available = CellResult1,
				groups = {}
			}
			SelfEntry1 = config
			SelfEntry[Node] = config
		end
		local v2 = assert(SelfEntry1)
		local Parent = v2.parent
		local Available = v2.available
		local Groups = v2.groups
		local Group = if P22.group then Groups[P22.group] else nil
		local GuiService = p2.guiService
		local Flag = false
		local Flag1 = false
		local Flag2 = false
		local config = {
			Name = Name,
			Type = if P22.direction2D then TypesEnum.InputActionType.Direction2D else TypesEnum.InputActionType.Bool,
			Pressed = function()
				-- upvalues: Flag (ref), Flag2 (ref), Flag1 (ref), p1 (upval), Available (copy), Node (copy), p5 (copy), Callback (copy)
				if Flag or Flag2 then return end
				Flag1 = true
				
				if p1.readSource(Available) and p1.available(Node) and p1.read(p5) ~= false then
					Callback()
				end
			end,
			Released = function()
				-- upvalues: Flag (ref), Flag1 (ref), P22 (copy)
				Flag = false
				Flag1 = false
				
				if P22.onReleased then
					P22.onReleased()
				end
			end
		}
		
		local function bind(Input)
			-- upvalues: Host (upval), TypesEnum (upval), p1 (upval)
			return Host.InputBinding(if type(Input) == "table" then Input else {
				KeyCode = if type(Input) == "string" then assert(TypesEnum.KeyCode:FromName(Input), `Facet action: unknown key '{Input}'`) elseif type(Input) == "table" then p1.read(Input.KeyCode) else Input
			})
		end
		
		for _, input in Inputs do
			config[#config + 1] = Host.InputBinding(if type(input) == "table" then input else {
				KeyCode = if type(input) == "string" then assert(TypesEnum.KeyCode:FromName(input), `Facet action: unknown key '{input}'`) elseif type(input) == "table" then p1.read(input.KeyCode) else input
			})
		end
		local Conditional = P22.conditional
		
		if Conditional then
			config[#config + 1] = Compose.show(Conditional.when, function()
				-- upvalues: bind (copy), Conditional (copy)
				return bind(Conditional.binding)
			end)
		end
		local InputActionResult = Host.InputAction(config)
		
		if P22.direction2D then
			Runtime.connect(InputActionResult, "StateChanged", P22.direction2D)
		end
		local function enabledBody(Callback)
			-- upvalues: Parent (copy), p1 (upval), p5 (copy), Available (copy), withinModal (upval), Node (copy)
			return Callback(Parent) ~= nil and (p1.read(p5, Callback) ~= false and (Callback(Available) and withinModal(Node, Callback)))
		end
		
		local v3 = nil
		local Keys = {}
		
		for _, input1 in Inputs do
			local ReadResult = if type(input1) == "string" then assert(TypesEnum.KeyCode:FromName(input1), `Facet action: unknown key '{input1}'`) elseif type(input1) == "table" then p1.read(input1.KeyCode) else input1
			local Name1 = if ReadResult then ReadResult.Name else nil
			
			if Name1 and ReservedKeysModule.KEYS[Name1] then
				Keys[Name1] = true
			end
		end
		if next(Keys) ~= nil and p2.userInputService then
			p1.reserveKeys({
				keys = Keys,
				priority = P22.priority or 2000,
				sink = P22.sink ~= false,
				node = Node,
				gui = p2.guiService,
				selected = p1.selection.get,
				enabled = function()
					-- upvalues: v3 (ref)
					local v4 = v3
					
					return v4 ~= nil and v4.Enabled
				end,
				press = function()
					-- upvalues: Flag1 (ref), Flag2 (ref), p1 (upval), Available (copy), Node (copy), p5 (copy), Callback (copy)
					if Flag1 then return end
					Flag2 = true
					
					if p1.readSource(Available) and p1.available(Node) and p1.read(p5) ~= false then
						Callback()
					end
				end,
				release = function()
					-- upvalues: Flag2 (ref), Flag1 (ref), P22 (copy)
					local Flag: boolean = Flag2
					Flag1 = false
					Flag2 = false
					
					if Flag and P22.onReleased then
						P22.onReleased()
					end
				end
			})
		end
		local UserInputService = p2.userInputService
		local Held = if UserInputService then function(): boolean
			-- upvalues: Inputs (copy), TypesEnum (upval), p1 (upval), UserInputService (copy)
			for _, input in Inputs do
				local ReadResult = if type(input) == "string" then assert(TypesEnum.KeyCode:FromName(input), `Facet action: unknown key '{input}'`) elseif type(input) == "table" then p1.read(input.KeyCode) else input
				
				if ReadResult then
					if UserInputService.IsGamepadButtonDown then
						for _, value in p1.navigationGamepads() do
							if UserInputService:IsGamepadButtonDown(value, ReadResult) then
								return true
							end
						end
					end
					if UserInputService.IsKeyDown and UserInputService:IsKeyDown(ReadResult) then
						return true
					end
				end
			end
			return false
		end else function(): boolean
			return false
		end
		local Context = nil
		
		if Group then
			Context = Group.context
			Runtime.decorate(InputActionResult, { Enabled = enabledBody })
			InputActionResult.Parent = Context
		elseif P22.group then
			Runtime.decorate(InputActionResult, { Enabled = enabledBody })
			Context = Host.InputContext("Facet" .. P22.group)({
				Parent = Parent,
				Priority = P22.priority or 2000,
				Sink = P22.sink ~= false,
				Enabled = function(Callback)
					-- upvalues: Parent (copy), Available (copy)
					return Callback(Parent) ~= nil and Callback(Available)
				end,
				InputActionResult
			})
			Groups[P22.group] = { context = Context }
		else
			Context = Host.InputContext("Facet" .. Name)({
				Parent = Parent,
				Priority = P22.priority or 2000,
				Sink = P22.sink ~= false,
				Enabled = enabledBody,
				InputActionResult
			})
		end
		local InputActionResult1 = if P22.group then InputActionResult else Context
		v3 = InputActionResult1
		
		if UserInputService then
			Compose.cleanup(assert(Runtime.host.observation).observeProperty(InputActionResult1, "Enabled", function()
				-- upvalues: InputActionResult1 (copy), Flag (ref), Held (ref)
				if InputActionResult1.Enabled then
					Flag = Held()
				end
			end))
			
			if InputActionResult1.Enabled then
				Flag = Held()
			end
		end
		local UserInputService1 = p2.userInputService
		
		if P22.capture and GuiService and GuiService.GetPropertyChangedSignal and UserInputService1 then
			local ObserveResult = p1.selection.observe()
			local EnabledResult = p1.observe.Enabled(InputActionResult1)
			local t = {}
			local t1 = {}
			local t2 = {}
			
			for _, input2 in Inputs do
				local ReadResult = if type(input2) == "string" then assert(TypesEnum.KeyCode:FromName(input2), `Facet action: unknown key '{input2}'`) elseif type(input2) == "table" then p1.read(input2.KeyCode) else input2
				for _, value1 in { "Up", "Down", "Left", "Right" } do
					local Entry = ({ Up = "W", Down = "S", Left = "A", Right = "D" })[value1]
					
					if ReadResult and (ReadResult == TypesEnum.KeyCode:FromName(value1) or ReadResult == TypesEnum.KeyCode:FromName("DPad" .. value1) or ReadResult == TypesEnum.KeyCode:FromName(Entry)) then
						t[ReadResult.Name] = value1
						
						if ReadResult == TypesEnum.KeyCode:FromName(Entry) then
							t1[Entry] = value1
						else
							t2[value1] = true
						end
					end
				end
			end
			local List = {}
			
			if next(t) == nil then
				return InputActionResult, Context
			end
			local CellResult2 = Compose.cell({})
			
			for _, value in t do
				if not table.find(List, value) then
					table.insert(List, value)
				end
			end
			local FormulaResult = Compose.formula(function(Callback): boolean
				-- upvalues: EnabledResult (copy), ObserveResult (copy)
				return Callback(EnabledResult) and Callback(ObserveResult) ~= nil
			end)
			
			local function _(Gui, p7)
				return if p7 == "Up" then Gui.NextSelectionUp elseif p7 == "Down" then Gui.NextSelectionDown elseif p7 == "Left" then Gui.NextSelectionLeft else Gui.NextSelectionRight
			end
			
			local _ = function(p7, Text, p8)
				-- upvalues: Runtime (upval)
				Runtime.host.render.setProperty(p7, "NextSelection" .. Text, p8)
			end
			
			local Gui = nil
			local v4 = nil
			local List1 = {}
			local NextSelectionUps = {}
			
			local function release()
				-- upvalues: Gui (ref), List1 (copy), NextSelectionUps (copy), Runtime (upval)
				local NextSelectionUp = Gui
				
				if NextSelectionUp then
					for _, value in List1 do
						if (if value == "Up" then NextSelectionUp.NextSelectionUp elseif value == "Down" then NextSelectionUp.NextSelectionDown elseif value == "Left" then NextSelectionUp.NextSelectionLeft else NextSelectionUp.NextSelectionRight) == NextSelectionUp then
							Runtime.host.render.setProperty(NextSelectionUp, "NextSelection" .. value, NextSelectionUps[value])
						end
					end
				end
				Gui = nil
				table.clear(List1)
				table.clear(NextSelectionUps)
			end
			
			Compose.watch(function(Callback)
				-- upvalues: FormulaResult (copy), ObserveResult (copy), CellResult2 (copy), Gui (ref), v4 (ref), Flag1 (ref), Flag2 (ref), t1 (copy), TypesEnum (upval), UserInputService1 (copy), p1 (upval), Held (ref), release (copy), List (copy), t2 (copy), List1 (copy), NextSelectionUps (copy), Runtime (upval)
				local CallbackResult = if Callback(FormulaResult) then Callback(ObserveResult) else nil
				local CallbackResult1 = Callback(CellResult2)
				
				if CallbackResult == Gui and CallbackResult1 == v4 then return end
				if CallbackResult and Gui and CallbackResult ~= Gui and not Flag1 and not Flag2 then
					for i in t1 do
						if UserInputService1:IsKeyDown((assert(TypesEnum.KeyCode:FromName(i)))) then
							p1.selection.set(Gui)
							
							return
						end
					end
				end
				if CallbackResult ~= Gui and not Held() then
					Flag1 = false
					Flag2 = false
				end
				release()
				v4 = CallbackResult1
				
				if CallbackResult then
					Gui = CallbackResult
					
					for _, value in List do
						if t2[value] or CallbackResult1[value] then
							table.insert(List1, value)
							NextSelectionUps[value] = if value == "Up" then CallbackResult.NextSelectionUp elseif value == "Down" then CallbackResult.NextSelectionDown elseif value == "Left" then CallbackResult.NextSelectionLeft else CallbackResult.NextSelectionRight
							Runtime.host.render.setProperty(CallbackResult, "NextSelection" .. value, CallbackResult)
						end
					end
				end
			end)
			Compose.cleanup(release)
			Runtime.connect(UserInputService1, "InputBegan", function(Input)
				-- upvalues: t (copy), FormulaResult (copy), t1 (copy), CellResult2 (copy), Flag1 (ref), Flag2 (ref), p1 (upval), Available (copy), Node (copy), p5 (copy), Callback (copy)
				if Input.KeyCode and t[Input.KeyCode.Name] and FormulaResult:peek() then
					local Entry = t1[Input.KeyCode.Name]
					
					if Entry then
						local Copy = table.clone(CellResult2:peek())
						Copy[Entry] = true
						CellResult2:set(Copy)
					end
					if Flag1 then return end
					Flag2 = true
					
					if p1.readSource(Available) and p1.available(Node) and p1.read(p5) ~= false then
						Callback()
					end
				end
			end)
			local OnReleasedFunction = P22.onReleased
			Runtime.connect(UserInputService1, "InputEnded", function(Input)
				-- upvalues: t (copy), t1 (copy), CellResult2 (copy), Flag1 (ref), Flag2 (ref), OnReleasedFunction (copy)
				if Input.KeyCode and t[Input.KeyCode.Name] then
					local Entry = t1[Input.KeyCode.Name]
					
					if Entry then
						local Copy = table.clone(CellResult2:peek())
						Copy[Entry] = nil
						CellResult2:set(Copy)
					end
					Flag1 = false
					Flag2 = false
					
					if OnReleasedFunction then
						OnReleasedFunction()
					end
				end
			end)
		end
		return InputActionResult, Context
	end
end
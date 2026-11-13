local CoreModule = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./environment_types")
local ActivationModule = require("./activation")
local config = {
	passive = true,
	gameplayGuard = true,
	traversalWrap = true,
	engageOnPress = true,
	resignOnActivate = true
}

return function(p1)
	-- upvalues: ActivationModule (copy), CoreModule (copy), config (copy)
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local Config = p1.config
	local TypesEnum = p1.types.Enum
	local GuiService = Config.guiService
	local UserInputService = Config.userInputService
	local CellResult = Compose.cell({})
	local NoKeyboardNavigation = Config.keyboardNavigation == nil or Config.keyboardNavigation
	local self = setmetatable({}, { __mode = "k" })
	local List = {
		TypesEnum.KeyCode.DPadUp,
		TypesEnum.KeyCode.DPadDown,
		TypesEnum.KeyCode.DPadLeft,
		TypesEnum.KeyCode.DPadRight
	}
	
	local function ordered(Object)
		-- upvalues: TypesEnum (copy)
		local Children = Object:GetChildren()
		local IsFacetDocumentOrderAttribute = Object:GetAttribute("FacetDocumentOrder") == true
		for _, UIGridStyleLayout in Children do
			if UIGridStyleLayout:IsA("UIGridStyleLayout") and UIGridStyleLayout.SortOrder == TypesEnum.SortOrder.LayoutOrder then
				IsFacetDocumentOrderAttribute = true
				break
			end
		end
		if not IsFacetDocumentOrderAttribute then
			return Children
		end
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
		
		return Children
	end
	
	local function shown(Parent)
		local Parent1 = Parent
		while Parent1 do
			if Parent1:IsA("GuiObject") and (not Parent1.Visible or not Parent1.Interactable) then
				return false
			end
			if Parent1:IsA("LayerCollector") then
				return Parent1.Enabled
			end
			Parent1 = Parent1.Parent
		end
		return false
	end
	
	local function hidden(Root): boolean
		local Parent = Root
		while Parent do
			if Parent:IsA("GuiObject") and Parent.Visible == false then
				return true
			end
			if Parent:IsA("LayerCollector") then
				return Parent.Enabled == false
			end
			Parent = Parent.Parent
		end
		return false
	end
	
	local function collect(Sibling, List)
		-- upvalues: ordered (copy), collect (copy)
		if Sibling:IsA("GuiObject") then
			if not Sibling.Visible or not Sibling.Interactable then return end
			if Sibling.Selectable then
				table.insert(List, Sibling)
			end
		elseif Sibling:IsA("LayerCollector") and not Sibling.Enabled then return end
		for _, value in ordered(Sibling) do
			collect(value, List)
		end
	end
	
	local function _(p2)
		-- upvalues: collect (copy)
		local t = {}
		collect(p2, t)
		
		return t
	end
	
	local _ = function(p2)
		return p2:FindFirstAncestorWhichIsA("LayerCollector")
	end
	
	local _ = function()
		-- upvalues: p1 (copy), shown (copy)
		local PeekResult = p1.modalScopes:peek()
		
		for i = #PeekResult, 1, -1 do
			if shown(PeekResult[i]) then
				return PeekResult[i]
			end
		end
		return nil
	end
	
	local function screens()
		-- upvalues: self (copy)
		local t = {}
		local List = {}
		
		for i in self do
			local LayerCollector = i:FindFirstAncestorWhichIsA("LayerCollector")
			
			if LayerCollector and not t[LayerCollector] and LayerCollector.Enabled then
				t[LayerCollector] = true
				table.insert(List, LayerCollector)
			end
		end
		table.sort(List, function(A, B): boolean
			return (if B:IsA("ScreenGui") then B.DisplayOrder else 0) < (if A:IsA("ScreenGui") then A.DisplayOrder else 0)
		end)
		
		return List
	end
	
	local _ = function(Frame: Frame)
		local AbsolutePosition = Frame.AbsolutePosition
		local AbsoluteSize = Frame.AbsoluteSize
		
		return {
			x = AbsolutePosition.X,
			y = AbsolutePosition.Y,
			width = AbsoluteSize.X,
			height = AbsoluteSize.Y
		}
	end
	
	local function scopeOf(Frame)
		-- upvalues: p1 (copy), shown (copy), collect (copy), CellResult (copy), screens (copy)
		local PeekResult = p1.modalScopes:peek()
		local v1 = nil
		
		for i = #PeekResult, 1, -1 do
			if not shown(PeekResult[i]) then
				continue
			end
			v1 = PeekResult[i]
			break
		end
		if v1 then
			local t = {}
			collect(v1, t)
			
			return t
		end
		if Frame and shown(Frame) then
			local LayerCollector = Frame:FindFirstAncestorWhichIsA("LayerCollector")
			
			if LayerCollector then
				local t = {}
				collect(LayerCollector, t)
				
				return t
			end
		end
		local PeekResult1 = CellResult:peek()
		local t = nil
		
		for i1 = #PeekResult1, 1, -1 do
			local PeekResultEntry = PeekResult1[i1]
			
			if PeekResultEntry.passive and PeekResultEntry.engaged:peek() and shown(PeekResultEntry.root) then
				t = {}
				collect(PeekResultEntry.root, t)
				
				if #t > 0 then
					return t
				end
			end
		end
		local t1 = nil
		for _, value in screens() do
			t1 = {}
			collect(value, t1)
			
			if #t1 > 0 then
				return t1
			end
		end
		return {}
	end
	
	local function beyond(Frame: Frame, Frame1: Frame)
		-- upvalues: scopeOf (copy), Compose (copy)
		local AbsolutePosition = Frame1.AbsolutePosition
		local AbsoluteSize = Frame1.AbsoluteSize
		local AbsolutePosition1 = Frame.AbsolutePosition
		local AbsoluteSize1 = Frame.AbsoluteSize
		local XDelta = AbsolutePosition1.X + AbsoluteSize1.X / 2 - (AbsolutePosition.X + AbsoluteSize.X / 2)
		local YDelta = AbsolutePosition1.Y + AbsoluteSize1.Y / 2 - (AbsolutePosition.Y + AbsoluteSize.Y / 2)
		local IsYBelow: boolean = AbsolutePosition.Y + AbsoluteSize.Y <= AbsolutePosition1.Y or (AbsolutePosition1.Y + AbsoluteSize1.Y <= AbsolutePosition.Y or math.abs(XDelta) <= math.abs(YDelta))
		local Down: string = if IsYBelow then if YDelta >= 0 then "down" else "up" elseif XDelta >= 0 then "right" else "left"
		local Frames = {}
		local List = {}
		
		for _, Frame2 in scopeOf(Frame1) do
			if Frame2 ~= Frame1 and Frame2 ~= Frame and not Frame2:IsA("ScrollingFrame") and not Frame2:IsDescendantOf(Frame) then
				table.insert(Frames, Frame2)
				local AbsolutePosition2 = Frame2.AbsolutePosition
				local AbsoluteSize2 = Frame2.AbsoluteSize
				table.insert(List, {
					x = AbsolutePosition2.X,
					y = AbsolutePosition2.Y,
					width = AbsoluteSize2.X,
					height = AbsoluteSize2.Y
				})
			end
		end
		local AbsolutePosition3 = Frame1.AbsolutePosition
		local AbsoluteSize3 = Frame1.AbsoluteSize
		local FocusNeighborResult = Compose.focusNeighbor({
			x = AbsolutePosition3.X,
			y = AbsolutePosition3.Y,
			width = AbsoluteSize3.X,
			height = AbsoluteSize3.Y
		}, List, Down)
		
		return if FocusNeighborResult then Frames[FocusNeighborResult] else nil
	end
	
	local function entryOf(Frame: Frame, Value: Frame)
		-- upvalues: collect (copy), shown (copy), beyond (copy)
		local List = {}
		collect(Frame, List)
		
		if List[1] == Frame then
			table.remove(List, 1)
		end
		if #List == 0 then
			return if Value == nil or not shown(Value) or Value:IsDescendantOf(Frame) then nil else beyond(Frame, Value) or Value
		end
		if Value and table.find(List, Value) then
			return Value
		end
		local FacetEntryAttribute = Frame:GetAttribute("FacetEntry")
		
		if type(FacetEntryAttribute) == "string" then
			for _, value in List do
				if value.Name == FacetEntryAttribute then
					return value
				end
			end
		end
		local Entry = List[1]
		
		if Value and Value ~= Frame and not Value:IsDescendantOf(Frame) then
			local NewAbsolutePosition = Value.AbsolutePosition + Value.AbsoluteSize / 2
			local AbsolutePosition = Frame.AbsolutePosition
			local AbsoluteSize = Frame.AbsoluteSize
			local IsYBelow: boolean = NewAbsolutePosition.Y <= AbsolutePosition.Y or AbsolutePosition.Y + AbsoluteSize.Y <= NewAbsolutePosition.Y
			local v2 = 1e999
			
			for _, Frame1 in List do
				local AbsolutePosition1 = Frame1.AbsolutePosition
				local AbsoluteSize1 = Frame1.AbsoluteSize
				local NewLargest = math.max(if IsYBelow then if NewAbsolutePosition.Y <= AbsolutePosition.Y then AbsolutePosition1.Y - AbsolutePosition.Y else AbsolutePosition.Y + AbsoluteSize.Y - AbsolutePosition1.Y - AbsoluteSize1.Y elseif NewAbsolutePosition.X <= AbsolutePosition.X then AbsolutePosition1.X - AbsolutePosition.X else AbsolutePosition.X + AbsoluteSize.X - AbsolutePosition1.X - AbsoluteSize1.X, 0) * 100000 + (if IsYBelow then math.abs(AbsolutePosition1.X + AbsoluteSize1.X / 2 - NewAbsolutePosition.X) else math.abs(AbsolutePosition1.Y + AbsoluteSize1.Y / 2 - NewAbsolutePosition.Y))
				
				if NewLargest < v2 then
					v2 = NewLargest
					Entry = Frame1
				end
			end
		end
		return Entry
	end
	
	local _ = function(Parent): boolean
		local Parent1 = Parent
		while Parent1 do
			if Parent1:GetAttribute("FacetTraversalWrap") == false then
				return false
			end
			Parent1 = Parent1.Parent
		end
		return true
	end
	
	local function traverse(p2: number)
		-- upvalues: GuiService (copy), p1 (copy), scopeOf (copy), UserInputService (copy)
		if GuiService == nil then return end
		local GetResult = p1.selection.get()
		local List = {}
		
		for _, ScrollingFrame in scopeOf(GetResult) do
			if not ScrollingFrame:IsA("ScrollingFrame") or ScrollingFrame:GetAttribute("FacetSelectionOwner") == true then
				table.insert(List, ScrollingFrame)
			end
		end
		if #List == 0 then return end
		local t = {}
		
		for i, value in List do
			t[value] = i
		end
		table.sort(List, function(A, B): boolean
			-- upvalues: t (copy)
			return if A.SelectionOrder == B.SelectionOrder then t[A] < t[B] else A.SelectionOrder < B.SelectionOrder
		end)
		local FoundIndex = if GetResult then table.find(List, GetResult) else nil
		
		if FoundIndex and (FoundIndex + p2 < 1 or #List < FoundIndex + p2) then
			local Entry1 = List[FoundIndex]
			local Flag = nil
			while Entry1 do
				if Entry1:GetAttribute("FacetTraversalWrap") ~= false then
					Entry1 = Entry1.Parent
					continue
				end
				Flag = false
				if not Flag then return end
			end
			Flag = true
		end
		local Entry = if FoundIndex then List[(FoundIndex - 1 + p2) % #List + 1] elseif p2 < 0 then List[#List] else List[1]
		local FocusedTextBox = if UserInputService and UserInputService.GetFocusedTextBox then UserInputService:GetFocusedTextBox() else nil
		
		if FocusedTextBox and FocusedTextBox ~= Entry then
			FocusedTextBox:ReleaseFocus(false)
		end
		p1.selection.set(Entry)
	end
	
	local function resting(Object): boolean
		-- upvalues: p1 (copy), shown (copy), CellResult (copy)
		local PeekResult = p1.modalScopes:peek()
		local Ancestor = nil
		
		for i = #PeekResult, 1, -1 do
			if not shown(PeekResult[i]) then
				continue
			end
			Ancestor = PeekResult[i]
			break
		end
		if Ancestor and (Object == Ancestor or Object:IsDescendantOf(Ancestor)) then
			return false
		end
		for _, value in CellResult:peek() do
			if value.passive and not value.engaged:peek() and Object:IsDescendantOf(value.root) then
				return true
			end
		end
		return false
	end
	
	local function enter()
		-- upvalues: Config (copy), GuiService (copy), p1 (copy), shown (copy), scopeOf (copy), resting (copy), screens (copy), collect (copy)
		local GamepadService = Config.services.GamepadService
		
		if GuiService == nil or GamepadService and GamepadService.GamepadCursorEnabled then return end
		local GetResult = p1.selection.get()
		
		if GetResult and shown(GetResult) then return end
		for _, value in scopeOf(nil) do
			if not resting(value) then
				p1.selection.set(value)
				
				return
			end
		end
		local PeekResult = p1.modalScopes:peek()
		local v3 = nil
		
		for i = #PeekResult, 1, -1 do
			if not shown(PeekResult[i]) then
				continue
			end
			v3 = PeekResult[i]
			break
		end
		if v3 then return end
		for _, value1 in screens() do
			local t = {}
			collect(value1, t)
			
			for _, value2 in t do
				if not resting(value2) then
					p1.selection.set(value2)
					break
				end
			end
		end
	end
	
	local function snapshot(Node)
		-- upvalues: p1 (copy), ordered (copy)
		local Levels = {}
		local Modal = false
		local PeekResult = p1.modalScopes:peek()
		local Value = Node
		local Parent = Node.Parent
		while Parent do
			if table.find(PeekResult, Value) then
				Modal = true
			end
			table.insert(Levels, {
				child = Value,
				parent = Parent,
				siblings = ordered(Parent)
			})
			
			if Parent:IsA("LayerCollector") then break end
			Value = Parent
			Parent = Parent.Parent
		end
		return { node = Node, levels = Levels, modal = Modal }
	end
	
	local function keyed(p3): boolean
		-- upvalues: shown (copy)
		for _, level in p3.levels do
			if level.parent:GetAttribute("FacetSelectionOwner") == true and shown(level.parent) then
				return true
			end
		end
		return false
	end
	
	local function survivor(p4)
		-- upvalues: shown (copy), collect (copy)
		local t = nil
		local t2 = nil
		for _, level in p4.levels do
			local Parent = level.parent
			
			if shown(Parent) then
				local FoundIndex: number = table.find(level.siblings, level.child) or 0
				
				for i = FoundIndex + 1, #level.siblings do
					local Sibling = level.siblings[i]
					
					if Sibling.Parent == Parent then
						t2 = {}
						collect(Sibling, t2)
						
						if t2[1] then
							return t2[1]
						end
					end
				end
				for i1 = FoundIndex - 1, 1, -1 do
					local Sibling = level.siblings[i1]
					
					if Sibling.Parent == Parent then
						t = {}
						collect(Sibling, t)
						
						if t[#t] then
							return t[#t]
						end
					end
				end
			end
		end
		return nil
	end
	
	local _ = function()
		-- upvalues: Config (copy)
		local InputParent = Config.inputParent
		
		if InputParent == nil then
			local Players = Config.services.Players
			local LocalPlayer = if Players then Players.LocalPlayer else nil
			
			if LocalPlayer then
				return (LocalPlayer:FindFirstChildOfClass("PlayerGui"))
			end
			InputParent = nil
		end
		return InputParent
	end
	
	local SharedResource = Compose.createSharedResource(function()
		-- upvalues: GuiService (copy), UserInputService (copy), Runtime (copy), ActivationModule (upval), p1 (copy), Config (copy), Compose (copy), self (copy), TypesEnum (copy), shown (copy), keyed (copy), survivor (copy), entryOf (copy), CoreModule (upval), snapshot (copy), List (copy), enter (copy), NoKeyboardNavigation (copy), CellResult (copy), hidden (copy), traverse (copy)
		if GuiService == nil or UserInputService == nil or not GuiService.GetPropertyChangedSignal then
			if UserInputService then
				Runtime.connect(UserInputService, "InputBegan", ActivationModule.release)
			end
			return nil, nil
		else
			local ObserveResult = p1.selection.observe()
			local GamepadService = Config.services.GamepadService
			
			if GamepadService then
				local GamepadCursorEnabledResult = p1.observe.GamepadCursorEnabled(GamepadService)
				Compose.watch(function(Callback)
					-- upvalues: GamepadCursorEnabledResult (copy), p1 (upval)
					if Callback(GamepadCursorEnabledResult) then
						p1.selection.set(nil)
					end
				end)
			end
			local KeyboardEnabledResult = p1.observe.KeyboardEnabled(UserInputService)
			local PreferredInputResult = p1.observe.PreferredInput(UserInputService)
			local v4 = false
			local v5 = false
			
			local function ownedByFacet(p5): boolean
				-- upvalues: self (upval)
				while p5 do
					if self[p5] then
						return true
					end
					p5 = p5.Parent
				end
				return false
			end
			
			Compose.watch(function(Callback)
				-- upvalues: ObserveResult (copy), UserInputService (copy), v5 (ref), self (upval)
				local CallbackResult = Callback(ObserveResult)
				local LastInputType = if UserInputService.GetLastInputType then UserInputService:GetLastInputType() else nil
				local Flag = false
				
				if LastInputType ~= nil then
					Flag = false
					
					if string.find(LastInputType.Name, "^Gamepad") ~= nil then
						local Parent = CallbackResult
						while Parent do
							if not self[Parent] then
								Parent = Parent.Parent
								continue
							end
							Flag = true
						end
						Flag = false
					end
				end
				v5 = Flag
			end)
			Compose.watch(function(Callback)
				-- upvalues: PreferredInputResult (copy), TypesEnum (upval), v4 (ref), v5 (ref), p1 (upval)
				local IsCallbackResultMatch = Callback(PreferredInputResult) == TypesEnum.PreferredInput.Gamepad
				
				if v4 and not IsCallbackResultMatch and v5 and p1.selection.get() ~= nil then
					p1.selection.set(nil)
				end
				v4 = IsCallbackResultMatch
			end)
			local v6 = nil
			local Flag = false
			
			local function recover()
				-- upvalues: Flag (ref), p1 (upval), shown (upval), v6 (ref), keyed (upval), survivor (upval)
				Flag = false
				
				if #p1.modalScopes:peek() > 0 then return end
				local GetResult = p1.selection.get()
				
				if GetResult and shown(GetResult) then return end
				local v7 = v6
				
				if v7 == nil or v7.modal or keyed(v7) then return end
				if shown(v7.node) and v7.node.Selectable then return end
				local SurvivorResult = survivor(v7)
				
				if SurvivorResult then
					p1.selection.set(SurvivorResult)
				end
			end
			
			local CellResult1 = Compose.cell(0)
			Compose.watch(function(Callback)
				-- upvalues: CellResult1 (copy), Flag (ref), recover (copy)
				if Callback(CellResult1) > 0 and Flag then
					recover()
				end
			end)
			
			local function _()
				-- upvalues: Flag (ref), v6 (ref), keyed (upval), CellResult1 (copy)
				if not Flag and v6 ~= nil and not v6.modal and not keyed(v6) then
					Flag = true
					CellResult1:set(CellResult1:peek() + 1)
					
					return
				end
			end
			
			local v7 = assert(Compose.currentOwner())
			local v8 = nil
			
			local _ = function(Frame): boolean
				-- upvalues: entryOf (upval), v6 (ref), p1 (upval)
				if Frame:GetAttribute("FacetSelectionOwner") == true then
					return false
				end
				local EntryOfResult = entryOf(Frame, if v6 then v6.node else nil)
				
				if EntryOfResult == nil then
					return false
				else
					p1.selection.set(EntryOfResult)
					
					return true
				end
			end
			
			local function track(Object)
				-- upvalues: v8 (ref), CoreModule (upval), v7 (copy), Compose (upval), p1 (upval), shown (upval), Flag (ref), v6 (ref), keyed (upval), CellResult1 (copy), entryOf (upval)
				if v8 then
					CoreModule.owner.dispose(v8)
				end
				local Child = CoreModule.owner.createChild(v7)
				v8 = Child
				Compose.withOwner(Child, function()
					-- upvalues: p1 (upval), Object (copy), Compose (upval), shown (upval), Flag (upval), v6 (upval), keyed (upval), CellResult1 (upval), entryOf (upval)
					local List = { p1.observe.Parent(Object) }
					local Parent = Object
					while Parent do
						if Parent:IsA("GuiObject") then
							table.insert(List, p1.observe.Visible(Parent))
							table.insert(List, p1.observe.Interactable(Parent))
						elseif Parent:IsA("LayerCollector") then
							table.insert(List, p1.observe.Enabled(Parent))
							break
						end
						Parent = Parent.Parent
					end
					Compose.watch(function(Callback: (any) -> ())
						-- upvalues: List (copy), p1 (upval), Object (upval), shown (upval), Flag (upval), v6 (upval), keyed (upval), CellResult1 (upval), entryOf (upval)
						for _, value in List do
							Callback(value)
						end
						if p1.selection.get() ~= Object then return end
						if shown(Object) then
							if Object:IsA("ScrollingFrame") then
								if Object:GetAttribute("FacetSelectionOwner") == true then return end
								local EntryOfResult = entryOf(Object, if v6 then v6.node else nil)
								
								if EntryOfResult == nil then return end
								p1.selection.set(EntryOfResult)
							end
						elseif not Flag and v6 ~= nil and not v6.modal then
							if not keyed(v6) then
								Flag = true
								CellResult1:set(CellResult1:peek() + 1)
								
								return
							end
							return
						end
					end)
				end)
			end
			
			Compose.watch(function(Callback)
				-- upvalues: ObserveResult (copy), shown (upval), entryOf (upval), v6 (ref), p1 (upval), snapshot (upval), track (copy), Flag (ref), keyed (upval), CellResult1 (copy)
				local CallbackResult = Callback(ObserveResult)
				
				if CallbackResult and CallbackResult:IsA("ScrollingFrame") and shown(CallbackResult) then
					local Flag1 = nil
					if CallbackResult:GetAttribute("FacetSelectionOwner") == true then
						Flag1 = false
					else
						local EntryOfResult = entryOf(CallbackResult, if v6 then v6.node else nil)
						
						if EntryOfResult == nil then
							Flag1 = false
						else
							p1.selection.set(EntryOfResult)
							Flag1 = true
						end
					end
					if Flag1 then return end
				end
				if not CallbackResult or not shown(CallbackResult) then
					if CallbackResult and CallbackResult:IsA("ScrollingFrame") then
						track(CallbackResult)
					end
					if not Flag and v6 ~= nil and not v6.modal then
						if keyed(v6) then return end
						Flag = true
						CellResult1:set(CellResult1:peek() + 1)
					end
				elseif v6 == nil or v6.node ~= CallbackResult then
					v6 = snapshot(CallbackResult)
					track(CallbackResult)
					
					return
				end
			end)
			Runtime.connect(UserInputService, "InputBegan", function(Input)
				-- upvalues: ActivationModule (upval), List (upval), enter (upval)
				ActivationModule.release(Input)
				
				if table.find(List, Input.KeyCode) then
					enter()
				end
			end)
			local InputParent = Config.inputParent
			
			if InputParent == nil then
				local Players = Config.services.Players
				local LocalPlayer = if Players then Players.LocalPlayer else nil
				InputParent = if LocalPlayer then LocalPlayer:FindFirstChildOfClass("PlayerGui") else nil
			end
			if InputParent then
				p1.Host.InputContext({
					Name = "FacetEntry",
					Parent = InputParent,
					Priority = 30,
					Sink = false,
					p1.Host.InputAction({
						Name = "Enter",
						Type = TypesEnum.InputActionType.Direction2D,
						StateChanged = function(Offset)
							-- upvalues: enter (upval)
							if typeof(Offset) == "Vector2" and Offset.Magnitude >= 0.5 then
								enter()
							end
						end,
						p1.Host.InputBinding({ KeyCode = TypesEnum.KeyCode.Thumbstick1 })
					})
				})
				local FormulaResult = Compose.formula(function(Callback): boolean
					-- upvalues: NoKeyboardNavigation (upval), KeyboardEnabledResult (copy), ObserveResult (copy), self (upval), CellResult (upval), hidden (upval)
					if not NoKeyboardNavigation or Callback(KeyboardEnabledResult) ~= true then
						return false
					end
					local CallbackResult = Callback(ObserveResult)
					
					if CallbackResult == nil then
						local Flag = false
						
						for _, value1 in Callback(CellResult) do
							if not value1.passive or Callback(value1.engaged) then
								return true
							elseif not hidden(value1.root) then
								Flag = true
							end
						end
						return not Flag
					else
						local Parent = CallbackResult
						local Flag1 = nil
						while Parent do
							if not self[Parent] then
								Parent = Parent.Parent
								continue
							end
							Flag1 = true
							if Flag1 then
								return true
							end
							for _, value in Callback(CellResult) do
								if CallbackResult == value.root or CallbackResult:IsDescendantOf(value.root) then
									return true
								end
							end
							return false
						end
						Flag1 = false
					end
				end)
				local Flag1 = false
				local Flag2 = false
				
				local _ = function()
					-- upvalues: UserInputService (copy), TypesEnum (upval), traverse (upval)
					local IsKeyDown = UserInputService.IsKeyDown ~= nil and (UserInputService:IsKeyDown(TypesEnum.KeyCode.LeftShift) or UserInputService:IsKeyDown(TypesEnum.KeyCode.RightShift))
					traverse(if IsKeyDown then -1 else 1)
				end
				
				p1.reserveKeys({
					priority = 1500,
					sink = true,
					keys = { Tab = true },
					editing = ownedByFacet,
					gui = GuiService,
					selected = p1.selection.get,
					enabled = function()
						-- upvalues: FormulaResult (copy)
						return FormulaResult:peek()
					end,
					press = function()
						-- upvalues: Flag1 (ref), Flag2 (ref), UserInputService (copy), TypesEnum (upval), traverse (upval)
						if not Flag1 then
							Flag2 = true
							local IsKeyDown = UserInputService.IsKeyDown ~= nil and (UserInputService:IsKeyDown(TypesEnum.KeyCode.LeftShift) or UserInputService:IsKeyDown(TypesEnum.KeyCode.RightShift))
							traverse(if IsKeyDown then -1 else 1)
						end
					end,
					release = function()
						-- upvalues: Flag1 (ref), Flag2 (ref)
						Flag1 = false
						Flag2 = false
					end
				})
				p1.Host.InputContext({
					Name = "FacetTraversal",
					Parent = InputParent,
					Priority = 1500,
					Sink = true,
					Enabled = FormulaResult,
					p1.Host.InputAction({
						Name = "Traverse",
						Type = TypesEnum.InputActionType.Bool,
						Pressed = function()
							-- upvalues: Flag2 (ref), Flag1 (ref), UserInputService (copy), TypesEnum (upval), traverse (upval)
							if not Flag2 then
								Flag1 = true
								local IsKeyDown = UserInputService.IsKeyDown ~= nil and (UserInputService:IsKeyDown(TypesEnum.KeyCode.LeftShift) or UserInputService:IsKeyDown(TypesEnum.KeyCode.RightShift))
								traverse(if IsKeyDown then -1 else 1)
							end
						end,
						Released = function()
							-- upvalues: Flag1 (ref), Flag2 (ref)
							Flag1 = false
							Flag2 = false
						end,
						p1.Host.InputBinding({ KeyCode = TypesEnum.KeyCode.Tab })
					})
				})
			end
			return nil, nil
		end
	end)
	
	return {
		track = function(Key)
			-- upvalues: GuiService (copy), UserInputService (copy), self (copy), SharedResource (copy)
			if GuiService ~= nil or UserInputService ~= nil then
				self[Key] = true
				SharedResource()
				
				return
			end
		end,
		responder = function(Ancestor, p6)
			-- upvalues: Compose (copy), config (upval), CellResult (copy), GuiService (copy), p1 (copy), Config (copy), UserInputService (copy), Runtime (copy), TypesEnum (copy)
			assert(Compose.currentOwner() ~= nil, "Facet UI.responder must run inside a component or Compose owner")
			assert(Ancestor ~= nil and (Ancestor.IsA ~= nil and (Ancestor:IsA("GuiObject") or Ancestor:IsA("LayerCollector"))), "Facet UI.responder expects a GuiObject or a LayerCollector")
			local P31 = p6 or {}
			for i, value in P31 do
				assert(config[i] == true, `Facet UI.responder: unknown option '{tostring(i)}'`)
				assert(type(value) == "boolean", `Facet UI.responder: {tostring(i)} must be a boolean`)
			end
			local IsPassive = P31.passive ~= false
			local CellResult1 = Compose.cell(not IsPassive)
			
			if P31.traversalWrap == false then
				Ancestor:SetAttribute("FacetTraversalWrap", false)
			end
			if P31.gameplayGuard == false then
				Ancestor:SetAttribute("FacetGameplayGuard", false)
			end
			local config1 = {
				root = Ancestor,
				passive = IsPassive,
				engaged = CellResult1
			}
			local Copy = table.clone(CellResult:peek())
			table.insert(Copy, config1)
			CellResult:set(Copy)
			Compose.cleanup(function()
				-- upvalues: CellResult (upval), config1 (copy)
				local Copy = table.clone(CellResult:peek())
				local FoundIndex: number? = table.find(Copy, config1)
				
				if FoundIndex then
					table.remove(Copy, FoundIndex)
					CellResult:set(Copy)
				end
			end)
			
			local function _(Ancestor1)
				-- upvalues: Ancestor (copy)
				return Ancestor1 ~= nil and (Ancestor1 == Ancestor or Ancestor1:IsDescendantOf(Ancestor))
			end
			
			local function engage()
				-- upvalues: CellResult1 (copy)
				CellResult1:set(true)
			end
			
			local function resign()
				-- upvalues: IsPassive (copy), CellResult1 (copy), GuiService (upval), p1 (upval), Ancestor (copy)
				if not IsPassive then return end
				CellResult1:set(false)
				
				if GuiService then
					local GetResult = p1.selection.get()
					
					if GetResult ~= nil and (GetResult == Ancestor or GetResult:IsDescendantOf(Ancestor)) then
						p1.selection.set(nil)
					end
				end
			end
			
			local InputParent = Config.inputParent
			
			if InputParent == nil then
				local Players = Config.services.Players
				local LocalPlayer = if Players then Players.LocalPlayer else nil
				InputParent = if LocalPlayer then LocalPlayer:FindFirstChildOfClass("PlayerGui") else nil
			end
			if IsPassive and GuiService and GuiService.GetPropertyChangedSignal then
				local ObserveResult = p1.selection.observe()
				Compose.watch(function(Callback)
					-- upvalues: ObserveResult (copy), Ancestor (copy), CellResult1 (copy)
					local CallbackResult = Callback(ObserveResult)
					
					if CallbackResult == nil then return end
					if CallbackResult ~= nil and (CallbackResult == Ancestor or CallbackResult:IsDescendantOf(Ancestor)) then
						CellResult1:set(true)
						
						return
					end
					if CellResult1:peek() then
						CellResult1:set(false)
					end
				end)
				
				if UserInputService then
					Runtime.connect(UserInputService, "InputBegan", function(Input)
						-- upvalues: TypesEnum (upval), P31 (copy), CellResult1 (copy), Ancestor (copy), UserInputService (copy), p1 (upval), IsPassive (copy), GuiService (upval)
						local UserInputType = Input.UserInputType
						
						if UserInputType ~= TypesEnum.UserInputType.MouseButton1 and UserInputType ~= TypesEnum.UserInputType.Touch then return end
						if P31.engageOnPress == false and not CellResult1:peek() then return end
						local Ancestor1 = if Ancestor:IsA("LayerCollector") then Ancestor else Ancestor:FindFirstAncestorWhichIsA("LayerCollector")
						local BasePlayerGui = if Ancestor1 then Ancestor1:FindFirstAncestorWhichIsA("BasePlayerGui") or Ancestor1.Parent else nil
						local Success, Result = pcall(function()
							-- upvalues: BasePlayerGui (copy)
							return BasePlayerGui.GetGuiObjectsAtPosition
						end)
						
						if BasePlayerGui == nil or not Success or Result == nil then return end
						for _, value in BasePlayerGui:GetGuiObjectsAtPosition(Input.Position.X, Input.Position.Y) do
							if value ~= nil and (value == Ancestor or value:IsDescendantOf(Ancestor)) then
								CellResult1:set(true)
								local Parent = value
								while Parent and Parent ~= Ancestor.Parent do
									if UserInputType ~= TypesEnum.UserInputType.Touch and UserInputService.PreferredInput ~= TypesEnum.PreferredInput.Touch and Parent:IsA("GuiObject") and Parent.Selectable then
										p1.selection.set(Parent)
										break
									end
									Parent = Parent.Parent
								end
								return
							end
						end
						if CellResult1:peek() then
							if not IsPassive then return end
							CellResult1:set(false)
							
							if GuiService then
								local GetResult = p1.selection.get()
								
								if GetResult ~= nil and (GetResult == Ancestor or GetResult:IsDescendantOf(Ancestor)) then
									p1.selection.set(nil)
								end
							end
						end
					end)
				end
				if UserInputService and P31.resignOnActivate then
					Runtime.connect(UserInputService, "InputEnded", function(Input)
						-- upvalues: TypesEnum (upval), p1 (upval), Ancestor (copy), IsPassive (copy), CellResult1 (copy), GuiService (upval)
						if Input.KeyCode ~= TypesEnum.KeyCode.ButtonA then return end
						local GetResult = p1.selection.get()
						
						if GetResult == nil or (GetResult == nil or GetResult ~= Ancestor and not GetResult:IsDescendantOf(Ancestor) or not GetResult:IsA("GuiButton")) then return end
						local function settle()
							-- upvalues: p1 (upval), GetResult (copy), Ancestor (upval), IsPassive (upval), CellResult1 (upval), GuiService (upval)
							if p1.selection.get() == GetResult and p1.withinModal(Ancestor) then
								if not IsPassive then return end
								CellResult1:set(false)
								
								if GuiService then
									local GetResult1 = p1.selection.get()
									
									if GetResult1 ~= nil and (GetResult1 == Ancestor or GetResult1:IsDescendantOf(Ancestor)) then
										p1.selection.set(nil)
									end
								end
							end
						end
						
						if task and task.defer then
							task.defer(settle)
							
							return
						end
						if p1.selection.get() == GetResult and p1.withinModal(Ancestor) then
							if not IsPassive then return end
							CellResult1:set(false)
							
							if GuiService then
								local GetResult1 = p1.selection.get()
								
								if GetResult1 ~= nil and (GetResult1 == Ancestor or GetResult1:IsDescendantOf(Ancestor)) then
									p1.selection.set(nil)
								end
							end
						end
					end)
				end
				if InputParent then
					p1.Host.InputContext({
						Name = "FacetResponderCancel",
						Parent = InputParent,
						Priority = 30,
						Sink = false,
						Enabled = function(Callback)
							-- upvalues: CellResult1 (copy)
							return Callback(CellResult1)
						end,
						p1.Host.InputAction({
							Name = "Cancel",
							Type = TypesEnum.InputActionType.Bool,
							Pressed = resign,
							p1.Host.InputBinding({ KeyCode = TypesEnum.KeyCode.ButtonB }),
							p1.Host.InputBinding({ KeyCode = TypesEnum.KeyCode.Escape })
						})
					})
					
					if P31.gameplayGuard ~= false then
						p1.Host.InputContext({
							Name = "FacetGameplayGuard",
							Parent = InputParent,
							Priority = 3000,
							Sink = true,
							Enabled = function(Callback)
								-- upvalues: CellResult1 (copy)
								return Callback(CellResult1)
							end,
							p1.Host.InputAction({
								Name = "Guard",
								Type = TypesEnum.InputActionType.Bool,
								p1.Host.InputBinding({ KeyCode = TypesEnum.KeyCode.Space })
							})
						})
					end
				end
			end
			return table.freeze({
				state = Compose.formula(function(Callback): string
					-- upvalues: CellResult1 (copy)
					return if Callback(CellResult1) then "engaged" else "passive"
				end),
				engage = engage,
				resign = resign
			})
		end,
		spaceActivates = function(Parent)
			-- upvalues: NoKeyboardNavigation (copy)
			return function(): boolean
				-- upvalues: NoKeyboardNavigation (upval), Parent (copy)
				if not NoKeyboardNavigation then
					return false
				end
				local Parent1 = Parent
				while Parent1 do
					if Parent1:GetAttribute("FacetGameplayGuard") == false then
						return false
					end
					Parent1 = Parent1.Parent
				end
				return true
			end
		end
	}
end
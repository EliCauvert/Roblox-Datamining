local _ = require("./activation")
local _ = require("./collection_reorder")
local CollectionPolicyModule = require("./collection_policy")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local CollectionStateModule = require("./collection_state")

return function(p1, p2, p3, p4, Callback)
	-- upvalues: CollectionStateModule (copy), CollectionPolicyModule (copy)
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local ReadSourceFunction = p1.readSource
	local Observe = p1.observe
	local TypesEnum = p1.types.Enum
	local GuiService = p1.config.guiService
	local UserInputService = p1.config.userInputService
	local BelongsToFunction = CollectionStateModule.belongsTo
	local FindSelectableFunction = CollectionStateModule.findSelectable
	local Spec = p2.spec
	local Kind = p2.kind
	local KeyOfFunction = p2.keyOf
	local Tree = p2.tree
	local SourceFunction = p2.source
	local Viewport = p2.viewport
	local MountedVersion = p2.mountedVersion
	local Status = p2.status
	local Controls = p2.controls
	local Horizontal = p2.horizontal
	local FocusActive = p2.focusActive
	local NodeOfFunction = p2.nodeOf
	local Flag = false
	local FormulaResult = Compose.formula(function(Callback): string
		-- upvalues: MountedVersion (copy), p2 (copy), Status (copy), Controls (copy)
		Callback(MountedVersion)
		
		for _, value in p2.placed do
			Callback(value)
		end
		local CallbackResult = Callback(Status)
		
		if CallbackResult.total == 0 then
			return ""
		else
			local v1 = assert(Controls.placementOf)((math.max(1, CallbackResult.total or 1)))
			
			return table.concat({
				tostring(CallbackResult.extent), tostring(CallbackResult.rowCount),
				tostring(CallbackResult.total), tostring(v1.column), tostring(v1.crossSize),
				(tostring(v1.crossOffset))
			}, ":")
		end
	end)
	local FocusScope = Compose.createFocusScope({
		from = function(Callback)
			-- upvalues: FocusActive (copy), p2 (copy), Kind (copy), SourceFunction (copy), FormulaResult (copy), ReadFunction (copy), Spec (copy)
			if not Callback(FocusActive) then
				return p2.noFocusCandidates
			elseif Kind == "list" then
				return SourceFunction(Callback)
			else
				Callback(FormulaResult)
				Callback(p2.cross)
				Callback(p2.measured)
				ReadFunction(Spec.measured, Callback)
				ReadFunction(Spec.columns, Callback)
				ReadFunction(Spec.itemSize, Callback)
				ReadFunction(Spec.gap, Callback)
				
				return SourceFunction(Callback)
			end
		end,
		key = KeyOfFunction,
		disabled = function(Disabled)
			-- upvalues: Tree (copy), KeyOfFunction (copy), CollectionPolicyModule (upval), Spec (copy)
			return if Tree == nil then CollectionPolicyModule.disabled(Spec.disabled, Disabled) else not Tree.visible(KeyOfFunction(Disabled, 1)) or CollectionPolicyModule.disabled(Spec.disabled, Disabled)
		end,
		initial = Spec.initialFocus,
		autoFocus = Spec.autoFocus,
		wrap = Spec.wrapFocus,
		position = function(_, p5: number)
			-- upvalues: Kind (copy), Horizontal (copy), Status (copy), Controls (copy)
			if Kind == "list" then
				local v2 = if Horizontal then p5 else 0
				
				if Horizontal then
					return v2, 0
				else
					return v2, p5
				end
			else
				local PeekResult = Status:peek()
				
				if PeekResult == nil or PeekResult.total == nil or PeekResult.total == 0 then
					return 0, 0
				end
				local v3 = assert(Controls.placementOf)((math.min(p5, PeekResult.total)))
				local Offset = if Horizontal then v3.offset else v3.crossOffset
				
				if Horizontal then
					return Offset, v3.crossOffset
				else
					return Offset, v3.offset
				end
			end
		end
	})
	p2.scope = FocusScope
	local List = {}
	local t = {}
	local v2 = nil
	local v3 = nil
	
	local function liveKeys(p5)
		-- upvalues: KeyOfFunction (copy), CollectionPolicyModule (upval), Spec (copy)
		local List = {}
		local t = {}
		local P7 = p5 or {}
		for i, value in P7 do
			local KeyOfResult = KeyOfFunction(value, i)
			table.insert(List, KeyOfResult)
			
			if not CollectionPolicyModule.disabled(Spec.disabled, value) then
				t[KeyOfResult] = true
			end
		end
		return List, t
	end
	
	Compose.watch(function(p6)
		-- upvalues: SourceFunction (copy), liveKeys (copy), t (ref), List (ref), v2 (ref), v3 (ref)
		local SourceResult = SourceFunction(p6)
		local LiveKeysResult = liveKeys(SourceResult)
		t = List
		List = LiveKeysResult
		v2 = SourceResult
		v3 = nil
	end)
	
	local function _()
		-- upvalues: SourceFunction (copy)
		return SourceFunction(function(p6)
			return p6:peek()
		end)
	end
	
	local function neighbourOf(Value)
		-- upvalues: Tree (copy), SourceFunction (copy), v2 (ref), v3 (ref), List (ref), liveKeys (copy), t (ref)
		local AncestorResult = if Tree then Tree.ancestor(Value) else nil
		
		if AncestorResult ~= nil then
			return AncestorResult
		end
		local SourceResult = SourceFunction(function(p6)
			return p6:peek()
		end)
		
		if SourceResult == v2 then
			local v4 = v3
			
			if v4 == nil then
				local t1 = {}
				
				for _, value in List do
					t1[value] = true
				end
				v3 = t1
				v4 = t1
			end
			if assert(v4)[Value] then
				return nil
			end
		end
		local LiveKeysResult, LiveKeysResult2 = liveKeys(SourceResult)
		
		if table.find(LiveKeysResult, Value) then
			return nil
		end
		local List1 = if table.find(List, Value) then List else t
		local FoundIndex: number? = table.find(List1, Value)
		
		if FoundIndex == nil then
			return nil
		end
		for i = FoundIndex + 1, #List1 do
			if LiveKeysResult2[List1[i]] then
				return List1[i]
			end
		end
		for i1 = FoundIndex - 1, 1, -1 do
			if LiveKeysResult2[List1[i1]] then
				return List1[i1]
			end
		end
		return nil
	end
	
	local FocusPolicy = Spec.focusPolicy or "key"
	assert(FocusPolicy == "key" or FocusPolicy == "index", "Facet collection focusPolicy must be key or index")
	
	if FocusPolicy == "index" then
		local v5 = nil
		
		local _ = function(List, p6)
			-- upvalues: KeyOfFunction (copy)
			for i, value in List do
				if KeyOfFunction(value, i) == p6 then
					return i
				end
			end
			return nil
		end
		
		Compose.watch(function(Callback)
			-- upvalues: FocusScope (copy), v5 (ref), SourceFunction (copy), KeyOfFunction (copy)
			local CallbackResult = Callback(FocusScope.current)
			local v6 = nil
			
			if CallbackResult == nil then
				v6 = nil
			else
				v6 = nil
				
				for i, value in SourceFunction(function(p7)
					return p7:peek()
				end) do
					if KeyOfFunction(value, i) == CallbackResult then
						v6 = i
						break
					end
				end
			end
			v5 = v6
		end)
		Compose.watch(function(p7)
			-- upvalues: SourceFunction (copy), FocusScope (copy), v5 (ref), p3 (copy), KeyOfFunction (copy), CollectionPolicyModule (upval), Spec (copy)
			local SourceResult = SourceFunction(p7)
			local PeekResult = FocusScope.current:peek()
			local v7: number = v5
			
			if PeekResult ~= nil and v7 ~= nil and (not p3 or not p3.busy()) then
				local v8 = nil
				
				for i, value in SourceResult do
					if KeyOfFunction(value, i) == PeekResult then
						v8 = i
						break
					end
				end
				if v8 ~= v7 then
					local Smallest = math.min(v7, #SourceResult)
					
					if SourceResult[Smallest] ~= nil and not CollectionPolicyModule.disabled(Spec.disabled, SourceResult[Smallest]) then
						FocusScope.focus(KeyOfFunction(SourceResult[Smallest], Smallest))
					end
					return
				end
			end
		end)
	end
	local v7 = nil
	Compose.watch(function(Callback)
		-- upvalues: FocusScope (copy), v7 (ref), p2 (copy), neighbourOf (copy)
		local CallbackResult = Callback(FocusScope.current)
		local v8 = v7
		v7 = CallbackResult
		
		if v8 == nil or CallbackResult == v8 or not p2.focusOwned then return end
		local NeighbourOfResult = neighbourOf(v8)
		
		if NeighbourOfResult ~= nil and NeighbourOfResult ~= CallbackResult then
			FocusScope.focus(NeighbourOfResult)
		end
	end)
	
	if Spec.focus then
		Spec.focus.current = FocusScope.current
		Spec.focus.focus = FocusScope.focus
		Spec.focus.clear = FocusScope.clear
		Spec.focus.next = FocusScope.next
		Spec.focus.previous = FocusScope.previous
		Spec.focus.move = FocusScope.move
		Spec.focus.first = FocusScope.first
		Spec.focus.last = FocusScope.last
		Spec.focus.isFocused = FocusScope.isFocused
	end
	if Tree then
		Tree.bind(p4, FocusScope)
	end
	local ParentResult = Observe.Parent(p4)
	local AbsolutePositionResult = Observe.AbsolutePosition(p4)
	local AbsoluteSizeResult = Observe.AbsoluteSize(p4)
	
	local function restoreFocus(PeekResult)
		-- upvalues: GuiService (copy), Spec (copy), p4 (copy), p2 (copy), NodeOfFunction (copy), BelongsToFunction (copy), FindSelectableFunction (copy), CollectionPolicyModule (upval), Flag (ref), p1 (copy)
		if GuiService == nil or Spec.restoreFocus == false or p4.Parent == nil or not p2.focusOwned or PeekResult == nil or NodeOfFunction(PeekResult) == nil or not BelongsToFunction(NodeOfFunction(PeekResult), p4) then return end
		local Selectable = FindSelectableFunction(assert(NodeOfFunction(PeekResult)), p2.focusedPath, 1)
		
		if Selectable and CollectionPolicyModule.selectionVisible(Selectable) then
			Flag = true
			pcall(function()
				-- upvalues: p1 (upval), Selectable (copy)
				p1.selection.set(Selectable)
			end)
			Flag = false
		end
	end
	
	local FormulaResult1 = Compose.formula(function(Callback): boolean
		-- upvalues: Status (copy)
		return Callback(Status).total > 0
	end)
	Compose.watch(function(Callback1)
		-- upvalues: FocusScope (copy), FormulaResult1 (copy), p2 (copy), Compose (copy), Status (copy), Controls (copy), Viewport (copy), Callback (copy), restoreFocus (copy)
		local CallbackResult = Callback1(FocusScope.current)
		
		if CallbackResult == nil then return end
		Callback1(FormulaResult1)
		p2.focusOwned = true
		local ArmPagingFunction = p2.armPaging
		
		if ArmPagingFunction then
			Compose.sample(function(): boolean
				-- upvalues: ArmPagingFunction (copy)
				ArmPagingFunction()
				
				return true
			end)
		end
		local v8 = if Status:peek().total > 0 then assert(Controls.indexOfKey)(CallbackResult) else nil
		
		if v8 then
			local v9 = assert(Controls.placementOf)(v8)
			local PeekResult = Viewport:peek()
			
			if v9.offset < PeekResult.offset then
				Callback(assert(Controls.offsetOf)(v8, "start", PeekResult.size))
			elseif PeekResult.offset + PeekResult.size < v9.offset + v9.size then
				Callback(assert(Controls.offsetOf)(v8, "end", PeekResult.size))
			end
		end
		restoreFocus(CallbackResult)
	end)
	Compose.watch(function(Callback)
		-- upvalues: GuiService (copy), FocusActive (copy), MountedVersion (copy), ParentResult (copy), AbsolutePositionResult (copy), AbsoluteSizeResult (copy), restoreFocus (copy), FocusScope (copy)
		if GuiService ~= nil and Callback(FocusActive) then
			Callback(MountedVersion)
			Callback(ParentResult)
			Callback(AbsolutePositionResult)
			Callback(AbsoluteSizeResult)
			restoreFocus(FocusScope.current:peek())
			
			return
		end
	end)
	local ObserveResult = if GuiService then p1.selection.observe() else Compose.cell(nil)
	
	local function captureSelection(GetResult)
		-- upvalues: FocusActive (copy), p2 (copy), BelongsToFunction (copy), FocusScope (copy)
		FocusActive:set(true)
		
		for i, slotKey in p2.slotKeys do
			if BelongsToFunction(GetResult, i) then
				p2.focusOwned = true
				local FocusedPath = {}
				local Parent = GetResult
				while Parent and Parent ~= i do
					table.insert(FocusedPath, 1, Parent.Name)
					Parent = Parent.Parent
				end
				p2.focusedPath = FocusedPath
				FocusScope.focus(slotKey:peek())
				break
			end
		end
	end
	
	local SelectionGainedConnection = nil
	Compose.cleanup(p1.selection.changed(function()
		-- upvalues: SelectionGainedConnection (ref), p1 (copy), BelongsToFunction (copy), p4 (copy), captureSelection (copy)
		if SelectionGainedConnection then
			SelectionGainedConnection:Disconnect()
			SelectionGainedConnection = nil
		end
		local GetResult = p1.selection.get()
		
		if GetResult and BelongsToFunction(GetResult, p4) then
			SelectionGainedConnection = GetResult.SelectionGained:Connect(function()
				-- upvalues: captureSelection (upval), GetResult (copy)
				captureSelection(GetResult)
			end)
		end
	end))
	Compose.cleanup(function()
		-- upvalues: SelectionGainedConnection (ref)
		if SelectionGainedConnection then
			SelectionGainedConnection:Disconnect()
		end
	end)
	Compose.watch(function(Callback1)
		-- upvalues: ObserveResult (copy), BelongsToFunction (copy), p4 (copy), ReadFunction (copy), Spec (copy), Viewport (copy), Status (copy), p2 (copy), Controls (copy), Callback (copy)
		local CallbackResult = Callback1(ObserveResult)
		
		if CallbackResult == nil or not CallbackResult:IsA("TextBox") or not BelongsToFunction(CallbackResult, p4) or ReadFunction(Spec.ScrollingEnabled, Callback1) == false then return end
		local CallbackResult1 = Callback1(Viewport)
		
		if CallbackResult1.size <= 0 then return end
		Callback1(Status)
		local PeekResult = nil
		
		for i, slotKey in p2.slotKeys do
			PeekResult = slotKey:peek()
			
			if CallbackResult:IsDescendantOf(i) then
				local v8 = assert(Controls.indexOfKey)(PeekResult)
				local v9 = v8 and assert(Controls.placementOf)(v8)
				
				if v9 and v9.offset < CallbackResult1.offset then
					Callback(v9.offset)
					break
				end
				if not v9 or CallbackResult1.offset + CallbackResult1.size >= v9.offset + v9.size then break end
				Callback((math.max(v9.offset, v9.offset + v9.size - CallbackResult1.size)))
				break
			end
		end
	end)
	
	local function renameAction(p7)
		-- upvalues: ReadSourceFunction (copy), ObserveResult (copy), BelongsToFunction (copy), p4 (copy), FocusActive (copy), p3 (copy), UserInputService (copy), MountedVersion (copy), p2 (copy), FocusScope (copy)
		local Source = ReadSourceFunction(ObserveResult, p7)
		
		if Source and not BelongsToFunction(Source, p4) or (not ReadSourceFunction(FocusActive, p7) or p3 and p3.busy()) or UserInputService and UserInputService.GetFocusedTextBox and UserInputService:GetFocusedTextBox() then
			return nil
		end
		ReadSourceFunction(MountedVersion, p7)
		local v10 = nil
		
		for i in ReadSourceFunction(p2.selection, p7) do
			if v10 ~= nil then
				return nil
			end
			v10 = i
		end
		local V87 = v10 or ReadSourceFunction(FocusScope.current, p7)
		local CellEdit = if V87 == nil then nil else p2.cellEdits[V87]
		
		if CellEdit then
			for _, value in CellEdit do
				if value.enabled(p7) then
					return value
				end
			end
		end
		return nil
	end
	
	p1.action(p4, "RenameCell", { TypesEnum.KeyCode.F2 }, function(p8): boolean
		-- upvalues: renameAction (copy)
		return renameAction(p8) ~= nil
	end, function()
		-- upvalues: renameAction (copy)
		local RenameActionResult = renameAction()
		
		if RenameActionResult then
			RenameActionResult.onActivate()
		end
	end)
	Compose.watch(function(Callback)
		-- upvalues: ObserveResult (copy), Flag (ref), BelongsToFunction (copy), p4 (copy), FocusActive (copy), p2 (copy), neighbourOf (copy), FocusScope (copy), restoreFocus (copy), v7 (ref), NodeOfFunction (copy)
		local CallbackResult = Callback(ObserveResult)
		
		if CallbackResult and not Flag then
			if BelongsToFunction(CallbackResult, p4) then
				FocusActive:set(true)
				local PeekResult = nil
				
				for i, slotKey in p2.slotKeys do
					PeekResult = slotKey:peek()
					
					if BelongsToFunction(CallbackResult, i) then
						local NeighbourOfResult1 = neighbourOf(PeekResult)
						
						if NeighbourOfResult1 ~= nil then
							p2.focusOwned = true
							FocusScope.focus(NeighbourOfResult1)
							restoreFocus(NeighbourOfResult1)
							break
						end
					else
						continue
					end
				end
				return
			else
				local V33 = v7 or FocusScope.current:peek()
				local NeighbourOfResult = if p2.focusOwned and V33 ~= nil then neighbourOf(V33) else nil
				
				if NeighbourOfResult == nil or not NodeOfFunction(NeighbourOfResult) then
					p2.focusOwned = false
				else
					FocusScope.focus(NeighbourOfResult)
					restoreFocus(NeighbourOfResult)
					
					return
				end
			end
		end
	end)
	Compose.watch(function(Callback)
		-- upvalues: GuiService (copy), ObserveResult (copy), p4 (copy), MountedVersion (copy), FocusScope (copy), NodeOfFunction (copy), FindSelectableFunction (copy), ReadFunction (copy), Spec (copy), KeyOfFunction (copy), CollectionPolicyModule (upval), p1 (copy)
		if GuiService == nil or Callback(ObserveResult) ~= p4 then return end
		Callback(MountedVersion)
		local v11 = nil
		local PeekResult = FocusScope.current:peek()
		
		if PeekResult ~= nil and NodeOfFunction(PeekResult) then
			v11 = FindSelectableFunction(assert(NodeOfFunction(PeekResult)), nil, 1)
		end
		if v11 == nil then
			for i, value in ReadFunction(Spec.from) do
				local KeyOfResult = KeyOfFunction(value, i)
				
				if NodeOfFunction(KeyOfResult) and not CollectionPolicyModule.disabled(Spec.disabled, value) then
					v11 = FindSelectableFunction(assert(NodeOfFunction(KeyOfResult)), nil, 1)
					
					if v11 then break end
				else
					continue
				end
			end
		end
		if v11 and CollectionPolicyModule.selectionVisible(v11) then
			p1.selection.set(v11)
		end
	end)
	
	return FocusScope, function(p8): boolean
		-- upvalues: ReadSourceFunction (copy), ObserveResult (copy), BelongsToFunction (copy), p4 (copy), p1 (copy)
		local Source = ReadSourceFunction(ObserveResult, p8)
		
		if Source == nil or not BelongsToFunction(Source, p4) then
			return false
		else
			local UserInputService = p1.config.userInputService
			
			return not (UserInputService and UserInputService:GetFocusedTextBox()) and not (Source:IsA("TextBox") and Source:IsFocused())
		end
	end
end
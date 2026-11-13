local CoreModule = require("../core")
local _ = require("./types")
local DocumentModule = require("./document")
local HistoryModule = require("./history")

return function(Library, p1)
	-- upvalues: CoreModule (copy), HistoryModule (copy), DocumentModule (copy)
	local CurrentOwnerResult = CoreModule.currentOwner()
	local Reactor = if CurrentOwnerResult and CurrentOwnerResult.reactor then CurrentOwnerResult.reactor else CoreModule.reactor.create()
	local t = {}
	local HistoryModuleResult = HistoryModule(DocumentModule.validate(p1, Library))
	local CellResult = CoreModule.cell(HistoryModuleResult.current())
	local CellResult1 = CoreModule.cell(p1.root.id)
	local CellResult2 = CoreModule.cell({ p1.root.id })
	local Id = p1.root.id
	local List = {}
	local List1 = {}
	local CellResult3 = CoreModule.cell(nil)
	local CellResult4 = CoreModule.cell(false)
	local CellResult5 = CoreModule.cell(false)
	
	local function choose(List, Value)
		-- upvalues: DocumentModule (upval), HistoryModuleResult (copy), CoreModule (upval), Reactor (copy), CellResult2 (copy), CellResult1 (copy)
		local List1 = {}
		
		for _, value in DocumentModule.nodes(HistoryModuleResult.current().root) do
			if table.find(List, value.node.id) then
				table.insert(List1, value.node.id)
			end
		end
		CoreModule.reactor.batch(Reactor, function()
			-- upvalues: CellResult2 (upval), List1 (copy), CellResult1 (upval), Value (copy)
			CellResult2:set(List1)
			CellResult1:set(if Value and table.find(List1, Value) then Value else List1[#List1] or "")
		end)
	end
	
	local function publish()
		-- upvalues: CellResult (copy), HistoryModuleResult (copy), CellResult4 (copy), CellResult5 (copy), choose (copy), CellResult2 (copy), CellResult1 (copy)
		CellResult:set(HistoryModuleResult.current())
		CellResult4:set(HistoryModuleResult.canUndo())
		CellResult5:set(HistoryModuleResult.canRedo())
		choose(CellResult2:peek(), CellResult1:peek())
	end
	
	local function _(p2)
		-- upvalues: CellResult2 (copy)
		local Ids = {}
		
		local function visit(Root)
			-- upvalues: CellResult2 (upval), Ids (copy), visit (copy)
			if table.find(CellResult2:peek(), Root.id) then
				table.insert(Ids, Root.id)
				
				return
			end
			for _, child in Root.children do
				visit(child)
			end
		end
		
		visit(p2.root)
		
		return Ids
	end
	
	local function attempt(p3): boolean
		-- upvalues: HistoryModuleResult (copy), CellResult1 (copy), CellResult3 (copy), List (copy), CellResult2 (copy), List1 (copy), CoreModule (upval), Reactor (copy), choose (copy), publish (copy)
		local Success, Result, Result3 = pcall(p3, HistoryModuleResult.current(), CellResult1:peek())
		
		if not Success then
			CellResult3:set((tostring(Result)))
			
			return false
		end
		CellResult3:set(nil)
		table.insert(List, table.clone(CellResult2:peek()))
		
		if #List > 100 then
			table.remove(List, 1)
		end
		table.clear(List1)
		CoreModule.reactor.batch(Reactor, function()
			-- upvalues: HistoryModuleResult (upval), Result (copy), Result3 (copy), choose (upval), publish (upval)
			HistoryModuleResult.commit(Result)
			
			if Result3 then
				choose(Result3, nil)
			end
			publish()
		end)
		
		return true
	end
	
	local _ = function(p3)
		-- upvalues: attempt (copy), CellResult2 (copy)
		return (attempt(function(p4)
			-- upvalues: CellResult2 (upval), p3 (copy)
			assert(#CellResult2:peek() > 0, "Choose a node")
			local v1 = p4
			
			for _, value in CellResult2:peek() do
				v1 = p3(v1, value)
			end
			return v1, nil
		end))
	end
	
	local _ = function(p4, p5)
		-- upvalues: DocumentModule (upval)
		local FindResult, FindResult2, FindResult3 = DocumentModule.find(p4.root, p5)
		assert(FindResult and (FindResult2 and FindResult3), "The root cannot move or be removed")
		table.remove(FindResult2.children, FindResult3)
		
		return FindResult
	end
	
	local function twins(CopyResult, List)
		-- upvalues: DocumentModule (upval)
		local CopyNodeResults = {}
		local Ids = {}
		
		for _, value in List do
			local CopyNodeResult = DocumentModule.copyNode(value)
			
			for _, value1 in DocumentModule.nodes(CopyNodeResult) do
				local Text: string = `n{CopyResult.nextId}`
				CopyResult.nextId += 1
				Ids[value1.node.id] = Text
				value1.node.id = Text
			end
			table.insert(CopyNodeResults, CopyNodeResult)
		end
		local function remapLiteral(Literal)
			-- upvalues: Ids (copy), remapLiteral (copy)
			if type(Literal) == "table" then
				local Template = Literal["$template"]
				
				if type(Template) == "string" and Ids[Template] then
					Literal["$template"] = Ids[Template]
				end
				for _, value in Literal do
					remapLiteral(value)
				end
			end
		end
		
		for _, copyNodeResult in CopyNodeResults do
			for _, value2 in DocumentModule.nodes(copyNodeResult) do
				local Bind = value2.node.bind
				
				if Bind and Bind.row then
					Bind.row = Ids[Bind.row] or Bind.row
				end
				for _, prop in value2.node.props do
					local Node = prop.node
					
					if Node and Ids[Node] then
						prop.node = Ids[Node]
					end
					if prop.nodes then
						for i, node in prop.nodes do
							prop.nodes[i] = Ids[node] or node
						end
					end
					if prop.literal ~= nil then
						remapLiteral(prop.literal)
					end
				end
			end
		end
		return CopyNodeResults
	end
	
	local v1 = nil
	v1 = {
		library = Library,
		document = CellResult,
		selected = CellResult1,
		selection = CellResult2,
		hovered = CoreModule.cell(nil),
		problem = CellResult3,
		canUndo = CellResult4,
		canRedo = CellResult5,
		selectMany = function(p4)
			-- upvalues: choose (copy), Id (ref), CellResult1 (copy)
			choose(p4, nil)
			Id = CellResult1:peek()
		end,
		select = function(Value, p4)
			-- upvalues: HistoryModuleResult (copy), DocumentModule (upval), Id (ref), choose (copy), CellResult2 (copy)
			local CurrentResult = HistoryModuleResult.current()
			local FindResult, FindResult2, FindResult3 = DocumentModule.find(CurrentResult.root, Value)
			
			if FindResult == nil then return end
			if p4 == "range" then
				local _, FindResult2_1, FindResult3_1 = DocumentModule.find(CurrentResult.root, Id)
				
				if FindResult2 and FindResult2_1 == FindResult2 and FindResult3_1 and FindResult3 then
					local Ids = {}
					
					for i = math.min(FindResult3_1, FindResult3), math.max(FindResult3_1, FindResult3) do
						table.insert(Ids, FindResult2.children[i].id)
					end
					choose(Ids, Value)
					
					return
				end
			end
			if p4 == "toggle" or p4 == "range" then
				local Copy = table.clone(CellResult2:peek())
				local FoundIndex: number? = table.find(Copy, Value)
				
				if FoundIndex then
					table.remove(Copy, FoundIndex)
				else
					table.insert(Copy, Value)
				end
				choose(Copy, Value)
			else
				choose({ Value }, Value)
			end
			Id = Value
		end,
		selectRelative = function(p5)
			-- upvalues: DocumentModule (upval), HistoryModuleResult (copy), CellResult1 (copy), v1 (ref)
			local FindResult, FindResult2, FindResult3 = DocumentModule.find(HistoryModuleResult.current().root, CellResult1:peek())
			
			if FindResult == nil then return end
			if p5 == "parent" and FindResult2 then
				v1.select(FindResult2.id)
				
				return
			end
			if p5 == "child" and FindResult.children[1] then
				v1.select(FindResult.children[1].id)
				
				return
			end
			if FindResult2 and FindResult3 and (p5 == "next" or p5 == "previous") then
				v1.select(FindResult2.children[(FindResult3 - 1 + (if p5 == "next" then 1 else -1)) % #FindResult2.children + 1].id)
			end
		end,
		insert = function(p5)
			-- upvalues: attempt (copy), DocumentModule (upval), Library (copy)
			return (attempt(function(p6, p7)
				-- upvalues: DocumentModule (upval), Library (upval), p5 (copy)
				local FindResult, FindResult2, FindResult3 = DocumentModule.find(p6.root, p7)
				
				if not FindResult then
					FindResult = p6.root
				end
				local v2 = assert(Library.kinds[FindResult.kind])
				local InsertResult2 = nil
				local InsertResult = nil
				
				if FindResult2 and FindResult3 and (v2.children == "none" or v2.leaf == true) then
					InsertResult, InsertResult2 = DocumentModule.insert(p6, Library, FindResult2.id, p5, FindResult3 + 1)
				else
					InsertResult, InsertResult2 = DocumentModule.insert(p6, Library, FindResult.id, p5)
				end
				return InsertResult, { InsertResult2 }
			end))
		end,
		change = function(ChangeResult, Callback)
			-- upvalues: DocumentModule (upval), Library (copy), attempt (copy), CellResult2 (copy)
			local function v62(p5, p6)
				-- upvalues: DocumentModule (upval), Callback (copy), Library (upval), ChangeResult (copy)
				local ChooseANode = assert(DocumentModule.find(p5.root, p6), "Choose a node")
				
				return DocumentModule.change(p5, Library, p6, ChangeResult, if type(Callback) == "function" then Callback(ChooseANode) else Callback)
			end
			
			return (attempt(function(p5)
				-- upvalues: CellResult2 (upval), v62 (copy)
				assert(#CellResult2:peek() > 0, "Choose a node")
				local v2 = p5
				
				for _, value in CellResult2:peek() do
					v2 = v62(v2, value)
				end
				return v2, nil
			end))
		end,
		changeMany = function(p5)
			-- upvalues: DocumentModule (upval), Library (copy), attempt (copy), CellResult2 (copy)
			local function v64(ChangeResult, p6)
				-- upvalues: p5 (copy), DocumentModule (upval), Library (upval)
				local ChangeResult1 = ChangeResult
				
				for i, value in p5 do
					ChangeResult1 = DocumentModule.change(ChangeResult1, Library, p6, i, value)
				end
				return ChangeResult1
			end
			
			return (attempt(function(p7)
				-- upvalues: CellResult2 (upval), v64 (copy)
				assert(#CellResult2:peek() > 0, "Choose a node")
				local v2 = p7
				
				for _, value in CellResult2:peek() do
					v2 = v64(v2, value)
				end
				return v2, nil
			end))
		end,
		content = function(p7, Library1)
			-- upvalues: attempt (copy), DocumentModule (upval), Library (copy)
			return (attempt(function(p8, p9)
				-- upvalues: DocumentModule (upval), Library (upval), p7 (copy), Library1 (copy)
				local ContentResult, ContentResult2 = DocumentModule.content(p8, Library, p9, p7, Library1)
				
				return ContentResult, { ContentResult2 }
			end))
		end,
		tag = function(p7)
			-- upvalues: DocumentModule (upval), Library (copy), attempt (copy), CellResult2 (copy)
			local function v68(p8, p9)
				-- upvalues: DocumentModule (upval), Library (upval), p7 (copy)
				return DocumentModule.tag(p8, Library, p9, p7)
			end
			
			return (attempt(function(p8)
				-- upvalues: CellResult2 (upval), v68 (copy)
				assert(#CellResult2:peek() > 0, "Choose a node")
				local v2 = p8
				
				for _, value in CellResult2:peek() do
					v2 = v68(v2, value)
				end
				return v2, nil
			end))
		end,
		rename = function(p8)
			-- upvalues: DocumentModule (upval), Library (copy), attempt (copy), CellResult2 (copy)
			local function v69(p9, p10)
				-- upvalues: DocumentModule (upval), Library (upval), p8 (copy)
				return DocumentModule.rename(p9, Library, p10, p8)
			end
			
			return (attempt(function(p9)
				-- upvalues: CellResult2 (upval), v69 (copy)
				assert(#CellResult2:peek() > 0, "Choose a node")
				local v2 = p9
				
				for _, value in CellResult2:peek() do
					v2 = v69(v2, value)
				end
				return v2, nil
			end))
		end,
		bind = function(p9)
			-- upvalues: DocumentModule (upval), Library (copy), attempt (copy), CellResult2 (copy)
			local function v70(p10, p11)
				-- upvalues: DocumentModule (upval), Library (upval), p9 (copy)
				return DocumentModule.bind(p10, Library, p11, p9)
			end
			
			return (attempt(function(p10)
				-- upvalues: CellResult2 (upval), v70 (copy)
				assert(#CellResult2:peek() > 0, "Choose a node")
				local v2 = p10
				
				for _, value in CellResult2:peek() do
					v2 = v70(v2, value)
				end
				return v2, nil
			end))
		end,
		move = function(Value, p10, p11)
			-- upvalues: attempt (copy), CellResult2 (copy), DocumentModule (upval), Library (copy)
			return (attempt(function(p12)
				-- upvalues: CellResult2 (upval), Value (copy), DocumentModule (upval), p10 (copy), p11 (copy), Library (upval)
				local t = nil
				if table.find(CellResult2:peek(), Value) then
					t = {}
					
					local function visit(Root)
						-- upvalues: CellResult2 (upval), t (copy), visit (copy)
						if table.find(CellResult2:peek(), Root.id) then
							table.insert(t, Root.id)
							
							return
						end
						for _, child in Root.children do
							visit(child)
						end
					end
					
					visit(p12.root)
				else
					t = { Value }
				end
				local CopyResult = DocumentModule.copy(p12)
				local ChooseAContainer = assert(DocumentModule.find(CopyResult.root, p10), "Choose a container")
				local List = {}
				
				for _, value in t do
					assert(DocumentModule.find(assert(DocumentModule.find(CopyResult.root, value), "Choose a node"), p10) == nil, "A node cannot move into itself")
					local FindResult, FindResult2, FindResult3 = DocumentModule.find(CopyResult.root, value)
					assert(FindResult and (FindResult2 and FindResult3), "The root cannot move or be removed")
					table.remove(FindResult2.children, FindResult3)
					table.insert(List, FindResult)
				end
				local ClampedValue = math.clamp(p11 or #ChooseAContainer.children + 1, 1, #ChooseAContainer.children + 1)
				
				for i, value1 in List do
					table.insert(ChooseAContainer.children, ClampedValue + i - 1, value1)
				end
				return DocumentModule.validate(CopyResult, Library), t
			end))
		end,
		remove = function()
			-- upvalues: attempt (copy), CellResult2 (copy), DocumentModule (upval), Library (copy)
			return (attempt(function(p13)
				-- upvalues: CellResult2 (upval), DocumentModule (upval), Library (upval)
				local Ids = {}
				
				local function visit(Root)
					-- upvalues: CellResult2 (upval), Ids (copy), visit (copy)
					if table.find(CellResult2:peek(), Root.id) then
						table.insert(Ids, Root.id)
						
						return
					end
					for _, child in Root.children do
						visit(child)
					end
				end
				
				visit(p13.root)
				assert(#Ids > 0, "Choose a node")
				local _, FindResult2 = DocumentModule.find(p13.root, Ids[1])
				local CopyResult = DocumentModule.copy(p13)
				
				for _, id in Ids do
					local FindResult, FindResult2_1, FindResult3 = DocumentModule.find(CopyResult.root, id)
					
					if FindResult then
						FindResult = FindResult2_1 and FindResult3
					end
					assert(FindResult, "The root cannot move or be removed")
					table.remove(FindResult2_1.children, FindResult3)
				end
				local ValidateResult = DocumentModule.validate(CopyResult, Library)
				
				if FindResult2 then
					return ValidateResult, { FindResult2.id }
				else
					return ValidateResult, {}
				end
			end))
		end,
		duplicate = function()
			-- upvalues: attempt (copy), CellResult2 (copy), DocumentModule (upval), twins (copy), Library (copy)
			return (attempt(function(p14)
				-- upvalues: CellResult2 (upval), DocumentModule (upval), twins (upval), Library (upval)
				local Ids = {}
				
				local function visit(Root)
					-- upvalues: CellResult2 (upval), Ids (copy), visit (copy)
					if table.find(CellResult2:peek(), Root.id) then
						table.insert(Ids, Root.id)
						
						return
					end
					for _, child in Root.children do
						visit(child)
					end
				end
				
				visit(p14.root)
				assert(#Ids > 0, "Choose a node")
				local List = {}
				
				for _, id in Ids do
					local FindResult, FindResult2 = DocumentModule.find(p14.root, id)
					assert(FindResult and FindResult2, "The root cannot be duplicated")
					table.insert(List, FindResult)
				end
				local CopyResult = DocumentModule.copy(p14)
				local Ids1 = {}
				
				for i, value in twins(CopyResult, List) do
					local _, FindResult2_1, FindResult3 = DocumentModule.find(CopyResult.root, Ids[i])
					assert(FindResult2_1 and FindResult3)
					table.insert(FindResult2_1.children, FindResult3 + 1, value)
					table.insert(Ids1, value.id)
				end
				return DocumentModule.validate(CopyResult, Library), Ids1
			end))
		end,
		copy = function(): boolean
			-- upvalues: HistoryModuleResult (copy), CellResult2 (copy), DocumentModule (upval), t (ref)
			local CopyNodeResults = {}
			local Ids = {}
			
			local function visit(Root)
				-- upvalues: CellResult2 (upval), Ids (copy), visit (copy)
				if table.find(CellResult2:peek(), Root.id) then
					table.insert(Ids, Root.id)
					
					return
				end
				for _, child in Root.children do
					visit(child)
				end
			end
			
			visit(HistoryModuleResult.current().root)
			
			for _, id in Ids do
				local FindResult, FindResult2 = DocumentModule.find(HistoryModuleResult.current().root, id)
				
				if FindResult == nil or FindResult2 == nil then
					return false
				end
				table.insert(CopyNodeResults, DocumentModule.copyNode(FindResult))
			end
			if #CopyNodeResults == 0 then
				return false
			else
				t = CopyNodeResults
				
				return true
			end
		end,
		paste = function()
			-- upvalues: t (ref), attempt (copy), DocumentModule (upval), Library (copy), twins (copy)
			return #t ~= 0 and attempt(function(p15, p16)
				-- upvalues: DocumentModule (upval), Library (upval), twins (upval), t (upval)
				local CopyResult = DocumentModule.copy(p15)
				local FindResult, FindResult2, FindResult3 = DocumentModule.find(CopyResult.root, p16)
				
				if not FindResult then
					FindResult = CopyResult.root
				end
				local Kind = Library.kinds[FindResult.kind]
				local v2 = #FindResult.children + 1
				
				if FindResult2 and FindResult3 and (Kind.children ~= "list" or Kind.leaf == true) then
					FindResult = FindResult2
					v2 = FindResult3 + 1
				end
				local Ids = {}
				
				for i, value in twins(CopyResult, t) do
					table.insert(FindResult.children, v2 + i - 1, value)
					table.insert(Ids, value.id)
				end
				return DocumentModule.validate(CopyResult, Library), Ids
			end)
		end,
		shift = function(Value)
			-- upvalues: attempt (copy), CellResult2 (copy), DocumentModule (upval), Library (copy)
			return (attempt(function(p15)
				-- upvalues: CellResult2 (upval), Value (copy), DocumentModule (upval), Library (upval)
				local List = {}
				
				local function visit(Root)
					-- upvalues: CellResult2 (upval), List (copy), visit (copy)
					if table.find(CellResult2:peek(), Root.id) then
						table.insert(List, Root.id)
						
						return
					end
					for _, child in Root.children do
						visit(child)
					end
				end
				
				visit(p15.root)
				assert(#List > 0, "Choose a node")
				assert(Value % 1 == 0 and Value ~= 0, "Choose a nonzero integer step")
				local CopyResult = DocumentModule.copy(p15)
				
				for _, value in List do
					local _, FindResult2 = DocumentModule.find(CopyResult.root, value)
					assert(FindResult2, "The root cannot move")
				end
				local Flag = false
				
				for _ = 1, math.abs(Value) do
					for _, value1 in DocumentModule.nodes(CopyResult.root) do
						local Children = value1.node.children
						
						for i = 1, #Children do
							local I: number = if Value < 0 then i else #Children + 1 - i
							local NewI = I + (if Value < 0 then -1 else 1)
							
							if Children[NewI] and table.find(List, Children[I].id) and not table.find(List, Children[NewI].id) then
								local Child = Children[I]
								Children[I] = Children[NewI]
								Children[NewI] = Child
								Flag = true
							end
						end
					end
				end
				assert(Flag, "The selection is already at the edge")
				
				return DocumentModule.validate(CopyResult, Library), nil
			end))
		end,
		wrap = function()
			-- upvalues: attempt (copy), CellResult2 (copy), DocumentModule (upval), Library (copy)
			return (attempt(function(p16)
				-- upvalues: CellResult2 (upval), DocumentModule (upval), Library (upval)
				local Ids = {}
				
				local function visit(Root)
					-- upvalues: CellResult2 (upval), Ids (copy), visit (copy)
					if table.find(CellResult2:peek(), Root.id) then
						table.insert(Ids, Root.id)
						
						return
					end
					for _, child in Root.children do
						visit(child)
					end
				end
				
				visit(p16.root)
				assert(#Ids > 0, "Choose siblings to wrap")
				local _, FindResult2, FindResult3 = DocumentModule.find(p16.root, Ids[1])
				assert(FindResult2 and FindResult3, "The root cannot be wrapped")
				
				for _, id in Ids do
					local _, FindResult2_1 = DocumentModule.find(p16.root, id)
					assert(FindResult2_1 == FindResult2, "Choose siblings to wrap")
				end
				local ContainerKind = Library.containerKind or p16.root.kind
				assert(Library.kinds[ContainerKind].children == "list" and Library.kinds[ContainerKind].leaf ~= true, "Choose a default list container")
				local InsertResult, InsertResult2 = DocumentModule.insert(p16, Library, FindResult2.id, ContainerKind, FindResult3)
				local ChooseAContainer = assert(DocumentModule.find(InsertResult.root, InsertResult2), "Choose a container")
				table.clear(ChooseAContainer.children)
				
				for _, id1 in Ids do
					local Children = ChooseAContainer.children
					local FindResult, FindResult2_2, FindResult3_1 = DocumentModule.find(InsertResult.root, id1)
					assert(FindResult and (FindResult2_2 and FindResult3_1), "The root cannot move or be removed")
					table.remove(FindResult2_2.children, FindResult3_1)
					table.insert(Children, FindResult)
				end
				return DocumentModule.validate(InsertResult, Library), { InsertResult2 }
			end))
		end,
		unwrap = function()
			-- upvalues: attempt (copy), CellResult2 (copy), DocumentModule (upval), Library (copy)
			return (attempt(function(p17)
				-- upvalues: CellResult2 (upval), DocumentModule (upval), Library (upval)
				local Ids = {}
				
				local function visit(Root)
					-- upvalues: CellResult2 (upval), Ids (copy), visit (copy)
					if table.find(CellResult2:peek(), Root.id) then
						table.insert(Ids, Root.id)
						
						return
					end
					for _, child in Root.children do
						visit(child)
					end
				end
				
				visit(p17.root)
				assert(#Ids > 0, "Choose a container")
				local CopyResult = DocumentModule.copy(p17)
				local Ids1 = {}
				
				for _, id in Ids do
					local FindResult, FindResult2, FindResult3 = DocumentModule.find(CopyResult.root, id)
					assert(FindResult and (FindResult2 and FindResult3), "The root cannot be unwrapped")
					assert(Library.kinds[FindResult.kind].children == "list", "Choose a list container")
					table.remove(FindResult2.children, FindResult3)
					
					for i, child in FindResult.children do
						table.insert(FindResult2.children, FindResult3 + i - 1, child)
						table.insert(Ids1, child.id)
					end
				end
				return DocumentModule.validate(CopyResult, Library), Ids1
			end))
		end,
		hide = function(p18, p19)
			-- upvalues: attempt (copy), DocumentModule (upval), Library (copy)
			return (attempt(function(p20)
				-- upvalues: DocumentModule (upval), p18 (copy), p19 (copy), Library (upval)
				local CopyResult = DocumentModule.copy(p20)
				assert(DocumentModule.find(CopyResult.root, p18), "Choose a node").hidden = if p19 then true else nil
				
				return DocumentModule.validate(CopyResult, Library), nil
			end))
		end,
		lock = function(p18, p19)
			-- upvalues: attempt (copy), DocumentModule (upval), Library (copy)
			return (attempt(function(p20)
				-- upvalues: DocumentModule (upval), p18 (copy), p19 (copy), Library (upval)
				local CopyResult = DocumentModule.copy(p20)
				assert(DocumentModule.find(CopyResult.root, p18), "Choose a node").locked = if p19 then true else nil
				
				return DocumentModule.validate(CopyResult, Library), nil
			end))
		end,
		setContract = function(p18)
			-- upvalues: attempt (copy), DocumentModule (upval), Library (copy)
			return (attempt(function(p19)
				-- upvalues: DocumentModule (upval), Library (upval), p18 (copy)
				return DocumentModule.setContract(p19, Library, p18), nil
			end))
		end,
		replace = function(p18)
			-- upvalues: attempt (copy), DocumentModule (upval), Library (copy)
			return (attempt(function()
				-- upvalues: DocumentModule (upval), p18 (copy), Library (upval)
				return DocumentModule.validate(p18, Library), { p18.root.id }
			end))
		end,
		undo = function(): boolean
			-- upvalues: HistoryModuleResult (copy), List1 (copy), CellResult2 (copy), CoreModule (upval), Reactor (copy), choose (copy), List (copy), publish (copy)
			if HistoryModuleResult.undo() then
				table.insert(List1, table.clone(CellResult2:peek()))
				CoreModule.reactor.batch(Reactor, function()
					-- upvalues: choose (upval), List (upval), publish (upval)
					choose(assert(table.remove(List)), nil)
					publish()
				end)
				
				return true
			else
				return false
			end
		end,
		redo = function(): boolean
			-- upvalues: HistoryModuleResult (copy), List (copy), CellResult2 (copy), CoreModule (upval), Reactor (copy), choose (copy), List1 (copy), publish (copy)
			if HistoryModuleResult.redo() then
				table.insert(List, table.clone(CellResult2:peek()))
				CoreModule.reactor.batch(Reactor, function()
					-- upvalues: choose (upval), List1 (upval), publish (upval)
					choose(assert(table.remove(List1)), nil)
					publish()
				end)
				
				return true
			else
				return false
			end
		end
	}
	
	return v1
end
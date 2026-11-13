local CoreModule = require("../core")
local _ = require("./types")
local DocumentModule = require("./document")
local DatatypeModule = require("./datatype")
local ImportsModule = require("./imports")

local function _(p1, p2)
	-- upvalues: CoreModule (copy)
	return CoreModule.formula(function(Callback)
		-- upvalues: p1 (copy), p2 (copy)
		return Callback(p1)[p2]
	end)
end

local function rowsOf(Literal)
	local List = {}
	
	if type(Literal) == "table" then
		for _, value in Literal do
			if type(value) == "table" then
				table.insert(List, value)
			end
		end
	end
	return List
end

local _ = nil

local function v8(Tbl, Library, p1)
	-- upvalues: DocumentModule (copy), CoreModule (copy), rowsOf (copy), DatatypeModule (copy), ImportsModule (copy), v8 (ref)
	local Inputs = if p1 and p1.inputs then p1.inputs else {}
	local Bindings = if p1 and p1.bindings then p1.bindings else {}
	local RootVariant = Tbl.rootVariant
	
	if RootVariant then
		local v1 = assert(DocumentModule.input(Tbl, RootVariant.input))
		local Binding = Bindings[RootVariant.input]
		assert(Binding == nil or Binding.readable == nil, "A root variant needs a static enum binding")
		local Value = if Binding then Binding.value or Binding.literal else Inputs[RootVariant.input] or v1.preview
		assert(type(Value) == "string" and table.find(assert(v1.options), Value) ~= nil, "A root variant needs an enum option")
		
		if Value == RootVariant.value then
			Tbl = table.clone(Tbl)
			Tbl.root = table.clone(Tbl.root)
			Tbl.root.kind = RootVariant.kind
			Tbl.root.props = RootVariant.props
			Tbl.root.children = RootVariant.children or Tbl.root.children
		end
	end
	local HasBindings: boolean = p1 ~= nil and p1.bindings ~= nil
	local Outputs = if p1 and p1.outputs then p1.outputs else {}
	local Slots = if p1 and p1.slots then p1.slots else {}
	local Token = if p1 then p1.token else nil
	local ResolveToken = if p1 then p1.resolveToken else nil
	local Decorate = if p1 then p1.decorate else nil
	local Previews = {}
	
	for _, input in Tbl.contract.inputs do
		local Input = Inputs[input.id]
		local Preview = input.preview
		
		if Input ~= nil then
			Previews[input.id] = Input
		elseif Preview ~= nil then
			Previews[input.id] = Preview
		end
	end
	local CellResults = {}
	local State = Tbl.state
	
	if State then
		for _, value1 in State do
			CellResults[value1.id] = CoreModule.cell(value1.initial)
		end
	end
	local t = {}
	local Sequences = Tbl.sequences
	local Sequence = Library.sequence
	local Build = if Sequence then Sequence.build else nil
	
	if Sequences ~= nil and Build ~= nil then
		local t1 = {}
		
		for _, output in Tbl.contract.outputs do
			t1[output.id] = function()
				-- upvalues: Outputs (copy), output (copy)
				local Output: (any) -> () = Outputs[output.id]
				
				if Output then
					Output({})
				end
			end
		end
		for _, sequence in Sequences do
			t[sequence.id] = Build(sequence, CellResults, t1)
		end
	end
	local Players: (any) -> () = if p1 then p1.players else nil
	
	if Players then
		Players(t)
	end
	local function _(p2, Callback)
		-- upvalues: Bindings (copy), Previews (copy)
		local Binding = Bindings[p2]
		
		if Binding == nil then
			return Previews[p2]
		else
			local Readable = Binding.readable
			
			return if Readable == nil then Binding.literal elseif Callback then Callback(Readable) else Readable:peek()
		end
	end
	
	local function truthy(When, p2, Callback): boolean
		-- upvalues: DocumentModule (upval), Tbl (ref), CellResults (copy), Bindings (copy), Previews (copy)
		local CallbackResult = if p2 then if Callback then Callback(p2) else p2:peek() else nil
		
		if DocumentModule.input(Tbl, When) == nil and CallbackResult ~= nil and CallbackResult[When] ~= nil then
			return CallbackResult[When] == true
		end
		local CellResult = CellResults[When]
		
		if CellResult ~= nil then
			return (if Callback then Callback(CellResult) else CellResult:peek()) == true
		end
		local Binding = Bindings[When]
		local Literal = nil
		
		if Binding == nil then
			Literal = Previews[When]
		else
			local Readable = Binding.readable
			Literal = if Readable == nil then Binding.literal elseif Callback then Callback(Readable) else Readable:peek()
		end
		return Literal == true
	end
	
	local function listFrom(Text: string, p2, Callback)
		-- upvalues: Bindings (copy), DocumentModule (upval), Tbl (ref), rowsOf (upval), Previews (copy)
		local Binding = Bindings[Text]
		local Rows = if Binding then Binding.rows else nil
		
		if Rows ~= nil then
			return if Callback then Callback(Rows) else Rows:peek()
		end
		if DocumentModule.input(Tbl, Text) == nil and p2 ~= nil then
			return (rowsOf((if Callback then Callback(p2) else p2:peek())[string.match(Text, "^[%w]+%.([%w_]+)$") or Text]))
		end
		local Binding1 = Bindings[Text]
		local Literal = nil
		
		if Binding1 == nil then
			Literal = Previews[Text]
		else
			local Readable = Binding1.readable
			Literal = if Readable == nil then Binding1.literal elseif Callback then Callback(Readable) else Readable:peek()
		end
		return (rowsOf(Literal))
	end
	
	local CellResults1 = {}
	local Names = {}
	
	local function collect(Tbl)
		-- upvalues: Names (copy), CellResults1 (copy), CoreModule (upval), collect (copy)
		Names[Tbl.id] = Tbl.name
		
		for _, prop in Tbl.props do
			local Node = prop.node
			
			if Node ~= nil and CellResults1[Node] == nil then
				CellResults1[Node] = CoreModule.cell(nil)
			end
			local Nodes = prop.nodes
			
			if Nodes then
				for _, node in Nodes do
					if CellResults1[node] == nil then
						CellResults1[node] = CoreModule.cell(nil)
					end
				end
			end
		end
		for _, child in Tbl.children do
			collect(child)
		end
		if Tbl.rowVariant then
			for _, cas in Tbl.rowVariant.cases do
				local Copy = table.clone(Tbl)
				Copy.rowVariant = nil
				local Children = cas.children
				Copy.props = cas.props
				Copy.children = Children
				collect(Copy)
			end
		end
	end
	
	collect(Tbl.root)
	
	local function carriesOutput(Literal): boolean
		-- upvalues: carriesOutput (copy)
		if type(Literal) ~= "table" then
			return false
		end
		if Literal["$output"] ~= nil or Literal["$template"] ~= nil or Literal["$input"] ~= nil then
			return true
		end
		for _, value in Literal do
			if carriesOutput(value) then
				return true
			end
		end
		return false
	end
	
	local Callback = nil
	
	local _ = function(p2, p3)
		-- upvalues: Callback (ref)
		local CallbackResult = Callback(p2, p3)
		assert(type(CallbackResult) == "table" or type(CallbackResult) == "userdata", `Design kind {p2.kind} did not build a node`)
		
		return CallbackResult
	end
	
	local function withCallbacks(Literal, p2, p3)
		-- upvalues: Bindings (copy), Previews (copy), DocumentModule (upval), Callback (ref), Outputs (copy), withCallbacks (copy)
		if type(Literal) ~= "table" then
			return Literal
		end
		local Input = Literal["$input"]
		
		if type(Input) == "string" then
			local Binding = Bindings[Input]
			
			if Binding then
				if Binding.value ~= nil then
					return Binding.value
				elseif Binding.readable ~= nil then
					return Binding.readable
				end
			end
			local Binding1 = Bindings[Input]
			
			if Binding1 == nil then
				return Previews[Input]
			else
				local Readable = Binding1.readable
				
				return if Readable == nil then Binding1.literal else Readable:peek()
			end
		else
			local Template = Literal["$template"]
			
			if type(Template) == "string" then
				local v2 = assert(DocumentModule.find(p3, Template), `{p3.name} renders unknown cell {Template}`)
				local HasBind = p3.bind ~= nil
				
				return function(p4)
					-- upvalues: Callback (upval), v2 (copy), HasBind (copy), p2 (copy)
					return Callback(v2, if HasBind then p4 else p2)
				end
			end
			local Output = Literal["$output"]
			
			if type(Output) == "string" then
				local IsRow = Literal["$row"] == true
				
				return function(...)
					-- upvalues: Outputs (upval), Output (copy), IsRow (copy), p2 (copy)
					local Output1: (any) -> () = Outputs[Output]
					
					if Output1 then
						Output1(if IsRow then { assert(p2, "Row outputs need a row"):peek() } else { ... })
					end
				end
			end
			local t = {}
			
			for i, value in Literal do
				t[i] = withCallbacks(value, p2, p3)
			end
			return t
		end
	end
	
	local function resolve(TagBinding, p4, p5, Field)
		-- upvalues: CoreModule (upval), CellResults1 (copy), Names (copy), CellResults (copy), Bindings (copy), Previews (copy), t (copy), DocumentModule (upval), Callback (ref), DatatypeModule (upval), ResolveToken (copy), Token (copy), withCallbacks (copy), carriesOutput (copy), Slots (copy), Outputs (copy), p1 (copy)
		local Literal = TagBinding.literal
		local Input = TagBinding.input
		local Item = TagBinding.item
		local Output = TagBinding.output
		local Token1 = TagBinding.token
		local Node = TagBinding.node
		
		if Node ~= nil then
			return {
				node = CoreModule.formula(function(Callback)
					-- upvalues: CellResults1 (upval), Node (copy)
					local CallbackResult = Callback(CellResults1[Node])
					assert(CallbackResult ~= nil, "Node reference is not captured")
					
					return CallbackResult
				end)
			}
		end
		local NodeFrom = TagBinding.nodeFrom
		
		if NodeFrom == nil then
			local State = TagBinding.state
			
			if State ~= nil then
				return { readable = CellResults[State] }
			end
			local Play = TagBinding.play
			
			if Play ~= nil then
				return {
					callback = function()
						-- upvalues: t (upval), Play (copy)
						local Entry = t[Play]
						
						if Entry then
							Entry.play()
						end
					end
				}
			end
			if Literal == nil then
				if Input then
					local Binding = Bindings[Input]
					local Path = TagBinding.path
					
					if Path ~= nil then
						if Binding == nil or Binding.value == nil then
							assert(Binding == nil or Binding.readable == nil, `Input {Input} path needs a value record binding`)
							local Literal1 = if Binding then Binding.literal else Previews[Input]
							for _, value3 in Path do
								assert(type(Literal1) == "table", `Input {Input} path crosses a non-record literal`)
								Literal1 = Literal1[value3]
							end
							return { literal = Literal1 }
						else
							local Value = Binding.value
							local v3 = nil
							
							for _, value1 in Path do
								assert(type(Value) == "table", `Input {Input} path crosses a non-record value`)
								v3 = nil
								
								for i1, value2 in Value do
									if i1 == value1 then
										v3 = value2
										break
									end
								end
								Value = v3
							end
							return { value = Value }
						end
					elseif Binding == nil then
						local Slot = Slots[Input]
						
						return if Slot then { slot = Slot } else { literal = Previews[Input] }
					else
						return table.clone(Binding)
					end
				elseif Item then
					local ItemBindingsNeedATemplate = assert(p4, "Item bindings need a template")
					
					return if Field == nil or Field.type ~= "string" then {
						readable = CoreModule.formula(function(Callback)
							-- upvalues: ItemBindingsNeedATemplate (copy), Item (copy)
							return Callback(ItemBindingsNeedATemplate)[Item]
						end)
					} else {
						readable = CoreModule.formula(function(Callback)
							-- upvalues: ItemBindingsNeedATemplate (copy), Item (copy)
							local CallbackResultEntry = Callback(ItemBindingsNeedATemplate)[Item]
							
							return if CallbackResultEntry == nil or type(CallbackResultEntry) == "string" then CallbackResultEntry else tostring(CallbackResultEntry)
						end)
					}
				elseif Output then
					local Arguments = TagBinding.arguments
					
					if Arguments then
						return {
							callback = function(...)
								-- upvalues: Outputs (upval), Output (copy), Arguments (copy), p4 (copy)
								local Output1: (any) -> () = Outputs[Output]
								
								if Output1 then
									local Packed = table.pack(...)
									local PeekResultEntries = {}
									
									for i, argument in Arguments do
										local PeekResultEntry = if argument.item then assert(p4, "Item arguments need a template"):peek()[argument.item] else Packed[argument.event]
										assert(PeekResultEntry ~= nil, `Missing action argument {i} for {Output}`)
										PeekResultEntries[i] = PeekResultEntry
									end
									Output1(PeekResultEntries)
								end
							end
						}
					end
					local Fields = TagBinding.fields
					
					if Fields then
						local ItemFieldsNeedATemplate = assert(p4, "Item fields need a template")
						local Args = TagBinding.args
						
						return {
							callback = function()
								-- upvalues: Outputs (upval), Output (copy), Args (copy), ItemFieldsNeedATemplate (copy), Fields (copy)
								local Output1: (any) -> () = Outputs[Output]
								
								if Output1 then
									local Copy = if Args then table.clone(Args) else {}
									local PeekResult = ItemFieldsNeedATemplate:peek()
									
									for _, field in Fields do
										local PeekResultEntry = PeekResult[field]
										
										if PeekResultEntry ~= nil then
											table.insert(Copy, PeekResultEntry)
										end
									end
									Output1(Copy)
								end
							end
						}
					else
						local Args1 = TagBinding.args
						
						return {
							callback = function(...)
								-- upvalues: Outputs (upval), Output (copy), Args1 (copy)
								local Output1: (any) -> () = Outputs[Output]
								
								if Output1 then
									Output1(if Args1 then Args1 else { ... })
								end
							end
						}
					end
				elseif Token1 then
					local ResolveToken1 = if p1 then p1.resolveToken else nil
					
					return if ResolveToken1 then table.clone(ResolveToken1(Token1)) else {
						literal = assert(Token, "This design reads theme tokens; supply a token resolver")(Token1)
					}
				else
					return {}
				end
			else
				if Field and Field.type == "content" and type(Literal) == "table" then
					local Template = Literal["$template"]
					
					if type(Template) == "string" then
						local FindResult = DocumentModule.find(p5, Template)
						
						local function content()
							-- upvalues: Callback (upval), FindResult (copy), p4 (copy)
							return Callback(assert(FindResult), p4)
						end
						
						return { value = content, slot = content, literal = Literal }
					end
				end
				if Field and Field.type == "value" and not Field.perRow and type(Literal) == "table" then
					local Template = Literal["$template"]
					
					if type(Template) == "string" then
						return {
							value = Callback(assert((DocumentModule.find(p5, Template))), p4)
						}
					end
				end
				if Field == nil or Field.type ~= "datatype" or type(Literal) ~= "table" then
					return if Field == nil or not Field.perRow then if carriesOutput(Literal) then {
						literal = Literal,
						value = withCallbacks(Literal, p4, p5)
					} else { literal = Literal } else {
						literal = Literal,
						value = function(p6)
							-- upvalues: withCallbacks (upval), Literal (copy), p5 (copy)
							return (withCallbacks(Literal, p6, p5))
						end
					}
				end
				local t2 = {}
				local v4 = false
				
				for i, value in Literal do
					local Ken = DatatypeModule.token(value)
					local InputResult = DatatypeModule.input(value)
					
					if (Ken ~= nil or InputResult ~= nil) and type(i) == "number" then
						local Binding = nil
						if InputResult then
							local config = { literal = Previews[InputResult] }
							Binding = Bindings[InputResult] or config
						else
							local v5 = assert(Ken)
							Binding = if ResolveToken then ResolveToken(v5) else {
								literal = assert(Token, "This design reads theme tokens; supply a token resolver")(v5)
							}
						end
						t2[i] = Binding
						v4 = v4 or Binding.readable ~= nil
					end
				end
				if next(t2) == nil then
					return if Field.perRow then {
						literal = Literal,
						value = function(p6)
							-- upvalues: withCallbacks (upval), Literal (copy), p5 (copy)
							return (withCallbacks(Literal, p6, p5))
						end
					} else { literal = Literal }
				else
					local function numeric(Callback)
						-- upvalues: Literal (copy), t2 (copy)
						local Copy = table.clone(Literal)
						
						for i, value in t2 do
							local Readable = value.readable
							local CallbackResult = if Readable then if Callback then Callback(Readable) else Readable:peek() elseif value.value == nil then value.literal else value.value
							assert(type(CallbackResult) == "number", `Datatype component {i} needs a numeric token or input`)
							Copy[i] = CallbackResult
						end
						return Copy
					end
					
					return if v4 then {
						readable = CoreModule.formula(function(p6)
							-- upvalues: numeric (copy)
							return (numeric(p6))
						end)
					} else { literal = numeric(nil) }
				end
			end
		else
			local t3 = {}
			local Nodes = TagBinding.nodes
			
			if Nodes then
				for _, node in Nodes do
					t3[Names[node]] = CellResults1[node]
				end
			end
			local CellResult = CellResults[NodeFrom]
			
			return {
				node = CoreModule.formula(function(Callback)
					-- upvalues: CellResult (copy), NodeFrom (copy), Bindings (upval), Previews (upval), t3 (copy)
					local CallbackResult = nil
					if CellResult == nil then
						local Binding = Bindings[NodeFrom]
						
						if Binding == nil then
							CallbackResult = Previews[NodeFrom]
						else
							local Readable = Binding.readable
							CallbackResult = if Readable == nil then Binding.literal elseif Callback then Callback(Readable) else Readable:peek()
						end
					else
						CallbackResult = Callback(CellResult)
					end
					local Entry = if type(CallbackResult) == "string" then t3[CallbackResult] else nil
					local CallbackResult1 = if Entry then Callback(Entry) else nil
					assert(CallbackResult1 ~= nil, "Node reference is not captured")
					
					return CallbackResult1
				end)
			}
		end
	end
	
	Callback = function(Tbl1, CellResult)
		-- upvalues: p1 (copy), Bindings (copy), Slots (copy), DocumentModule (upval), Tbl (ref), Library (copy), resolve (copy), HasBindings (copy), CoreModule (upval), truthy (copy), Callback (ref), listFrom (copy), Previews (copy), ImportsModule (upval), Token (copy), ResolveToken (copy), v8 (upval), CellResults1 (copy), Decorate (copy)
		if p1 and p1.exclude and p1.exclude(Tbl1) then
			return nil
		end
		if Tbl1.slot then
			local Binding = Bindings[Tbl1.slot]
			local Slot = if Binding then Binding.slot else Slots[Tbl1.slot]
			assert(Slot ~= nil or not assert(DocumentModule.input(Tbl, Tbl1.slot)).required, "A required slot child needs a factory")
			
			return if Slot then Slot() else nil
		end
		if Tbl1.rowVariant then
			local PeekResultEntry = assert(CellResult, "Row variants need an item"):peek()[Tbl1.rowVariant.item]
			
			for _, cas in Tbl1.rowVariant.cases do
				if PeekResultEntry == cas.value then
					Tbl1 = table.clone(Tbl1)
					local Props = cas.props
					local Children = cas.children
					Tbl1.kind = cas.kind
					Tbl1.props = Props
					Tbl1.children = Children
					break
				end
			end
		end
		local v6 = assert(Library.kinds[Tbl1.kind], `Unknown {Library.name} kind {Tbl1.kind}`)
		local Bindings1 = {}
		local t = {}
		
		for i, prop in Tbl1.props do
			local ResolveResult = resolve(prop, CellResult, Tbl1, v6.fields[i])
			local Motion = prop.motion
			local Readable = ResolveResult.readable
			local Animate = if Library.motion then Library.motion.animate else nil
			
			if Motion ~= nil and Readable ~= nil and Animate ~= nil then
				ResolveResult.readable = Animate(Readable, Motion)
			end
			Bindings1[i] = ResolveResult
			local Literal = prop.literal
			
			if Literal ~= nil then
				DocumentModule.cellsOf(Literal, t)
			end
		end
		local List = {}
		
		for _, child in Tbl1.children do
			if not t[child.id] then
				table.insert(List, child)
			end
		end
		local List1 = {}
		
		local function append(p6)
			-- upvalues: HasBindings (upval), List1 (copy), CoreModule (upval), truthy (upval), CellResult (copy), Callback (upval)
			local When = p6.when
			
			if When ~= nil and HasBindings then
				table.insert(List1, CoreModule.show(function(p7)
					-- upvalues: truthy (upval), When (copy), CellResult (upval)
					return (truthy(When, CellResult, p7))
				end, function()
					-- upvalues: p6 (copy), CellResult (upval), Callback (upval)
					local CallbackResult = Callback(p6, CellResult)
					assert(type(CallbackResult) == "table" or type(CallbackResult) == "userdata", `Design kind {p6.kind} did not build a node`)
					
					return CallbackResult
				end))
				
				return
			end
			if When == nil or truthy(When, CellResult, nil) then
				table.insert(List1, Callback(p6, CellResult))
			end
		end
		
		local Bind = Tbl1.bind
		local Entry = List[1]
		
		if v6.children == "slot" then
			if Entry then
				Bindings1[assert(v6.slot, `{Tbl1.kind} names no content property`)] = {
					slot = function()
						-- upvalues: Callback (upval), Entry (copy), CellResult (copy)
						return Callback(Entry, CellResult)
					end
				}
			end
		elseif v6.children == "template" then
			if Bind then
				Bindings1[assert(v6.source, `{Tbl1.kind} names no list property`)] = {
					rows = if HasBindings then CoreModule.formula(function(p6)
						-- upvalues: listFrom (upval), Bind (copy), CellResult (copy)
						return (listFrom(Bind.from, CellResult, p6))
					end) else CoreModule.cell((listFrom(Bind.from, CellResult, nil))),
					key = Bind.key
				}
			end
			if v6.template == nil then
				for _, value in List do
					append(value)
				end
			elseif v6.iteration and Entry and Bind == nil then
				Bindings1[assert(v6.template)] = {
					template = function(p6)
						-- upvalues: Callback (upval), Entry (copy)
						return Callback(Entry, p6)
					end
				}
			elseif Bind and Entry then
				local Row = Bind.row or Entry.id
				local Entry1 = Entry
				
				for _, value1 in List do
					if value1.id == Row then
						Entry1 = value1
					else
						append(value1)
					end
				end
				Bindings1[assert(v6.template)] = {
					template = function(p6)
						-- upvalues: Callback (upval), Entry1 (ref)
						return Callback(Entry1, p6)
					end
				}
			end
		elseif Bind and Entry then
			local Row = Bind.row or Entry.id
			for _, value2 in List do
				if value2.id ~= Row then
					append(value2)
					continue
				end
				if HasBindings then
					table.insert(List1, CoreModule.keyed({
						from = function(p6)
							-- upvalues: listFrom (upval), Bind (copy), CellResult (copy)
							return (listFrom(Bind.from, CellResult, p6))
						end,
						key = function(p6)
							-- upvalues: Bind (copy)
							local v7 = p6[Bind.key]
							assert(v7 ~= nil, `A row needs key {Bind.key}`)
							
							return v7
						end,
						render = function(p6)
							-- upvalues: value2 (copy), Callback (upval)
							local CallbackResult = Callback(value2, p6)
							assert(type(CallbackResult) == "table" or type(CallbackResult) == "userdata", `Design kind {value2.kind} did not build a node`)
							
							return CallbackResult
						end
					}))
				else
					for _, value3 in listFrom(Bind.from, CellResult, nil) do
						table.insert(List1, Callback(value2, CoreModule.cell(value3)))
					end
				end
			end
		else
			for _, value4 in List do
				append(value4)
			end
		end
		local Name = Tbl1.name
		local NameInput = Tbl1.nameInput
		
		if NameInput ~= nil then
			local Binding = Bindings[NameInput]
			local Literal = nil
			
			if Binding == nil then
				Literal = Previews[NameInput]
			else
				local Readable = Binding.readable
				Literal = if Readable == nil then Binding.literal else Readable:peek()
			end
			if type(Literal) == "string" and Literal ~= "" then
				Name = Literal
			end
		end
		local NameField = Tbl1.nameField
		
		if NameField ~= nil and CellResult ~= nil then
			local PeekResultEntry = CellResult:peek()[NameField]
			
			if PeekResultEntry ~= nil then
				Name = tostring(PeekResultEntry)
			end
		end
		local BuildResult = nil
		
		if v6.design then
			local Design = v6.design
			local ReadResult = ImportsModule.read(Design, if p1 then p1.use else nil)
			local Outputs = {}
			
			for _, output in ReadResult.contract.outputs do
				local Binding = Bindings1[output.id]
				local Callback1 = if Binding then Binding.callback else nil
				
				if Callback1 then
					Outputs[output.id] = function(p6)
						-- upvalues: Callback1 (copy)
						Callback1(table.unpack(p6))
					end
				end
			end
			Bindings1[Design.nameInput] = { literal = Name }
			BuildResult = v8(ReadResult, Design.library, {
				use = if p1 then p1.use else nil,
				bindings = Bindings1,
				outputs = Outputs,
				token = Token,
				resolveToken = ResolveToken,
				exclude = if p1 then p1.exclude else nil
			})
		else
			BuildResult = v6.build(Bindings1, List1, Name)
		end
		local Tags = Tbl1.tags
		local Tags1 = Library.tags
		
		if Tags ~= nil and Tags1 ~= nil then
			Tags1.apply(BuildResult, Tags)
		end
		if Tbl1.tagBinding and Tags1 then
			local ResolveResult = resolve(Tbl1.tagBinding, CellResult, Tbl1, nil)
			
			local function apply(PeekResult)
				-- upvalues: Tags1 (copy), BuildResult (ref)
				local List = {}
				
				if type(PeekResult) == "string" then
					table.insert(List, PeekResult)
				elseif type(PeekResult) == "table" then
					for _, value in PeekResult do
						assert(type(value) == "string", "Bound tags contain text")
						table.insert(List, value)
					end
				end
				Tags1.apply(BuildResult, List)
			end
			
			local Readable = ResolveResult.readable
			
			if Readable and HasBindings then
				CoreModule.watch(function(Callback)
					-- upvalues: apply (copy), Readable (copy)
					apply(Callback(Readable))
				end)
			else
				apply(if Readable then Readable:peek() elseif ResolveResult.value == nil then ResolveResult.literal else ResolveResult.value)
			end
		end
		local CellResult1 = CellResults1[Tbl1.id]
		
		if CellResult1 ~= nil then
			CellResult1:set(BuildResult)
		end
		if Decorate then
			Decorate(Tbl1, BuildResult)
		end
		return BuildResult
	end
	
	local CallbackResult = Callback(Tbl.root, nil)
	
	if Sequences ~= nil then
		for _, value in Sequences do
			local v7 = t[value.id]
			
			if value.autoplay and v7 then
				v7.play()
			end
		end
	end
	return CallbackResult
end

return v8
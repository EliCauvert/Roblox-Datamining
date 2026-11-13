local _ = require("./types")
local DatatypeModule = require("./datatype")
local DocumentCopyModule = require("./document-copy")
local LiteralFunction = DocumentCopyModule.literal
local ValueFunction = DocumentCopyModule.value
local NodeFunction = DocumentCopyModule.node
local ContractFunction = DocumentCopyModule.contract
local StateFunction = DocumentCopyModule.state
local SequencesFunction = DocumentCopyModule.sequences
local DocumentFunction = DocumentCopyModule.document

local function plain(Value: number, p1: number): boolean
	-- upvalues: plain (copy)
	if type(Value) == "string" then
		return #Value <= 10000
	end
	if type(Value) == "number" then
		return Value == Value and math.abs(Value) < 1000000000
	end
	if type(Value) == "table" then
		if p1 >= 8 then
			return false
		end
		local Count = 0
		
		for _, value in Value do
			Count += 1
			
			if Count > 500 or not plain(value, p1 + 1) then
				return false
			end
		end
	end
	return true
end

local function _(p2, Id): boolean
	for _, output in p2.contract.outputs do
		if output.id == Id then
			return true
		end
	end
	return false
end

local function present(TagBinding): number
	return (if TagBinding.literal == nil then 0 else 1) + (if TagBinding.input == nil then 0 else 1) + (if TagBinding.item == nil then 0 else 1) + (if TagBinding.output == nil then 0 else 1) + (if TagBinding.token == nil then 0 else 1) + (if TagBinding.node == nil then 0 else 1) + (if TagBinding.nodeFrom == nil then 0 else 1) + (if TagBinding.state == nil then 0 else 1) + (if TagBinding.play == nil then 0 else 1)
end

local function checkTypeName(Text: string)
	if Text == nil then return end
	assert(string.match(Text, "^[%a_][%w_%.]*$") ~= nil, "A Luau type names a type or a qualified type")
	assert(string.sub(Text, -1) ~= "." and not string.find(Text, "..", 1, true), "A Luau type has no empty path segments")
	
	for i in string.gmatch(Text, "[^%.]+") do
		assert(string.match(i, "^[%a_][%w_]*$") ~= nil, "A Luau type has identifier path segments")
	end
end

local function checkFields(Fields)
	-- upvalues: checkTypeName (copy), checkFields (copy)
	if Fields == nil then return end
	for _, field in Fields do
		checkTypeName(field.luauType)
		
		if field.options then
			assert(field.type == "string" and field.luauType == nil and #field.options >= 2, "Item options need a text enum")
			local t = {}
			
			for _, option in field.options do
				assert(#option > 0 and not t[option], "Item options must be unique nonempty text")
				t[option] = true
			end
		end
		checkFields(field.fields)
	end
end

local function checkContract(Contract)
	-- upvalues: checkTypeName (copy), checkFields (copy), plain (copy)
	local t = {}
	
	for _, input in Contract.inputs do
		assert(string.match(input.id, "^%l[%w]*$") ~= nil, "Input ids are lower camel case")
		assert(not t[input.id], `Duplicate contract id {input.id}`)
		t[input.id] = true
		checkTypeName(input.luauType)
		checkFields(input.fields)
		local Options = input.options
		
		if Options then
			assert(input.kind == "value" and input.type == "string" and #Options >= 2, `Input {input.id} options need a static text enum`)
			local t1 = {}
			
			for _, option in Options do
				assert(#option > 0 and not t1[option], `Input {input.id} options must be unique nonempty text`)
				t1[option] = true
			end
			assert(input.preview == nil or type(input.preview) == "string" and t1[input.preview] == true, `Input {input.id} preview must be an option`)
		end
		local Preview = input.preview
		assert(Preview == nil or plain(Preview, 0), `Preview for {input.id} must be plain data`)
		assert(input.type ~= "slot" or input.kind == "value", `Slot input {input.id} must be a value`)
	end
	for _, output in Contract.outputs do
		assert(string.match(output.id, "^on%u[%w]*$") ~= nil, "Outputs are named onSomething")
		assert(not t[output.id], `Duplicate contract id {output.id}`)
		t[output.id] = true
		local Row = output.row
		
		if Row ~= nil then
			local Flag = false
			
			for _, input1 in Contract.inputs do
				Flag = Flag or input1.id == Row and input1.type == "list" and input1.fields ~= nil
			end
			assert(Flag, `{output.id} carries a row of {Row}, which is not a list input with fields`)
		end
	end
end

local function listOf(p3, Text: string, p4)
	local v1 = nil
	
	for _, input in p3.contract.inputs do
		if input.id == Text then
			v1 = input
			break
		end
	end
	if v1 ~= nil then
		return v1
	end
	local Fields = if p4 then p4.fields else nil
	local Match, Match2 = string.match(Text, "^([%w]+)%.([%w_]+)$")
	
	if Match ~= nil and (p4 == nil or Match ~= p4.id) then
		return nil
	end
	if Fields ~= nil then
		for _, field in Fields do
			if field.id == (Match2 or Text) and field.type == "list" then
				return {
					kind = "readable",
					type = "list",
					id = field.id,
					fields = field.fields
				}
			end
		end
	end
	return nil
end

local _ = function(p5, Id)
	local Sequences = p5.sequences
	
	if Sequences then
		for _, sequence in Sequences do
			if sequence.id == Id then
				return sequence
			end
		end
	end
	return nil
end

local function cellsOf(Literal, p6)
	-- upvalues: cellsOf (copy)
	if type(Literal) == "table" then
		local Template = Literal["$template"]
		
		if type(Template) == "string" then
			p6[Template] = true
			
			return p6
		end
		for _, value in Literal do
			cellsOf(value, p6)
		end
	end
	return p6
end

local DocumentModule = {
	copy = DocumentFunction,
	copyNode = NodeFunction,
	input = function(p7, Id)
		for _, input in p7.contract.inputs do
			if input.id == Id then
				return input
			end
		end
		return nil
	end,
	stateOf = function(p8, Id)
		local State = p8.state
		
		if State then
			for _, value in State do
				if value.id == Id then
					return value
				end
			end
		end
		return nil
	end,
	cellsOf = cellsOf
}

local function checkOutputs(p9, Literal, p10, p11)
	-- upvalues: checkOutputs (copy)
	if type(Literal) ~= "table" then return end
	local Output = Literal["$output"]
	
	if Output == nil then
		if Literal["$template"] ~= nil then return end
		local Input = Literal["$input"]
		
		if Input == nil then
			for _, value in Literal do
				checkOutputs(p9, value, p10, p11)
			end
			return
		else
			local v2 = false
			
			if type(Input) == "string" then
				local v3 = nil
				
				for _, input in p9.contract.inputs do
					if input.id == Input then
						v3 = input
						break
					end
				end
				v2 = v3 ~= nil
			end
			assert(v2, `{p10} reads unknown record input {tostring(Input)}`)
			assert(next(Literal) == "$input" and next(Literal, "$input") == nil, "A record input marker holds only $input")
			
			return
		end
	else
		local Flag = false
		
		if type(Output) == "string" then
			Flag = false
			
			for _, output in p9.contract.outputs do
				if output.id == Output then
					Flag = true
					break
				end
			end
		end
		assert(Flag, `{p10} calls unknown output {tostring(Output)}`)
		assert(Literal["$row"] == nil or p11 ~= nil, `{p10} passes a row outside a collection`)
	end
end

local function checkValue(p12, p13, TagBinding, p14, p15)
	-- upvalues: present (copy), plain (copy), checkOutputs (copy), DatatypeModule (copy)
	assert(present(TagBinding) == 1, `{p15} holds exactly one literal or binding`)
	assert(TagBinding.path == nil or TagBinding.input ~= nil, `{p15} paths belong to input bindings`)
	assert(TagBinding.arguments == nil or TagBinding.output ~= nil, `{p15} action arguments belong to output bindings`)
	local Play = TagBinding.play
	
	if Play == nil then
		local State = TagBinding.state
		
		if State == nil then
			local Literal = TagBinding.literal
			local Input = TagBinding.input
			local Item = TagBinding.item
			local Output = TagBinding.output
			
			if TagBinding.node ~= nil then
				assert(p13.type == "node", `{p15} cannot reference a node`)
				
				return
			end
			local NodeFrom = TagBinding.nodeFrom
			
			if NodeFrom == nil then
				assert(p13.type ~= "node", `{p15} references another node`)
				local IsContent = p13.type == "content"
				
				if Literal ~= nil and type(Literal) == "table" and type(Literal["$template"]) == "string" and p13.type == "value" and not p13.perRow then
					assert(next(Literal) == "$template" and next(Literal, "$template") == nil, "An authored value node marker holds only $template")
					
					return
				end
				if Literal ~= nil and IsContent then
					assert(type(Literal) == "table" and type(Literal["$template"]) == "string", `{p15} holds a slot input or a content node`)
					
					return
				end
				if Literal == nil then
					if Input then
						local v4 = nil
						
						for _, input in p12.contract.inputs do
							if input.id == Input then
								v4 = input
								break
							end
						end
						local v5 = assert(v4, `{p15} reads unknown input {Input}`)
						assert(p13.type == "content" == (v5.type == "slot"), `{p15} and input {Input} do not match`)
						assert(p13.type ~= "event" or v5.kind == "cell", `{p15} needs an output or a cell input`)
						local Path = TagBinding.path
						
						if Path ~= nil then
							assert(#Path > 0 and v5.kind == "value" and v5.type == "record", `{p15} needs a value record for its input path`)
							local Fields = v5.fields
							local v6 = nil
							
							for i2, value7 in Path do
								assert(string.match(value7, "^[%a_][%w_]*$") ~= nil, `{p15} input path needs field identifiers`)
								v6 = nil
								local Fields1 = Fields or {}
								for _, value8 in Fields1 do
									if value8.id == value7 then
										v6 = value8
										break
									end
								end
								if Fields ~= nil then
									assert(v6 ~= nil, `{p15} reads unknown record field {value7}`)
								end
								if i2 < #Path and v6 ~= nil then
									assert(v6.type == "record", `{p15} crosses a non-record field {value7}`)
								end
								Fields = if v6 then v6.fields else nil
							end
							return
						end
					elseif Item then
						local Fields = assert(p14, `{p15} reads an item outside a collection template`).fields
						
						if Fields then
							local Flag1 = false
							
							for _, field in Fields do
								Flag1 = Flag1 or field.id == Item
							end
							assert(Flag1, `{p15} reads unknown item field {Item}`)
							
							return
						end
					elseif Output then
						assert(p13.type == "event", `{p15} cannot call an output`)
						local Flag2 = false
						
						for _, output1 in p12.contract.outputs do
							if output1.id == Output then
								Flag2 = true
								break
							end
						end
						assert(Flag2, `{p15} calls unknown output {Output}`)
						local Arguments = TagBinding.arguments
						
						if Arguments then
							assert(TagBinding.args == nil and TagBinding.fields == nil, `{p15} cannot mix action arguments with args or fields`)
							local v7 = nil
							
							for _, output in p12.contract.outputs do
								if output.id == Output then
									v7 = output
								end
							end
							local v8 = assert(assert(v7).args, `{p15} action arguments need typed output args`)
							assert(assert(v7).row == nil and #v8 == #Arguments, `{p15} action arguments must match the output arity`)
							local Types = {}
							local Largest = 0
							
							for i, value5 in Arguments do
								local Type1 = v8[i]
								
								if not value5.item then
									local Event: number = value5.event
									assert(Event >= 1 and Event % 1 == 0 and Event <= #Arguments, `{p15} event arguments need positive contiguous positions`)
									assert(Types[Event] == nil or Types[Event] == Type1, `{p15} event argument {Event} has conflicting types`)
									Types[Event] = Type1
									Largest = math.max(Largest, Event)
									continue
								end
								local v9 = nil
								local Fields = assert(p14, `{p15} passes item fields outside a collection template`).fields or {}
								for _, value4 in Fields do
									if value4.id == value5.item then
										v9 = value4
									end
								end
								assert(v9 and v9.type == Type1, `{p15} item argument {value5.item} must match output type {Type1}`)
							end
							for i3 = 1, Largest do
								assert(Types[i3] ~= nil, `{p15} event arguments need positive contiguous positions`)
							end
						end
						local Args = TagBinding.args
						
						if Args then
							for _, value in Args do
								assert(plain(value, 0), `{p15} output arguments must be plain data`)
							end
						end
						local Fields = TagBinding.fields
						
						if Fields then
							local Fields2 = assert(p14, `{p15} passes item fields outside a collection template`).fields
							
							if Fields2 then
								for _, field1 in Fields do
									local Flag = false
									
									for _, value2 in Fields2 do
										Flag = Flag or value2.id == field1
									end
									assert(Flag, `{p15} passes unknown item field {field1}`)
								end
								return
							end
						end
					else
						assert(p13.tokens == true, `{p15} does not take theme tokens`)
					end
					return
				else
					assert(plain(Literal, 0), `{p15} must be plain data`)
					checkOutputs(p12, Literal, p15, p14)
					local Also = p13.also
					
					if Also ~= nil and table.find(Also, (type(Literal))) ~= nil then return end
					if p13.type == "choice" then
						local Options = p13.options or {}
						assert(type(Literal) == "string" and table.find(Options, Literal) ~= nil, `{p15} must be one of its options`)
						
						return
					end
					if p13.type == "number" then
						assert(type(Literal) == "number", `{p15} must be a number`)
						
						return
					end
					if p13.type == "boolean" then
						assert(type(Literal) == "boolean", `{p15} must be true or false`)
						
						return
					end
					if p13.type == "string" or p13.type == "color" then
						assert(type(Literal) == "string", `{p15} must be text`)
						
						return
					end
					if p13.type == "vector3" then
						assert(type(Literal) == "table" and (#Literal == 3 and (type(Literal[1]) == "number" and type(Literal[2]) == "number")) and type(Literal[3]) == "number", `{p15} must be three numbers`)
						
						return
					end
					if p13.type ~= "datatype" then
						assert(p13.type == "value", `{p15} must be bound`)
						
						return
					end
					local Text: string = assert(p13.datatype, `{p15} names no datatype`)
					
					if string.sub(Text, 1, 5) == "Enum." then
						assert(type(Literal) == "string", `{p15} must name an item of {Text}`)
						
						return
					end
					local ArityEntry = DatatypeModule.arity[Text]
					local IsNumber: boolean = type(Literal) == "table" and (ArityEntry == nil or #Literal == ArityEntry)
					
					if IsNumber and type(Literal) == "table" then
						local v10 = nil
						for i1, value6 in Literal do
							local InputResult = DatatypeModule.input(value6)
							
							if InputResult then
								v10 = nil
								
								for _, input2 in p12.contract.inputs do
									if input2.id == InputResult then
										v10 = input2
										break
									end
								end
								local v11 = assert(v10, `{p15} component reads unknown input {InputResult}`)
								assert(v11.type == "number" and v11.required == true and (v11.luauType == nil or v11.luauType == "number"), `{p15} component needs a required numeric input`)
							end
							IsNumber = IsNumber and (type(i1) == "number" and (i1 % 1 == 0 and (i1 >= 1 and i1 <= #Literal)) and (type(value6) == "number" or (p13.tokens == true and DatatypeModule.token(value6) ~= nil or InputResult ~= nil)))
						end
					end
					assert(IsNumber, `{p15} must be {ArityEntry or "some"} numeric, token or input components for {Text}`)
					
					return
				end
			else
				assert(p13.type == "node", `{p15} cannot reference a node`)
				assert(p13.reference ~= "native", `{p15} needs a direct node reference for native emission`)
				local v12 = nil
				
				for _, input1 in p12.contract.inputs do
					if input1.id == NodeFrom then
						v12 = input1
						break
					end
				end
				local State1 = p12.state
				local v13 = nil
				repeat
					if State1 then
						for _, value3 in State1 do
							if value3.id == NodeFrom then
								v13 = value3
								break
							end
						end
					end
					v13 = nil
				until true
				assert((if v12 then v12.type elseif v13 then v13.type else nil) == "string", `{p15} follows {NodeFrom}, which is not a text input or state`)
				local Nodes = TagBinding.nodes
				assert(Nodes ~= nil and #Nodes > 0, `{p15} names no candidate nodes`)
				
				return
			end
		else
			local State1 = p12.state
			local v14 = nil
			repeat
				if State1 then
					for _, value1 in State1 do
						if value1.id == State then
							v14 = value1
							break
						end
					end
				end
				v14 = nil
			until true
			assert(v14 ~= nil, `{p15} reads unknown state {State}`)
			assert(p13.type ~= "event" and (p13.type ~= "content" and p13.type ~= "node"), `{p15} cannot hold state`)
			
			return
		end
	else
		local Sequences = p12.sequences
		local v15 = nil
		repeat
			if Sequences then
				for _, sequence in Sequences do
					if sequence.id == Play then
						v15 = sequence
						break
					end
				end
			end
			v15 = nil
		until true
		assert(v15 ~= nil, `{p15} plays unknown sequence {Play}`)
		assert(p13.type == "event", `{p15} cannot play a sequence`)
	end
end

function DocumentModule.validate(p16, p17)
	-- upvalues: checkContract (copy), plain (copy), present (copy), checkValue (copy), listOf (copy), cellsOf (copy), DocumentFunction (copy), DocumentModule (copy)
	assert(p16.schema == "compose-design/1", "Unsupported design format")
	assert(p16.library == p17.name, `This design uses the {p16.library} library`)
	local IsNextIdAbove: boolean = #p16.name > 0 and #p16.name <= 120
	assert(IsNextIdAbove, "A design needs a name")
	IsNextIdAbove = p16.nextId % 1 == 0 and p16.nextId >= 1
	assert(IsNextIdAbove, "Invalid next node id")
	checkContract(p16.contract)
	local State = p16.state
	
	if State then
		for _, value in State do
			assert(string.match(value.id, "^%l[%w]*$") ~= nil, "State ids are lower camel case")
			local v16 = false
			local Id = value.id
			local v17 = nil
			
			for _, input in p16.contract.inputs do
				if input.id == Id then
					v17 = input
					break
				end
			end
			if v17 == nil then
				local Id1 = value.id
				local Flag = false
				
				for _, output in p16.contract.outputs do
					if output.id == Id1 then
						Flag = true
						break
					end
				end
				v16 = not Flag
			end
			assert(v16, `Duplicate id {value.id}`)
			local Id1 = value.id
			local State1 = p16.state
			local v18 = nil
			
			if not State1 then break end
			for _, value1 in State1 do
				if value1.id == Id1 then
					v18 = value1
					assert(v18 == value, `Duplicate state id {value.id}`)
					assert(value.type ~= "slot", `State {value.id} cannot be a slot`)
					assert(plain(value.initial, 0), `State {value.id} starts with plain data`)
					continue
				end
			end
			v18 = nil
		end
	end
	local Sequences = p16.sequences
	
	if Sequences then
		assert(p17.sequence ~= nil, `{p17.name} cannot play sequences`)
		local v19 = nil
		local Flag = nil
		local Flag1 = nil
		
		for _, sequence in Sequences do
			local Id: string = sequence.id
			assert(string.match(Id, "^%l[%w]*$") ~= nil, "Sequence ids are lower camel case")
			local v20 = false
			v19 = nil
			
			for _, input2 in p16.contract.inputs do
				if input2.id == Id then
					v19 = input2
					break
				end
			end
			if v19 == nil then
				Flag1 = false
				
				for _, output1 in p16.contract.outputs do
					if output1.id == Id then
						Flag1 = true
						break
					end
				end
				v20 = not Flag1
				
				if v20 then
					local State2 = p16.state
					local v21 = nil
					repeat
						if not State2 then break end
						for _, value2 in State2 do
							if value2.id == Id then
								v21 = value2
								break
							end
						end
						v21 = nil
					until true
					v20 = v21 == nil
				end
			end
			assert(v20, `Duplicate id {Id}`)
			local Sequences1 = p16.sequences
			local v22 = nil
			repeat
				if not Sequences1 then break end
				for _, sequence1 in Sequences1 do
					if sequence1.id == Id then
						v22 = sequence1
						break
					end
				end
				v22 = nil
			until true
			assert(v22 == sequence, `Duplicate sequence id {Id}`)
			assert(#sequence.steps > 0 and #sequence.steps <= 32, `Sequence {Id} holds 1 to 32 steps`)
			
			for _, step in sequence.steps do
				for _, value3 in { step.delay, step.duration, step.easing } do
					assert(type(value3) == "string" and string.match(value3, "^%a[%w]*$") ~= nil, `Sequence {Id} times steps with token names`)
				end
				local State1 = step.state
				assert(State1 == nil == (step.to == nil), `Sequence {Id} moves a state to a value`)
				local v23 = true
				repeat
					if State1 == nil then break end
					local State2 = p16.state
					local v24 = nil
					repeat
						if not State2 then break end
						for _, value5 in State2 do
							if value5.id == State1 then
								v24 = value5
								break
							end
						end
						v24 = nil
					until true
					v23 = v24 ~= nil
				until true
				assert(v23, `Sequence {Id} moves unknown state {State1}`)
				local To = step.to
				assert(To == nil or plain(To, 0), `Sequence {Id} moves state to plain data`)
				local Output = step.output
				Flag = true
				
				if Output ~= nil then
					Flag = false
					
					for _, output2 in p16.contract.outputs do
						if output2.id == Output then
							Flag = true
							break
						end
					end
				end
				assert(Flag, `Sequence {Id} calls unknown output {Output}`)
			end
		end
	end
	local t = {}
	IsNextIdAbove = 0
	local Largest = 0
	local t2 = {}
	local List = {}
	local Names = {}
	
	local function visit(Tbl, p18: number, p19, Enabled, Enabled1)
		-- upvalues: IsNextIdAbove (ref), t (copy), Names (copy), Largest (ref), p16 (copy), p17 (copy), present (upval), checkValue (upval), listOf (upval), cellsOf (upval), t2 (copy), List (copy), visit (copy)
		assert(p18 <= 32, "Designs nest at most 32 levels")
		IsNextIdAbove += 1
		assert(IsNextIdAbove <= 500, "A design holds at most 500 nodes")
		local Number: number? = tonumber(string.match(Tbl.id, "^n(%d+)$"))
		assert(Number ~= nil and (Enabled == true or not t[Tbl.id]), "Node ids must be unique")
		t[Tbl.id] = true
		Names[Tbl.id] = Tbl.name
		Largest = math.max(Largest, Number)
		
		if Tbl.slot then
			local Slot = Tbl.slot
			local v25 = nil
			
			for _, input in p16.contract.inputs do
				if input.id == Slot then
					v25 = input
					break
				end
			end
			local SlotChildrenNeedAnInput = assert(v25, "Slot children need an input")
			assert(SlotChildrenNeedAnInput.type == "slot" and SlotChildrenNeedAnInput.kind == "value", "Slot children need a slot input")
			assert(Tbl.kind == "$slot" and Tbl.name == Tbl.slot, "Slot children keep their input name")
			assert(Tbl ~= p16.root and (#Tbl.children == 0 and next(Tbl.props) == nil), "A slot is an ordinary child factory")
			assert(Tbl.bind == nil and (Tbl.when == nil and (Tbl.rowVariant == nil and (Tbl.tags == nil and (Tbl.tagBinding == nil and Tbl.nameField == nil)))) and Tbl.nameInput == nil, "Slot children carry only their input")
			
			return
		else
			local v26 = assert(p17.kinds[Tbl.kind], `Unknown {p17.name} kind {Tbl.kind}`)
			
			if v26.design then
				local v27 = nil
				for _, input1 in v26.design.contract.inputs do
					local Prop = Tbl.props[input1.id]
					
					if not Prop or not Prop.input or Prop.path ~= nil then
						if Prop and input1.kind ~= "value" then
							assert(Prop.input ~= nil or Prop.state ~= nil, `Imported Design input {input1.id} needs a readable or cell input`)
							continue
						end
						continue
					end
					local Input = Prop.input
					v27 = nil
					
					for _, input2 in p16.contract.inputs do
						if input2.id == Input then
							v27 = input2
							break
						end
					end
					local ImportedDesignInputIsUndeclared = assert(v27, "Imported Design input is undeclared")
					assert(ImportedDesignInputIsUndeclared.type == input1.type and ImportedDesignInputIsUndeclared.luauType == input1.luauType, `Imported Design input {input1.id} needs its declared type`)
					assert(ImportedDesignInputIsUndeclared.kind == input1.kind or input1.kind == "readable" and ImportedDesignInputIsUndeclared.kind == "cell", `Imported Design input {input1.id} needs its declared input kind`)
				end
			end
			assert(#Tbl.name > 0 and #Tbl.name <= 120, "A node needs a name")
			assert(Tbl.hidden == nil or type(Tbl.hidden) == "boolean", "Hidden is a boolean")
			assert(Tbl.locked == nil or type(Tbl.locked) == "boolean", "Locked is a boolean")
			
			if Tbl.tagBinding then
				assert(p17.tags ~= nil and Tbl.tags == nil, "Bound tags need library tags and replace fixed tags")
				local TagBinding = Tbl.tagBinding
				assert(present(TagBinding) == 1 and (if TagBinding.input == nil then TagBinding.item ~= nil and (TagBinding.motion == nil and TagBinding.path == nil) else TagBinding.motion == nil and TagBinding.path == nil), "Tags bind an input or item field")
				checkValue(p16, { type = "value" }, TagBinding, p19, "tags")
				local Type2 = nil
				local LuauType = nil
				
				if TagBinding.input then
					local Input = TagBinding.input
					local v28 = nil
					
					for _, input5 in p16.contract.inputs do
						if input5.id == Input then
							v28 = input5
							break
						end
					end
					local v29 = assert(v28)
					Type2 = v29.type
					LuauType = v29.luauType
				else
					local Fields = assert(p19).fields or {}
					for _, field in Fields do
						if field.id == TagBinding.item then
							Type2 = field.type
							LuauType = field.luauType
						end
					end
				end
				assert(Type2 == "string" or Type2 == "list" and LuauType ~= nil, "Tags need text or a list with a named string list type")
			end
			local NameField = Tbl.nameField
			
			if NameField ~= nil then
				local Fields = assert(p19, `{Tbl.name} takes its name from an item outside a collection template`).fields
				
				if Fields then
					local v30 = false
					
					for _, field1 in Fields do
						v30 = v30 or field1.id == NameField
					end
					assert(v30, `{Tbl.name} takes its name from unknown item field {NameField}`)
				end
			end
			local NameInput = Tbl.nameInput
			
			if NameInput ~= nil then
				assert(NameField == nil, `{Tbl.name} takes its name from one source`)
				local v31 = nil
				
				for _, input3 in p16.contract.inputs do
					if input3.id == NameInput then
						v31 = input3
						break
					end
				end
				local v32 = assert(v31, `{Tbl.name} takes its name from unknown input {NameInput}`)
				assert(v32.type == "string" and v32.kind == "value", `{Tbl.name} takes its name from {NameInput}, which is not a text value`)
			end
			local When = Tbl.when
			
			if When ~= nil then
				assert(p17.show ~= nil, `{p17.name} cannot show nodes conditionally`)
				assert(Tbl ~= p16.root, "The root is always shown")
				local v33 = nil
				
				for _, input4 in p16.contract.inputs do
					if input4.id == When then
						v33 = input4
						break
					end
				end
				local State = p16.state
				local v34 = nil
				repeat
					if State then
						for _, value1 in State do
							if value1.id == When then
								v34 = value1
								break
							end
						end
					end
					v34 = nil
				until true
				local Type1 = if v33 then v33.type elseif v34 then v34.type else nil
				local Fields = if p19 then p19.fields else nil
				
				if Type1 == nil and Fields ~= nil then
					for _, value in Fields do
						if value.id == When then
							Type1 = value.type
						end
					end
				end
				assert(Type1 == "boolean", `{Tbl.name} is shown by {When}, which is not a true or false input`)
			end
			local Bind2 = Tbl.bind
			local ListOfResult = if Bind2 then listOf(p16, Bind2.from, p19) else nil
			local t3 = {}
			
			for i, prop in Tbl.props do
				local v35 = assert(v26.fields[i], `{Tbl.kind} has no property {i}`)
				local Literal = prop.literal
				assert(not v35.perRow or ListOfResult ~= nil, `{i} needs the node to repeat a list`)
				checkValue(p16, v35, prop, if Literal == nil or ListOfResult == nil then p19 else ListOfResult, i)
				local Motion = prop.motion
				
				if Motion ~= nil then
					assert(table.find(assert(p17.motion, `{p17.name} has no motion roles`).roles, Motion) ~= nil, `{i} moves with unknown motion role {Motion}`)
					assert(prop.input ~= nil or prop.state ~= nil or prop.item ~= nil, `{i} moves only when it follows an input, state or item`)
					assert(v35.type ~= "event" and (v35.type ~= "content" and v35.type ~= "node"), `{i} cannot move`)
				end
				if Literal ~= nil then
					cellsOf(Literal, t3)
				end
				local Node = prop.node
				
				if Node ~= nil then
					t2[Node] = i
				end
				local Nodes = prop.nodes
				
				if Nodes then
					for _, node in Nodes do
						t2[node] = i
						table.insert(List, node)
					end
				end
			end
			local v36 = p19
			local v37 = nil
			local Id1 = nil
			local v38 = 0
			local t4 = {}
			
			for _, child2 in Tbl.children do
				t4[child2.id] = true
				
				if not t3[child2.id] then
					v38 += 1
				end
			end
			if v26.children == "none" then
				assert(v38 == 0 and Tbl.bind == nil, `{Tbl.kind} holds no children`)
			elseif v26.children == "slot" then
				assert(v38 <= 1 and Tbl.bind == nil, `{Tbl.kind} holds one content node`)
				assert(v26.slot ~= nil, `{Tbl.kind} names no content property`)
				assert(v38 == 0 or Tbl.props[v26.slot] == nil, `{Tbl.kind} already binds its content`)
			elseif v26.children == "template" then
				local Bind1 = Tbl.bind
				assert(v38 <= 1 or (v26.template == nil or Bind1 ~= nil and Bind1.row ~= nil), `{Tbl.kind} holds one row template`)
				
				if Bind1 then
					local v39 = assert(listOf(p16, Bind1.from, p19), `{Tbl.kind} binds unknown input {Bind1.from}`)
					assert(v39.type == "list", `{Tbl.kind} binds {Bind1.from}, which is not a list`)
					local IsValue = not v26.staticRows
					
					if not IsValue then
						IsValue = true
						
						if v39.kind ~= "value" then
							IsValue = false
							local From = Bind1.from
							local v40 = nil
							
							for _, input6 in p16.contract.inputs do
								if input6.id == From then
									v40 = input6
									break
								end
							end
							if v40 == nil then
								IsValue = p19 ~= nil and p19.kind == "value"
							end
						end
					end
					assert(IsValue, `{Tbl.kind} repeats value lists`)
					assert(#Bind1.key > 0, `{Tbl.kind} needs an item key`)
					local Row = Bind1.row
					
					if Row == nil then
						v36 = v39
					else
						assert(t4[Row], `{Tbl.kind} repeats unknown row {Row}`)
						v37 = v39
						Id1 = Row
					end
				else
					local Iteration = v26.iteration
					
					if Iteration then
						v36 = {
							kind = "value",
							type = "list",
							id = Tbl.id,
							fields = Iteration.fields
						}
						local v41 = nil
						
						for _, prop1 in Tbl.props do
							if prop1.input then
								local Input = prop1.input
								v41 = nil
								
								for _, input7 in p16.contract.inputs do
									if input7.id == Input then
										v41 = input7
										break
									end
								end
							else
								v41 = nil
							end
							assert(v41 == nil or v41.kind == "value", `{Tbl.kind} geometry inputs are values`)
						end
					else
						assert(#Tbl.children == 0, `{Tbl.kind} needs a list input for its template`)
					end
				end
			else
				local Bind = Tbl.bind
				
				if Bind then
					assert(p17.keyed ~= nil, `{p17.name} cannot repeat children`)
					local v42 = assert(listOf(p16, Bind.from, p19), `{Tbl.kind} binds unknown input {Bind.from}`)
					assert(v42.type == "list", `{Tbl.kind} binds {Bind.from}, which is not a list`)
					assert(#Bind.key > 0, `{Tbl.kind} needs an item key`)
					local Row = Bind.row
					
					if Row == nil then
						assert(v38 == 1, `{Tbl.kind} repeats exactly one row template`)
					else
						assert(t4[Row], `{Tbl.kind} repeats unknown row {Row}`)
					end
					v37 = v42
					local Id = nil
					
					for _, child1 in Tbl.children do
						if Id == nil and not t3[child1.id] then
							Id = child1.id
						end
					end
					Id1 = Row or Id
				end
			end
			for i1 in t3 do
				assert(t4[i1], `{Tbl.name} renders unknown cell {i1}`)
			end
			for _, child in Tbl.children do
				if t3[child.id] then
					visit(child, p18 + 1, ListOfResult or p19, nil, ListOfResult ~= nil)
				else
					local IsIdMatch: boolean = v37 ~= nil and child.id == Id1
					assert(child.slot == nil or v26.children == "list" and (not IsIdMatch and Tbl.bind == nil), "Slot factories are ordinary layout children")
					assert(child.when == nil or v26.children == "list" and not IsIdMatch, `{child.name} is shown conditionally only inside a list container, outside its row`)
					visit(child, p18 + 1, if IsIdMatch then v37 else v36, nil, IsIdMatch or v26.children == "template" and (if Tbl.bind == nil then v26.iteration ~= nil else Tbl.bind.row == nil or v26.iteration ~= nil))
				end
			end
			local RowVariant = Tbl.rowVariant
			
			if RowVariant then
				assert(Enabled1 == true, "Row variants belong to the root of a row template")
				local Options = nil
				local Fields = assert(p19, "Row variants need a collection item").fields or {}
				for _, field2 in Fields do
					if field2.id == RowVariant.item and field2.type == "string" then
						Options = field2.options
					end
				end
				local RowVariantsNeedADeclaredTextEnumField = assert(Options, "Row variants need a declared text enum field")
				assert(#RowVariant.cases > 0 and #RowVariant.cases < #RowVariantsNeedADeclaredTextEnumField, "Row variants keep a default enum option")
				local t5 = {}
				
				for _, cas in RowVariant.cases do
					assert(table.find(RowVariantsNeedADeclaredTextEnumField, cas.value) ~= nil and not t5[cas.value], "Row variants select distinct enum options")
					t5[cas.value] = true
					local Copy = table.clone(Tbl)
					Copy.rowVariant = nil
					local Props = cas.props
					local Children = cas.children
					Copy.kind = cas.kind
					Copy.props = Props
					Copy.children = Children
					visit(Copy, p18, p19, true)
				end
			end
		end
	end
	
	visit(p16.root, 0, nil)
	local RootVariant = p16.rootVariant
	
	if RootVariant and RootVariant.children then
		for _, child in RootVariant.children do
			visit(child, 1, nil)
		end
	end
	assert(Largest < p16.nextId, "Next node id must exceed every node id")
	
	for i, value4 in t2 do
		assert(t[i], `{value4} references unknown node {i}`)
	end
	local t3 = {}
	
	for _, value6 in List do
		local Text: string = assert(Names[value6])
		assert(string.match(Text, "^[%a_][%w_]*$") ~= nil, `{Text} must be a Luau name to be chosen by a reference`)
		assert(t3[Text] == nil or t3[Text] == value6, `Two chosen nodes share the name {Text}`)
		t3[Text] = value6
	end
	if RootVariant then
		local Input = RootVariant.input
		local v43 = nil
		
		for _, input1 in p16.contract.inputs do
			if input1.id == Input then
				v43 = input1
				break
			end
		end
		local ARootVariantNeedsAnEnumInput = assert(v43, "A root variant needs an enum input")
		assert(ARootVariantNeedsAnEnumInput.kind == "value" and (ARootVariantNeedsAnEnumInput.type == "string" and ARootVariantNeedsAnEnumInput.required == true) and ARootVariantNeedsAnEnumInput.options ~= nil, "A root variant needs a required static text enum")
		assert(table.find(assert(ARootVariantNeedsAnEnumInput.options), RootVariant.value) ~= nil, "A root variant value must be an enum option")
		local Root = p16.root
		local v44 = assert(p17.kinds[Root.kind])
		local v45 = assert(p17.kinds[RootVariant.kind], `Unknown {p17.name} kind {RootVariant.kind}`)
		assert(if v44.children == "list" then v45.children == "list" or v45.children == "slot" else v44.children == "slot" and (v45.children == "list" or v45.children == "slot"), "Root variants need list or slot kinds")
		assert(Root.bind == nil, "Root variants cannot repeat the root")
		
		if RootVariant.children == nil then
			assert(#Root.children == 1 and Root.children[1].when == nil, "Root variants without children share one unconditional content node")
		end
		local DocumentResult = DocumentFunction(p16)
		local v46 = assert(DocumentResult.rootVariant)
		DocumentResult.rootVariant = nil
		DocumentResult.root.kind = RootVariant.kind
		DocumentResult.root.props = v46.props
		DocumentResult.root.children = v46.children or DocumentResult.root.children
		DocumentModule.validate(DocumentResult, p17)
	end
	return p16
end

function DocumentModule.setRootVariant(p20, p21, RootVariant)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy)
	local DocumentResult = DocumentFunction(p20)
	DocumentResult.rootVariant = RootVariant
	
	return DocumentModule.validate(DocumentFunction(DocumentResult), p21)
end

function DocumentModule.setRowVariant(p20, p21, Id, RowVariant)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy)
	local DocumentResult = DocumentFunction(p20)
	assert(DocumentModule.find(DocumentResult.root, Id), "Choose a row node").rowVariant = RowVariant
	
	return DocumentModule.validate(DocumentFunction(DocumentResult), p21)
end

local function defaults(p20)
	-- upvalues: LiteralFunction (copy)
	local t = {}
	local Defaults = p20.defaults
	
	if Defaults then
		for i, default in Defaults do
			t[i] = { literal = LiteralFunction(default) }
		end
	end
	return t
end

function DocumentModule.new(Name, p21, Kind)
	-- upvalues: defaults (copy)
	return {
		schema = "compose-design/1",
		nextId = 2,
		name = Name,
		library = p21.name,
		contract = { inputs = {}, outputs = {} },
		root = {
			id = "n1",
			kind = Kind,
			name = Kind,
			props = defaults((assert(p21.kinds[Kind], `Unknown {p21.name} kind {Kind}`))),
			children = {}
		}
	}
end

function DocumentModule.find(Tbl, Id)
	-- upvalues: DocumentModule (copy)
	if Tbl.id == Id then
		return Tbl, nil, nil
	end
	local FindResult = nil
	local FindResult2 = nil
	local FindResult3 = nil
	for i, child in Tbl.children do
		if child.id == Id then
			return child, Tbl, i
		end
		FindResult, FindResult2, FindResult3 = DocumentModule.find(child, Id)
		
		if FindResult then
			return FindResult, FindResult2, FindResult3
		end
	end
	if Tbl.rowVariant then
		local FindResult1 = nil
		local FindResult2_1 = nil
		local FindResult3_1 = nil
		local Copy = nil
		for _, cas in Tbl.rowVariant.cases do
			Copy = table.clone(Tbl)
			Copy.rowVariant = nil
			Copy.children = cas.children
			
			for i1, child1 in cas.children do
				if child1.id == Id then
					return child1, Copy, i1
				end
				FindResult1, FindResult2_1, FindResult3_1 = DocumentModule.find(child1, Id)
				
				if FindResult1 then
					return FindResult1, FindResult2_1, FindResult3_1
				end
			end
		end
	end
	return nil, nil, nil
end

function DocumentModule.nodes(Node)
	local List = {}
	
	local function visit(Node, Depth: number)
		-- upvalues: List (copy), visit (copy)
		table.insert(List, { node = Node, depth = Depth })
		
		for _, child in Node.children do
			visit(child, Depth + 1)
		end
		if Node.rowVariant then
			for _, cas in Node.rowVariant.cases do
				for _, child1 in cas.children do
					visit(child1, Depth + 1)
				end
			end
		end
	end
	
	visit(Node, 0)
	
	return List
end

function DocumentModule.nameFrom(p21, p22, Id, NameField)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy)
	local DocumentResult = DocumentFunction(p21)
	assert(DocumentModule.find(DocumentResult.root, Id), "Choose a node").nameField = NameField
	
	return DocumentModule.validate(DocumentResult, p22)
end

function DocumentModule.insert(p21, p22, Id, Kind, p23)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy), defaults (copy), LiteralFunction (copy)
	local DocumentResult = DocumentFunction(p21)
	local ChooseAContainer = assert(DocumentModule.find(DocumentResult.root, Id), "Choose a container")
	local v47 = assert(p22.kinds[ChooseAContainer.kind])
	assert(v47.children == "list" or ((v47.children == "template" or v47.children == "slot") and #ChooseAContainer.children == 0 or (v47.children == "template" and v47.template == nil or v47.children == "template" and (ChooseAContainer.bind ~= nil and ChooseAContainer.bind.row ~= nil))), `{ChooseAContainer.kind} cannot take this node`)
	
	local function create(p24)
		-- upvalues: p22 (copy), DocumentResult (copy), defaults (upval), LiteralFunction (upval), create (copy)
		local v48 = assert(p22.kinds[p24.kind], `Unknown {p22.name} kind {p24.kind}`)
		local config = {
			id = `n{DocumentResult.nextId}`,
			kind = p24.kind,
			name = p24.kind,
			props = defaults(v48),
			children = {}
		}
		DocumentResult.nextId += 1
		local Props = p24.props
		
		if Props then
			for i, prop in Props do
				config.props[i] = { literal = LiteralFunction(prop) }
			end
		end
		local Children = p24.children or v48.seeds
		
		if Children then
			for _, child in Children do
				table.insert(config.children, create(child))
			end
		end
		return config
	end
	
	local CreateResult = create({ kind = Kind })
	
	if v47.children == "slot" and v47.slot then
		ChooseAContainer.props[v47.slot] = nil
	end
	table.insert(ChooseAContainer.children, math.clamp(p23 or #ChooseAContainer.children + 1, 1, #ChooseAContainer.children + 1), CreateResult)
	
	return DocumentModule.validate(DocumentResult, p22), CreateResult.id
end

function DocumentModule.applies(ChooseANode, Kind, p25): boolean
	local Field = Kind.fields[p25]
	local Requires = if Field then Field.requires else nil
	
	if Requires == nil then
		return true
	end
	for i, _require in Requires do
		local Prop = ChooseANode.props[i]
		local Defaults = Kind.defaults
		local Field1 = Kind.fields[i]
		local Literal = if Prop then Prop.literal elseif Defaults and Defaults[i] ~= nil then Defaults[i] elseif Field1 then Field1.default else nil
		
		if (Prop == nil or Literal ~= nil) and (Literal == nil or #_require > 0 and table.find(_require, Literal) == nil) then
			return false
		end
	end
	return true
end

local function changeProperty(ChooseANode, Kind, Slot, p26)
	-- upvalues: cellsOf (copy), ValueFunction (copy)
	local Prop = ChooseANode.props[Slot]
	local CellsOfResult = if Prop and Prop.literal ~= nil then cellsOf(Prop.literal, {}) else {}
	
	if p26 and Kind and Kind.children == "slot" and Slot == Kind.slot then
		for _, child in ChooseANode.children do
			CellsOfResult[child.id] = true
		end
	end
	if p26 then
		ChooseANode.props[Slot] = ValueFunction(p26)
	else
		ChooseANode.props[Slot] = nil
	end
	if next(CellsOfResult) ~= nil then
		local t = {}
		
		for _, prop in ChooseANode.props do
			if prop.literal ~= nil then
				cellsOf(prop.literal, t)
			end
		end
		for i = #ChooseANode.children, 1, -1 do
			local Id = ChooseANode.children[i].id
			
			if CellsOfResult[Id] and not t[Id] then
				table.remove(ChooseANode.children, i)
			end
		end
	end
end

function DocumentModule.content(p27, p28, Id, p29, Kind)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy), defaults (copy), changeProperty (copy)
	local DocumentResult = DocumentFunction(p27)
	local ChooseANode = assert(DocumentModule.find(DocumentResult.root, Id), "Choose a node")
	local v49 = assert(p28.kinds[ChooseANode.kind])
	local v50 = assert(v49.fields[p29], `{ChooseANode.kind} has no property {p29}`)
	assert(v50.type == "content" or v50.type == "value" and not v50.perRow, `{p29} does not hold content`)
	local v51 = assert(p28.kinds[Kind], `Unknown {p28.name} kind {Kind}`)
	local Text: string = `n{DocumentResult.nextId}`
	DocumentResult.nextId += 1
	table.insert(ChooseANode.children, {
		id = Text,
		kind = Kind,
		name = Kind,
		props = defaults(v51),
		children = {}
	})
	changeProperty(ChooseANode, v49, p29, { literal = { ["$template"] = Text } })
	
	return DocumentModule.validate(DocumentResult, p28), Text
end

function DocumentModule.change(p27, p28, Id, p29, p30)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy), changeProperty (copy)
	local DocumentResult = DocumentFunction(p27)
	local ChooseANode = assert(DocumentModule.find(DocumentResult.root, Id), "Choose a node")
	local Kind = p28.kinds[ChooseANode.kind]
	changeProperty(ChooseANode, Kind, p29, p30)
	
	if Kind then
		local Requires = if Kind.fields[p29] then Kind.fields[p29].requires else nil
		
		if p30 and Requires and not DocumentModule.applies(ChooseANode, Kind, p29) then
			local List = {}
			
			for i, _require in Requires do
				local List1 = {}
				
				for _, value in _require do
					table.insert(List1, (tostring(value)))
				end
				table.insert(List, if #List1 > 0 then `{i} is {table.concat(List1, " or ")}` else `{i} is set`)
			end
			table.sort(List)
			error(`{p29} applies only when {table.concat(List, " and ")}`, 0)
		end
		local Flag = true
		while Flag do
			Flag = false
			
			for prop in ChooseANode.props do
				if not DocumentModule.applies(ChooseANode, Kind, prop) then
					ChooseANode.props[prop] = nil
					Flag = true
				end
			end
		end
	end
	return DocumentModule.validate(DocumentResult, p28)
end

function DocumentModule.tag(p31, p32, Id, Tbl)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy)
	assert(Tbl == nil or p32.tags ~= nil, `{p32.name} has no tags`)
	local DocumentResult = DocumentFunction(p31)
	local ChooseANode = assert(DocumentModule.find(DocumentResult.root, Id), "Choose a node")
	
	if Tbl ~= nil then
		for _, value in Tbl do
			assert(type(value) == "string" and string.match(value, "^[%w_%-]+$"), "A tag is letters, digits, - and _")
		end
	end
	ChooseANode.tags = if Tbl == nil or #Tbl <= 0 then nil else table.clone(Tbl)
	ChooseANode.tagBinding = nil
	
	return DocumentModule.validate(DocumentResult, p32)
end

function DocumentModule.bindTags(p33, p34, Id, p35)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy), ValueFunction (copy)
	local DocumentResult = DocumentFunction(p33)
	local ChooseANode = assert(DocumentModule.find(DocumentResult.root, Id), "Choose a node")
	ChooseANode.tags = nil
	ChooseANode.tagBinding = if p35 then ValueFunction(p35) else nil
	
	return DocumentModule.validate(DocumentResult, p34)
end

function DocumentModule.insertSlot(p33, p34, Id, Name, p35)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy)
	local DocumentResult = DocumentFunction(p33)
	local ChooseAContainer = assert(DocumentModule.find(DocumentResult.root, Id), "Choose a container")
	assert(assert(p34.kinds[ChooseAContainer.kind]).children == "list", "Slot children need a list container")
	local Text: string = `n{DocumentResult.nextId}`
	DocumentResult.nextId += 1
	table.insert(ChooseAContainer.children, math.clamp(p35 or #ChooseAContainer.children + 1, 1, #ChooseAContainer.children + 1), {
		kind = "$slot",
		id = Text,
		name = Name,
		slot = Name,
		props = {},
		children = {}
	})
	
	return DocumentModule.validate(DocumentResult, p34), Text
end

function DocumentModule.rename(p33, p34, Id, Name)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy)
	local DocumentResult = DocumentFunction(p33)
	assert(DocumentModule.find(DocumentResult.root, Id), "Choose a node").name = Name
	
	return DocumentModule.validate(DocumentResult, p34)
end

function DocumentModule.bind(p33, p34, Id, p35)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy)
	local DocumentResult = DocumentFunction(p33)
	assert(DocumentModule.find(DocumentResult.root, Id), "Choose a node").bind = if p35 then { from = p35.from, key = p35.key, row = p35.row } else nil
	
	return DocumentModule.validate(DocumentResult, p34)
end

function DocumentModule.remove(p33, p34, Id)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy)
	local DocumentResult = DocumentFunction(p33)
	local _, FindResult2, FindResult3 = DocumentModule.find(DocumentResult.root, Id)
	assert(FindResult2 and FindResult3, "The root cannot be removed")
	table.remove(FindResult2.children, FindResult3)
	
	return DocumentModule.validate(DocumentResult, p34)
end

function DocumentModule.move(p33, p34, Id, Id1, p35)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy)
	local DocumentResult = DocumentFunction(p33)
	local FindResult, FindResult2, FindResult3 = DocumentModule.find(DocumentResult.root, Id)
	assert(FindResult and (FindResult2 and FindResult3), "The root cannot move")
	assert(DocumentModule.find(FindResult, Id1) == nil, "A node cannot move into itself")
	local ChooseAContainer = assert(DocumentModule.find(DocumentResult.root, Id1), "Choose a container")
	table.remove(FindResult2.children, FindResult3)
	table.insert(ChooseAContainer.children, math.clamp(p35 or #ChooseAContainer.children + 1, 1, #ChooseAContainer.children + 1), FindResult)
	
	return DocumentModule.validate(DocumentResult, p34)
end

function DocumentModule.duplicate(p33, p34, Id)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy), NodeFunction (copy)
	local DocumentResult = DocumentFunction(p33)
	local FindResult, FindResult2, FindResult3 = DocumentModule.find(DocumentResult.root, Id)
	assert(FindResult and (FindResult2 and FindResult3), "The root cannot be duplicated")
	local NodeResult = NodeFunction(FindResult)
	
	for _, value in DocumentModule.nodes(NodeResult) do
		value.node.id = `n{DocumentResult.nextId}`
		DocumentResult.nextId += 1
	end
	table.insert(FindResult2.children, FindResult3 + 1, NodeResult)
	
	return DocumentModule.validate(DocumentResult, p34), NodeResult.id
end

function DocumentModule.paste(p35, p36, p37, Id, p38)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy), NodeFunction (copy)
	local DocumentResult = DocumentFunction(p35)
	local ChooseAContainer = assert(DocumentModule.find(DocumentResult.root, Id), "Choose a container")
	local NodeResult = NodeFunction(p37)
	
	for _, value in DocumentModule.nodes(NodeResult) do
		value.node.id = `n{DocumentResult.nextId}`
		DocumentResult.nextId += 1
	end
	table.insert(ChooseAContainer.children, math.clamp(p38 or #ChooseAContainer.children + 1, 1, #ChooseAContainer.children + 1), NodeResult)
	
	return DocumentModule.validate(DocumentResult, p36), NodeResult.id
end

function DocumentModule.setContract(p39, p40, p41)
	-- upvalues: DocumentFunction (copy), ContractFunction (copy), DocumentModule (copy)
	local DocumentResult = DocumentFunction(p39)
	DocumentResult.contract = ContractFunction(p41)
	
	return DocumentModule.validate(DocumentResult, p40)
end

function DocumentModule.nameFromInput(p39, p40, Id, NameInput)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy)
	local DocumentResult = DocumentFunction(p39)
	assert(DocumentModule.find(DocumentResult.root, Id), "Choose a node").nameInput = NameInput
	
	return DocumentModule.validate(DocumentResult, p40)
end

function DocumentModule.showWhen(p39, p40, Id, When)
	-- upvalues: DocumentFunction (copy), DocumentModule (copy)
	local DocumentResult = DocumentFunction(p39)
	assert(DocumentModule.find(DocumentResult.root, Id), "Choose a node").when = When
	
	return DocumentModule.validate(DocumentResult, p40)
end

function DocumentModule.setSequences(p39, p40, p41)
	-- upvalues: DocumentFunction (copy), SequencesFunction (copy), DocumentModule (copy)
	local DocumentResult = DocumentFunction(p39)
	DocumentResult.sequences = if p41 == nil or #p41 <= 0 then nil else SequencesFunction(p41)
	
	return DocumentModule.validate(DocumentResult, p40)
end

function DocumentModule.setState(p39, p40, p41)
	-- upvalues: DocumentFunction (copy), StateFunction (copy), DocumentModule (copy)
	local DocumentResult = DocumentFunction(p39)
	DocumentResult.state = StateFunction(p41)
	
	return DocumentModule.validate(DocumentResult, p40)
end

return DocumentModule
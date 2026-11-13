local _ = require("./types")
local DocumentModule = require("./document")
local SourceReadModule = require("./source-read")
local DatatypeModule = require("./datatype")

local function before(A, B): boolean
	return if type(A) == "number" and type(B) == "number" then A < B elseif type(A) == "string" and type(B) == "string" then A < B else type(A) == "number"
end

local function _(List)
	-- upvalues: before (copy)
	local List1 = {}
	
	for i in List do
		table.insert(List1, i)
	end
	table.sort(List1, before)
	
	return List1
end

local function prefix(Text: string, p1): string
	return if Text == p1 then "" elseif type(Text) == "string" and string.match(Text, "^[%a_][%w_]*$") then Text .. " = " else "[" .. (if type(Text) == "string" then string.format("%q", Text) else tostring(Text)) .. "] = "
end

local function literal(Name): string
	-- upvalues: before (copy), prefix (copy), literal (copy)
	if type(Name) == "string" then
		return string.format("%q", Name)
	end
	if type(Name) == "number" or type(Name) == "boolean" then
		return (tostring(Name))
	end
	local List = {}
	
	for i in Name do
		table.insert(List, i)
	end
	table.sort(List, before)
	
	if #List == 0 then
		return "{}"
	end
	local List1 = {}
	
	for i1, value in List do
		table.insert(List1, prefix(value, i1) .. literal(Name[value]))
	end
	return "{ " .. table.concat(List1, ", ") .. " }"
end

local _ = function(p1)
	-- upvalues: literal (copy), before (copy), prefix (copy)
	local function lay(List, Count: number, p2)
		-- upvalues: literal (upval), before (upval), prefix (upval), lay (copy)
		if type(List) ~= "table" then
			return literal(List)
		end
		local v1 = literal(List)
		
		if v1 == "{}" or p2 + #v1 <= 120 then
			return v1
		end
		local List1 = { "{" }
		local List2 = {}
		
		for i in List do
			table.insert(List2, i)
		end
		table.sort(List2, before)
		
		for i1, value in List2 do
			local v2 = prefix(value, i1)
			table.insert(List1, string.rep("\t", Count + 1) .. v2 .. lay(List[value], Count + 1, (Count + 1) * 4 + #v2 + 1) .. ",")
		end
		table.insert(List1, string.rep("\t", Count) .. "}")
		
		return table.concat(List1, "\n")
	end
	
	return lay(p1, 0, 16)
end

local _ = function(p3, Text1): string
	-- upvalues: literal (copy)
	local Text: string = assert(p3.token, `{p3.name} has no theme tokens`)
	
	return if string.sub(Text, -1) == "." then Text .. Text1 else `{Text} {literal(Text1)}`
end

local function datatypeLiteral(p3, p4, Text: string, Entry: string, Count: number): string
	-- upvalues: literal (copy), DatatypeModule (copy), DocumentModule (copy)
	if string.sub(Text, 1, 5) == "Enum." then
		return `{Text}.{tostring(Entry)}`
	end
	if Text == "Color3" and type(Entry) == "string" then
		return `Color3.fromHex {literal((string.gsub(Entry, "^#", "")))}`
	end
	local List = {}
	local v3 = false
	
	local function _(p5)
		-- upvalues: v3 (ref), Count (copy)
		return if v3 then `function(use)\n{string.rep("\t", Count + 1)}return {p5}\n{string.rep("\t", Count)}end` else p5
	end
	
	if type(Entry) == "table" then
		for _, value in Entry do
			local Ken = DatatypeModule.token(value)
			local InputResult = DatatypeModule.input(value)
			local Text3 = nil
			
			if Ken then
				local Text1: string = assert(p4.token, `{p4.name} has no theme tokens`)
				Text3 = if string.sub(Text1, -1) == "." then Text1 .. Ken else `{Text1} {literal(Ken)}`
			else
				Text3 = literal(value)
			end
			if InputResult then
				local IsNotValue = assert(DocumentModule.input(p3, InputResult)).kind ~= "value"
				v3 = v3 or IsNotValue
				Text3 = if IsNotValue then `use(props.{InputResult})` else `props.{InputResult}`
			end
			table.insert(List, Text3)
		end
		if Text ~= "UDim2" then
			if Text == "Vector2" or Text == "Vector3" then
				for _, value1 in { "zero", "one" } do
					local Flag = true
					
					for _, value2 in Entry do
						Flag = Flag and value2 == (if value1 == "zero" then 0 else 1)
					end
					if Flag then
						return `{Text}.{value1}`
					end
				end
			end
		elseif Entry[1] == 0 and Entry[3] == 0 then
			local FromOffsetName: string = `UDim2.fromOffset({List[2]}, {List[4]})`
			
			return if v3 then `function(use)\n{string.rep("\t", Count + 1)}return {FromOffsetName}\n{string.rep("\t", Count)}end` else FromOffsetName
		elseif Entry[2] == 0 and Entry[4] == 0 then
			local FromScaleName: string = `UDim2.fromScale({List[1]}, {List[3]})`
			
			return if v3 then `function(use)\n{string.rep("\t", Count + 1)}return {FromScaleName}\n{string.rep("\t", Count)}end` else FromScaleName
		end
	end
	local Text2: string = `{Text}.new({table.concat(List, ", ")})`
	
	return if v3 then `function(use)\n{string.rep("\t", Count + 1)}return {Text2}\n{string.rep("\t", Count)}end` else Text2
end

local function fieldsLiteral(Fields)
	-- upvalues: fieldsLiteral (copy)
	local t = {}
	
	for _, field in Fields do
		local Fields1 = field.fields
		t[#t + 1] = {
			id = field.id,
			type = field.type,
			luauType = field.luauType,
			options = if field.options then table.clone(field.options) else nil,
			fields = if Fields1 then fieldsLiteral(Fields1) else nil
		}
	end
	return t
end

local function contractLiteral(Contract)
	-- upvalues: fieldsLiteral (copy)
	local Inputs = {}
	
	for _, input in Contract.inputs do
		local Fields = input.fields
		local config = {
			id = input.id,
			kind = input.kind,
			type = input.type,
			luauType = input.luauType,
			preview = input.preview,
			required = if input.required then true else nil,
			fields = if Fields then fieldsLiteral(Fields) else nil
		}
		
		if input.options then
			local Options = {}
			
			for i, option in input.options do
				Options[i] = option
			end
			config.options = Options
		end
		Inputs[#Inputs + 1] = config
	end
	local Outputs = {}
	
	for _, output in Contract.outputs do
		local config = { id = output.id, row = output.row }
		local Args = output.args
		
		if Args then
			local Args1 = {}
			
			for i1, arg in Args do
				Args1[i1] = arg
			end
			config.args = Args1
		end
		Outputs[#Outputs + 1] = config
	end
	return { inputs = Inputs, outputs = Outputs }
end

local function stateLiteral(State)
	local t = {}
	
	for i, value in State do
		t[i] = {
			id = value.id,
			type = value.type,
			initial = value.initial
		}
	end
	return t
end

local function sequencesLiteral(Sequences)
	local t = {}
	
	for i, sequence in Sequences do
		local Steps = {}
		
		for i1, step in sequence.steps do
			Steps[i1] = {
				delay = step.delay,
				duration = step.duration,
				easing = step.easing,
				state = step.state,
				output = step.output,
				to = step.to
			}
		end
		t[i] = {
			id = sequence.id,
			steps = Steps,
			autoplay = if sequence.autoplay then true else nil
		}
	end
	return t
end

local _ = function(p5, p6): string
	return if p6 == "number" then "number" elseif p6 == "boolean" then "boolean" elseif p6 == "vector3" then "{ number }" elseif p6 == "list" then "{ { [string]: unknown } }" elseif p6 == "record" then "{ [string]: unknown }" elseif p6 == "slot" then `() -> {p5.returnType}` else "string"
end

local function enumType(Options): string?
	-- upvalues: literal (copy)
	if Options == nil then
		return nil
	end
	local List = {}
	
	for _, option in Options do
		table.insert(List, literal(option))
	end
	return table.concat(List, " | ")
end

local function flatRowType(p5, Fields): string
	-- upvalues: enumType (copy), flatRowType (copy)
	local List = {}
	
	for _, field in Fields do
		local EnumTypeResult = enumType(field.options)
		
		if EnumTypeResult == nil then
			EnumTypeResult = field.luauType
		end
		local Fields1 = field.fields
		
		if EnumTypeResult == nil and Fields1 ~= nil and #Fields1 > 0 then
			local FlatRowTypeResult = flatRowType(p5, Fields1)
			EnumTypeResult = if field.type == "list" then "{ " .. FlatRowTypeResult .. " }" else FlatRowTypeResult
		end
		local v4 = "%*: %*"
		local Id = field.id
		local Number: string = EnumTypeResult
		
		if not Number then
			local Type = field.type
			Number = if Type == "number" then "number" elseif Type == "boolean" then "boolean" elseif Type == "vector3" then "{ number }" elseif Type == "list" then "{ { [string]: unknown } }" elseif Type == "record" then "{ [string]: unknown }" elseif Type == "slot" then `() -> {p5.returnType}` else "string"
		end
		table.insert(List, (v4:format(Id, Number)))
	end
	return "{ " .. table.concat(List, ", ") .. " }"
end

local function rowType(p6, Fields, p7, Count1)
	-- upvalues: flatRowType (copy), enumType (copy), rowType (copy)
	local Count = p7 or 0
	local FlatRowTypeResult = flatRowType(p6, Fields)
	
	if (Count1 or 0) + #FlatRowTypeResult <= 120 then
		return FlatRowTypeResult
	end
	local List = { "{" }
	
	for _, field in Fields do
		local Text = string.rep("\t", Count + 1) .. field.id .. ": "
		local EnumTypeResult = enumType(field.options)
		
		if EnumTypeResult == nil then
			EnumTypeResult = field.luauType
		end
		local Fields1 = field.fields
		
		if EnumTypeResult == nil and Fields1 ~= nil and #Fields1 > 0 then
			local RowTypeResult = rowType(p6, Fields1, Count + 1, (Count + 1) * 4 + #field.id + 3 + (if field.type == "list" then 2 else 0))
			EnumTypeResult = if field.type == "list" then "{ " .. RowTypeResult .. " }" else RowTypeResult
		end
		local Number: string = EnumTypeResult
		
		if not Number then
			local Type = field.type
			Number = if Type == "number" then "number" elseif Type == "boolean" then "boolean" elseif Type == "vector3" then "{ number }" elseif Type == "list" then "{ { [string]: unknown } }" elseif Type == "record" then "{ [string]: unknown }" elseif Type == "slot" then `() -> {p6.returnType}` else "string"
		end
		table.insert(List, Text .. Number .. ",")
	end
	table.insert(List, string.rep("\t", Count) .. "}")
	
	return table.concat(List, "\n")
end

local _ = function(p8): string
	return string.upper((string.sub(p8.id, 1, 1))) .. string.sub(p8.id, 2) .. "Item"
end

local function base(p8, p9)
	-- upvalues: literal (copy), rowType (copy)
	if p9.type == "slot" then
		return `() -> {p9.luauType or p8.returnType}`
	end
	if p9.options then
		local List = {}
		
		for _, option in p9.options do
			table.insert(List, literal(option))
		end
		return table.concat(List, " | ")
	else
		if p9.luauType ~= nil then
			return p9.luauType
		end
		local Fields = p9.fields
		
		if Fields and #Fields > 0 then
			if p9.type == "list" then
				return "{ " .. (string.upper((string.sub(p9.id, 1, 1))) .. string.sub(p9.id, 2) .. "Item") .. " }"
			elseif p9.type == "record" then
				return rowType(p8, Fields)
			end
		end
		local Type = p9.type
		
		return if Type == "number" then "number" elseif Type == "boolean" then "boolean" elseif Type == "vector3" then "{ number }" elseif Type == "list" then "{ { [string]: unknown } }" elseif Type == "record" then "{ [string]: unknown }" elseif Type == "slot" then `() -> {p8.returnType}` else "string"
	end
end

local function outputType(p10, p11, Contract): string
	local Row = p11.row
	
	if Row ~= nil then
		for _, input in Contract.inputs do
			if input.id == Row then
				return `({string.upper((string.sub(input.id, 1, 1))) .. string.sub(input.id, 2) .. "Item"}) -> ()`
			end
		end
	end
	local Args = p11.args
	
	if Args == nil then
		return "(...unknown) -> ()"
	end
	local List = {}
	
	for _, arg in Args do
		table.insert(List, if arg == "number" then "number" elseif arg == "boolean" then "boolean" elseif arg == "vector3" then "{ number }" elseif arg == "list" then "{ { [string]: unknown } }" elseif arg == "record" then "{ [string]: unknown }" elseif arg == "slot" then `() -> {p10.returnType}` else "string")
	end
	return "(" .. table.concat(List, ", ") .. ") -> ()"
end

local function fieldType(p12, p13)
	-- upvalues: base (copy)
	local BaseResult = base(p12, p13)
	
	return if p13.kind == "readable" then `{p12.readable}<{BaseResult}>` elseif p13.kind == "cell" then `{p12.cell}<{BaseResult}>` elseif p13.type == "slot" and not p13.required then `({BaseResult})` else BaseResult
end

return {
	parse = SourceReadModule.parse,
	parseLiteral = SourceReadModule.parseLiteral,
	literal = literal,
	emit = function(p12, p13, p14): string
		-- upvalues: DocumentModule (copy), SourceReadModule (copy), rowType (copy), fieldType (copy), outputType (copy), contractLiteral (copy), stateLiteral (copy), sequencesLiteral (copy), literal (copy), before (copy), prefix (copy), datatypeLiteral (copy)
		local Name = if p14 then p14.name else nil
		
		if Name ~= nil then
			assert(string.match(Name, "^[%a_][%w_]*$") ~= nil, "A component name is a Luau identifier")
		end
		DocumentModule.validate(p12, p13)
		local Controls = if p14 then p14.controls else nil
		local PropsType = if p14 then p14.propsType else nil
		local List = { "--!strict", "" }
		
		for _, value in p13.prelude do
			table.insert(List, value)
		end
		local Prelude = if p14 then p14.prelude else nil
		
		if Prelude then
			for _, value1 in Prelude do
				table.insert(List, value1)
			end
		end
		local TypeImportsResult = SourceReadModule.typeImports(table.concat(p12.typeImports or {}, "\n"), table.concat(List, "\n")) or {}
		for _, value2 in TypeImportsResult do
			table.insert(List, value2)
		end
		local IsLocalControls: boolean = p14 ~= nil and p14.localControls == true
		
		if Controls ~= nil and not IsLocalControls then
			table.insert(List, Controls)
		end
		table.insert(List, "")
		
		if PropsType == nil and #p12.contract.inputs == 0 and #p12.contract.outputs == 0 then
			table.insert(List, "export type Props = {}")
			table.insert(List, "")
		elseif PropsType == nil then
			for _, input in p12.contract.inputs do
				local Fields = input.fields
				
				if input.type == "list" and Fields and #Fields > 0 then
					local Message: string = `export type {string.upper((string.sub(input.id, 1, 1))) .. string.sub(input.id, 2) .. "Item"} = `
					table.insert(List, Message .. rowType(p13, Fields, 0, #Message))
					table.insert(List, "")
				end
			end
			table.insert(List, "export type Props = {")
			
			for _, input1 in p12.contract.inputs do
				table.insert(List, `\t{input1.id}: {fieldType(p13, input1)}{if input1.required then "" else "?"},`)
			end
			for _, output in p12.contract.outputs do
				table.insert(List, `\t{output.id}: ({outputType(p13, output, p12.contract)})?,`)
			end
			table.insert(List, "}")
			table.insert(List, "")
		end
		local v5 = #List + 1
		local config = {
			name = p12.name,
			contract = contractLiteral(p12.contract)
		}
		local Editor = {}
		
		local function recordEditor(p15, Key)
			-- upvalues: DocumentModule (upval), p12 (copy), Editor (copy)
			local InputResult = if p15.nameInput then DocumentModule.input(p12, p15.nameInput) else nil
			local Name = if p15.nameField or InputResult and InputResult.required then p15.name else nil
			
			if p15.hidden or p15.locked or Name then
				Editor[Key] = {
					hidden = if p15.hidden then true else nil,
					locked = if p15.locked then true else nil,
					name = Name
				}
			end
		end
		
		SourceReadModule.editorNodes(p12.root, "root", recordEditor)
		
		if p12.rootVariant and p12.rootVariant.children then
			local Copy = table.clone(p12.root)
			Copy.rowVariant = nil
			local Children = p12.rootVariant.children
			Copy.props = p12.rootVariant.props
			Copy.children = Children
			SourceReadModule.editorNodes(Copy, "alternative", recordEditor)
		end
		if next(Editor) ~= nil then
			config.editor = Editor
		end
		local State1 = p12.state
		
		if State1 and #State1 > 0 then
			config.state = stateLiteral(State1)
		end
		local Sequences = p12.sequences
		
		if Sequences and #Sequences > 0 then
			config.sequences = sequencesLiteral(Sequences)
		end
		local function lay(List, Count: number, p15)
			-- upvalues: literal (upval), before (upval), prefix (upval), lay (copy)
			if type(List) ~= "table" then
				return literal(List)
			end
			local v6 = literal(List)
			
			if v6 == "{}" or p15 + #v6 <= 120 then
				return v6
			end
			local List1 = { "{" }
			local List2 = {}
			
			for i in List do
				table.insert(List2, i)
			end
			table.sort(List2, before)
			
			for i1, value in List2 do
				local v7 = prefix(value, i1)
				table.insert(List1, string.rep("\t", Count + 1) .. v7 .. lay(List[value], Count + 1, (Count + 1) * 4 + #v7 + 1) .. ",")
			end
			table.insert(List1, string.rep("\t", Count) .. "}")
			
			return table.concat(List1, "\n")
		end
		
		table.insert(List, "local _design = " .. lay(config, 0, 16))
		table.insert(List, "")
		local t = {}
		local List1 = {}
		local t1 = {}
		local Names = {}
		
		local function nameNodes(Root)
			-- upvalues: Names (copy), nameNodes (copy)
			Names[Root.id] = Root.name
			
			for _, child in Root.children do
				nameNodes(child)
			end
			if Root.rowVariant then
				for _, cas in Root.rowVariant.cases do
					for _, child1 in cas.children do
						nameNodes(child1)
					end
				end
			end
		end
		
		nameNodes(p12.root)
		
		local function collect(Tbl)
			-- upvalues: t (copy), List1 (copy), t1 (copy), Names (copy), collect (copy)
			for _, prop in Tbl.props do
				local Node = prop.node
				
				if Node ~= nil and not t[Node] then
					t[Node] = true
					table.insert(List1, Node)
				end
				local Nodes = prop.nodes
				
				if Nodes then
					for _, node in Nodes do
						t1[Names[node]] = node
						
						if not t[node] then
							t[node] = true
							table.insert(List1, node)
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
		
		collect(p12.root)
		local RootVariant = p12.rootVariant
		local v8 = nil
		
		if RootVariant then
			v8 = table.clone(p12.root)
			v8.kind = RootVariant.kind
			v8.props = RootVariant.props
			v8.children = RootVariant.children or p12.root.children
			nameNodes(v8)
			collect(v8)
		end
		table.sort(List1)
		local IsRowFunctions: boolean = p14 ~= nil and p14.rowFunctions == true
		local List2 = {}
		local config1 = {
			props = true,
			state = true,
			refs = true,
			capture = true,
			rootContent = true,
			[p13.parameter] = true
		}
		
		for _, kind in p13.kinds do
			local Match: string? = string.match(kind.call, "^([%w_]+)")
			
			if Match then
				config1[Match] = true
			end
		end
		local Callback1 = nil
		local Callback = nil
		
		local function _(Count: number): string
			return string.rep("\t", Count)
		end
		
		local _ = function(p16, p17, Count: number, p18): string
			return `function({p19 or "..."})\n{string.rep("\t", Count + 1)}if props.{p16} then\n{string.rep("\t", Count + 2)}props.{p16}({p17})\n` .. `{string.rep("\t", Count + 1)}end\n{string.rep("\t", Count)}end`
		end
		
		local _ = function(p16, p17, Count: number, p18): string
			return `function({p19}){if p18 then `: {p18}` else ""}\n{string.rep("\t", Count + 1)}return {p17}\n{string.rep("\t", Count)}end`
		end
		
		local List3 = {}
		local RepeatedItems = {}
		
		local function rowBase(p19): string
			local Replaced = string.gsub(p19.name, "[^%w_]", "")
			
			if not string.match(Replaced, "^%u") then
				Replaced = "Row" .. Replaced
				
				return Replaced
			end
			if not string.match(Replaced, "Row$") then
				Replaced ..= "Row"
			end
			return Replaced
		end
		
		local _ = function(Text): string
			-- upvalues: config1 (copy)
			local Text1: string = Text
			local Count = 1
			while config1[Text1] do
				Count += 1
				Text1 = Text .. tostring(Count)
			end
			config1[Text1] = true
			
			return Text1
		end
		
		local List4 = {}
		
		local function fieldsOf(Text: string)
			-- upvalues: DocumentModule (upval), p12 (copy), List4 (copy)
			local InputResult = DocumentModule.input(p12, Text)
			
			if InputResult ~= nil then
				return InputResult.fields
			end
			local Entry = List4[#List4]
			local Fields = if Entry then Entry.fields else nil
			local Match: string = string.match(Text, "^[%w]+%.([%w_]+)$") or Text
			
			if Fields ~= nil then
				for _, field in Fields do
					if field.id == Match then
						return field.fields
					end
				end
			end
			return nil
		end
		
		local function sourceOf(Text: string, Count: number): string
			-- upvalues: DocumentModule (upval), p12 (copy)
			if DocumentModule.input(p12, Text) == nil then
				local Match, Match2 = string.match(Text, "^([%w]+)%.([%w_]+)$")
				
				return if Match then `function(use)\n{string.rep("\t", Count + 1)}return {`use(row_{Match}).{Match2}`}\n{string.rep("\t", Count)}end` else `function(use)\n{string.rep("\t", Count + 1)}return {`use(current).{Text}`}\n{string.rep("\t", Count)}end`
			else
				return `props.{Text}`
			end
		end
		
		local RepeatedItems1 = {}
		
		if PropsType == nil then
			for _, input2 in p12.contract.inputs do
				local Fields = input2.fields
				
				if input2.type == "list" and Fields and #Fields > 0 then
					RepeatedItems1[input2.id] = string.upper((string.sub(input2.id, 1, 1))) .. string.sub(input2.id, 2) .. "Item"
					config1[string.upper((string.sub(input2.id, 1, 1))) .. string.sub(input2.id, 2) .. "Item"] = true
				end
			end
		end
		local function itemType(p19, From, List)
			-- upvalues: RepeatedItems (copy), RepeatedItems1 (copy), fieldsOf (copy), rowBase (copy), config1 (copy), List3 (copy), rowType (upval), p13 (copy)
			local RepeatedItem = RepeatedItems[p19.id] or (if From then RepeatedItems1[From] else nil)
			
			if RepeatedItem ~= nil then
				RepeatedItems[p19.id] = RepeatedItem
				
				return RepeatedItem
			end
			local List1 = {}
			
			if List == nil then
				if From ~= nil then
					local FieldsOfResult = fieldsOf(From)
					
					if FieldsOfResult ~= nil then
						for _, value1 in FieldsOfResult do
							table.insert(List1, value1)
						end
					end
				end
			else
				for _, value in List do
					table.insert(List1, value)
				end
			end
			if #List1 == 0 then
				return nil
			end
			local RepeatedItem1: string = if List then "RepeatedItem" else rowBase(p19) .. "Item"
			local RepeatedItem11: string = RepeatedItem1
			local Count = 1
			while config1[RepeatedItem11] do
				Count += 1
				RepeatedItem11 = RepeatedItem1 .. tostring(Count)
			end
			config1[RepeatedItem11] = true
			RepeatedItems[p19.id] = RepeatedItem11
			
			if From then
				RepeatedItems1[From] = RepeatedItem11
			end
			local Text: string = `type {RepeatedItem11} = `
			table.insert(List3, Text .. rowType(p13, List1, 0, #Text))
			
			return RepeatedItem11
		end
		
		local function keyFunction(p20, Bind, Count: number): string
			-- upvalues: itemType (copy), fieldsOf (copy), p13 (copy)
			local ItemTypeResult = itemType(p20, Bind.from)
			
			if ItemTypeResult == nil then
				return `function(row)\n{string.rep("\t", Count + 1)}return {"row." .. Bind.key}\n{string.rep("\t", Count)}end`
			end
			local Number = "string"
			local FieldsOfResult = fieldsOf(Bind.from)
			
			if FieldsOfResult then
				for _, value in FieldsOfResult do
					if value.id == Bind.key then
						local Type = value.type
						Number = if Type == "number" then "number" elseif Type == "boolean" then "boolean" elseif Type == "vector3" then "{ number }" elseif Type == "list" then "{ { [string]: unknown } }" elseif Type == "record" then "{ [string]: unknown }" elseif Type == "slot" then `() -> {p13.returnType}` else "string"
					end
				end
			end
			return `function(row: {ItemTypeResult}): {Number}\n{string.rep("\t", Count + 1)}return row.{Bind.key}\n{string.rep("\t", Count)}end`
		end
		
		local function rowFunction(Tbl, Count: number, Text, Fields): string
			-- upvalues: itemType (copy), p13 (copy), List4 (copy), fieldsOf (copy), Callback (ref), literal (upval), IsRowFunctions (copy), rowBase (copy), config1 (copy), List2 (copy)
			local ItemTypeResult = itemType(Tbl, Text, Fields)
			local CurrentName: string = if ItemTypeResult then `current: {p13.rowReadable or p13.readable}<{ItemTypeResult}>` else "current"
			table.insert(List4, {
				fields = Fields or (if Text then fieldsOf(Text) else nil)
			})
			
			local function rowBody(Count: number): string
				-- upvalues: Callback (upval), Tbl (copy), literal (upval), Text (copy)
				local CallbackResult: string = Callback(Tbl, Count + 1)
				local List = {}
				
				if Tbl.rowVariant then
					for _, cas in Tbl.rowVariant.cases do
						local Copy = table.clone(Tbl)
						Copy.rowVariant = nil
						local Props = cas.props
						local Children = cas.children
						Copy.kind = cas.kind
						Copy.props = Props
						Copy.children = Children
						table.insert(List, `{string.rep("\t", Count + 1)}if current:peek().{Tbl.rowVariant.item} == {literal(cas.value)} then\n{string.rep("\t", Count + 2)}return {Callback(Copy, Count + 2)}\n{string.rep("\t", Count + 1)}end\n`)
					end
				end
				local Match = if Text then string.match(Text, "%.([%w_]+)$") or Text else nil
				local Text1 = if Match then `row_{Match}` else nil
				
				return (if Text1 and string.find(CallbackResult, `use({Text1})`, 1, true) then `{string.rep("\t", Count + 1)}local {Text1} = current\n` else "") .. table.concat(List, "") .. `{string.rep("\t", Count + 1)}return {CallbackResult}`
			end
			local Text1 = nil
			
			if IsRowFunctions then
				local RowBaseResult = rowBase(Tbl)
				local RowBaseResult1: string = RowBaseResult
				local Count1 = 1
				while config1[RowBaseResult1] do
					Count1 += 1
					RowBaseResult1 = RowBaseResult .. tostring(Count1)
				end
				config1[RowBaseResult1] = true
				table.insert(List2, `\tlocal function {RowBaseResult1}({CurrentName})\n{rowBody(1)}\n\tend`)
				Text1 = RowBaseResult1
			else
				Text1 = `function({CurrentName})\n{rowBody(Count)}\n{string.rep("\t", Count)}end`
			end
			table.remove(List4)
			
			return Text1
		end
		
		local v9 = nil
		
		local function layout(Literal, Count: number, p21)
			-- upvalues: literal (upval), v9 (ref), DocumentModule (upval), Callback (ref), rowFunction (copy), before (upval), prefix (upval), layout (copy)
			if type(Literal) ~= "table" then
				return literal(Literal)
			end
			local Output = Literal["$output"]
			local Input = Literal["$input"]
			
			if type(Input) == "string" then
				return `props.{Input}`
			end
			if type(Output) == "string" then
				return `function(...)\n{string.rep("\t", Count + 1)}if props.{Output} then\n{string.rep("\t", Count + 2)}props.{Output}({if Literal["$row"] == true then "current:peek()" else "..."})\n` .. `{string.rep("\t", Count + 1)}end\n{string.rep("\t", Count)}end`
			end
			local Template = Literal["$template"]
			
			if type(Template) == "string" then
				local ACellTemplateNeedsItsNode = assert(v9, "A cell template needs its node")
				local ACellTemplateNamesAChild = assert(DocumentModule.find(ACellTemplateNeedsItsNode, Template), "A cell template names a child")
				local Bind = ACellTemplateNeedsItsNode.bind
				
				return if Bind == nil then `function()\n{string.rep("\t", Count + 1)}return {Callback(ACellTemplateNamesAChild, Count + 1)}\n{string.rep("\t", Count)}end` else rowFunction(ACellTemplateNamesAChild, Count, Bind.from)
			end
			local List = {}
			
			for i in Literal do
				table.insert(List, i)
			end
			table.sort(List, before)
			
			if #List == 0 then
				return "{}"
			end
			local t = {}
			
			for i1, value in List do
				t[i1] = prefix(value, i1)
			end
			local List1 = {}
			local Flag = true
			
			for i2, value1 in List do
				local LayoutResult: string = layout(Literal[value1], Count, 0)
				
				if string.find(LayoutResult, "\n", 1, true) then
					Flag = false
					break
				else
					List1[i2] = t[i2] .. LayoutResult
					continue
				end
			end
			if Flag then
				local Text = "{ " .. table.concat(List1, ", ") .. " }"
				
				if p21 + #Text <= 120 then
					return Text
				end
			end
			local List2 = { "{" }
			
			for i3, value2 in List do
				local Entry = t[i3]
				table.insert(List2, `{string.rep("\t", Count + 1)}{Entry}{layout(Literal[value2], Count + 1, (Count + 1) * 4 + #Entry + 1)},`)
			end
			table.insert(List2, string.rep("\t", Count) .. "}")
			
			return table.concat(List2, "\n")
		end
		
		local t2 = {}
		
		local function carriesRow(List): boolean
			-- upvalues: carriesRow (copy)
			if type(List) ~= "table" then
				return false
			end
			if List["$row"] ~= nil then
				return true
			end
			for _, value in List do
				if carriesRow(value) then
					return true
				end
			end
			return false
		end
		
		local t3 = {}
		
		local function hoist(p22, Text1: string, LuauType, Literal): string
			-- upvalues: config1 (copy), fieldsOf (copy), p13 (copy), itemType (copy), DocumentModule (upval), t3 (copy), t2 (copy), layout (copy)
			local Replaced = string.gsub(p22.name, "[^%w_]", "")
			local Text2 = string.lower((string.sub(Replaced, 1, 1))) .. string.sub(Replaced, 2)
			
			if not string.match(Text2, "^%a") then
				Text2 = "value"
			end
			local Text3 = Text2 .. string.upper((string.sub(Text1, 1, 1))) .. string.sub(Text1, 2)
			local Text4: string = Text3
			local Count = 1
			while config1[Text4] do
				Count += 1
				Text4 = Text3 .. tostring(Count)
			end
			config1[Text4] = true
			local Text: string = LuauType
			local Bind = p22.bind
			
			if Bind ~= nil then
				local Replacement = "unknown"
				local FieldsOfResult = fieldsOf(Bind.from) or {}
				for _, value in FieldsOfResult do
					if value.id == Bind.key then
						local Type = value.type
						Replacement = if Type == "number" then "number" elseif Type == "boolean" then "boolean" elseif Type == "vector3" then "{ number }" elseif Type == "list" then "{ { [string]: unknown } }" elseif Type == "record" then "{ [string]: unknown }" elseif Type == "slot" then `() -> {p13.returnType}` else "string"
					end
				end
				Text = string.gsub(string.gsub(Text, "%$Item", itemType(p22, Bind.from) or "unknown"), "%$Key", Replacement)
			end
			local Message: string = `\tlocal {Text4}: {Text} = `
			local HasNextEntry = next(DocumentModule.cellsOf(Literal, {})) ~= nil
			table.insert(if HasNextEntry then t3 else t2, Message .. layout(Literal, 1, #Message + 3))
			
			return Text4
		end
		
		local function expression(Tbl, Count: number, p23, Field)
			-- upvalues: p13 (copy), expression (copy), literal (upval), DocumentModule (upval), p12 (copy), layout (copy)
			local Motion = Tbl.motion
			
			if Motion ~= nil then
				local Copy = table.clone(Tbl)
				Copy.motion = nil
				
				return `{assert(p13.motion, `{p13.name} has no motion roles`).call}({expression(Copy, Count, p23, Field)}, {literal(Motion)})`
			end
			local Node = Tbl.node
			
			if Node == nil then
				local State = Tbl.state
				
				if State ~= nil then
					return `state.{State}`
				end
				local Play = Tbl.play
				
				if Play ~= nil then
					return `sequences.{Play}.play`
				end
				local NodeFrom = Tbl.nodeFrom
				
				if NodeFrom ~= nil then
					return `function(use)\n{string.rep("\t", Count + 1)}local chosen = named[{if DocumentModule.stateOf(p12, NodeFrom) == nil then if assert(DocumentModule.input(p12, NodeFrom)).kind == "value" then `props.{NodeFrom}` else `use(props.{NodeFrom})` else `use(state.{NodeFrom})`}]\n` .. `{string.rep("\t", Count + 1)}return assert(if chosen then use(chosen) else nil, "Node reference is not captured")\n{string.rep("\t", Count)}end`
				end
				local Literal = Tbl.literal
				local Input = Tbl.input
				local Item = Tbl.item
				local Output = Tbl.output
				local Token = Tbl.token
				
				if Literal ~= nil then
					return layout(Literal, Count, p23)
				end
				if Input then
					local Path = Tbl.path
					
					return `props.{Input}` .. (if Path then "." .. table.concat(Path, ".") else "")
				end
				if Item then
					return `function(use)\n{string.rep("\t", Count + 1)}return {`use(current).{Item}`}\n{string.rep("\t", Count)}end`
				end
				if not Output then
					local v10 = assert(Token)
					local Text: string = assert(p13.token, `{p13.name} has no theme tokens`)
					
					return if string.sub(Text, -1) == "." then Text .. v10 else `{Text} {literal(v10)}`
				end
				local Arguments = Tbl.arguments
				
				if Arguments then
					local t = {}
					
					for _, output in p12.contract.outputs do
						if output.id == Output then
							t = assert(output.args)
						end
					end
					local EventNames = {}
					local List = {}
					
					for i, argument in Arguments do
						if argument.item then
							table.insert(List, `current:peek().{argument.item}`)
						else
							local Entry = t[i]
							EventNames[argument.event] = `event{argument.event}: {if Entry == "number" then "number" elseif Entry == "boolean" then "boolean" elseif Entry == "vector3" then "{ number }" elseif Entry == "list" then "{ { [string]: unknown } }" elseif Entry == "record" then "{ [string]: unknown }" elseif Entry == "slot" then `() -> {p13.returnType}` else "string"}`
							table.insert(List, `event{argument.event}`)
						end
					end
					return `function({table.concat(EventNames, ", ") or "..."})\n{string.rep("\t", Count + 1)}if props.{Output} then\n{string.rep("\t", Count + 2)}props.{Output}({table.concat(List, ", ")})\n` .. `{string.rep("\t", Count + 1)}end\n{string.rep("\t", Count)}end`
				else
					local Args = Tbl.args
					local Fields = Tbl.fields
					local t4 = {}
					
					if Args then
						for i1, arg in Args do
							t4[i1] = arg
						end
					end
					local Segment: string = if Args then string.sub(literal(t4), 3, -3) elseif Fields then "" else "..."
					
					if Fields then
						local List = {}
						
						for _, field in Fields do
							table.insert(List, `current:peek().{field}`)
						end
						if Segment == "" then
							Segment = table.concat(List, ", ")
						else
							Segment = `{Segment}, {table.concat(List, ", ")}`
						end
					end
					return `function(...)\n{string.rep("\t", Count + 1)}if props.{Output} then\n{string.rep("\t", Count + 2)}props.{Output}({Segment})\n` .. `{string.rep("\t", Count + 1)}end\n{string.rep("\t", Count)}end`
				end
			elseif Field and Field.reference == "native" then
				local Message: string = `assert(refs.{Node}:peek(), "Node reference is not captured")`
				
				return if p23 + #Message <= 120 then Message else `assert(\n{string.rep("\t", Count + 1)}refs.{Node}:peek(),\n{string.rep("\t", Count + 1)}"Node reference is not captured"\n{string.rep("\t", Count)})`
			else
				return `function(use)\n{string.rep("\t", Count + 1)}return {`assert(use(refs.{Node}), "Node reference is not captured")`}\n{string.rep("\t", Count)}end`
			end
		end
		
		local function tagged(p24, Count: number)
			-- upvalues: p13 (copy), Callback1 (ref), expression (copy)
			local Tags = p24.tags
			local Tags1 = p13.tags
			
			if Tags == nil and p24.tagBinding == nil or Tags1 == nil then
				return Callback1(p24, Count)
			end
			local Repeated = string.rep("\t", Count + 1)
			local List = {}
			local Tags2 = Tags or {}
			for _, value in Tags2 do
				table.insert(List, string.format("%q", value))
			end
			local ExpressionResult = if p24.tagBinding then expression(p24.tagBinding, Count + 1, (Count + 1) * 4) else "{ " .. table.concat(List, ", ") .. " }"
			local CallbackResult: string = Callback1(p24, Count + 1)
			
			if p24.tagBinding and not string.find(CallbackResult, "\n", 1, true) then
				local ExpressionResult1: string = expression(p24.tagBinding, Count, Count * 4 + #Tags1.call + #CallbackResult + 3)
				
				if string.sub(ExpressionResult1, 1, 8) == "function" then
					return `{Tags1.call}({CallbackResult}, {ExpressionResult1})`
				end
			end
			local Text: string = `{Tags1.call}({CallbackResult}, {ExpressionResult})`
			
			return if string.find(Text, "\n", 1, true) or Count * 4 + #Text > 120 then `{Tags1.call}(\n{Repeated}{CallbackResult},\n{Repeated}{ExpressionResult}\n{string.rep("\t", Count)})` else Text
		end
		
		local v11 = nil
		
		Callback = function(ACellTemplateNamesAChild, Count: number)
			-- upvalues: DocumentModule (upval), p12 (copy), v11 (ref), t (copy), tagged (copy)
			if ACellTemplateNamesAChild.slot then
				local PropsName: string = `props.{ACellTemplateNamesAChild.slot}()`
				
				return if assert(DocumentModule.input(p12, ACellTemplateNamesAChild.slot)).required then PropsName else `if props.{ACellTemplateNamesAChild.slot} then {PropsName} else nil`
			elseif ACellTemplateNamesAChild == v11 then
				return "rootContent()"
			elseif t[ACellTemplateNamesAChild.id] then
				local Repeated = string.rep("\t", Count + 1)
				local TaggedResult: string = tagged(ACellTemplateNamesAChild, Count + 1)
				local CaptureName: string = `capture("{ACellTemplateNamesAChild.id}", {TaggedResult})`
				
				return if string.find(TaggedResult, "\n", 1, true) or Count * 4 + #CaptureName > 120 then `capture(\n{Repeated}"{ACellTemplateNamesAChild.id}",\n{Repeated}{TaggedResult}\n{string.rep("\t", Count)})` else CaptureName
			else
				return tagged(ACellTemplateNamesAChild, Count)
			end
		end
		
		Callback1 = function(p25, Count3: number): string
			-- upvalues: p13 (copy), DocumentModule (upval), p12 (copy), literal (upval), v9 (ref), Callback (ref), itemType (copy), List4 (copy), fieldsOf (copy), layout (copy), datatypeLiteral (upval), carriesRow (copy), hoist (copy), expression (copy), sourceOf (copy), rowFunction (copy), keyFunction (copy)
			local v12 = assert(p13.kinds[p25.kind])
			local Repeated = string.rep("\t", Count3 + 1)
			local NameField = p25.nameField
			local NameInput = p25.nameInput
			local Text: string = if NameField == nil then if NameInput == nil then `{v12.call} {literal(p25.name)} ` else `{v12.call}(props.{NameInput}{if assert(DocumentModule.input(p12, NameInput)).required then "" else ` or {literal(p25.name)}`}) ` else `{v12.call}(tostring(current:peek().{NameField})) `
			local List = {}
			local Design = v12.design
			
			if Design then
				local InputResult = if NameInput then DocumentModule.input(p12, NameInput) else nil
				Text = `{v12.call}({p13.parameter}, `
				table.insert(List, `{Repeated}{Design.nameInput} = {if NameField then `tostring(current:peek().{NameField})` elseif InputResult then `props.{NameInput}` .. (if InputResult.required then "" else ` or {literal(p25.name)}`) else literal(p25.name)},`)
			end
			local List1 = {}
			local HasBind: boolean = v12.children == "template" and p25.bind ~= nil
			local Slot = if v12.children == "slot" then v12.slot else nil
			for i, prop in p25.props do
				local Literal = prop.literal
				local Field = v12.fields[i]
				local Default = if Field then Field.default else nil
				
				if (not HasBind or i ~= v12.source and i ~= v12.key) and (i ~= Slot or Literal == nil) and (Literal == nil or Default == nil or literal(Literal) ~= literal(Default)) then
					table.insert(List1, i)
				end
			end
			table.sort(List1)
			local t = {}
			local v13 = v9
			v9 = p25
			local Bind = nil
			local Datatype = nil
			local LuauType = nil
			local Flag = nil
			local Literal = nil
			local CallbackResult = nil
			
			for _, value1 in List1 do
				local Prop = p25.props[value1]
				local Field = v12.fields[value1]
				Literal = Prop.literal
				
				if Literal ~= nil then
					DocumentModule.cellsOf(Literal, t)
				end
				Datatype = if Field then Field.datatype else nil
				LuauType = if Field then Field.luauType else nil
				Bind = p25.bind
				local Item = Prop.item
				repeat
					if type(Literal) == "table" and Field and Field.type == "value" and not Field.perRow and type(Literal["$template"]) == "string" then
						CallbackResult = Callback(assert((DocumentModule.find(p25, Literal["$template"]))), Count3 + 1)
						break
					end
					if Literal ~= nil and Field ~= nil and Field.perRow and Bind ~= nil then
						local ItemTypeResult = itemType(p25, Bind.from)
						local CurrentName: string = if ItemTypeResult then `current: {p13.rowReadable or p13.readable}<{ItemTypeResult}>` else "current"
						table.insert(List4, { fields = fieldsOf(Bind.from) })
						local Count2 = Count3 + 1
						CallbackResult = `function({CurrentName}){if LuauType then `: {LuauType}` else ""}\n{string.rep("\t", Count2 + 1)}return {layout(Literal, Count3 + 2, 0)}\n{string.rep("\t", Count2)}end`
						table.remove(List4)
						break
					end
					if Literal ~= nil and Datatype ~= nil then
						CallbackResult = datatypeLiteral(p12, p13, Datatype, Literal, Count3 + 1)
						break
					end
					if Literal ~= nil and type(Literal) == "table" and LuauType then
						if type(Literal) == "table" then
							if Literal["$row"] == nil then
								Flag = false
								
								for _, value3 in Literal do
									if carriesRow(value3) then
										Flag = true
										break
									end
								end
							else
								Flag = true
							end
						else
							Flag = false
						end
						if not Flag then
							CallbackResult = hoist(p25, value1, LuauType, Literal)
							break
						end
					end
					CallbackResult = expression(Prop, Count3 + 1, (Count3 + 1) * 4 + #value1 + 4, Field)
				until true
				if Item ~= nil and Field ~= nil and Field.type == "string" then
					local Entry = List4[#List4]
					local Fields = if Entry and Entry.fields then Entry.fields else {}
					local Flag1 = true
					
					for _, field in Fields do
						if field.id == Item and field.type ~= "string" then
							Flag1 = false
						end
					end
					if not Flag1 then
						local Count = Count3 + 1
						CallbackResult = `function(use)\n{string.rep("\t", Count + 1)}return {`tostring(use(current).{Item})`}\n{string.rep("\t", Count)}end`
					end
				end
				table.insert(List, `{Repeated}{value1} = {CallbackResult},`)
			end
			v9 = v13
			local List2 = {}
			
			for _, child in p25.children do
				if not t[child.id] then
					table.insert(List2, child)
				end
			end
			local Bind1 = p25.bind
			local Entry = List2[1]
			
			if v12.children == "slot" then
				if Entry then
					local NewCount = Count3 + 1
					table.insert(List, `{Repeated}{assert(v12.slot)} = {`function()\n{string.rep("\t", NewCount + 1)}return {Callback(Entry, Count3 + 2)}\n{string.rep("\t", NewCount)}end`},`)
				end
			elseif v12.children == "template" then
				if Bind1 then
					table.insert(List, `{Repeated}{assert(v12.source)} = {sourceOf(Bind1.from, Count3 + 1)},`)
					local Key = v12.key
					
					if Key then
						local Field1 = v12.fields[Key]
						
						if (if Field1 then Field1.default else nil) ~= Bind1.key then
							table.insert(List, `{Repeated}{Key} = {literal(Bind1.key)},`)
						end
					end
				end
				local Template = v12.template
				
				if Template == nil then
					for _, value4 in List2 do
						table.insert(List, `{Repeated}{Callback(value4, Count3 + 1)},`)
					end
				elseif v12.iteration and Entry and Bind1 == nil then
					table.insert(List, `{Repeated}{Template} = {rowFunction(Entry, Count3 + 1, nil, v12.iteration.fields)},`)
				elseif Bind1 and Entry then
					local Row1 = Bind1.row or Entry.id
					local Entry1 = Entry
					
					for _, value2 in List2 do
						if value2.id == Row1 then
							Entry1 = value2
						end
					end
					table.insert(List, `{Repeated}{Template} = {rowFunction(Entry1, Count3 + 1, Bind1.from)},`)
					
					for _, value5 in List2 do
						if value5 ~= Entry1 then
							table.insert(List, `{Repeated}{Callback(value5, Count3 + 1)},`)
						end
					end
				end
			else
				local Row = if Bind1 then Bind1.row or (if Entry then Entry.id else nil) else nil
				for _, value in List2 do
					local When = value.when
					
					if Bind1 and value.id == Row then
						local Repeated1 = string.rep("\t", Count3 + 2)
						table.insert(List, `{Repeated}{assert(p13.keyed)} ` .. "{")
						table.insert(List, `{Repeated1}from = {sourceOf(Bind1.from, Count3 + 2)},`)
						table.insert(List, `{Repeated1}key = {keyFunction(value, Bind1, Count3 + 2)},`)
						table.insert(List, `{Repeated1}render = {rowFunction(value, Count3 + 2, Bind1.from)},`)
						table.insert(List, `{Repeated}},`)
						continue
					end
					if When == nil then
						table.insert(List, `{Repeated}{Callback(value, Count3 + 1)},`)
						continue
					end
					local v14 = assert(p13.show)
					local StateName = nil
					
					if DocumentModule.stateOf(p12, When) == nil then
						if DocumentModule.input(p12, When) == nil then
							local NewCount = Count3 + 1
							StateName = `function(use)\n{string.rep("\t", NewCount + 1)}return {`use(current).{When} == true`}\n{string.rep("\t", NewCount)}end`
						elseif assert(DocumentModule.input(p12, When)).kind == "value" then
							local NewCount = Count3 + 1
							StateName = `function()\n{string.rep("\t", NewCount + 1)}return {`props.{When} == true`}\n{string.rep("\t", NewCount)}end`
						else
							StateName = `props.{When}`
						end
					else
						StateName = `state.{When}`
					end
					local Count1 = Count3 + 1
					table.insert(List, `{Repeated}{v14}({StateName}, {`function()\n{string.rep("\t", Count1 + 1)}return {Callback(value, Count3 + 2)}\n{string.rep("\t", Count1)}end`}),`)
				end
			end
			return if #List == 0 then Text .. "{}" else Text .. "{\n" .. table.concat(List, "\n") .. "\n" .. string.rep("\t", Count3) .. "}" .. (if Design then ")" else "")
		end
		
		local PropsType1 = PropsType or "Props"
		local Message: string = if Controls == nil then `({p13.parameter}: {p13.parameterType}, props: {PropsType1}): {p13.returnType}` else `(props: {PropsType1}): {p13.returnType}`
		table.insert(List, if Name then `local function {Name}{Message}` else `return function{Message}`)
		
		if Controls ~= nil and IsLocalControls then
			table.insert(List, "\t" .. Controls)
		end
		local v15 = nil
		
		if RootVariant and RootVariant.children == nil then
			local Child = p12.root.children[1]
			v15 = Callback(Child, 2)
			v11 = Child
		end
		local CallbackResult = Callback(p12.root, 1)
		local CallbackResult1 = if v8 then Callback(v8, 2) else nil
		for i1, value7 in List3 do
			table.insert(List, v5 + i1 * 2 - 2, value7)
			table.insert(List, v5 + i1 * 2 - 1, "")
		end
		for _, value5 in t2 do
			table.insert(List, value5)
		end
		local HasFoundAt = string.find(CallbackResult .. (v15 or "") .. (CallbackResult1 or ""), "state.", 1, true) ~= nil
		for _, value3 in t3 do
			HasFoundAt = HasFoundAt or string.find(value3, "state.", 1, true) ~= nil
		end
		for _, value8 in List2 do
			HasFoundAt = HasFoundAt or string.find(value8, "state.", 1, true) ~= nil
		end
		if #List1 > 0 then
			local v16 = assert(p13.newCell, `{p13.name} cannot reference nodes; it names no cell constructor`)
			local List5 = {}
			
			for _, value9 in List1 do
				table.insert(List5, `{value9} = {v16}<<{p13.returnType}?>>(nil)`)
			end
			local Text = "\tlocal refs: { [string]: " .. `{p13.cell}<{p13.returnType}?>` .. " } = "
			local Text1 = Text .. "{ " .. table.concat(List5, ", ") .. " }"
			
			if #Text1 + 3 <= 120 then
				table.insert(List, Text1)
			else
				table.insert(List, Text .. "{")
				
				for _, value10 in List5 do
					table.insert(List, "\t\t" .. value10 .. ",")
				end
				table.insert(List, "\t}")
			end
			table.insert(List, `\tlocal function capture(id: string, node: {p26.returnType}): {p26.returnType}`)
			table.insert(List, "\t\trefs[id]:set(node)")
			table.insert(List, "\t\treturn node")
			table.insert(List, "\tend")
			local List7 = {}
			
			for i in t4 do
				table.insert(List7, i)
			end
			table.sort(List7)
			
			if #List7 > 0 then
				local List8 = {}
				
				for _, value6 in List7 do
					table.insert(List8, `{value6} = refs.{t4[value6]}`)
				end
				table.insert(List, "\tlocal named: { [string]: " .. `{p26.readable}<{p26.returnType}?>` .. " } = { " .. table.concat(List8, ", ") .. " }")
			end
		end
		local List6 = {}
		
		if Sequences and #Sequences > 0 then
			local v17 = assert(p26.sequence, `{p26.name} cannot play sequences`)
			table.insert(List6, "\tlocal sequences = {")
			
			for _, sequence in Sequences do
				table.insert(List6, "\t\t" .. sequence.id .. " = " .. v17.call .. " {")
				table.insert(List6, "\t\t\tsteps = {")
				
				for _, step in sequence.steps do
					local List9 = {}
					
					local _ = function(p27, p28)
						-- upvalues: List9 (copy), literal (upval)
						if p28 ~= nil then
							table.insert(List9, `{p27} = {literal(p28)}`)
						end
					end
					
					local Delay = step.delay
					
					if Delay ~= nil then
						table.insert(List9, `delay = {literal(Delay)}`)
					end
					local Duration = step.duration
					
					if Duration ~= nil then
						table.insert(List9, `duration = {literal(Duration)}`)
					end
					local Easing = step.easing
					
					if Easing ~= nil then
						table.insert(List9, `easing = {literal(Easing)}`)
					end
					local State = step.state
					local To = step.to
					
					if State ~= nil and To ~= nil then
						table.insert(List9, if type(To) == "number" then `sample = {v17.toward}(state.{State}, {literal(To)})` else `onStart = function() state.{State}:set({literal(To)}) end`)
						HasFoundAt = true
					end
					local Output = step.output
					
					if Output ~= nil then
						table.insert(List9, `onEnd = props.{Output}`)
					end
					table.insert(List6, "\t\t\t\t{ " .. table.concat(List9, ", ") .. " },")
				end
				table.insert(List6, "\t\t\t},")
				table.insert(List6, "\t\t},")
			end
			table.insert(List6, "\t}")
			
			for _, value4 in Sequences do
				if value4.autoplay then
					table.insert(List6, `\tsequences.{value4.id}.play()`)
				end
			end
		end
		if State1 and #State1 > 0 and HasFoundAt then
			local v18 = assert(p26.newCell, `{p26.name} cannot hold state; it names no cell constructor`)
			local List10 = {}
			
			for _, value11 in State1 do
				local Initial = value11.initial
				local LiteralResult = literal(Initial)
				table.insert(List10, if type(Initial) == "string" or type(Initial) == "table" then `{value11.id} = {v18} {LiteralResult}` else `{value11.id} = {v18}({LiteralResult})`)
			end
			table.insert(List, "\tlocal state = { " .. table.concat(List10, ", ") .. " }")
		end
		for _, value12 in List6 do
			table.insert(List, value12)
		end
		for _, value13 in List2 do
			table.insert(List, value13)
		end
		for _, value14 in t3 do
			table.insert(List, value14)
		end
		if RootVariant and CallbackResult1 then
			if v15 then
				table.insert(List, `\tlocal function rootContent(): {p26.returnType}\n\t\treturn {v15}\n\tend`)
			end
			table.insert(List, `\tif props.{RootVariant.input} == {literal(RootVariant.value)} then\n\t\treturn {CallbackResult1}\n\tend`)
		end
		table.insert(List, `\treturn {CallbackResult}`)
		table.insert(List, "end")
		
		if Name then
			table.insert(List, "")
			table.insert(List, `return {Name}`)
		end
		table.insert(List, "")
		
		return table.concat(List, "\n")
	end
}
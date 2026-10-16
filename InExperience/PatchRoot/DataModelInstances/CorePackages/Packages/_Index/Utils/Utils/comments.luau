local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local _ = require(script.Parent.types)
local GraphQLModule = require(Parent.GraphQL)
local VisitFunction = GraphQLModule.visit
local TokenKind = GraphQLModule.TokenKind
local _ = require(Parent.GraphQL)
local Callback = nil
local Callback1 = nil
local Callback2 = nil
local Callback3 = nil
local Callback4 = nil
local Callback5 = nil
local IsBlank = nil
local Callback6 = nil
local String = LuauPolyfillModule.String
local t = {}

local function collectComment(p1) --[[ Line: 66 ]]
	-- upvalues: Callback (ref), Boolean (copy), Callback1 (ref)
	local Value = if typeof(p1.name) == "table" then p1.name.value else nil
	
	if Value == nil then return end
	Callback(p1, Value)
	local Kind = p1.kind
	
	if Kind == "EnumTypeDefinition" then
		if Boolean.toJSBoolean(p1.values) then
			for _, value in p1.values do
				Callback(value, Value, value.name.value)
			end
			return
		end
	elseif (Kind == "ObjectTypeDefinition" or Kind == "InputObjectTypeDefinition" or Kind == "InterfaceTypeDefinition") and Boolean.toJSBoolean(p1.fields) then
		for _, field in p1.fields do
			Callback(field, Value, field.name.value)
			local ToJSBooleanFunction = Boolean.toJSBoolean
			local CallbackResult = Callback1(field)
			
			if ToJSBooleanFunction(if Boolean.toJSBoolean(CallbackResult) then field.arguments else CallbackResult) then
				for _, argument in field.arguments do
					Callback(argument, Value, field.name.value, argument.name.value)
				end
			end
		end
	end
end

Callback = function(p2, p3, p4, p5) --[[ Line: 123 | Named "pushComment" ]]
	-- upvalues: Callback2 (ref), Boolean (copy), Array (copy), t (ref)
	local CallbackResult = Callback2(p2)
	
	if typeof(CallbackResult) ~= "string" or #CallbackResult == 0 then return end
	local List = { p3 }
	
	if Boolean.toJSBoolean(p4) then
		table.insert(List, p4)
		
		if Boolean.toJSBoolean(p5) then
			table.insert(List, p5)
		end
	end
	local v1 = Array.join(List, ".")
	
	if not Boolean.toJSBoolean(t[tostring(v1)]) then
		t[tostring(v1)] = {}
	end
	table.insert(t[v1], CallbackResult)
end

local function printComment(Text: string): string --[[ Line: 155 ]]
	return "\n# " .. Text:gsub("\n", "\n# ")
end

local function join(Directives, p2) --[[ Line: 183 ]]
	-- upvalues: Boolean (copy), Array (copy)
	return if Boolean.toJSBoolean(Directives) then Array.join(Array.filter(Directives, function(p3) --[[ Line: 195 ]]
		-- upvalues: Boolean (upval)
		return Boolean.toJSBoolean(p3)
	end), Boolean.toJSBoolean(p2) and p2 or "") else ""
end

local function _(p2) --[[ Line: 205 | Named "hasMultilineItems" ]]
	-- upvalues: Array (copy), String (copy)
	local SomeResult = if typeof(p2) == "table" then Array.some(p2, function(p3) --[[ Line: 212 ]]
		-- upvalues: String (upval)
		return String.includes(p3, "\n")
	end) else nil
	
	return SomeResult ~= nil and SomeResult
end

local _ = function(p2) --[[ Line: 229 | Named "addDescription" ]]
	-- upvalues: Array (copy), Object (copy), Boolean (copy), String (copy), t (ref), join (copy), printComment (copy)
	return function(p3, p4, p5, p6, p7, Entry) --[[ Line: 230 ]]
		-- upvalues: Array (upval), Object (upval), Boolean (upval), String (upval), t (upval), join (upval), printComment (upval), p2 (copy)
		local List = {}
		local ReduceResult = Array.reduce(p7, function(None, None1) --[[ Line: 258 ]]
			-- upvalues: Object (upval), Array (upval), Boolean (upval), List (copy)
			if None1 ~= Object.None and Array.includes({ "fields", "arguments", "values" }, None1) and Boolean.toJSBoolean(None.name) then
				table.insert(List, None.name.value)
			end
			return if None == Object.None then None1 else None[None1]
		end, Entry[1] or Object.None)
		local v1 = Array.join(Array.filter(Array.concat({}, List, {
			if typeof(if typeof(ReduceResult) == "table" then ReduceResult.name else nil) == "table" then (if typeof(ReduceResult) == "table" then ReduceResult.name else nil).value else nil
		}), Boolean.toJSBoolean), ".")
		local ConcatResult = {}
		
		if String.includes(p4.kind, "Definition") and Boolean.toJSBoolean(t[v1]) then
			ConcatResult = Array.concat(ConcatResult, t[v1])
		end
		return (join(Array.concat({}, Array.map(ConcatResult, printComment), {
			p4.description or "",
			(p2(p3, p4, p5, p6, p7, Entry))
		}), "\n"))
	end
end

local function indent(Text: string): string --[[ Line: 320 ]]
	-- upvalues: Boolean (copy)
	return if Boolean.toJSBoolean(Text) then ("  %s"):format((Text:gsub("\n", "\n  "))) else Text
end

local _ = function(p3): string --[[ Line: 344 | Named "block" ]]
	-- upvalues: indent (copy), join (copy)
	return if p3 and #p3 ~= 0 then ("{\n%s\n}"):format(indent((join(p3, "\n")))) else ""
end

local _ = function(Text, p3, p4): string --[[ Line: 363 | Named "wrap" ]]
	-- upvalues: Boolean (copy)
	return if Boolean.toJSBoolean(p3) then Text .. tostring(p3) .. (Boolean.toJSBoolean(p4) and p4 or "") else ""
end

local function printBlockString(Text: string, p3): string --[[ Line: 377 ]]
	-- upvalues: String (copy), Boolean (copy)
	local P25 = p3 ~= nil and p3
	local Text1: string = Text:gsub("\"", "\\\"\"\"")
	
	if (Text:sub(1, 1) == " " or Text:sub(1, 1) == "\t") and String.indexOf(Text, "\n") == -1 then
		return ("\"\"\"%s\"\"\""):format((Text1:gsub("\"$", "\"\n")))
	else
		return ("\"\"\"\n%s\n\"\"\""):format(if Boolean.toJSBoolean(P25) then Text1 elseif Boolean.toJSBoolean(Text1) then ("  %s"):format((Text1:gsub("\n", "\n  "))) else Text1)
	end
end

local config = {
	Name = {
		leave = function(_, p3) --[[ Line: 417 ]]
			return p3.value
		end
	},
	Variable = {
		leave = function(_, p3): string --[[ Line: 425 ]]
			return "$" .. tostring(p3.name)
		end
	},
	Document = {
		leave = function(_, p3) --[[ Line: 434 ]]
			-- upvalues: join (copy)
			return (join(p3.definitions, "\n\n"))
		end
	},
	OperationDefinition = {
		leave = function(_, p3): string --[[ Line: 442 ]]
			-- upvalues: join (copy), Boolean (copy)
			local v1 = join(p3.variableDefinitions, ", ")
			
			return tostring((join({
				p3.operation,
				join({
					p3.name,
					if Boolean.toJSBoolean(v1) then "(" .. tostring(v1) .. (if Boolean.toJSBoolean(")") then ")" else "") else ""
				}),
				(join(p3.directives, " "))
			}, " "))) .. " " .. tostring(p3.selectionSet)
		end
	},
	VariableDefinition = {
		leave = function(_, p3): string --[[ Line: 452 ]]
			-- upvalues: Boolean (copy), join (copy)
			local DefaultValue = p3.defaultValue
			local Directives = p3.directives
			local Text = tostring(p3.variable)
			local v1 = ": "
			local Text1 = tostring(p3.type)
			local Text2 = nil
			
			if Boolean.toJSBoolean(DefaultValue) then
				local _ = Boolean.toJSBoolean(nil)
				Text2 = " = " .. tostring(DefaultValue) .. ""
			else
				Text2 = ""
			end
			local Text3 = tostring(Text2)
			local v2 = join(Directives, " ")
			local Text4 = nil
			
			if Boolean.toJSBoolean(v2) then
				local _ = Boolean.toJSBoolean(nil)
				Text4 = " " .. tostring(v2) .. ""
			else
				Text4 = ""
			end
			return Text .. v1 .. Text1 .. Text3 .. tostring(Text4)
		end
	},
	SelectionSet = {
		leave = function(_, p3): string --[[ Line: 466 ]]
			-- upvalues: indent (copy), join (copy)
			local Selections = p3.selections
			
			return if Selections and #Selections ~= 0 then ("{\n%s\n}"):format(indent((join(Selections, "\n")))) else ""
		end
	},
	Field = {
		leave = function(_, p3) --[[ Line: 473 ]]
			-- upvalues: Boolean (copy), join (copy)
			local Alias = p3.alias
			local Arguments = p3.arguments
			local Directives = p3.directives
			local SelectionSet = p3.selectionSet
			local Text = (if Boolean.toJSBoolean(Alias) then "" .. tostring(Alias) .. (if Boolean.toJSBoolean(": ") then ": " else "") else "") .. p3.name
			local v1 = join(Arguments, ", ")
			local Text1 = Text .. (if Boolean.toJSBoolean(v1) then "(" .. tostring(v1) .. (if Boolean.toJSBoolean(")") then ")" else "") else "")
			
			if Text1.length > 80 then
				local Text2: string = join(Arguments, "\n")
				local Text3 = if Boolean.toJSBoolean(Text2) then ("  %s"):format((Text2:gsub("\n", "\n  "))) else Text2
				Text1 = Text .. (if Boolean.toJSBoolean(Text3) then "(\n" .. tostring(Text3) .. (if Boolean.toJSBoolean("\n)") then "\n)" else "") else "")
			end
			return (join({ Text1, join(Directives, " "), SelectionSet }, " "))
		end
	},
	Argument = {
		leave = function(_, p3): string --[[ Line: 497 ]]
			return tostring(p3.name) .. ": " .. tostring(p3.value)
		end
	},
	FragmentSpread = {
		leave = function(_, p3): string --[[ Line: 507 ]]
			-- upvalues: join (copy), Boolean (copy)
			local v1 = "..."
			local Text = tostring(p3.name)
			local v2 = join(p3.directives, " ")
			local Text1 = nil
			
			if Boolean.toJSBoolean(v2) then
				local _ = Boolean.toJSBoolean(nil)
				Text1 = " " .. tostring(v2) .. ""
			else
				Text1 = ""
			end
			return v1 .. Text .. tostring(Text1)
		end
	},
	InlineFragment = {
		leave = function(_, p3) --[[ Line: 516 ]]
			-- upvalues: join (copy), Boolean (copy)
			local TypeCondition = p3.typeCondition
			local Directives = p3.directives
			local SelectionSet = p3.selectionSet
			local SelectionSets = {}
			local v1 = "..."
			local Text = nil
			
			if Boolean.toJSBoolean(TypeCondition) then
				local _ = Boolean.toJSBoolean(nil)
				Text = "on " .. tostring(TypeCondition) .. ""
			else
				Text = ""
			end
			SelectionSets[1] = v1
			SelectionSets[2] = Text
			SelectionSets[3] = join(Directives, " ")
			SelectionSets[4] = SelectionSet
			
			return (join(SelectionSets, " "))
		end
	},
	FragmentDefinition = {
		leave = function(_, p3): string --[[ Line: 525 ]]
			-- upvalues: join (copy), Boolean (copy)
			local TypeCondition = p3.typeCondition
			local Directives = p3.directives
			local SelectionSet = p3.selectionSet
			local Text = tostring(p3.name)
			local v1 = join(p3.variableDefinitions, ", ")
			local FragmentName: string = ("fragment %s%s "):format(Text, if Boolean.toJSBoolean(v1) then "(" .. tostring(v1) .. (if Boolean.toJSBoolean(")") then ")" else "") else "")
			local Text1 = tostring(TypeCondition)
			local v2 = join(Directives, " ")
			
			return FragmentName .. ("on %s %s"):format(Text1, (tostring(if Boolean.toJSBoolean(v2) then "" .. tostring(v2) .. (if Boolean.toJSBoolean(" ") then " " else "") else ""))) .. tostring(SelectionSet)
		end
	},
	IntValue = {
		leave = function(_, p3) --[[ Line: 545 ]]
			return p3.value
		end
	},
	FloatValue = {
		leave = function(_, p3) --[[ Line: 554 ]]
			return p3.value
		end
	},
	StringValue = {
		leave = function(_, p3) --[[ Line: 563 ]]
			-- upvalues: Boolean (copy), printBlockString (copy)
			local Value: string = p3.value
			
			return if Boolean.toJSBoolean(p3.block) then printBlockString(Value) else "'" .. Value:gsub("'", "\\'") .. "'"
		end
	},
	BooleanValue = {
		leave = function(_, p3): string --[[ Line: 579 ]]
			-- upvalues: Boolean (copy)
			return if Boolean.toJSBoolean(p3.value) then "true" else "false"
		end
	},
	NullValue = {
		leave = function(): string --[[ Line: 586 ]]
			return "null"
		end
	},
	EnumValue = {
		leave = function(_, p3) --[[ Line: 593 ]]
			return p3.value
		end
	},
	ListValue = {
		leave = function(_, p3): string --[[ Line: 602 ]]
			-- upvalues: join (copy)
			return "[" .. tostring((join(p3.values, ", "))) .. "]"
		end
	},
	ObjectValue = {
		leave = function(_, p3): string --[[ Line: 611 ]]
			-- upvalues: join (copy)
			return "{" .. tostring((join(p3.fields, ", "))) .. "}"
		end
	},
	ObjectField = {
		leave = function(_, p3): string --[[ Line: 620 ]]
			return tostring(p3.name) .. ": " .. tostring(p3.value)
		end
	},
	Directive = {
		leave = function(_, p3): string --[[ Line: 630 ]]
			-- upvalues: join (copy), Boolean (copy)
			local Text = tostring(p3.name)
			local v1 = join(p3.arguments, ", ")
			
			return "@" .. Text .. tostring(if Boolean.toJSBoolean(v1) then "(" .. tostring(v1) .. (if Boolean.toJSBoolean(")") then ")" else "") else "")
		end
	},
	NamedType = {
		leave = function(_, p3) --[[ Line: 640 ]]
			return p3.name
		end
	},
	ListType = {
		leave = function(_, p3): string --[[ Line: 649 ]]
			return "[" .. tostring(p3.type) .. "]"
		end
	},
	NonNullType = {
		leave = function(_, p3): string --[[ Line: 658 ]]
			return tostring(p3.type) .. "!"
		end
	},
	SchemaDefinition = {
		leave = function(_, p3) --[[ Line: 668 ]]
			-- upvalues: join (copy), indent (copy)
			local OperationTypes = p3.operationTypes
			
			return (join({
				"schema",
				join(p3.directives, " "),
				if OperationTypes and #OperationTypes ~= 0 then ("{\n%s\n}"):format(indent((join(OperationTypes, "\n")))) else ""
			}, " "))
		end
	},
	OperationTypeDefinition = {
		leave = function(_, p3): string --[[ Line: 677 ]]
			return tostring(p3.operation) .. ": " .. tostring(p3.type)
		end
	},
	ScalarTypeDefinition = {
		leave = function(_, p3) --[[ Line: 686 ]]
			-- upvalues: join (copy)
			return (join({ "scalar", p3.name, (join(p3.directives, " ")) }, " "))
		end
	},
	ObjectTypeDefinition = {
		leave = function(_, p3) --[[ Line: 695 ]]
			-- upvalues: join (copy), Boolean (copy), indent (copy)
			local Directives = p3.directives
			local Fields = p3.fields
			local Names = {}
			local v1 = "type"
			local Name = p3.name
			local v2 = join(p3.interfaces, " & ")
			local Text = nil
			
			if Boolean.toJSBoolean(v2) then
				local _ = Boolean.toJSBoolean(nil)
				Text = "implements " .. tostring(v2) .. ""
			else
				Text = ""
			end
			Names[1] = v1
			Names[2] = Name
			Names[3] = Text
			Names[4] = join(Directives, " ")
			Names[5] = if Fields and #Fields ~= 0 then ("{\n%s\n}"):format(indent((join(Fields, "\n")))) else ""
			
			return (join(Names, " "))
		end
	},
	FieldDefinition = {
		leave = function(_, p3): string --[[ Line: 710 ]]
			-- upvalues: Array (copy), String (copy), join (copy), Boolean (copy)
			local Arguments = p3.arguments
			local Type = p3.type
			local Directives = p3.directives
			local Text = tostring(p3.name)
			local SomeResult = if typeof(Arguments) == "table" then Array.some(Arguments, function(p4) --[[ Line: 212 ]]
				-- upvalues: String (upval)
				return String.includes(p4, "\n")
			end) else nil
			local Text3 = nil
			
			if SomeResult ~= nil and SomeResult then
				local Text1: string = join(Arguments, "\n")
				local Text2 = if Boolean.toJSBoolean(Text1) then ("  %s"):format((Text1:gsub("\n", "\n  "))) else Text1
				Text3 = if Boolean.toJSBoolean(Text2) then "(\n" .. tostring(Text2) .. (if Boolean.toJSBoolean("\n)") then "\n)" else "") else ""
			else
				local v1 = join(Arguments, ", ")
				Text3 = if Boolean.toJSBoolean(v1) then "(" .. tostring(v1) .. (if Boolean.toJSBoolean(")") then ")" else "") else ""
			end
			local v2 = ": "
			local Text4 = tostring(Type)
			local v3 = join(Directives, " ")
			local Text5 = nil
			
			if Boolean.toJSBoolean(v3) then
				local _ = Boolean.toJSBoolean(nil)
				Text5 = " " .. tostring(v3) .. ""
			else
				Text5 = ""
			end
			return Text .. Text3 .. v2 .. Text4 .. Text5
		end
	},
	InputValueDefinition = {
		leave = function(_, p3) --[[ Line: 735 ]]
			-- upvalues: join (copy), Boolean (copy)
			local DefaultValue = p3.defaultValue
			local Directives = p3.directives
			local t = {}
			local Text = tostring(p3.name) .. ": " .. tostring(p3.type)
			local Text1 = nil
			
			if Boolean.toJSBoolean(DefaultValue) then
				local _ = Boolean.toJSBoolean(nil)
				Text1 = "= " .. tostring(DefaultValue) .. ""
			else
				Text1 = ""
			end
			t[1] = Text
			t[2] = Text1
			t[3] = join(Directives, " ")
			
			return (join(t, " "))
		end
	},
	InterfaceTypeDefinition = {
		leave = function(_, p3) --[[ Line: 748 ]]
			-- upvalues: join (copy), Boolean (copy), indent (copy)
			local Directives = p3.directives
			local Fields = p3.fields
			local Names = {}
			local v1 = "interface"
			local Name = p3.name
			local v2 = join(p3.interfaces, " & ")
			local Text = nil
			
			if Boolean.toJSBoolean(v2) then
				local _ = Boolean.toJSBoolean(nil)
				Text = "implements " .. tostring(v2) .. ""
			else
				Text = ""
			end
			Names[1] = v1
			Names[2] = Name
			Names[3] = Text
			Names[4] = join(Directives, " ")
			Names[5] = if Fields and #Fields ~= 0 then ("{\n%s\n}"):format(indent((join(Fields, "\n")))) else ""
			
			return (join(Names, " "))
		end
	},
	UnionTypeDefinition = {
		leave = function(_, p3) --[[ Line: 763 ]]
			-- upvalues: join (copy), Boolean (copy)
			local Types = p3.types
			local Names = {}
			local v1 = "union"
			local Name = p3.name
			local v2 = join(p3.directives, " ")
			local v3 = join(Types, " | ")
			local Text = nil
			
			if Boolean.toJSBoolean(v3) then
				local _ = Boolean.toJSBoolean(nil)
				Text = "= " .. tostring(v3) .. ""
			else
				Text = ""
			end
			Names[1] = v1
			Names[2] = Name
			Names[3] = v2
			Names[4] = Text
			
			return (join(Names, " "))
		end
	},
	EnumTypeDefinition = {
		leave = function(_, p3) --[[ Line: 772 ]]
			-- upvalues: join (copy), indent (copy)
			local Values = p3.values
			
			return (join({
				"enum",
				p3.name,
				join(p3.directives, " "),
				if Values and #Values ~= 0 then ("{\n%s\n}"):format(indent((join(Values, "\n")))) else ""
			}, " "))
		end
	},
	EnumValueDefinition = {
		leave = function(_, p3) --[[ Line: 781 ]]
			-- upvalues: join (copy)
			return (join({ p3.name, (join(p3.directives, " ")) }, " "))
		end
	},
	InputObjectTypeDefinition = {
		leave = function(_, p3) --[[ Line: 790 ]]
			-- upvalues: join (copy), indent (copy)
			local Fields = p3.fields
			
			return (join({
				"input",
				p3.name,
				join(p3.directives, " "),
				if Fields and #Fields ~= 0 then ("{\n%s\n}"):format(indent((join(Fields, "\n")))) else ""
			}, " "))
		end
	},
	DirectiveDefinition = {
		leave = function(_, p3): string --[[ Line: 799 ]]
			-- upvalues: Boolean (copy), Array (copy), String (copy), join (copy)
			local Arguments = p3.arguments
			local Repeatable = p3.repeatable
			local Locations = p3.locations
			local v1 = "directive @"
			local Text = tostring(p3.name)
			local SomeResult = if typeof(Arguments) == "table" then Array.some(Arguments, function(p4) --[[ Line: 212 ]]
				-- upvalues: String (upval)
				return String.includes(p4, "\n")
			end) else nil
			local Text3 = nil
			
			if Boolean.toJSBoolean(SomeResult ~= nil and SomeResult) then
				local Text1: string = join(Arguments, "\n")
				local Text2 = if Boolean.toJSBoolean(Text1) then ("  %s"):format((Text1:gsub("\n", "\n  "))) else Text1
				Text3 = if Boolean.toJSBoolean(Text2) then "(\n" .. tostring(Text2) .. (if Boolean.toJSBoolean("\n)") then "\n)" else "") else ""
			else
				local v2 = join(Arguments, ", ")
				Text3 = if Boolean.toJSBoolean(v2) then "(" .. tostring(v2) .. (if Boolean.toJSBoolean(")") then ")" else "") else ""
			end
			return v1 .. Text .. tostring(Text3) .. (if Boolean.toJSBoolean(Repeatable) then " repeatable" else "") .. " on " .. tostring((join(Locations, " | ")))
		end
	},
	SchemaExtension = {
		leave = function(_, p3) --[[ Line: 817 ]]
			-- upvalues: join (copy), indent (copy)
			local OperationTypes = p3.operationTypes
			
			return (join({
				"extend schema",
				join(p3.directives, " "),
				if OperationTypes and #OperationTypes ~= 0 then ("{\n%s\n}"):format(indent((join(OperationTypes, "\n")))) else ""
			}, " "))
		end
	},
	ScalarTypeExtension = {
		leave = function(_, p3) --[[ Line: 826 ]]
			-- upvalues: join (copy)
			return (join({ "extend scalar", p3.name, (join(p3.directives, " ")) }, " "))
		end
	},
	ObjectTypeExtension = {
		leave = function(_, p3) --[[ Line: 835 ]]
			-- upvalues: join (copy), Boolean (copy), indent (copy)
			local Directives = p3.directives
			local Fields = p3.fields
			local Names = {}
			local v1 = "extend type"
			local Name = p3.name
			local v2 = join(p3.interfaces, " & ")
			local Text = nil
			
			if Boolean.toJSBoolean(v2) then
				local _ = Boolean.toJSBoolean(nil)
				Text = "implements " .. tostring(v2) .. ""
			else
				Text = ""
			end
			Names[1] = v1
			Names[2] = Name
			Names[3] = Text
			Names[4] = join(Directives, " ")
			Names[5] = if Fields and #Fields ~= 0 then ("{\n%s\n}"):format(indent((join(Fields, "\n")))) else ""
			
			return (join(Names, " "))
		end
	},
	InterfaceTypeExtension = {
		leave = function(_, p3) --[[ Line: 850 ]]
			-- upvalues: join (copy), Boolean (copy), indent (copy)
			local Directives = p3.directives
			local Fields = p3.fields
			local Names = {}
			local v1 = "extend interface"
			local Name = p3.name
			local v2 = join(p3.interfaces, " & ")
			local Text = nil
			
			if Boolean.toJSBoolean(v2) then
				local _ = Boolean.toJSBoolean(nil)
				Text = "implements " .. tostring(v2) .. ""
			else
				Text = ""
			end
			Names[1] = v1
			Names[2] = Name
			Names[3] = Text
			Names[4] = join(Directives, " ")
			Names[5] = if Fields and #Fields ~= 0 then ("{\n%s\n}"):format(indent((join(Fields, "\n")))) else ""
			
			return (join(Names, " "))
		end
	},
	UnionTypeExtension = {
		leave = function(_, p3) --[[ Line: 865 ]]
			-- upvalues: join (copy), Boolean (copy)
			local Types = p3.types
			local Names = {}
			local v1 = "extend union"
			local Name = p3.name
			local v2 = join(p3.directives, " ")
			local v3 = join(Types, " | ")
			local Text = nil
			
			if Boolean.toJSBoolean(v3) then
				local _ = Boolean.toJSBoolean(nil)
				Text = "= " .. tostring(v3) .. ""
			else
				Text = ""
			end
			Names[1] = v1
			Names[2] = Name
			Names[3] = v2
			Names[4] = Text
			
			return (join(Names, " "))
		end
	},
	EnumTypeExtension = {
		leave = function(_, p3) --[[ Line: 874 ]]
			-- upvalues: join (copy), indent (copy)
			local Values = p3.values
			
			return (join({
				"extend enum",
				p3.name,
				join(p3.directives, " "),
				if Values and #Values ~= 0 then ("{\n%s\n}"):format(indent((join(Values, "\n")))) else ""
			}, " "))
		end
	},
	InputObjectTypeExtension = {
		leave = function(_, p3) --[[ Line: 883 ]]
			-- upvalues: join (copy), indent (copy)
			local Fields = p3.fields
			
			return (join({
				"extend input",
				p3.name,
				join(p3.directives, " "),
				if Fields and #Fields ~= 0 then ("{\n%s\n}"):format(indent((join(Fields, "\n")))) else ""
			}, " "))
		end
	}
}
local ReduceResult = Array.reduce(Object.keys(config), function(p3, p4) --[[ Line: 900 ]]
	-- upvalues: Object (copy), config (copy), Array (copy), Boolean (copy), String (copy), t (ref), join (copy), printComment (copy)
	local LeaveFunction = config[p4].leave
	
	return (Object.assign({}, p3, {
		[p4] = {
			leave = function(p5, p6, p7, p8, p9, Entry) --[[ Line: 230 ]]
				-- upvalues: Array (upval), Object (upval), Boolean (upval), String (upval), t (upval), join (upval), printComment (upval), LeaveFunction (copy)
				local List = {}
				local ReduceResult = Array.reduce(p9, function(None, None1) --[[ Line: 258 ]]
					-- upvalues: Object (upval), Array (upval), Boolean (upval), List (copy)
					if None1 ~= Object.None and Array.includes({ "fields", "arguments", "values" }, None1) and Boolean.toJSBoolean(None.name) then
						table.insert(List, None.name.value)
					end
					return if None == Object.None then None1 else None[None1]
				end, Entry[1] or Object.None)
				local v1 = Array.join(Array.filter(Array.concat({}, List, {
					if typeof(if typeof(ReduceResult) == "table" then ReduceResult.name else nil) == "table" then (if typeof(ReduceResult) == "table" then ReduceResult.name else nil).value else nil
				}), Boolean.toJSBoolean), ".")
				local ConcatResult = {}
				
				if String.includes(p6.kind, "Definition") and Boolean.toJSBoolean(t[v1]) then
					ConcatResult = Array.concat(ConcatResult, t[v1])
				end
				return (join(Array.concat({}, Array.map(ConcatResult, printComment), {
					p6.description or "",
					(LeaveFunction(p5, p6, p7, p8, p9, Entry))
				}), "\n"))
			end
		}
	}))
end, {})

Callback1 = function(p5): boolean --[[ Line: 920 | Named "isFieldDefinitionNode" ]]
	return p5.kind == "FieldDefinition"
end

Callback2 = function(p5) --[[ Line: 945 | Named "getComment" ]]
	-- upvalues: Callback3 (ref), Callback4 (ref)
	local CallbackResult = Callback3(p5)
	
	return if CallbackResult == nil then nil else Callback4(("\n%s"):format((tostring(CallbackResult))))
end

Callback3 = function(p5) --[[ Line: 958 | Named "getLeadingCommentBlock" ]]
	-- upvalues: Boolean (copy), TokenKind (copy), Array (copy)
	local Loc = p5.loc
	
	if not Boolean.toJSBoolean(Loc) then return end
	local List = {}
	local Prev = Loc.startToken.prev
	while Prev ~= nil and (Prev.kind == TokenKind.COMMENT and Prev.next ~= nil and Prev.prev ~= nil and Prev.line + 1 == Prev.next.line and Prev.line ~= Prev.prev.line) do
		table.insert(List, (tostring(Prev.value)))
		Prev = Prev.prev
	end
	return if #List > 0 then Array.join(Array.reverse(List), "\n") else nil
end

Callback4 = function(p6) --[[ Line: 995 | Named "dedentBlockStringValue" ]]
	-- upvalues: String (copy), Callback5 (ref), IsBlank (ref), Array (copy)
	local SplitResult = String.split(p6, { "\r\n", "\n", "\r" })
	local CallbackResult: number = Callback5(SplitResult)
	
	if CallbackResult ~= 0 then
		local Count = 2
		while Count <= #SplitResult do
			SplitResult[Count] = String.slice(SplitResult[Count], CallbackResult + 1)
			Count += 1
		end
	end
	while #SplitResult > 0 and IsBlank(SplitResult[1]) do
		table.remove(SplitResult, 1)
	end
	while #SplitResult > 0 and IsBlank(SplitResult[#SplitResult]) do
		table.remove(SplitResult)
	end
	return Array.join(SplitResult, "\n")
end

Callback5 = function(SplitResult) --[[ Line: 1060 | Named "getBlockStringIndentation" ]]
	-- upvalues: Callback6 (ref)
	local v1 = nil
	local Count = 2
	while Count <= #SplitResult do
		local SplitResultEntry = SplitResult[Count]
		local CallbackResult = Callback6(SplitResultEntry)
		
		if CallbackResult == #SplitResultEntry then
			Count += 1
		else
			if v1 == nil or CallbackResult < v1 then
				v1 = CallbackResult
				
				if v1 == 0 then break end
			end
			Count += 1
		end
	end
	return if v1 == nil then 0 else v1
end

Callback6 = function(Text): number --[[ Line: 1107 | Named "leadingWhitespace" ]]
	local Count = 0
	while Count < #Text and (Text:sub(Count + 1, Count + 1) == " " or Text:sub(Count + 1, Count + 1) == "\t") do
		Count += 1
	end
	return Count
end

IsBlank = function(p7): boolean --[[ Line: 1123 | Named "isBlank" ]]
	-- upvalues: Callback6 (ref)
	return Callback6(p7) == #p7
end

return {
	resetComments = function() --[[ Line: 62 ]]
		-- upvalues: t (ref)
		t = {}
	end,
	collectComment = collectComment,
	pushComment = Callback,
	printComment = printComment,
	printWithComments = function(p7) --[[ Line: 914 ]]
		-- upvalues: VisitFunction (copy), ReduceResult (copy)
		return (VisitFunction(p7, ReduceResult))
	end,
	getDescription = function(p7, p8) --[[ Line: 926 ]]
		-- upvalues: Boolean (copy), Callback2 (ref)
		return if p7.description == nil then if Boolean.toJSBoolean(if typeof(p8) == "table" then p8.commentDescriptions else nil) then Callback2(p7) else nil else p7.description.value
	end,
	getComment = Callback2,
	getLeadingCommentBlock = Callback3,
	dedentBlockStringValue = Callback4,
	getBlockStringIndentation = Callback5
}
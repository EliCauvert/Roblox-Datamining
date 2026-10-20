local Array = require(script.Parent.Parent.Parent.LuauPolyfill).Array
local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.ast)
local VisitFunction = require(script.Parent.visitor).visit
local PrintBlockStringFunction = require(script.Parent.blockString).printBlockString
local Leave = nil
local Callback = nil
local Callback2 = nil
local Callback1 = nil
local Callback3 = nil
local isMultiline = nil
local Callback4 = nil

local function print_(p1)
	-- upvalues: VisitFunction (copy), Leave (ref)
	return VisitFunction(p1, { leave = Leave })
end

local function addDescription(Callback1)
	-- upvalues: Callback (ref)
	return function(_, p1)
		-- upvalues: Callback (upval), Callback1 (copy)
		return Callback({ p1.description, Callback1(p1) }, "\n")
	end
end

Leave = {
	Name = function(_, p1)
		return p1.value
	end,
	Variable = function(_, p1): string
		return "$" .. tostring(p1.name)
	end,
	Document = function(_, p1): string
		-- upvalues: Callback (ref)
		return Callback(p1.definitions, "\n\n") .. "\n"
	end,
	OperationDefinition = function(_, p1)
		-- upvalues: Callback1 (ref), Callback (ref)
		local Operation = p1.operation
		local Name = p1.name
		local v1 = Callback1("(", Callback(p1.variableDefinitions, ", "), ")")
		local v2 = Callback(p1.directives, " ")
		local SelectionSet = p1.selectionSet
		
		return if Name or v2 and v2 ~= "" or v1 and v1 ~= "" or Operation ~= "query" then Callback({ Operation, Callback({ Name, v1 }), v2, SelectionSet }, " ") else SelectionSet
	end,
	VariableDefinition = function(_, p1): string
		-- upvalues: Callback1 (ref), Callback (ref)
		return tostring(p1.variable) .. ": " .. tostring(p1.type) .. Callback1(" = ", p1.defaultValue) .. Callback1(" ", Callback(p1.directives, " "))
	end,
	SelectionSet = function(_, p1)
		-- upvalues: Callback2 (ref)
		return Callback2(p1.selections)
	end,
	Field = function(_, p1)
		-- upvalues: Callback1 (ref), Callback (ref), Callback3 (ref)
		local Arguments = p1.arguments
		local Directives = p1.directives
		local SelectionSet = p1.selectionSet
		local Text = Callback1("", p1.alias, ": ") .. tostring(p1.name)
		local Text1 = Text .. Callback1("(", Callback(Arguments, ", "), ")")
		local Length = utf8.len(Text1)
		assert(Length ~= nil, "invalid utf8 string")
		
		if Length > 80 then
			Text1 = Text .. Callback1("(\n", Callback3(Callback(Arguments, "\n")), "\n)")
		end
		return Callback({ Text1, Callback(Directives, " "), SelectionSet }, " ")
	end,
	Argument = function(_, p1): string
		return tostring(p1.name) .. ": " .. tostring(p1.value)
	end,
	FragmentSpread = function(_, p1): string
		-- upvalues: Callback1 (ref), Callback (ref)
		return "..." .. tostring(p1.name) .. Callback1(" ", Callback(p1.directives, " "))
	end,
	InlineFragment = function(_, p1)
		-- upvalues: Callback (ref), Callback1 (ref)
		return Callback({
			"...",
			Callback1("on ", p1.typeCondition),
			Callback(p1.directives, " "),
			p1.selectionSet
		}, " ")
	end,
	FragmentDefinition = function(_, p1): string
		-- upvalues: Callback1 (ref), Callback (ref)
		return "fragment " .. tostring(p1.name) .. Callback1("(", Callback(p1.variableDefinitions, ", "), ")") .. " " .. "on " .. tostring(p1.typeCondition) .. " " .. Callback1("", Callback(p1.directives, " "), " ") .. tostring(p1.selectionSet)
	end,
	IntValue = function(_, p1)
		return p1.value
	end,
	FloatValue = function(_, p1)
		return p1.value
	end,
	StringValue = function(_, p1, p2)
		-- upvalues: PrintBlockStringFunction (copy), HttpService (copy)
		local Value = p1.value
		
		return if p1.block then PrintBlockStringFunction(Value, if p2 == "description" then "" else "  ") else HttpService:JSONEncode(Value)
	end,
	BooleanValue = function(_, p1): string
		return if p1.value then "true" else "false"
	end,
	NullValue = function(_, _): string
		return "null"
	end,
	EnumValue = function(_, p1)
		return p1.value
	end,
	ListValue = function(_, p1): string
		-- upvalues: Callback (ref)
		return "[" .. Callback(p1.values, ", ") .. "]"
	end,
	ObjectValue = function(_, p1): string
		-- upvalues: Callback (ref)
		return "{" .. Callback(p1.fields, ", ") .. "}"
	end,
	ObjectField = function(_, p1): string
		return p1.name .. ": " .. p1.value
	end,
	Directive = function(_, p1): string
		-- upvalues: Callback1 (ref), Callback (ref)
		return "@" .. tostring(p1.name) .. Callback1("(", Callback(p1.arguments, ", "), ")")
	end,
	NamedType = function(_, p1)
		return p1.name
	end,
	ListType = function(_, p1): string
		return "[" .. tostring(p1.type) .. "]"
	end,
	NonNullType = function(_, p1): string
		return tostring(p1.type) .. "!"
	end,
	SchemaDefinition = addDescription(function(p1)
		-- upvalues: Callback (ref), Callback2 (ref)
		return Callback({
			"schema",
			Callback(p1.directives, " "),
			Callback2(p1.operationTypes)
		}, " ")
	end),
	OperationTypeDefinition = function(_, p1): string
		return tostring(p1.operation) .. ": " .. tostring(p1.type)
	end,
	ScalarTypeDefinition = addDescription(function(p1)
		-- upvalues: Callback (ref)
		return Callback({ "scalar", p1.name, Callback(p1.directives, " ") }, " ")
	end),
	ObjectTypeDefinition = addDescription(function(p1)
		-- upvalues: Callback (ref), Callback1 (ref), Callback2 (ref)
		return Callback({
			"type",
			p1.name,
			Callback1("implements ", Callback(p1.interfaces, " & ")),
			Callback(p1.directives, " "),
			Callback2(p1.fields)
		}, " ")
	end),
	FieldDefinition = addDescription(function(p1): string
		-- upvalues: Callback4 (ref), Callback1 (ref), Callback3 (ref), Callback (ref)
		local Arguments = p1.arguments
		
		return tostring(p1.name) .. (if Callback4(Arguments) then Callback1("(\n", Callback3(Callback(Arguments, "\n")), "\n)") else Callback1("(", Callback(Arguments, ", "), ")")) .. ": " .. tostring(p1.type) .. Callback1(" ", Callback(p1.directives, " "))
	end),
	InputValueDefinition = addDescription(function(p1)
		-- upvalues: Callback (ref), Callback1 (ref)
		return Callback({
			tostring(p1.name) .. ": " .. tostring(p1.type),
			Callback1("= ", p1.defaultValue),
			Callback(p1.directives, " ")
		}, " ")
	end),
	InterfaceTypeDefinition = addDescription(function(p1)
		-- upvalues: Callback (ref), Callback1 (ref), Callback2 (ref)
		return Callback({
			"interface",
			p1.name,
			Callback1("implements ", Callback(p1.interfaces, " & ")),
			Callback(p1.directives, " "),
			Callback2(p1.fields)
		}, " ")
	end),
	UnionTypeDefinition = addDescription(function(p1)
		-- upvalues: Callback (ref)
		local Types = p1.types
		
		return Callback({
			"union",
			p1.name,
			Callback(p1.directives, " "),
			if Types and #Types ~= 0 then "= " .. Callback(Types, " | ") else ""
		}, " ")
	end),
	EnumTypeDefinition = addDescription(function(p1)
		-- upvalues: Callback (ref), Callback2 (ref)
		return Callback({
			"enum",
			p1.name,
			Callback(p1.directives, " "),
			Callback2(p1.values)
		}, " ")
	end),
	EnumValueDefinition = addDescription(function(p1)
		-- upvalues: Callback (ref)
		return Callback({ p1.name, Callback(p1.directives, " ") }, " ")
	end),
	InputObjectTypeDefinition = addDescription(function(p1)
		-- upvalues: Callback (ref), Callback2 (ref)
		return Callback({
			"input",
			p1.name,
			Callback(p1.directives, " "),
			Callback2(p1.fields)
		}, " ")
	end),
	DirectiveDefinition = addDescription(function(p1): string
		-- upvalues: Callback4 (ref), Callback1 (ref), Callback3 (ref), Callback (ref)
		local Arguments = p1.arguments
		local Repeatable = p1.repeatable
		
		return "directive @" .. tostring(p1.name) .. (if Callback4(Arguments) then Callback1("(\n", Callback3(Callback(Arguments, "\n")), "\n)") else Callback1("(", Callback(Arguments, ", "), ")")) .. (if Repeatable then " repeatable" else "") .. " on " .. Callback(p1.locations, " | ")
	end),
	SchemaExtension = function(_, p1)
		-- upvalues: Callback (ref), Callback2 (ref)
		return Callback({
			"extend schema",
			Callback(p1.directives, " "),
			Callback2(p1.operationTypes)
		}, " ")
	end,
	ScalarTypeExtension = function(_, p1)
		-- upvalues: Callback (ref)
		return Callback({ "extend scalar", p1.name, Callback(p1.directives, " ") }, " ")
	end,
	ObjectTypeExtension = function(_, p1)
		-- upvalues: Callback (ref), Callback1 (ref), Callback2 (ref)
		return Callback({
			"extend type",
			p1.name,
			Callback1("implements ", Callback(p1.interfaces, " & ")),
			Callback(p1.directives, " "),
			Callback2(p1.fields)
		}, " ")
	end,
	InterfaceTypeExtension = function(_, p1)
		-- upvalues: Callback (ref), Callback1 (ref), Callback2 (ref)
		return Callback({
			"extend interface",
			p1.name,
			Callback1("implements ", Callback(p1.interfaces, " & ")),
			Callback(p1.directives, " "),
			Callback2(p1.fields)
		}, " ")
	end,
	UnionTypeExtension = function(_, p1)
		-- upvalues: Callback (ref)
		local Types = p1.types
		
		return Callback({
			"extend union",
			p1.name,
			Callback(p1.directives, " "),
			if Types and #Types ~= 0 then "= " .. Callback(Types, " | ") else ""
		}, " ")
	end,
	EnumTypeExtension = function(_, p1)
		-- upvalues: Callback (ref), Callback2 (ref)
		return Callback({
			"extend enum",
			p1.name,
			Callback(p1.directives, " "),
			Callback2(p1.values)
		}, " ")
	end,
	InputObjectTypeExtension = function(_, p1)
		-- upvalues: Callback (ref), Callback2 (ref)
		return Callback({
			"extend input",
			p1.name,
			Callback(p1.directives, " "),
			Callback2(p1.fields)
		}, " ")
	end
}

Callback = function(Directives, p1)
	-- upvalues: Array (copy)
	local P80 = p1 or ""
	
	return if Directives then Array.join(Array.filter(Directives, function(p2): boolean
		return tostring(p2) and p2 ~= ""
	end), P80) else ""
end

Callback2 = function(Fields)
	-- upvalues: Callback1 (ref), Callback3 (ref), Callback (ref)
	return Callback1("{\n", Callback3(Callback(Fields, "\n")), "\n}")
end

Callback1 = function(Text, DefaultValue, p1): string
	local P85 = p1 or ""
	
	return if DefaultValue == nil or DefaultValue == "" then "" else Text .. tostring(DefaultValue) .. tostring(P85)
end

Callback3 = function(Text: string)
	-- upvalues: Callback1 (ref)
	return Callback1("  ", (Text:gsub("\n", "\n  ")))
end

isMultiline = function(p1): boolean
	return string.find(tostring(p1), "\n") ~= nil
end

Callback4 = function(Arguments)
	-- upvalues: Array (copy), isMultiline (ref)
	return Arguments ~= nil and Array.some(Arguments, isMultiline)
end

return { print = print_ }
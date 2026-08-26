local array = require(script.Parent.Parent.Parent.LuauPolyfill).Array
local httpService = game:GetService("HttpService")
local _ = require(script.Parent.ast)
local visit = require(script.Parent.visitor).visit
local printBlockString = require(script.Parent.blockString).printBlockString
local t = nil
local _ = nil
local join = nil
local block = nil
local wrap = nil
local indent = nil
local _ = nil
local hasMultilineItems = nil

local function print_(p1)
	-- upvalues: visit (ref), t (write)
	return visit(p1, { leave = t })
end

local function addDescription(p1)
	-- upvalues: join (write)
	return function(_, p2)
		-- upvalues: join (copy), p1 (ref)
		return join({ p2.description, p1(p2) }, "\n")
	end
end

t = {
	Name = function(_, p1)
		return p1.value
	end,
	Variable = function(_, p1)
		return "$" .. tostring(p1.name)
	end,
	Document = function(_, p1)
		-- upvalues: join (write)
		return join(p1.definitions, "\n\n") .. "\n"
	end,
	OperationDefinition = function(_, p1)
		-- upvalues: wrap (write), join (write)
		local operation = p1.operation
		local name = p1.name
		local var1 = wrap("(", join(p1.variableDefinitions, ", "), ")")
		local var2 = join(p1.directives, " ")
		local selectionSet = p1.selectionSet
		
		return if name or var2 and var2 ~= "" or (var1 and var1 ~= "" or operation ~= "query") then join({ operation, join({ name, var1 }), var2, selectionSet }, " ") else selectionSet
	end,
	VariableDefinition = function(_, p1)
		-- upvalues: wrap (write), join (write)
		return tostring(p1.variable) .. ": " .. tostring(p1.type) .. wrap(" = ", p1.defaultValue) .. wrap(" ", join(p1.directives, " "))
	end,
	SelectionSet = function(_, p1)
		-- upvalues: block (write)
		return block(p1.selections)
	end,
	Field = function(_, p1)
		-- upvalues: wrap (write), join (write), indent (write)
		local alias = p1.alias
		local name = p1.name
		local arguments = p1.arguments
		local directives = p1.directives
		local selectionSet = p1.selectionSet
		local text = wrap("", alias, ": ") .. tostring(name)
		local text_1 = text .. wrap("(", join(arguments, ", "), ")")
		local charCount = utf8.len(text_1)
		assert(charCount ~= nil, "invalid utf8 string")
		
		if charCount > 80 then
			text_1 = text .. wrap("(\n", indent(join(arguments, "\n")), "\n)")
		end
		return join({ text_1, join(directives, " "), selectionSet }, " ")
	end,
	Argument = function(_, p1)
		return tostring(p1.name) .. ": " .. tostring(p1.value)
	end,
	FragmentSpread = function(_, p1)
		-- upvalues: wrap (write), join (write)
		return "..." .. tostring(p1.name) .. wrap(" ", join(p1.directives, " "))
	end,
	InlineFragment = function(_, p1)
		-- upvalues: join (write), wrap (write)
		return join({
			"...",
			wrap("on ", p1.typeCondition),
			join(p1.directives, " "),
			p1.selectionSet
		}, " ")
	end,
	FragmentDefinition = function(_, p1)
		-- upvalues: wrap (write), join (write)
		return "fragment " .. tostring(p1.name) .. wrap("(", join(p1.variableDefinitions, ", "), ")") .. " " .. "on " .. tostring(p1.typeCondition) .. " " .. wrap("", join(p1.directives, " "), " ") .. tostring(p1.selectionSet)
	end,
	IntValue = function(_, p1)
		return p1.value
	end,
	FloatValue = function(_, p1)
		return p1.value
	end,
	StringValue = function(_, p1, p2)
		-- upvalues: printBlockString (ref), httpService (ref)
		local value = p1.value
		
		return if p1.block then printBlockString(value, if p2 == "description" then "" else "  ") else httpService:JSONEncode(value)
	end,
	BooleanValue = function(_, p1)
		return if p1.value then "true" else "false"
	end,
	NullValue = function(_, _)
		return "null"
	end,
	EnumValue = function(_, p1)
		return p1.value
	end,
	ListValue = function(_, p1)
		-- upvalues: join (write)
		return "[" .. join(p1.values, ", ") .. "]"
	end,
	ObjectValue = function(_, p1)
		-- upvalues: join (write)
		return "{" .. join(p1.fields, ", ") .. "}"
	end,
	ObjectField = function(_, p1)
		return p1.name .. ": " .. p22.value
	end,
	Directive = function(_, p1)
		-- upvalues: wrap (write), join (write)
		return "@" .. tostring(p1.name) .. wrap("(", join(p1.arguments, ", "), ")")
	end,
	NamedType = function(_, p1)
		return p1.name
	end,
	ListType = function(_, p1)
		return "[" .. tostring(p1.type) .. "]"
	end,
	NonNullType = function(_, p1)
		return tostring(p1.type) .. "!"
	end,
	SchemaDefinition = addDescription(function(p1)
		-- upvalues: join (write), block (write)
		return join({
			"schema",
			join(p1.directives, " "),
			block(p1.operationTypes)
		}, " ")
	end),
	OperationTypeDefinition = function(_, p1)
		return tostring(p1.operation) .. ": " .. tostring(p1.type)
	end,
	ScalarTypeDefinition = addDescription(function(p1)
		-- upvalues: join (write)
		return join({ "scalar", p1.name, join(p1.directives, " ") }, " ")
	end),
	ObjectTypeDefinition = addDescription(function(p1)
		-- upvalues: join (write), wrap (write), block (write)
		return join({
			"type",
			p1.name,
			wrap("implements ", join(p1.interfaces, " & ")),
			join(p1.directives, " "),
			block(p1.fields)
		}, " ")
	end),
	FieldDefinition = addDescription(function(p1)
		-- upvalues: hasMultilineItems (write), wrap (write), indent (write), join (write)
		local arguments = p1.arguments
		
		return tostring(p1.name) .. (if hasMultilineItems(arguments) then wrap("(\n", indent(join(arguments, "\n")), "\n)") else wrap("(", join(arguments, ", "), ")")) .. ": " .. tostring(p1.type) .. wrap(" ", join(p1.directives, " "))
	end),
	InputValueDefinition = addDescription(function(p1)
		-- upvalues: join (write), wrap (write)
		return join({
			tostring(p1.name) .. ": " .. tostring(p1.type),
			wrap("= ", p1.defaultValue),
			join(p1.directives, " ")
		}, " ")
	end),
	InterfaceTypeDefinition = addDescription(function(p1)
		-- upvalues: join (write), wrap (write), block (write)
		return join({
			"interface",
			p1.name,
			wrap("implements ", join(p1.interfaces, " & ")),
			join(p1.directives, " "),
			block(p1.fields)
		}, " ")
	end),
	UnionTypeDefinition = addDescription(function(p1)
		-- upvalues: join (write)
		local types = p1.types
		
		return join({
			"union",
			p1.name,
			join(p1.directives, " "),
			if types and #types ~= 0 then "= " .. join(types, " | ") else ""
		}, " ")
	end),
	EnumTypeDefinition = addDescription(function(p1)
		-- upvalues: join (write), block (write)
		return join({
			"enum",
			p1.name,
			join(p1.directives, " "),
			block(p1.values)
		}, " ")
	end),
	EnumValueDefinition = addDescription(function(p1)
		-- upvalues: join (write)
		return join({ p1.name, join(p1.directives, " ") }, " ")
	end),
	InputObjectTypeDefinition = addDescription(function(p1)
		-- upvalues: join (write), block (write)
		return join({
			"input",
			p1.name,
			join(p1.directives, " "),
			block(p1.fields)
		}, " ")
	end),
	DirectiveDefinition = addDescription(function(p1)
		-- upvalues: hasMultilineItems (write), wrap (write), indent (write), join (write)
		local arguments = p1.arguments
		
		return "directive @" .. tostring(p1.name) .. (if hasMultilineItems(arguments) then wrap("(\n", indent(join(arguments, "\n")), "\n)") else wrap("(", join(arguments, ", "), ")")) .. (if p1.repeatable then " repeatable" else "") .. " on " .. join(p1.locations, " | ")
	end),
	SchemaExtension = function(_, p1)
		-- upvalues: join (write), block (write)
		return join({
			"extend schema",
			join(p1.directives, " "),
			block(p1.operationTypes)
		}, " ")
	end,
	ScalarTypeExtension = function(_, p1)
		-- upvalues: join (write)
		return join({ "extend scalar", p1.name, join(p1.directives, " ") }, " ")
	end,
	ObjectTypeExtension = function(_, p1)
		-- upvalues: join (write), wrap (write), block (write)
		return join({
			"extend type",
			p1.name,
			wrap("implements ", join(p1.interfaces, " & ")),
			join(p1.directives, " "),
			block(p1.fields)
		}, " ")
	end,
	InterfaceTypeExtension = function(_, p1)
		-- upvalues: join (write), wrap (write), block (write)
		return join({
			"extend interface",
			p1.name,
			wrap("implements ", join(p1.interfaces, " & ")),
			join(p1.directives, " "),
			block(p1.fields)
		}, " ")
	end,
	UnionTypeExtension = function(_, p1)
		-- upvalues: join (write)
		local types = p1.types
		
		return join({
			"extend union",
			p1.name,
			join(p1.directives, " "),
			if types and #types ~= 0 then "= " .. join(types, " | ") else ""
		}, " ")
	end,
	EnumTypeExtension = function(_, p1)
		-- upvalues: join (write), block (write)
		return join({
			"extend enum",
			p1.name,
			join(p1.directives, " "),
			block(p1.values)
		}, " ")
	end,
	InputObjectTypeExtension = function(_, p1)
		-- upvalues: join (write), block (write)
		return join({
			"extend input",
			p1.name,
			join(p1.directives, " "),
			block(p1.fields)
		}, " ")
	end
}

join = function(p1, p2)
	-- upvalues: array (ref)
	p2 = p2 or ""
	
	return if p1 then array.join(array.filter(p1, function(p3)
		return tostring(p3) and p3 ~= ""
	end), p2) else ""
end

block = function(p1)
	-- upvalues: wrap (write), indent (write), join (write)
	return wrap("{\n", indent(join(p1, "\n")), "\n}")
end

wrap = function(p1, p2, p3)
	p3 = p3 or ""
	
	return if p2 == nil or p2 == "" then "" else p1 .. tostring(p2) .. tostring(p3)
end

indent = function(p1)
	-- upvalues: wrap (write)
	return wrap("  ", p1:gsub("\n", "\n  "))
end

local function isMultiline(p1)
	return string.find(tostring(p1), "\n") ~= nil
end

hasMultilineItems = function(p1)
	-- upvalues: array (ref), isMultiline (write)
	return p1 ~= nil and array.some(p1, isMultiline)
end

return { print = print_ }
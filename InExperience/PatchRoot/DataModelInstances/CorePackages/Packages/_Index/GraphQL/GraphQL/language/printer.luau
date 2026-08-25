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

local function print_(p0)
	-- upvalues: visit (ref), t (write)
	return visit(p0, { leave = t })
end

local function addDescription(p1)
	-- upvalues: join (write)
	return function(_, p2)
		-- upvalues: join (copy), p1 (ref)
		return join({ p2.description, p1(p2) }, "\n")
	end
end

t = {
	Name = function(_, p3)
		return p3.value
	end,
	Variable = function(_, p4)
		return "$" .. tostring(p4.name)
	end,
	Document = function(_, p5)
		-- upvalues: join (write)
		return join(p5.definitions, "\n\n") .. "\n"
	end,
	OperationDefinition = function(_, p6)
		-- upvalues: wrap (write), join (write)
		local operation = p6.operation
		local name = p6.name
		local var10 = wrap("(", join(p6.variableDefinitions, ", "), ")")
		local var11 = join(p6.directives, " ")
		local selectionSet = p6.selectionSet
		
		return if name or var11 and var11 ~= "" or (var10 and var10 ~= "" or operation ~= "query") then join({ operation, join({ name, var10 }), var11, selectionSet }, " ") else selectionSet
	end,
	VariableDefinition = function(_, p7)
		-- upvalues: wrap (write), join (write)
		return tostring(p7.variable) .. ": " .. tostring(p7.type) .. wrap(" = ", p7.defaultValue) .. wrap(" ", join(p7.directives, " "))
	end,
	SelectionSet = function(_, p8)
		-- upvalues: block (write)
		return block(p8.selections)
	end,
	Field = function(_, p9)
		-- upvalues: wrap (write), join (write), indent (write)
		local alias = p9.alias
		local name = p9.name
		local arguments = p9.arguments
		local directives = p9.directives
		local selectionSet = p9.selectionSet
		local text = wrap("", alias, ": ") .. tostring(name)
		local text_1 = text .. wrap("(", join(arguments, ", "), ")")
		local charCount = utf8.len(text_1)
		assert(charCount ~= nil, "invalid utf8 string")
		
		if charCount > 80 then
			text_1 = text .. wrap("(\n", indent(join(arguments, "\n")), "\n)")
		end
		return join({ text_1, join(directives, " "), selectionSet }, " ")
	end,
	Argument = function(_, p10)
		return tostring(p10.name) .. ": " .. tostring(p10.value)
	end,
	FragmentSpread = function(_, p11)
		-- upvalues: wrap (write), join (write)
		return "..." .. tostring(p11.name) .. wrap(" ", join(p11.directives, " "))
	end,
	InlineFragment = function(_, p12)
		-- upvalues: join (write), wrap (write)
		return join({
			"...",
			wrap("on ", p12.typeCondition),
			join(p12.directives, " "),
			p12.selectionSet
		}, " ")
	end,
	FragmentDefinition = function(_, p13)
		-- upvalues: wrap (write), join (write)
		return "fragment " .. tostring(p13.name) .. wrap("(", join(p13.variableDefinitions, ", "), ")") .. " " .. "on " .. tostring(p13.typeCondition) .. " " .. wrap("", join(p13.directives, " "), " ") .. tostring(p13.selectionSet)
	end,
	IntValue = function(_, p14)
		return p14.value
	end,
	FloatValue = function(_, p15)
		return p15.value
	end,
	StringValue = function(_, p16, p17)
		-- upvalues: printBlockString (ref), httpService (ref)
		local value = p16.value
		
		return if p16.block then printBlockString(value, if p17 == "description" then "" else "  ") else httpService:JSONEncode(value)
	end,
	BooleanValue = function(_, p18)
		return if p18.value then "true" else "false"
	end,
	NullValue = function(_, _)
		return "null"
	end,
	EnumValue = function(_, p19)
		return p19.value
	end,
	ListValue = function(_, p20)
		-- upvalues: join (write)
		return "[" .. join(p20.values, ", ") .. "]"
	end,
	ObjectValue = function(_, p21)
		-- upvalues: join (write)
		return "{" .. join(p21.fields, ", ") .. "}"
	end,
	ObjectField = function(_, p22)
		return p22.name .. ": " .. p22.value
	end,
	Directive = function(_, p23)
		-- upvalues: wrap (write), join (write)
		return "@" .. tostring(p23.name) .. wrap("(", join(p23.arguments, ", "), ")")
	end,
	NamedType = function(_, p24)
		return p24.name
	end,
	ListType = function(_, p25)
		return "[" .. tostring(p25.type) .. "]"
	end,
	NonNullType = function(_, p26)
		return tostring(p26.type) .. "!"
	end,
	SchemaDefinition = addDescription(function(p27)
		-- upvalues: join (write), block (write)
		return join({
			"schema",
			join(p27.directives, " "),
			block(p27.operationTypes)
		}, " ")
	end),
	OperationTypeDefinition = function(_, p28)
		return tostring(p28.operation) .. ": " .. tostring(p28.type)
	end,
	ScalarTypeDefinition = addDescription(function(p29)
		-- upvalues: join (write)
		return join({ "scalar", p29.name, join(p29.directives, " ") }, " ")
	end),
	ObjectTypeDefinition = addDescription(function(p30)
		-- upvalues: join (write), wrap (write), block (write)
		return join({
			"type",
			p30.name,
			wrap("implements ", join(p30.interfaces, " & ")),
			join(p30.directives, " "),
			block(p30.fields)
		}, " ")
	end),
	FieldDefinition = addDescription(function(p31)
		-- upvalues: hasMultilineItems (write), wrap (write), indent (write), join (write)
		local arguments = p31.arguments
		
		return tostring(p31.name) .. (if hasMultilineItems(arguments) then wrap("(\n", indent(join(arguments, "\n")), "\n)") else wrap("(", join(arguments, ", "), ")")) .. ": " .. tostring(p31.type) .. wrap(" ", join(p31.directives, " "))
	end),
	InputValueDefinition = addDescription(function(p32)
		-- upvalues: join (write), wrap (write)
		return join({
			tostring(p32.name) .. ": " .. tostring(p32.type),
			wrap("= ", p32.defaultValue),
			join(p32.directives, " ")
		}, " ")
	end),
	InterfaceTypeDefinition = addDescription(function(p33)
		-- upvalues: join (write), wrap (write), block (write)
		return join({
			"interface",
			p33.name,
			wrap("implements ", join(p33.interfaces, " & ")),
			join(p33.directives, " "),
			block(p33.fields)
		}, " ")
	end),
	UnionTypeDefinition = addDescription(function(p34)
		-- upvalues: join (write)
		local types = p34.types
		
		return join({
			"union",
			p34.name,
			join(p34.directives, " "),
			if types and #types ~= 0 then "= " .. join(types, " | ") else ""
		}, " ")
	end),
	EnumTypeDefinition = addDescription(function(p35)
		-- upvalues: join (write), block (write)
		return join({
			"enum",
			p35.name,
			join(p35.directives, " "),
			block(p35.values)
		}, " ")
	end),
	EnumValueDefinition = addDescription(function(p36)
		-- upvalues: join (write)
		return join({ p36.name, join(p36.directives, " ") }, " ")
	end),
	InputObjectTypeDefinition = addDescription(function(p37)
		-- upvalues: join (write), block (write)
		return join({
			"input",
			p37.name,
			join(p37.directives, " "),
			block(p37.fields)
		}, " ")
	end),
	DirectiveDefinition = addDescription(function(p38)
		-- upvalues: hasMultilineItems (write), wrap (write), indent (write), join (write)
		local arguments = p38.arguments
		
		return "directive @" .. tostring(p38.name) .. (if hasMultilineItems(arguments) then wrap("(\n", indent(join(arguments, "\n")), "\n)") else wrap("(", join(arguments, ", "), ")")) .. (if p38.repeatable then " repeatable" else "") .. " on " .. join(p38.locations, " | ")
	end),
	SchemaExtension = function(_, p39)
		-- upvalues: join (write), block (write)
		return join({
			"extend schema",
			join(p39.directives, " "),
			block(p39.operationTypes)
		}, " ")
	end,
	ScalarTypeExtension = function(_, p40)
		-- upvalues: join (write)
		return join({ "extend scalar", p40.name, join(p40.directives, " ") }, " ")
	end,
	ObjectTypeExtension = function(_, p41)
		-- upvalues: join (write), wrap (write), block (write)
		return join({
			"extend type",
			p41.name,
			wrap("implements ", join(p41.interfaces, " & ")),
			join(p41.directives, " "),
			block(p41.fields)
		}, " ")
	end,
	InterfaceTypeExtension = function(_, p42)
		-- upvalues: join (write), wrap (write), block (write)
		return join({
			"extend interface",
			p42.name,
			wrap("implements ", join(p42.interfaces, " & ")),
			join(p42.directives, " "),
			block(p42.fields)
		}, " ")
	end,
	UnionTypeExtension = function(_, p43)
		-- upvalues: join (write)
		local types = p43.types
		
		return join({
			"extend union",
			p43.name,
			join(p43.directives, " "),
			if types and #types ~= 0 then "= " .. join(types, " | ") else ""
		}, " ")
	end,
	EnumTypeExtension = function(_, p44)
		-- upvalues: join (write), block (write)
		return join({
			"extend enum",
			p44.name,
			join(p44.directives, " "),
			block(p44.values)
		}, " ")
	end,
	InputObjectTypeExtension = function(_, p45)
		-- upvalues: join (write), block (write)
		return join({
			"extend input",
			p45.name,
			join(p45.directives, " "),
			block(p45.fields)
		}, " ")
	end
}

join = function(p46, p47)
	-- upvalues: array (ref)
	p47 = p47 or ""
	
	return if p46 then array.join(array.filter(p46, function(p48)
		return tostring(p48) and p48 ~= ""
	end), p47) else ""
end

block = function(p49)
	-- upvalues: wrap (write), indent (write), join (write)
	return wrap("{\n", indent(join(p49, "\n")), "\n}")
end

wrap = function(p50, p51, p52)
	p52 = p52 or ""
	
	return if p51 == nil or p51 == "" then "" else p50 .. tostring(p51) .. tostring(p52)
end

indent = function(p53)
	-- upvalues: wrap (write)
	return wrap("  ", p53:gsub("\n", "\n  "))
end

local function isMultiline(p54)
	return string.find(tostring(p54), "\n") ~= nil
end

hasMultilineItems = function(p55)
	-- upvalues: array (ref), isMultiline (write)
	return p55 ~= nil and array.some(p55, isMultiline)
end

return { print = print_ }
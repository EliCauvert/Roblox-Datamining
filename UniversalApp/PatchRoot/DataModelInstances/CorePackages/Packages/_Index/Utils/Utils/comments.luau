local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local _ = require(script.Parent.types)
local graphQLModule = require(parent.GraphQL)
local visit = graphQLModule.visit
local tokenKind = graphQLModule.TokenKind
local _ = require(parent.GraphQL)
local var1 = nil
local isFieldDefinitionNode = nil
local var2 = nil
local var3 = nil
local var4 = nil
local var5 = nil
local isBlank = nil
local leadingWhitespace = nil
local string = luauPolyfillModule.String
local t_1 = {}

function t.resetComments()
	-- upvalues: t_1 (write)
	t_1 = {}
end

function t.collectComment(p1)
	-- upvalues: var1 (write), boolean (ref), isFieldDefinitionNode (write)
	local var6 = if typeof(p1.name) == "table" then p1.name.value else nil
	
	if var6 == nil then return end
	var1(p1, var6)
	local kind = p1.kind
	
	if kind == "EnumTypeDefinition" then
		if not boolean.toJSBoolean(p1.values) then return end
		for i, v in p1.values do
			var1(v, var6, v.name.value)
		end
		return
	elseif (kind == "ObjectTypeDefinition" or kind == "InputObjectTypeDefinition" or kind == "InterfaceTypeDefinition") and boolean.toJSBoolean(p1.fields) then
		for i, v in p1.fields do
			var1(v, var6, v.name.value)
			local var7 = isFieldDefinitionNode(v)
			
			if boolean.toJSBoolean(if boolean.toJSBoolean(var7) then v.arguments else var7) then
				for i_1, v_1 in v.arguments do
					var1(v_1, var6, v.name.value, v_1.name.value)
				end
			end
		end
	end
end

function t.pushComment(p2, p3, p4, p5)
	-- upvalues: var2 (write), boolean (ref), array (ref), t_1 (write)
	local var8 = var2(p2)
	
	if typeof(var8) ~= "string" or #var8 == 0 then return end
	local list = { p3 }
	
	if boolean.toJSBoolean(p4) then
		table.insert(list, p4)
		
		if boolean.toJSBoolean(p5) then
			table.insert(list, p5)
		end
	end
	local var9 = array.join(list, ".")
	
	if not boolean.toJSBoolean(t_1[tostring(var9)]) then
		t_1[tostring(var9)] = {}
	end
	table.insert(t_1[var9], var8)
end

local function printComment(p2)
	return "\n# " .. p5:gsub("\n", "\n# ")
end

t.printComment = printComment

local function join(p2, p3)
	-- upvalues: boolean (ref), array (ref)
	return if boolean.toJSBoolean(p2) then array.join(array.filter(p2, function(p4)
		-- upvalues: boolean (copy)
		return boolean.toJSBoolean(p4)
	end), if boolean.toJSBoolean(p3) then p3 else "") else ""
end

local function _(p2)
	-- upvalues: array (ref), string (ref)
	local var8 = if typeof(p2) == "table" then array.some(p2, function(p3)
		-- upvalues: string (copy)
		return string.includes(p3, "\n")
	end) else nil
	
	return if var8 == nil then false else var8
end

local _ = function(p2)
	-- upvalues: array (ref), object (ref), boolean (ref), string (ref), t_1 (write), join (ref), printComment (ref)
	return function(p3, p4, p5, p6, p7, p8)
		-- upvalues: array (copy), object (copy), boolean (copy), string (copy), t_1 (copy), join (copy), printComment (copy), p2 (ref)
		local t = {}
		local var8 = array.reduce(p7, function(p9, p10)
			-- upvalues: object (copy), array (copy), boolean (copy), t (ref)
			if p10 ~= object.None and array.includes({ "fields", "arguments", "values" }, p10) and boolean.toJSBoolean(p9.name) then
				table.insert(t, p9.name.value)
			end
			return if p9 == object.None then p10 else p9[p10]
		end, p8[1] or object.None)
		local var9 = array.join(array.filter(array.concat({}, t, {
			if typeof(if typeof(var8) == "table" then var8.name else nil) == "table" then (if typeof(var8) == "table" then var8.name else nil).value else nil
		}), boolean.toJSBoolean), ".")
		local t_2 = {}
		
		if string.includes(p4.kind, "Definition") and boolean.toJSBoolean(t_1[var9]) then
			t_2 = array.concat(t_2, t_1[var9])
		end
		return join(array.concat({}, array.map(t_2, printComment), { p4.description or "", p2(p3, p4, p5, p6, p7, p8) }), "\n")
	end
end

local function indent(p3)
	-- upvalues: boolean (ref)
	return if boolean.toJSBoolean(p3) then ("  %s"):format(p3:gsub("\n", "\n  ")) else p3
end

local _ = function(p3)
	-- upvalues: indent (ref), join (ref)
	return if p3 and #p3 ~= 0 then ("{\n%s\n}"):format(indent(join(p3, "\n"))) else ""
end

local _ = function(p3, p4, p5)
	-- upvalues: boolean (ref)
	return if boolean.toJSBoolean(p4) then p3 .. tostring(p4) .. (if boolean.toJSBoolean(p5) then p5 else "") else ""
end

local function printBlockString(p3, p4)
	-- upvalues: string (ref), boolean (ref)
	local var8 = p3:gsub("\"", "\\\"\"\"")
	
	return if (p3:sub(1, 1) == " " or p3:sub(1, 1) == "\t") and string.indexOf(p3, "\n") == -1 then ("\"\"\"%s\"\"\""):format(var8:gsub("\"$", "\"\n")) else ("\"\"\"\n%s\n\"\"\""):format(if boolean.toJSBoolean(if p4 ~= nil then false else p4) then var8 elseif boolean.toJSBoolean(var8) then ("  %s"):format(var8:gsub("\n", "\n  ")) else var8)
end

local t_2 = {
	Name = {
		leave = function(_, p3)
			return p3.value
		end
	},
	Variable = {
		leave = function(_, p3)
			return "$" .. tostring(p3.name)
		end
	},
	Document = {
		leave = function(_, p3)
			-- upvalues: join (ref)
			return join(p3.definitions, "\n\n")
		end
	},
	OperationDefinition = {
		leave = function(_, p3)
			-- upvalues: join (ref), boolean (ref)
			local var8 = join(p3.variableDefinitions, ", ")
			
			return tostring(join({
				p3.operation,
				join({
					p3.name,
					if boolean.toJSBoolean(var8) then "(" .. tostring(var8) .. (if boolean.toJSBoolean(")") then ")" else "") else ""
				}),
				join(p3.directives, " ")
			}, " ")) .. " " .. tostring(p3.selectionSet)
		end
	},
	VariableDefinition = {
		leave = function(_, p3)
			-- upvalues: boolean (ref), join (ref)
			local variable = p3.variable
			local type = p3.type
			local defaultValue = p3.defaultValue
			local var8 = join(p3.directives, " ")
			
			return tostring(variable) .. ": " .. tostring(type) .. tostring(if boolean.toJSBoolean(defaultValue) then " = " .. tostring(defaultValue) .. "" else "") .. tostring(if boolean.toJSBoolean(var8) then " " .. tostring(var8) .. "" else "")
		end
	},
	SelectionSet = {
		leave = function(_, p3)
			-- upvalues: indent (ref), join (ref)
			local selections = p3.selections
			
			return if selections and #selections ~= 0 then ("{\n%s\n}"):format(indent(join(selections, "\n"))) else ""
		end
	},
	Field = {
		leave = function(_, p3)
			-- upvalues: boolean (ref), join (ref)
			local alias = p3.alias
			local name = p3.name
			local arguments = p3.arguments
			local directives = p3.directives
			local selectionSet = p3.selectionSet
			local text = (if boolean.toJSBoolean(alias) then "" .. tostring(alias) .. (if boolean.toJSBoolean(": ") then ": " else "") else "") .. name
			local var8 = join(arguments, ", ")
			local text_1 = text .. (if boolean.toJSBoolean(var8) then "(" .. tostring(var8) .. (if boolean.toJSBoolean(")") then ")" else "") else "")
			
			if text_1.length > 80 then
				local var9 = text
				local var10 = join(arguments, "\n")
				local var11 = if boolean.toJSBoolean(var10) then ("  %s"):format(var10:gsub("\n", "\n  ")) else var10
				text_1 = var9 .. (if boolean.toJSBoolean(var11) then "(\n" .. tostring(var11) .. (if boolean.toJSBoolean("\n)") then "\n)" else "") else "")
			end
			return join({ text_1, join(directives, " "), selectionSet }, " ")
		end
	},
	Argument = {
		leave = function(_, p3)
			return tostring(p3.name) .. ": " .. tostring(p3.value)
		end
	},
	FragmentSpread = {
		leave = function(_, p3)
			-- upvalues: join (ref), boolean (ref)
			local var8 = join(p3.directives, " ")
			
			return "..." .. tostring(p3.name) .. tostring(if boolean.toJSBoolean(var8) then " " .. tostring(var8) .. "" else "")
		end
	},
	InlineFragment = {
		leave = function(_, p3)
			-- upvalues: join (ref), boolean (ref)
			local typeCondition = p3.typeCondition
			
			return join({
				"...",
				if boolean.toJSBoolean(typeCondition) then "on " .. tostring(typeCondition) .. "" else "",
				join(p3.directives, " "),
				p3.selectionSet
			}, " ")
		end
	},
	FragmentDefinition = {
		leave = function(_, p3)
			-- upvalues: join (ref), boolean (ref)
			local name = p3.name
			local typeCondition = p3.typeCondition
			local variableDefinitions = p3.variableDefinitions
			local directives = p3.directives
			local selectionSet = p3.selectionSet
			local var8 = join(variableDefinitions, ", ")
			local var9 = join(directives, " ")
			
			return ("fragment %s%s "):format(tostring(name), if boolean.toJSBoolean(var8) then "(" .. tostring(var8) .. (if boolean.toJSBoolean(")") then ")" else "") else "") .. ("on %s %s"):format(tostring(typeCondition), tostring(if boolean.toJSBoolean(var9) then "" .. tostring(var9) .. (if boolean.toJSBoolean(" ") then " " else "") else "")) .. tostring(selectionSet)
		end
	},
	IntValue = {
		leave = function(_, p3)
			return p3.value
		end
	},
	FloatValue = {
		leave = function(_, p3)
			return p3.value
		end
	},
	StringValue = {
		leave = function(_, p3)
			-- upvalues: boolean (ref), printBlockString (ref)
			local value = p3.value
			
			return if boolean.toJSBoolean(p3.block) then printBlockString(value) else "'" .. value:gsub("'", "\\'") .. "'"
		end
	},
	BooleanValue = {
		leave = function(_, p3)
			-- upvalues: boolean (ref)
			return if boolean.toJSBoolean(p3.value) then "true" else "false"
		end
	},
	NullValue = {
		leave = function()
			return "null"
		end
	},
	EnumValue = {
		leave = function(_, p3)
			return p3.value
		end
	},
	ListValue = {
		leave = function(_, p3)
			-- upvalues: join (ref)
			return "[" .. tostring(join(p3.values, ", ")) .. "]"
		end
	},
	ObjectValue = {
		leave = function(_, p3)
			-- upvalues: join (ref)
			return "{" .. tostring(join(p3.fields, ", ")) .. "}"
		end
	},
	ObjectField = {
		leave = function(_, p3)
			return tostring(p3.name) .. ": " .. tostring(p3.value)
		end
	},
	Directive = {
		leave = function(_, p3)
			-- upvalues: join (ref), boolean (ref)
			local var8 = join(p3.arguments, ", ")
			
			return "@" .. tostring(p3.name) .. tostring(if boolean.toJSBoolean(var8) then "(" .. tostring(var8) .. (if boolean.toJSBoolean(")") then ")" else "") else "")
		end
	},
	NamedType = {
		leave = function(_, p3)
			return p3.name
		end
	},
	ListType = {
		leave = function(_, p3)
			return "[" .. tostring(p3.type) .. "]"
		end
	},
	NonNullType = {
		leave = function(_, p3)
			return tostring(p3.type) .. "!"
		end
	},
	SchemaDefinition = {
		leave = function(_, p3)
			-- upvalues: join (ref), indent (ref)
			local operationTypes = p3.operationTypes
			
			return join({
				"schema",
				join(p3.directives, " "),
				if operationTypes and #operationTypes ~= 0 then ("{\n%s\n}"):format(indent(join(operationTypes, "\n"))) else ""
			}, " ")
		end
	},
	OperationTypeDefinition = {
		leave = function(_, p3)
			return tostring(p3.operation) .. ": " .. tostring(p3.type)
		end
	},
	ScalarTypeDefinition = {
		leave = function(_, p3)
			-- upvalues: join (ref)
			return join({ "scalar", p3.name, join(p3.directives, " ") }, " ")
		end
	},
	ObjectTypeDefinition = {
		leave = function(_, p3)
			-- upvalues: join (ref), boolean (ref), indent (ref)
			local name = p3.name
			local interfaces = p3.interfaces
			local directives = p3.directives
			local fields = p3.fields
			local t = {}
			local var8 = join(interfaces, " & ")
			-- Unknown statement at pc 6: <SetList>
			
			return join(t, " ")
		end
	},
	FieldDefinition = {
		leave = function(_, p3)
			-- upvalues: array (ref), string (ref), join (ref), boolean (ref)
			local var8
			local name = p3.name
			local arguments = p3.arguments
			local type = p3.type
			local directives = p3.directives
			local var9 = tostring(name)
			local var10 = if typeof(arguments) == "table" then array.some(arguments, function(p4)
				-- upvalues: string (copy)
				return string.includes(p4, "\n")
			end) else nil
			
			if if var10 ~= nil then false else var10 then
				var10 = join(arguments, "\n")
				local var11 = if boolean.toJSBoolean(var10) then ("  %s"):format(var10:gsub("\n", "\n  ")) else var10
				var8 = if boolean.toJSBoolean(var11) then "(\n" .. tostring(var11) .. (if boolean.toJSBoolean("\n)") then "\n)" else "") else ""
			else
				local var12 = join(arguments, ", ")
				var8 = if boolean.toJSBoolean(var12) then "(" .. tostring(var12) .. (if boolean.toJSBoolean(")") then ")" else "") else ""
			end
			local var13 = join(directives, " ")
			
			return var9 .. var46 .. ": " .. tostring(type) .. (if boolean.toJSBoolean(var13) then " " .. tostring(var13) .. "" else "")
		end
	},
	InputValueDefinition = {
		leave = function(_, p3)
			-- upvalues: join (ref), boolean (ref)
			local defaultValue = p3.defaultValue
			
			return join({
				tostring(p3.name) .. ": " .. tostring(p3.type),
				if boolean.toJSBoolean(defaultValue) then "= " .. tostring(defaultValue) .. "" else "",
				join(p3.directives, " ")
			}, " ")
		end
	},
	InterfaceTypeDefinition = {
		leave = function(_, p3)
			-- upvalues: join (ref), boolean (ref), indent (ref)
			local name = p3.name
			local interfaces = p3.interfaces
			local directives = p3.directives
			local fields = p3.fields
			local t = {}
			local var8 = join(interfaces, " & ")
			-- Unknown statement at pc 6: <SetList>
			
			return join(t, " ")
		end
	},
	UnionTypeDefinition = {
		leave = function(_, p3)
			-- upvalues: join (ref), boolean (ref)
			local name = p3.name
			local directives = p3.directives
			local t = {}
			local var8 = join(p3.types, " | ")
			-- Unknown statement at pc 4: <SetList>
			
			return join(t, " ")
		end
	},
	EnumTypeDefinition = {
		leave = function(_, p3)
			-- upvalues: join (ref), indent (ref)
			local values = p3.values
			
			return join({
				"enum",
				p3.name,
				join(p3.directives, " "),
				if values and #values ~= 0 then ("{\n%s\n}"):format(indent(join(values, "\n"))) else ""
			}, " ")
		end
	},
	EnumValueDefinition = {
		leave = function(_, p3)
			-- upvalues: join (ref)
			return join({ p3.name, join(p3.directives, " ") }, " ")
		end
	},
	InputObjectTypeDefinition = {
		leave = function(_, p3)
			-- upvalues: join (ref), indent (ref)
			local fields = p3.fields
			
			return join({
				"input",
				p3.name,
				join(p3.directives, " "),
				if fields and #fields ~= 0 then ("{\n%s\n}"):format(indent(join(fields, "\n"))) else ""
			}, " ")
		end
	},
	DirectiveDefinition = {
		leave = function(_, p3)
			-- upvalues: boolean (ref), array (ref), string (ref), join (ref)
			local var8
			local name = p3.name
			local arguments = p3.arguments
			local repeatable = p3.repeatable
			local locations = p3.locations
			local var9 = "directive @"
			local var10 = tostring(name)
			local var11 = if typeof(arguments) == "table" then array.some(arguments, function(p4)
				-- upvalues: string (copy)
				return string.includes(p4, "\n")
			end) else nil
			
			if boolean.toJSBoolean(if var11 ~= nil then false else var11) then
				local var12 = join(arguments, "\n")
				local var13 = if boolean.toJSBoolean(var12) then ("  %s"):format(var12:gsub("\n", "\n  ")) else var12
				var8 = if boolean.toJSBoolean(var13) then "(\n" .. tostring(var13) .. (if boolean.toJSBoolean("\n)") then "\n)" else "") else ""
			else
				local var14 = join(arguments, ", ")
				var8 = if boolean.toJSBoolean(var14) then "(" .. tostring(var14) .. (if boolean.toJSBoolean(")") then ")" else "") else ""
			end
			return var9 .. var54 .. tostring(var8) .. (if boolean.toJSBoolean(repeatable) then " repeatable" else "") .. " on " .. tostring(join(locations, " | "))
		end
	},
	SchemaExtension = {
		leave = function(_, p3)
			-- upvalues: join (ref), indent (ref)
			local operationTypes = p3.operationTypes
			
			return join({
				"extend schema",
				join(p3.directives, " "),
				if operationTypes and #operationTypes ~= 0 then ("{\n%s\n}"):format(indent(join(operationTypes, "\n"))) else ""
			}, " ")
		end
	},
	ScalarTypeExtension = {
		leave = function(_, p3)
			-- upvalues: join (ref)
			return join({ "extend scalar", p3.name, join(p3.directives, " ") }, " ")
		end
	},
	ObjectTypeExtension = {
		leave = function(_, p3)
			-- upvalues: join (ref), boolean (ref), indent (ref)
			local name = p3.name
			local interfaces = p3.interfaces
			local directives = p3.directives
			local fields = p3.fields
			local t = {}
			local var8 = join(interfaces, " & ")
			-- Unknown statement at pc 6: <SetList>
			
			return join(t, " ")
		end
	},
	InterfaceTypeExtension = {
		leave = function(_, p3)
			-- upvalues: join (ref), boolean (ref), indent (ref)
			local name = p3.name
			local interfaces = p3.interfaces
			local directives = p3.directives
			local fields = p3.fields
			local t = {}
			local var8 = join(interfaces, " & ")
			-- Unknown statement at pc 6: <SetList>
			
			return join(t, " ")
		end
	},
	UnionTypeExtension = {
		leave = function(_, p3)
			-- upvalues: join (ref), boolean (ref)
			local name = p3.name
			local directives = p3.directives
			local t = {}
			local var8 = join(p3.types, " | ")
			-- Unknown statement at pc 4: <SetList>
			
			return join(t, " ")
		end
	},
	EnumTypeExtension = {
		leave = function(_, p3)
			-- upvalues: join (ref), indent (ref)
			local values = p3.values
			
			return join({
				"extend enum",
				p3.name,
				join(p3.directives, " "),
				if values and #values ~= 0 then ("{\n%s\n}"):format(indent(join(values, "\n"))) else ""
			}, " ")
		end
	},
	InputObjectTypeExtension = {
		leave = function(_, p3)
			-- upvalues: join (ref), indent (ref)
			local fields = p3.fields
			
			return join({
				"extend input",
				p3.name,
				join(p3.directives, " "),
				if fields and #fields ~= 0 then ("{\n%s\n}"):format(indent(join(fields, "\n"))) else ""
			}, " ")
		end
	}
}
local var8 = array.reduce(object.keys(t_2), function(p3, p4)
	-- upvalues: object (ref), t_2 (ref), array (ref), boolean (ref), string (ref), t_1 (write), join (ref), printComment (ref)
	local assign = object.assign
	local t = {}
	local t_3 = {}
	local t_4 = {}
	local leave = t_2[p4].leave
	
	function t_4.leave(p5, p6, p7, p8, p9, p10)
		-- upvalues: array (copy), object (copy), boolean (copy), string (copy), t_1 (copy), join (copy), printComment (copy), leave (ref)
		local t = {}
		local var9 = array.reduce(p9, function(p11, p12)
			-- upvalues: object (copy), array (copy), boolean (copy), t (ref)
			if p12 ~= object.None and array.includes({ "fields", "arguments", "values" }, p12) and boolean.toJSBoolean(p11.name) then
				table.insert(t, p11.name.value)
			end
			return if p11 == object.None then p12 else p11[p12]
		end, p10[1] or object.None)
		local var10 = array.join(array.filter(array.concat({}, t, {
			if typeof(if typeof(var9) == "table" then var9.name else nil) == "table" then (if typeof(var9) == "table" then var9.name else nil).value else nil
		}), boolean.toJSBoolean), ".")
		local t_2 = {}
		
		if string.includes(p6.kind, "Definition") and boolean.toJSBoolean(t_1[var10]) then
			t_2 = array.concat(t_2, t_1[var10])
		end
		return join(array.concat({}, array.map(t_2, printComment), {
			p6.description or "",
			leave(p5, p6, p7, p8, p9, p10)
		}), "\n")
	end
	
	t_3[p4] = t_4
	
	return assign(t, p3, t_3)
end, {})

function t.printWithComments(p5)
	-- upvalues: visit (ref), var8 (ref)
	return visit(p5, var8)
end

isFieldDefinitionNode = function(p5)
	return p5.kind == "FieldDefinition"
end

function t.getDescription(p5, p6)
	-- upvalues: boolean (ref), var2 (write)
	return if p5.description == nil then if boolean.toJSBoolean(if typeof(p6) == "table" then p6.commentDescriptions else nil) then var2(p5) else nil else p5.description.value
end

function t.getComment(p5)
	-- upvalues: var3 (write), var4 (write)
	local var9 = var3(p5)
	
	return if var9 == nil then nil else var4(("\n%s"):format(tostring(var9)))
end

function t.getLeadingCommentBlock(p5)
	-- upvalues: boolean (ref), tokenKind (ref), array (ref)
	local loc = p5.loc
	
	if not boolean.toJSBoolean(loc) then return end
	local t = {}
	local prev = loc.startToken.prev
	while prev ~= nil and (prev.kind == tokenKind.COMMENT and prev.next ~= nil) and (prev.prev ~= nil and prev.line + 1 == prev.next.line and prev.line ~= prev.prev.line) do
		table.insert(t, tostring(prev.value))
		prev = prev.prev
	end
	return if #t > 0 then array.join(array.reverse(t), "\n") else nil
end

function t.dedentBlockStringValue(p6)
	-- upvalues: string (ref), var5 (write), isBlank (write), array (ref)
	local var9 = string.split(p6, { "\r\n", "\n", "\r" })
	local var10 = var5(var9)
	
	if var10 ~= 0 then
		local var11 = 2
		while var11 <= #var9 do
			var9[var11] = string.slice(var9[var11], var10 + 1)
			var11 += 1
		end
	end
	while #var9 > 0 and isBlank(var9[1]) do
		table.remove(var9, 1)
	end
	while #var9 > 0 and isBlank(var9[#var9]) do
		table.remove(var9)
	end
	return array.join(var9, "\n")
end

function t.getBlockStringIndentation(p7)
	-- upvalues: leadingWhitespace (write)
	local var12 = nil
	local var13 = 2
	while var13 <= #p7 do
		local var14 = p7[var13]
		local var15 = leadingWhitespace(var14)
		
		if var15 == #var14 then
			var13 += 1
		elseif var12 == nil or var15 < var12 then
			var12 = var15
			
			if var12 == 0 then break end
		end
		var13 += 1
	end
	return if var12 == nil then 0 else var12
end

leadingWhitespace = function(p8)
	local var16 = 0
	while var16 < #p8 and (p8:sub(var16 + 1, var16 + 1) == " " or p8:sub(var16 + 1, var16 + 1) == "\t") do
		var16 += 1
	end
	return var16
end

isBlank = function(p9)
	-- upvalues: leadingWhitespace (write)
	return leadingWhitespace(p9) == #p9
end

return t
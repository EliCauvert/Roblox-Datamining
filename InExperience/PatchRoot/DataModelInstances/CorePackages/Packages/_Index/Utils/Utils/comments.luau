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
local var3 = nil
local isFieldDefinitionNode = nil
local var5 = nil
local var6 = nil
local var7 = nil
local var8 = nil
local isBlank = nil
local leadingWhitespace = nil
local string = luauPolyfillModule.String
local t_1 = {}

function t.resetComments() --[[ line: 62 ]]
	-- upvalues: t_1 (write)
	t_1 = {}
end

function t.collectComment(p0) --[[ line: 66 ]]
	-- upvalues: var3 (write), boolean (ref), isFieldDefinitionNode (write)
	local var18 = if typeof(p0.name) == "table" then p0.name.value else nil
	
	if var18 == nil then return end
	var3(p0, var18)
	local kind = p0.kind
	
	if kind == "EnumTypeDefinition" then
		if not boolean.toJSBoolean(p0.values) then return end
		for i, v in p0.values do
			var3(v, var18, v.name.value)
		end
		return
	elseif (kind == "ObjectTypeDefinition" or kind == "InputObjectTypeDefinition" or kind == "InterfaceTypeDefinition") and boolean.toJSBoolean(p0.fields) then
		for i, v in p0.fields do
			var3(v, var18, v.name.value)
			local var19 = isFieldDefinitionNode(v)
			
			if boolean.toJSBoolean(if boolean.toJSBoolean(var19) then v.arguments else var19) then
				for i_1, v_1 in v.arguments do
					var3(v_1, var18, v.name.value, v_1.name.value)
				end
			end
		end
	end
end

function t.pushComment(p1, p2, p3, p4) --[[ line: 123 ]]
	-- upvalues: var5 (write), boolean (ref), array (ref), t_1 (write)
	local var20 = var5(p1)
	
	if typeof(var20) ~= "string" or #var20 == 0 then return end
	local list = { p2 }
	
	if boolean.toJSBoolean(p3) then
		table.insert(list, p3)
		
		if boolean.toJSBoolean(p4) then
			table.insert(list, p4)
		end
	end
	local var22 = array.join(list, ".")
	
	if not boolean.toJSBoolean(t_1[tostring(var22)]) then
		t_1[tostring(var22)] = {}
	end
	table.insert(t_1[var22], var20)
end

local function printComment(p5) --[[ line: 155 ]]
	return "\n# " .. p5:gsub("\n", "\n# ")
end

t.printComment = printComment

local function join(p6, p7) --[[ line: 183 ]]
	-- upvalues: boolean (ref), array (ref)
	return if boolean.toJSBoolean(p6) then array.join(array.filter(p6, function(p8) --[[ line: 195 ]]
		-- upvalues: boolean (copy)
		return boolean.toJSBoolean(p8)
	end), if boolean.toJSBoolean(p7) then p7 else "") else ""
end

local function _(p9) --[[ line: 205 | named "hasMultilineItems" ]]
	-- upvalues: array (ref), string (ref)
	local var23 = if typeof(p9) == "table" then array.some(p9, function(p10) --[[ line: 212 ]]
		-- upvalues: string (copy)
		return string.includes(p10, "\n")
	end) else nil
	
	return if var23 == nil then false else var23
end

local _ = function(p11) --[[ line: 229 | named "addDescription" ]]
	-- upvalues: array (ref), object (ref), boolean (ref), string (ref), t_1 (write), join (ref), printComment (ref)
	return function(p12, p13, p14, p15, p16, p17) --[[ line: 230 ]]
		-- upvalues: array (copy), object (copy), boolean (copy), string (copy), t_1 (copy), join (copy), printComment (copy), p11 (ref)
		local t = {}
		local var25 = array.reduce(p16, function(p18, p19) --[[ line: 258 ]]
			-- upvalues: object (copy), array (copy), boolean (copy), t (ref)
			if p19 ~= object.None and array.includes({ "fields", "arguments", "values" }, p19) and boolean.toJSBoolean(p18.name) then
				table.insert(t, p18.name.value)
			end
			return if p18 == object.None then p19 else p18[p19]
		end, p17[1] or object.None)
		local var26 = array.join(array.filter(array.concat({}, t, {
			if typeof(if typeof(var25) == "table" then var25.name else nil) == "table" then (if typeof(var25) == "table" then var25.name else nil).value else nil
		}), boolean.toJSBoolean), ".")
		local t_2 = {}
		
		if string.includes(p13.kind, "Definition") and boolean.toJSBoolean(t_1[var26]) then
			t_2 = array.concat(t_2, t_1[var26])
		end
		return join(array.concat({}, array.map(t_2, printComment), { p13.description or "", p11(p12, p13, p14, p15, p16, p17) }), "\n")
	end
end

local function indent(p20) --[[ line: 320 ]]
	-- upvalues: boolean (ref)
	return if boolean.toJSBoolean(p20) then ("  %s"):format(p20:gsub("\n", "\n  ")) else p20
end

local _ = function(p21) --[[ line: 344 | named "block" ]]
	-- upvalues: indent (ref), join (ref)
	return if p21 and #p21 ~= 0 then ("{\n%s\n}"):format(indent(join(p21, "\n"))) else ""
end

local _ = function(p22, p23, p24) --[[ line: 363 | named "wrap" ]]
	-- upvalues: boolean (ref)
	return if boolean.toJSBoolean(p23) then p22 .. tostring(p23) .. (if boolean.toJSBoolean(p24) then p24 else "") else ""
end

local function printBlockString(p25, p26) --[[ line: 377 ]]
	-- upvalues: string (ref), boolean (ref)
	local var28 = p25:gsub("\"", "\\\"\"\"")
	
	return if (p25:sub(1, 1) == " " or p25:sub(1, 1) == "\t") and string.indexOf(p25, "\n") == -1 then ("\"\"\"%s\"\"\""):format(var28:gsub("\"$", "\"\n")) else ("\"\"\"\n%s\n\"\"\""):format(if boolean.toJSBoolean(if p26 ~= nil then false else p26) then var28 elseif boolean.toJSBoolean(var28) then ("  %s"):format(var28:gsub("\n", "\n  ")) else var28)
end

local t_2 = {
	Name = {
		leave = function(_, p27) --[[ line: 417 ]]
			return p27.value
		end
	},
	Variable = {
		leave = function(_, p28) --[[ line: 425 ]]
			return "$" .. tostring(p28.name)
		end
	},
	Document = {
		leave = function(_, p29) --[[ line: 434 ]]
			-- upvalues: join (ref)
			return join(p29.definitions, "\n\n")
		end
	},
	OperationDefinition = {
		leave = function(_, p30) --[[ line: 442 ]]
			-- upvalues: join (ref), boolean (ref)
			local var29 = join(p30.variableDefinitions, ", ")
			
			return tostring(join({
				p30.operation,
				join({
					p30.name,
					if boolean.toJSBoolean(var29) then "(" .. tostring(var29) .. (if boolean.toJSBoolean(")") then ")" else "") else ""
				}),
				join(p30.directives, " ")
			}, " ")) .. " " .. tostring(p30.selectionSet)
		end
	},
	VariableDefinition = {
		leave = function(_, p31) --[[ line: 452 ]]
			-- upvalues: boolean (ref), join (ref)
			local variable = p31.variable
			local type = p31.type
			local defaultValue = p31.defaultValue
			local var30 = join(p31.directives, " ")
			
			return tostring(variable) .. ": " .. tostring(type) .. tostring(if boolean.toJSBoolean(defaultValue) then " = " .. tostring(defaultValue) .. "" else "") .. tostring(if boolean.toJSBoolean(var30) then " " .. tostring(var30) .. "" else "")
		end
	},
	SelectionSet = {
		leave = function(_, p32) --[[ line: 466 ]]
			-- upvalues: indent (ref), join (ref)
			local selections = p32.selections
			
			return if selections and #selections ~= 0 then ("{\n%s\n}"):format(indent(join(selections, "\n"))) else ""
		end
	},
	Field = {
		leave = function(_, p33) --[[ line: 473 ]]
			-- upvalues: boolean (ref), join (ref)
			local alias = p33.alias
			local name = p33.name
			local arguments = p33.arguments
			local directives = p33.directives
			local selectionSet = p33.selectionSet
			local text = (if boolean.toJSBoolean(alias) then "" .. tostring(alias) .. (if boolean.toJSBoolean(": ") then ": " else "") else "") .. name
			local var32 = join(arguments, ", ")
			local text_1 = text .. (if boolean.toJSBoolean(var32) then "(" .. tostring(var32) .. (if boolean.toJSBoolean(")") then ")" else "") else "")
			
			if text_1.length > 80 then
				local var34 = text
				local var35 = join(arguments, "\n")
				local var36 = if boolean.toJSBoolean(var35) then ("  %s"):format(var35:gsub("\n", "\n  ")) else var35
				text_1 = var34 .. (if boolean.toJSBoolean(var36) then "(\n" .. tostring(var36) .. (if boolean.toJSBoolean("\n)") then "\n)" else "") else "")
			end
			return join({ text_1, join(directives, " "), selectionSet }, " ")
		end
	},
	Argument = {
		leave = function(_, p34) --[[ line: 497 ]]
			return tostring(p34.name) .. ": " .. tostring(p34.value)
		end
	},
	FragmentSpread = {
		leave = function(_, p35) --[[ line: 507 ]]
			-- upvalues: join (ref), boolean (ref)
			local var37 = join(p35.directives, " ")
			
			return "..." .. tostring(p35.name) .. tostring(if boolean.toJSBoolean(var37) then " " .. tostring(var37) .. "" else "")
		end
	},
	InlineFragment = {
		leave = function(_, p36) --[[ line: 516 ]]
			-- upvalues: join (ref), boolean (ref)
			local typeCondition = p36.typeCondition
			
			return join({
				"...",
				if boolean.toJSBoolean(typeCondition) then "on " .. tostring(typeCondition) .. "" else "",
				join(p36.directives, " "),
				p36.selectionSet
			}, " ")
		end
	},
	FragmentDefinition = {
		leave = function(_, p37) --[[ line: 525 ]]
			-- upvalues: join (ref), boolean (ref)
			local name = p37.name
			local typeCondition = p37.typeCondition
			local variableDefinitions = p37.variableDefinitions
			local directives = p37.directives
			local selectionSet = p37.selectionSet
			local var38 = join(variableDefinitions, ", ")
			local var39 = join(directives, " ")
			
			return ("fragment %s%s "):format(tostring(name), if boolean.toJSBoolean(var38) then "(" .. tostring(var38) .. (if boolean.toJSBoolean(")") then ")" else "") else "") .. ("on %s %s"):format(tostring(typeCondition), tostring(if boolean.toJSBoolean(var39) then "" .. tostring(var39) .. (if boolean.toJSBoolean(" ") then " " else "") else "")) .. tostring(selectionSet)
		end
	},
	IntValue = {
		leave = function(_, p38) --[[ line: 545 ]]
			return p38.value
		end
	},
	FloatValue = {
		leave = function(_, p39) --[[ line: 554 ]]
			return p39.value
		end
	},
	StringValue = {
		leave = function(_, p40) --[[ line: 563 ]]
			-- upvalues: boolean (ref), printBlockString (ref)
			local value = p40.value
			
			return if boolean.toJSBoolean(p40.block) then printBlockString(value) else "'" .. value:gsub("'", "\\'") .. "'"
		end
	},
	BooleanValue = {
		leave = function(_, p41) --[[ line: 579 ]]
			-- upvalues: boolean (ref)
			return if boolean.toJSBoolean(p41.value) then "true" else "false"
		end
	},
	NullValue = {
		leave = function() --[[ line: 586 ]]
			return "null"
		end
	},
	EnumValue = {
		leave = function(_, p42) --[[ line: 593 ]]
			return p42.value
		end
	},
	ListValue = {
		leave = function(_, p43) --[[ line: 602 ]]
			-- upvalues: join (ref)
			return "[" .. tostring(join(p43.values, ", ")) .. "]"
		end
	},
	ObjectValue = {
		leave = function(_, p44) --[[ line: 611 ]]
			-- upvalues: join (ref)
			return "{" .. tostring(join(p44.fields, ", ")) .. "}"
		end
	},
	ObjectField = {
		leave = function(_, p45) --[[ line: 620 ]]
			return tostring(p45.name) .. ": " .. tostring(p45.value)
		end
	},
	Directive = {
		leave = function(_, p46) --[[ line: 630 ]]
			-- upvalues: join (ref), boolean (ref)
			local var40 = join(p46.arguments, ", ")
			
			return "@" .. tostring(p46.name) .. tostring(if boolean.toJSBoolean(var40) then "(" .. tostring(var40) .. (if boolean.toJSBoolean(")") then ")" else "") else "")
		end
	},
	NamedType = {
		leave = function(_, p47) --[[ line: 640 ]]
			return p47.name
		end
	},
	ListType = {
		leave = function(_, p48) --[[ line: 649 ]]
			return "[" .. tostring(p48.type) .. "]"
		end
	},
	NonNullType = {
		leave = function(_, p49) --[[ line: 658 ]]
			return tostring(p49.type) .. "!"
		end
	},
	SchemaDefinition = {
		leave = function(_, p50) --[[ line: 668 ]]
			-- upvalues: join (ref), indent (ref)
			local operationTypes = p50.operationTypes
			
			return join({
				"schema",
				join(p50.directives, " "),
				if operationTypes and #operationTypes ~= 0 then ("{\n%s\n}"):format(indent(join(operationTypes, "\n"))) else ""
			}, " ")
		end
	},
	OperationTypeDefinition = {
		leave = function(_, p51) --[[ line: 677 ]]
			return tostring(p51.operation) .. ": " .. tostring(p51.type)
		end
	},
	ScalarTypeDefinition = {
		leave = function(_, p52) --[[ line: 686 ]]
			-- upvalues: join (ref)
			return join({ "scalar", p52.name, join(p52.directives, " ") }, " ")
		end
	},
	ObjectTypeDefinition = {
		leave = function(_, p53) --[[ line: 695 ]]
			-- upvalues: join (ref), boolean (ref), indent (ref)
			local name = p53.name
			local interfaces = p53.interfaces
			local directives = p53.directives
			local fields = p53.fields
			local t = {}
			local var42 = join(interfaces, " & ")
			-- Unknown statement at pc 6: <SetList>
			
			return join(t, " ")
		end
	},
	FieldDefinition = {
		leave = function(_, p54) --[[ line: 710 ]]
			-- upvalues: array (ref), string (ref), join (ref), boolean (ref)
			local var46
			local name = p54.name
			local arguments = p54.arguments
			local type = p54.type
			local directives = p54.directives
			local var43 = tostring(name)
			local var44 = if typeof(arguments) == "table" then array.some(arguments, function(p55) --[[ line: 212 ]]
				-- upvalues: string (copy)
				return string.includes(p55, "\n")
			end) else nil
			
			if if var44 ~= nil then false else var44 then
				var44 = join(arguments, "\n")
				local var47 = if boolean.toJSBoolean(var44) then ("  %s"):format(var44:gsub("\n", "\n  ")) else var44
				var46 = if boolean.toJSBoolean(var47) then "(\n" .. tostring(var47) .. (if boolean.toJSBoolean("\n)") then "\n)" else "") else ""
			else
				local var45 = join(arguments, ", ")
				var46 = if boolean.toJSBoolean(var45) then "(" .. tostring(var45) .. (if boolean.toJSBoolean(")") then ")" else "") else ""
			end
			local var48 = join(directives, " ")
			
			return var43 .. var46 .. ": " .. tostring(type) .. (if boolean.toJSBoolean(var48) then " " .. tostring(var48) .. "" else "")
		end
	},
	InputValueDefinition = {
		leave = function(_, p56) --[[ line: 735 ]]
			-- upvalues: join (ref), boolean (ref)
			local defaultValue = p56.defaultValue
			
			return join({
				tostring(p56.name) .. ": " .. tostring(p56.type),
				if boolean.toJSBoolean(defaultValue) then "= " .. tostring(defaultValue) .. "" else "",
				join(p56.directives, " ")
			}, " ")
		end
	},
	InterfaceTypeDefinition = {
		leave = function(_, p57) --[[ line: 748 ]]
			-- upvalues: join (ref), boolean (ref), indent (ref)
			local name = p57.name
			local interfaces = p57.interfaces
			local directives = p57.directives
			local fields = p57.fields
			local t = {}
			local var50 = join(interfaces, " & ")
			-- Unknown statement at pc 6: <SetList>
			
			return join(t, " ")
		end
	},
	UnionTypeDefinition = {
		leave = function(_, p58) --[[ line: 763 ]]
			-- upvalues: join (ref), boolean (ref)
			local name = p58.name
			local directives = p58.directives
			local t = {}
			local var52 = join(p58.types, " | ")
			-- Unknown statement at pc 4: <SetList>
			
			return join(t, " ")
		end
	},
	EnumTypeDefinition = {
		leave = function(_, p59) --[[ line: 772 ]]
			-- upvalues: join (ref), indent (ref)
			local values = p59.values
			
			return join({
				"enum",
				p59.name,
				join(p59.directives, " "),
				if values and #values ~= 0 then ("{\n%s\n}"):format(indent(join(values, "\n"))) else ""
			}, " ")
		end
	},
	EnumValueDefinition = {
		leave = function(_, p60) --[[ line: 781 ]]
			-- upvalues: join (ref)
			return join({ p60.name, join(p60.directives, " ") }, " ")
		end
	},
	InputObjectTypeDefinition = {
		leave = function(_, p61) --[[ line: 790 ]]
			-- upvalues: join (ref), indent (ref)
			local fields = p61.fields
			
			return join({
				"input",
				p61.name,
				join(p61.directives, " "),
				if fields and #fields ~= 0 then ("{\n%s\n}"):format(indent(join(fields, "\n"))) else ""
			}, " ")
		end
	},
	DirectiveDefinition = {
		leave = function(_, p62) --[[ line: 799 ]]
			-- upvalues: boolean (ref), array (ref), string (ref), join (ref)
			local var57
			local name = p62.name
			local arguments = p62.arguments
			local repeatable = p62.repeatable
			local locations = p62.locations
			local var53 = "directive @"
			local var54 = tostring(name)
			local var55 = if typeof(arguments) == "table" then array.some(arguments, function(p63) --[[ line: 212 ]]
				-- upvalues: string (copy)
				return string.includes(p63, "\n")
			end) else nil
			
			if boolean.toJSBoolean(if var55 ~= nil then false else var55) then
				local var58 = join(arguments, "\n")
				local var59 = if boolean.toJSBoolean(var58) then ("  %s"):format(var58:gsub("\n", "\n  ")) else var58
				var57 = if boolean.toJSBoolean(var59) then "(\n" .. tostring(var59) .. (if boolean.toJSBoolean("\n)") then "\n)" else "") else ""
			else
				local var56 = join(arguments, ", ")
				var57 = if boolean.toJSBoolean(var56) then "(" .. tostring(var56) .. (if boolean.toJSBoolean(")") then ")" else "") else ""
			end
			return var53 .. var54 .. tostring(var57) .. (if boolean.toJSBoolean(repeatable) then " repeatable" else "") .. " on " .. tostring(join(locations, " | "))
		end
	},
	SchemaExtension = {
		leave = function(_, p64) --[[ line: 817 ]]
			-- upvalues: join (ref), indent (ref)
			local operationTypes = p64.operationTypes
			
			return join({
				"extend schema",
				join(p64.directives, " "),
				if operationTypes and #operationTypes ~= 0 then ("{\n%s\n}"):format(indent(join(operationTypes, "\n"))) else ""
			}, " ")
		end
	},
	ScalarTypeExtension = {
		leave = function(_, p65) --[[ line: 826 ]]
			-- upvalues: join (ref)
			return join({ "extend scalar", p65.name, join(p65.directives, " ") }, " ")
		end
	},
	ObjectTypeExtension = {
		leave = function(_, p66) --[[ line: 835 ]]
			-- upvalues: join (ref), boolean (ref), indent (ref)
			local name = p66.name
			local interfaces = p66.interfaces
			local directives = p66.directives
			local fields = p66.fields
			local t = {}
			local var61 = join(interfaces, " & ")
			-- Unknown statement at pc 6: <SetList>
			
			return join(t, " ")
		end
	},
	InterfaceTypeExtension = {
		leave = function(_, p67) --[[ line: 850 ]]
			-- upvalues: join (ref), boolean (ref), indent (ref)
			local name = p67.name
			local interfaces = p67.interfaces
			local directives = p67.directives
			local fields = p67.fields
			local t = {}
			local var63 = join(interfaces, " & ")
			-- Unknown statement at pc 6: <SetList>
			
			return join(t, " ")
		end
	},
	UnionTypeExtension = {
		leave = function(_, p68) --[[ line: 865 ]]
			-- upvalues: join (ref), boolean (ref)
			local name = p68.name
			local directives = p68.directives
			local t = {}
			local var65 = join(p68.types, " | ")
			-- Unknown statement at pc 4: <SetList>
			
			return join(t, " ")
		end
	},
	EnumTypeExtension = {
		leave = function(_, p69) --[[ line: 874 ]]
			-- upvalues: join (ref), indent (ref)
			local values = p69.values
			
			return join({
				"extend enum",
				p69.name,
				join(p69.directives, " "),
				if values and #values ~= 0 then ("{\n%s\n}"):format(indent(join(values, "\n"))) else ""
			}, " ")
		end
	},
	InputObjectTypeExtension = {
		leave = function(_, p70) --[[ line: 883 ]]
			-- upvalues: join (ref), indent (ref)
			local fields = p70.fields
			
			return join({
				"extend input",
				p70.name,
				join(p70.directives, " "),
				if fields and #fields ~= 0 then ("{\n%s\n}"):format(indent(join(fields, "\n"))) else ""
			}, " ")
		end
	}
}
local var17 = array.reduce(object.keys(t_2), function(p71, p72) --[[ line: 900 ]]
	-- upvalues: object (ref), t_2 (ref), array (ref), boolean (ref), string (ref), t_1 (write), join (ref), printComment (ref)
	local assign = object.assign
	local t = {}
	local t_3 = {}
	local t_4 = {}
	local leave = t_2[p72].leave
	
	function t_4.leave(p73, p74, p75, p76, p77, p78) --[[ line: 230 ]]
		-- upvalues: array (copy), object (copy), boolean (copy), string (copy), t_1 (copy), join (copy), printComment (copy), leave (ref)
		local t = {}
		local var25 = array.reduce(p77, function(p79, p80) --[[ line: 258 ]]
			-- upvalues: object (copy), array (copy), boolean (copy), t (ref)
			if p80 ~= object.None and array.includes({ "fields", "arguments", "values" }, p80) and boolean.toJSBoolean(p79.name) then
				table.insert(t, p79.name.value)
			end
			return if p79 == object.None then p80 else p79[p80]
		end, p78[1] or object.None)
		local var26 = array.join(array.filter(array.concat({}, t, {
			if typeof(if typeof(var25) == "table" then var25.name else nil) == "table" then (if typeof(var25) == "table" then var25.name else nil).value else nil
		}), boolean.toJSBoolean), ".")
		local t_2 = {}
		
		if string.includes(p74.kind, "Definition") and boolean.toJSBoolean(t_1[var26]) then
			t_2 = array.concat(t_2, t_1[var26])
		end
		return join(array.concat({}, array.map(t_2, printComment), {
			p74.description or "",
			leave(p73, p74, p75, p76, p77, p78)
		}), "\n")
	end
	
	t_3[p72] = t_4
	
	return assign(t, p71, t_3)
end, {})

function t.printWithComments(p81) --[[ line: 914 ]]
	-- upvalues: visit (ref), var17 (ref)
	return visit(p81, var17)
end

isFieldDefinitionNode = function(p82) --[[ line: 920 | named "isFieldDefinitionNode" ]]
	return p82.kind == "FieldDefinition"
end

function t.getDescription(p83, p84) --[[ line: 926 ]]
	-- upvalues: boolean (ref), var5 (write)
	return if p83.description == nil then if boolean.toJSBoolean(if typeof(p84) == "table" then p84.commentDescriptions else nil) then var5(p83) else nil else p83.description.value
end

function t.getComment(p85) --[[ line: 945 ]]
	-- upvalues: var6 (write), var7 (write)
	local var69 = var6(p85)
	
	return if var69 == nil then nil else var7(("\n%s"):format(tostring(var69)))
end

function t.getLeadingCommentBlock(p86) --[[ line: 958 ]]
	-- upvalues: boolean (ref), tokenKind (ref), array (ref)
	local loc = p86.loc
	
	if not boolean.toJSBoolean(loc) then return end
	local t = {}
	local prev = loc.startToken.prev
	while prev ~= nil and (prev.kind == tokenKind.COMMENT and prev.next ~= nil) and (prev.prev ~= nil and prev.line + 1 == prev.next.line and prev.line ~= prev.prev.line) do
		table.insert(t, tostring(prev.value))
		prev = prev.prev
	end
	return if #t > 0 then array.join(array.reverse(t), "\n") else nil
end

function t.dedentBlockStringValue(p87) --[[ line: 995 ]]
	-- upvalues: string (ref), var8 (write), isBlank (write), array (ref)
	local var71 = string.split(p87, { "\r\n", "\n", "\r" })
	local var72 = var8(var71)
	
	if var72 ~= 0 then
		local var73 = 2
		while var73 <= #var71 do
			var71[var73] = string.slice(var71[var73], var72 + 1)
			var73 += 1
		end
	end
	while #var71 > 0 and isBlank(var71[1]) do
		table.remove(var71, 1)
	end
	while #var71 > 0 and isBlank(var71[#var71]) do
		table.remove(var71)
	end
	return array.join(var71, "\n")
end

function t.getBlockStringIndentation(p88) --[[ line: 1060 ]]
	-- upvalues: leadingWhitespace (write)
	local var74 = nil
	local var75 = 2
	while var75 <= #p88 do
		local var76 = p88[var75]
		local var77 = leadingWhitespace(var76)
		
		if var77 == #var76 then
			var75 += 1
		elseif var74 == nil or var77 < var74 then
			var74 = var77
			
			if var74 == 0 then break end
		end
		var75 += 1
	end
	return if var74 == nil then 0 else var74
end

leadingWhitespace = function(p89) --[[ line: 1107 | named "leadingWhitespace" ]]
	local var78 = 0
	while var78 < #p89 and (p89:sub(var78 + 1, var78 + 1) == " " or p89:sub(var78 + 1, var78 + 1) == "\t") do
		var78 += 1
	end
	return var78
end

isBlank = function(p90) --[[ line: 1123 | named "isBlank" ]]
	-- upvalues: leadingWhitespace (write)
	return leadingWhitespace(p90) == #p90
end

return t
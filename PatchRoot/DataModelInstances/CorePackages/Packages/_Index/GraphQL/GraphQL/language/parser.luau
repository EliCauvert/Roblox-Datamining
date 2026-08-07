-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:35 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent
local _ = require(parent_1.Parent.LuauPolyfill)
local _ = require(parent_1.error)
local tokenKindModule = require(parent.tokenKind)
local location = require(parent.ast).Location
local source = require(parent.source).Source
local lexerModule = require(parent.lexer)
local lexer = lexerModule.Lexer
local isPunctuatorTokenKind = lexerModule.isPunctuatorTokenKind
local tokenKind = tokenKindModule.TokenKind
local directiveLocation = require(parent.directiveLocation).DirectiveLocation
local kind = require(parent.kinds).Kind
local syntaxError = require(script.Parent.Parent.error.syntaxError).syntaxError
local getTokenDesc = nil
local getTokenKindDesc = nil
local t = {}
t.__index = t

local function parse(p0, p1) --[[ line: 221 ]]
	-- upvalues: t (ref)
	return t.new(p0, p1):parseDocument()
end

local function parseValue(p2, p3) --[[ line: 236 ]]
	-- upvalues: t (ref), tokenKind (ref)
	local var8 = t.new(p2, p3)
	var8:expectToken(tokenKind.SOF)
	local var9 = var8:parseValueLiteral(false)
	var8:expectToken(tokenKind.EOF)
	
	return var9
end

local function parseType(value, p4) --[[ line: 254 ]]
	-- upvalues: t (ref), tokenKind (ref)
	local var10 = t.new(value, p4)
	var10:expectToken(tokenKind.SOF)
	local var11 = var10:parseTypeReference()
	var10:expectToken(tokenKind.EOF)
	
	return var11
end

function t.new(p5, p6) --[[ line: 262 ]]
	-- upvalues: source (ref), lexer (ref), t (ref)
	return setmetatable({
		_lexer = lexer.new(if typeof(p5) == "string" then source.new(p5) else p5),
		_options = p6
	}, t)
end

function t:parseName() --[[ line: 280 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local name = self:expectToken(tokenKind.NAME)
	
	return {
		kind = kind.NAME,
		value = name.value,
		loc = self:loc(name)
	}
end

function t:parseDocument() --[[ line: 294 ]]
	-- upvalues: kind (ref), tokenKind (ref)
	return {
		kind = kind.DOCUMENT,
		definitions = self:many(tokenKind.SOF, self.parseDefinition, tokenKind.EOF),
		loc = self:loc(self._lexer.token)
	}
end

function t:parseDefinition() --[[ line: 314 ]]
	-- upvalues: tokenKind (ref)
	if self:peek(tokenKind.NAME) then
		local value = self._lexer.token.value
		
		if value == "query" or value == "mutation" or value == "subscription" then
			return self:parseOperationDefinition()
		elseif value == "fragment" then
			return self:parseFragmentDefinition()
		elseif value == "schema" or value == "scalar" or (value == "type" or value == "interface") or (value == "union" or value == "enum" or (value == "input" or value == "directive")) then
			return self:parseTypeSystemDefinition()
		elseif value == "extend" then
			return self:parseTypeSystemExtension()
		end
	elseif self:peek(tokenKind.BRACE_L) then
		return self:parseOperationDefinition()
	elseif self:peekDescription() then
		return self:parseTypeSystemDefinition()
	end
	error(self:unexpected())
end

function t:parseOperationDefinition() --[[ line: 351 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	
	return if self:peek(tokenKind.BRACE_L) then {
		operation = "query",
		name = nil,
		kind = kind.OPERATION_DEFINITION,
		variableDefinitions = {},
		directives = {},
		selectionSet = self:parseSelectionSet(),
		loc = self:loc(token)
	} else {
		kind = kind.OPERATION_DEFINITION,
		operation = self:parseOperationType(),
		name = if self:peek(tokenKind.NAME) then self:parseName() else nil,
		variableDefinitions = self:parseVariableDefinitions(),
		directives = self:parseDirectives(false),
		selectionSet = self:parseSelectionSet(),
		loc = self:loc(token)
	}
end

function t:parseOperationType() --[[ line: 384 ]]
	-- upvalues: tokenKind (ref)
	local name = self:expectToken(tokenKind.NAME)
	
	if name.value == "query" then
		return "query"
	elseif name.value == "mutation" then
		return "mutation"
	elseif name.value == "subscription" then
		return "subscription"
	end
	error(self:unexpected(name))
end

function t:parseVariableDefinitions() --[[ line: 401 ]]
	-- upvalues: tokenKind (ref)
	return self:optionalMany(tokenKind.PAREN_L, self.parseVariableDefinition, tokenKind.PAREN_R)
end

function t:parseVariableDefinition() --[[ line: 408 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var14 = self:parseVariable()
	self:expectToken(tokenKind.COLON)
	
	return {
		kind = kind.VARIABLE_DEFINITION,
		variable = var14,
		type = self:parseTypeReference(),
		defaultValue = if self:expectOptionalToken(tokenKind.EQUALS) then self:parseValueLiteral(true) else nil,
		directives = self:parseDirectives(true),
		loc = self:loc(token)
	}
end

function t:parseVariable() --[[ line: 428 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	self:expectToken(tokenKind.DOLLAR)
	
	return {
		kind = kind.VARIABLE,
		name = self:parseName(),
		loc = self:loc(token)
	}
end

function t:parseSelectionSet() --[[ line: 441 ]]
	-- upvalues: kind (ref), tokenKind (ref)
	return {
		kind = kind.SELECTION_SET,
		selections = self:many(tokenKind.BRACE_L, self.parseSelection, tokenKind.BRACE_R),
		loc = self:loc(self._lexer.token)
	}
end

function t:parseSelection() --[[ line: 456 ]]
	-- upvalues: tokenKind (ref)
	return if self:peek(tokenKind.SPREAD) then self:parseFragment() else self:parseField()
end

function t:parseField() --[[ line: 469 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local var17
	local token = self._lexer.token
	local var15 = self:parseName()
	local var16 = nil
	local _ = nil
	
	if self:expectOptionalToken(tokenKind.COLON) then
		var16 = var15
		var17 = self:parseName()
	else
		var17 = var15
	end
	return {
		kind = kind.FIELD,
		alias = var16,
		name = var17,
		arguments = self:parseArguments(false),
		directives = self:parseDirectives(false),
		selectionSet = self:peek(tokenKind.BRACE_L) and self:parseSelectionSet() or nil,
		loc = self:loc(token)
	}
end

function t:parseArguments(p7) --[[ line: 497 ]]
	-- upvalues: tokenKind (ref)
	return self:optionalMany(tokenKind.PAREN_L, if p7 then self.parseConstArgument else self.parseArgument, tokenKind.PAREN_R)
end

function t:parseArgument() --[[ line: 510 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var18 = self:parseName()
	self:expectToken(tokenKind.COLON)
	
	return {
		kind = kind.ARGUMENT,
		name = var18,
		value = self:parseValueLiteral(false),
		loc = self:loc(token)
	}
end

function t:parseConstArgument() --[[ line: 523 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var19 = self:parseName()
	self:expectToken(tokenKind.COLON)
	
	return {
		kind = kind.ARGUMENT,
		name = var19,
		value = self:parseValueLiteral(true),
		loc = self:loc(token)
	}
end

function t:parseFragment() --[[ line: 545 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	self:expectToken(tokenKind.SPREAD)
	local on = self:expectOptionalKeyword("on")
	
	return if on or not self:peek(tokenKind.NAME) then {
		kind = kind.INLINE_FRAGMENT,
		typeCondition = if on then self:parseNamedType() else nil,
		directives = self:parseDirectives(false),
		selectionSet = self:parseSelectionSet(),
		loc = self:loc(token)
	} else {
		kind = kind.FRAGMENT_SPREAD,
		name = self:parseFragmentName(),
		directives = self:parseDirectives(false),
		loc = self:loc(token)
	}
end

function t:parseFragmentDefinition() --[[ line: 573 ]]
	-- upvalues: kind (ref)
	local token = self._lexer.token
	self:expectKeyword("fragment")
	
	if (self._options and self._options.experimentalFragmentVariables) == true then
		local var21 = self:parseFragmentName()
		local var22 = self:parseVariableDefinitions()
		self:expectKeyword("on")
		
		return {
			kind = kind.FRAGMENT_DEFINITION,
			name = var21,
			variableDefinitions = var22,
			typeCondition = self:parseNamedType(),
			directives = self:parseDirectives(false),
			selectionSet = self:parseSelectionSet(),
			loc = self:loc(token)
		}
	end
	local var23 = self:parseFragmentName()
	self:expectKeyword("on")
	
	return {
		kind = kind.FRAGMENT_DEFINITION,
		name = var23,
		typeCondition = self:parseNamedType(),
		directives = self:parseDirectives(false),
		selectionSet = self:parseSelectionSet(),
		loc = self:loc(token)
	}
end

function t:parseFragmentName() --[[ line: 616 ]]
	if self._lexer.token.value == "on" then
		error(self:unexpected())
	end
	return self:parseName()
end

function t:parseValueLiteral(p8) --[[ line: 643 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local kind_1 = token.kind
	
	if kind_1 == tokenKind.BRACKET_L then
		return self:parseList(p8)
	elseif kind_1 == tokenKind.BRACE_L then
		return self:parseObject(p8)
	elseif kind_1 == tokenKind.INT then
		self._lexer:advance()
		
		return {
			kind = kind.INT,
			value = token.value,
			loc = self:loc(token)
		}
	elseif kind_1 == tokenKind.FLOAT then
		self._lexer:advance()
		
		return {
			kind = kind.FLOAT,
			value = token.value,
			loc = self:loc(token)
		}
	elseif kind_1 == tokenKind.STRING or kind_1 == tokenKind.BLOCK_STRING then
		return self:parseStringLiteral()
	elseif kind_1 == tokenKind.NAME then
		self._lexer:advance()
		local value = token.value
		
		return if value == "true" then { value = true, kind = kind.BOOLEAN, loc = self:loc(token) } elseif value == "false" then {
			value = false,
			kind = kind.BOOLEAN,
			loc = self:loc(token)
		} elseif value == "null" then { kind = kind.NULL, loc = self:loc(token) } else { kind = kind.ENUM, value = value, loc = self:loc(token) }
	elseif kind_1 == tokenKind.DOLLAR and not p8 then
		return self:parseVariable()
	end
	error(self:unexpected())
end

function t:parseStringLiteral() --[[ line: 692 ]]
	-- upvalues: kind (ref), tokenKind (ref)
	local token = self._lexer.token
	self._lexer:advance()
	
	return {
		kind = kind.STRING,
		value = token.value,
		block = token.kind == tokenKind.BLOCK_STRING,
		loc = self:loc(token)
	}
end

function t:parseList(p9) --[[ line: 708 ]]
	-- upvalues: kind (ref), tokenKind (ref)
	return {
		kind = kind.LIST,
		values = self:any(tokenKind.BRACKET_L, function() --[[ line: 710 ]]
			-- upvalues: self (ref), p9 (ref)
			return self:parseValueLiteral(p9)
		end, tokenKind.BRACKET_R),
		loc = self:loc(self._lexer.token)
	}
end

function t:parseObject(p10) --[[ line: 725 ]]
	-- upvalues: kind (ref), tokenKind (ref)
	return {
		kind = kind.OBJECT,
		fields = self:any(tokenKind.BRACE_L, function() --[[ line: 727 ]]
			-- upvalues: self (ref), p10 (ref)
			return self:parseObjectField(p10)
		end, tokenKind.BRACE_R),
		loc = self:loc(self._lexer.token)
	}
end

function t:parseObjectField(p11) --[[ line: 740 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var24 = self:parseName()
	self:expectToken(tokenKind.COLON)
	
	return {
		kind = kind.OBJECT_FIELD,
		name = var24,
		value = self:parseValueLiteral(p11),
		loc = self:loc(token)
	}
end

function t:parseDirectives(p12) --[[ line: 753 ]]
	-- upvalues: tokenKind (ref)
	local t = {}
	while self:peek(tokenKind.AT) do
		table.insert(t, self:parseDirective(p12))
	end
	return t
end

function t:parseDirective(p13) --[[ line: 764 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	self:expectToken(tokenKind.AT)
	
	return {
		kind = kind.DIRECTIVE,
		name = self:parseName(),
		arguments = self:parseArguments(p13),
		loc = self:loc(token)
	}
end

function t:parseTypeReference() --[[ line: 783 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local t
	local token = self._lexer.token
	local _ = nil
	
	if self:expectOptionalToken(tokenKind.BRACKET_L) then
		local var26 = self:parseTypeReference()
		self:expectToken(tokenKind.BRACKET_R)
		t = {
			kind = kind.LIST_TYPE,
			type = var26,
			loc = self:loc(token)
		}
	else
		t = self:parseNamedType()
	end
	return if self:expectOptionalToken(tokenKind.BANG) then {
		kind = kind.NON_NULL_TYPE,
		type = t,
		loc = self:loc(token)
	} else t
end

function t:parseNamedType() --[[ line: 816 ]]
	-- upvalues: kind (ref)
	return {
		kind = kind.NAMED_TYPE,
		name = self:parseName(),
		loc = self:loc(self._lexer.token)
	}
end

function t:parseTypeSystemDefinition() --[[ line: 839 ]]
	-- upvalues: tokenKind (ref)
	local var28 = if self:peekDescription() then self._lexer:lookahead() else self._lexer.token
	
	if var28.kind == tokenKind.NAME then
		local value = var28.value
		
		if value == "schema" then
			return self:parseSchemaDefinition()
		elseif value == "scalar" then
			return self:parseScalarTypeDefinition()
		elseif value == "type" then
			return self:parseObjectTypeDefinition()
		elseif value == "interface" then
			return self:parseInterfaceTypeDefinition()
		elseif value == "union" then
			return self:parseUnionTypeDefinition()
		elseif value == "enum" then
			return self:parseEnumTypeDefinition()
		elseif value == "input" then
			return self:parseInputObjectTypeDefinition()
		elseif value == "directive" then
			return self:parseDirectiveDefinition()
		end
	end
	error(self:unexpected(var28))
end

function t:peekDescription() --[[ line: 869 ]]
	-- upvalues: tokenKind (ref)
	return self:peek(tokenKind.STRING) or self:peek(tokenKind.BLOCK_STRING)
end

function t:parseDescription() --[[ line: 876 ]]
	if self:peekDescription() then
		return self:parseStringLiteral()
	end
end

function t:parseSchemaDefinition() --[[ line: 886 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var29 = self:parseDescription()
	self:expectKeyword("schema")
	
	return {
		kind = kind.SCHEMA_DEFINITION,
		description = var29,
		directives = self:parseDirectives(true),
		operationTypes = self:many(tokenKind.BRACE_L, self.parseOperationTypeDefinition, tokenKind.BRACE_R),
		loc = self:loc(token)
	}
end

function t:parseOperationTypeDefinition() --[[ line: 908 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var30 = self:parseOperationType()
	self:expectToken(tokenKind.COLON)
	
	return {
		kind = kind.OPERATION_TYPE_DEFINITION,
		operation = var30,
		type = self:parseNamedType(),
		loc = self:loc(token)
	}
end

function t:parseScalarTypeDefinition() --[[ line: 925 ]]
	-- upvalues: kind (ref)
	local token = self._lexer.token
	local var31 = self:parseDescription()
	self:expectKeyword("scalar")
	
	return {
		kind = kind.SCALAR_TYPE_DEFINITION,
		description = var31,
		name = self:parseName(),
		directives = self:parseDirectives(true),
		loc = self:loc(token)
	}
end

function t:parseObjectTypeDefinition() --[[ line: 945 ]]
	-- upvalues: kind (ref)
	local token = self._lexer.token
	local var32 = self:parseDescription()
	self:expectKeyword("type")
	
	return {
		kind = kind.OBJECT_TYPE_DEFINITION,
		description = var32,
		name = self:parseName(),
		interfaces = self:parseImplementsInterfaces(),
		directives = self:parseDirectives(true),
		fields = self:parseFieldsDefinition(),
		loc = self:loc(token)
	}
end

function t:parseImplementsInterfaces() --[[ line: 969 ]]
	-- upvalues: tokenKind (ref)
	return if self:expectOptionalKeyword("implements") then self:delimitedMany(tokenKind.AMP, self.parseNamedType) else {}
end

function t:parseFieldsDefinition() --[[ line: 980 ]]
	-- upvalues: tokenKind (ref)
	return self:optionalMany(tokenKind.BRACE_L, self.parseFieldDefinition, tokenKind.BRACE_R)
end

function t:parseFieldDefinition() --[[ line: 988 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var33 = self:parseDescription()
	local var34 = self:parseName()
	local var35 = self:parseArgumentDefs()
	self:expectToken(tokenKind.COLON)
	
	return {
		kind = kind.FIELD_DEFINITION,
		description = var33,
		name = var34,
		arguments = var35,
		type = self:parseTypeReference(),
		directives = self:parseDirectives(true),
		loc = self:loc(token)
	}
end

function t:parseArgumentDefs() --[[ line: 1010 ]]
	-- upvalues: tokenKind (ref)
	return self:optionalMany(tokenKind.PAREN_L, self.parseInputValueDef, tokenKind.PAREN_R)
end

function t:parseInputValueDef() --[[ line: 1018 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var36 = self:parseDescription()
	local var37 = self:parseName()
	self:expectToken(tokenKind.COLON)
	
	return {
		kind = kind.INPUT_VALUE_DEFINITION,
		description = var36,
		name = var37,
		type = self:parseTypeReference(),
		defaultValue = if self:expectOptionalToken(tokenKind.EQUALS) then self:parseValueLiteral(true) else nil,
		directives = self:parseDirectives(true),
		loc = self:loc(token)
	}
end

function t:parseInterfaceTypeDefinition() --[[ line: 1044 ]]
	-- upvalues: kind (ref)
	local token = self._lexer.token
	local var38 = self:parseDescription()
	self:expectKeyword("interface")
	
	return {
		kind = kind.INTERFACE_TYPE_DEFINITION,
		description = var38,
		name = self:parseName(),
		interfaces = self:parseImplementsInterfaces(),
		directives = self:parseDirectives(true),
		fields = self:parseFieldsDefinition(),
		loc = self:loc(token)
	}
end

function t:parseUnionTypeDefinition() --[[ line: 1067 ]]
	-- upvalues: kind (ref)
	local token = self._lexer.token
	local var39 = self:parseDescription()
	self:expectKeyword("union")
	
	return {
		kind = kind.UNION_TYPE_DEFINITION,
		description = var39,
		name = self:parseName(),
		directives = self:parseDirectives(true),
		types = self:parseUnionMemberTypes(),
		loc = self:loc(token)
	}
end

function t:parseUnionMemberTypes() --[[ line: 1089 ]]
	-- upvalues: tokenKind (ref)
	local t = {}
	
	if self:expectOptionalToken(tokenKind.EQUALS) then
		self:expectOptionalToken(tokenKind.PIPE)
		repeat
			table.insert(t, self:parseNamedType())
		until not self:expectOptionalToken(tokenKind.PIPE)
	end
	return t
end

function t:parseEnumTypeDefinition() --[[ line: 1105 ]]
	-- upvalues: kind (ref)
	local token = self._lexer.token
	local var41 = self:parseDescription()
	self:expectKeyword("enum")
	
	return {
		kind = kind.ENUM_TYPE_DEFINITION,
		description = var41,
		name = self:parseName(),
		directives = self:parseDirectives(true),
		values = self:parseEnumValuesDefinition(),
		loc = self:loc(token)
	}
end

function t:parseEnumValuesDefinition() --[[ line: 1125 ]]
	-- upvalues: tokenKind (ref)
	return self:optionalMany(tokenKind.BRACE_L, self.parseEnumValueDefinition, tokenKind.BRACE_R)
end

function t:parseEnumValueDefinition() --[[ line: 1134 ]]
	-- upvalues: kind (ref)
	return {
		kind = kind.ENUM_VALUE_DEFINITION,
		description = self:parseDescription(),
		name = self:parseName(),
		directives = self:parseDirectives(true),
		loc = self:loc(self._lexer.token)
	}
end

function t:parseInputObjectTypeDefinition() --[[ line: 1152 ]]
	-- upvalues: kind (ref)
	local token = self._lexer.token
	local var42 = self:parseDescription()
	self:expectKeyword("input")
	
	return {
		kind = kind.INPUT_OBJECT_TYPE_DEFINITION,
		description = var42,
		name = self:parseName(),
		directives = self:parseDirectives(true),
		fields = self:parseInputFieldsDefinition(),
		loc = self:loc(token)
	}
end

function t:parseInputFieldsDefinition() --[[ line: 1172 ]]
	-- upvalues: tokenKind (ref)
	return self:optionalMany(tokenKind.BRACE_L, self.parseInputValueDef, tokenKind.BRACE_R)
end

function t:parseTypeSystemExtension() --[[ line: 1189 ]]
	-- upvalues: tokenKind (ref)
	local var43 = self._lexer:lookahead()
	
	if var43.kind == tokenKind.NAME then
		local value = var43.value
		
		if value == "schema" then
			return self:parseSchemaExtension()
		elseif value == "scalar" then
			return self:parseScalarTypeExtension()
		elseif value == "type" then
			return self:parseObjectTypeExtension()
		elseif value == "interface" then
			return self:parseInterfaceTypeExtension()
		elseif value == "union" then
			return self:parseUnionTypeExtension()
		elseif value == "enum" then
			return self:parseEnumTypeExtension()
		elseif value == "input" then
			return self:parseInputObjectTypeExtension()
		end
	end
	error(self:unexpected(var43))
end

function t:parseSchemaExtension() --[[ line: 1219 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("schema")
	local var44 = self:parseDirectives(true)
	local brace_l = self:optionalMany(tokenKind.BRACE_L, self.parseOperationTypeDefinition, tokenKind.BRACE_R)
	
	if #var44 == 0 and #brace_l == 0 then
		error(self:unexpected())
	end
	return {
		kind = kind.SCHEMA_EXTENSION,
		directives = var44,
		operationTypes = brace_l,
		loc = self:loc(token)
	}
end

function t:parseScalarTypeExtension() --[[ line: 1244 ]]
	-- upvalues: kind (ref)
	local token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("scalar")
	local var46 = self:parseName()
	local var47 = self:parseDirectives(true)
	
	if #var47 == 0 then
		error(self:unexpected())
	end
	return {
		kind = kind.SCALAR_TYPE_EXTENSION,
		name = var46,
		directives = var47,
		loc = self:loc(token)
	}
end

function t:parseObjectTypeExtension() --[[ line: 1267 ]]
	-- upvalues: kind (ref)
	local token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("type")
	local var48 = self:parseName()
	local var49 = self:parseImplementsInterfaces()
	local var50 = self:parseDirectives(true)
	local var51 = self:parseFieldsDefinition()
	
	if #var49 == 0 and #var50 == 0 and #var51 == 0 then
		error(self:unexpected())
	end
	return {
		kind = kind.OBJECT_TYPE_EXTENSION,
		name = var48,
		interfaces = var49,
		directives = var50,
		fields = var51,
		loc = self:loc(token)
	}
end

function t:parseInterfaceTypeExtension() --[[ line: 1294 ]]
	-- upvalues: kind (ref)
	local token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("interface")
	local var52 = self:parseName()
	local var53 = self:parseImplementsInterfaces()
	local var54 = self:parseDirectives(true)
	local var55 = self:parseFieldsDefinition()
	
	if #var53 == 0 and #var54 == 0 and #var55 == 0 then
		error(self:unexpected())
	end
	return {
		kind = kind.INTERFACE_TYPE_EXTENSION,
		name = var52,
		interfaces = var53,
		directives = var54,
		fields = var55,
		loc = self:loc(token)
	}
end

function t:parseUnionTypeExtension() --[[ line: 1320 ]]
	-- upvalues: kind (ref)
	local token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("union")
	local var56 = self:parseName()
	local var57 = self:parseDirectives(true)
	local var58 = self:parseUnionMemberTypes()
	
	if #var57 == 0 and #var58 == 0 then
		error(self:unexpected())
	end
	return {
		kind = kind.UNION_TYPE_EXTENSION,
		name = var56,
		directives = var57,
		types = var58,
		loc = self:loc(token)
	}
end

function t:parseEnumTypeExtension() --[[ line: 1344 ]]
	-- upvalues: kind (ref)
	local token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("enum")
	local var59 = self:parseName()
	local var60 = self:parseDirectives(true)
	local var61 = self:parseEnumValuesDefinition()
	
	if #var60 == 0 and #var61 == 0 then
		error(self:unexpected())
	end
	return {
		kind = kind.ENUM_TYPE_EXTENSION,
		name = var59,
		directives = var60,
		values = var61,
		loc = self:loc(token)
	}
end

function t:parseInputObjectTypeExtension() --[[ line: 1368 ]]
	-- upvalues: kind (ref)
	local token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("input")
	local var62 = self:parseName()
	local var63 = self:parseDirectives(true)
	local var64 = self:parseInputFieldsDefinition()
	
	if #var63 == 0 and #var64 == 0 then
		error(self:unexpected())
	end
	return {
		kind = kind.INPUT_OBJECT_TYPE_EXTENSION,
		name = var62,
		directives = var63,
		fields = var64,
		loc = self:loc(token)
	}
end

function t:parseDirectiveDefinition() --[[ line: 1391 ]]
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var65 = self:parseDescription()
	self:expectKeyword("directive")
	self:expectToken(tokenKind.AT)
	local var66 = self:parseName()
	local var67 = self:parseArgumentDefs()
	local repeatable = self:expectOptionalKeyword("repeatable")
	self:expectKeyword("on")
	
	return {
		kind = kind.DIRECTIVE_DEFINITION,
		description = var65,
		name = var66,
		arguments = var67,
		repeatable = repeatable,
		locations = self:parseDirectiveLocations(),
		loc = self:loc(token)
	}
end

function t:parseDirectiveLocations() --[[ line: 1417 ]]
	-- upvalues: tokenKind (ref)
	self:expectOptionalToken(tokenKind.PIPE)
	local t = {}
	repeat
		table.insert(t, self:parseDirectiveLocation())
	until not self:expectOptionalToken(tokenKind.PIPE)
	return t
end

function t:parseDirectiveLocation() --[[ line: 1454 ]]
	-- upvalues: directiveLocation (ref)
	local token = self._lexer.token
	local var70 = self:parseName()
	
	if directiveLocation[var70.value] == nil then
		error(self:unexpected(token))
		
		return
	end
	return var70
end

function t:loc(p14) --[[ line: 1467 ]]
	-- upvalues: location (ref)
	return if (self._options and self._options.noLocation) == true then nil else location.new(p14, self._lexer.lastToken, self._lexer.source)
end

function t:peek(p15) --[[ line: 1477 ]]
	return self._lexer.token.kind == p15
end

function t:expectToken(p16) --[[ line: 1485 ]]
	-- upvalues: syntaxError (ref), getTokenKindDesc (write), getTokenDesc (write)
	local token = self._lexer.token
	
	if token.kind == p16 then
		self._lexer:advance()
		
		return token
	end
	error(syntaxError(self._lexer.source, token.start, "Expected " .. getTokenKindDesc(p16) .. ", found " .. getTokenDesc(token) .. "."))
end

function t:expectOptionalToken(p17) --[[ line: 1505 ]]
	local token = self._lexer.token
	
	if token.kind == p17 then
		self._lexer:advance()
		
		return token
	end
	return nil
end

function t:expectKeyword(p18) --[[ line: 1518 ]]
	-- upvalues: tokenKind (ref), syntaxError (ref), getTokenDesc (write)
	local token = self._lexer.token
	
	if token.kind == tokenKind.NAME and token.value == p18 then
		self._lexer:advance()
		
		return
	end
	error(syntaxError(self._lexer.source, token.start, "Expected \"" .. p18 .. "\", found " .. getTokenDesc(token) .. "."))
end

function t:expectOptionalKeyword(p19) --[[ line: 1537 ]]
	-- upvalues: tokenKind (ref)
	local token = self._lexer.token
	
	if token.kind == tokenKind.NAME and token.value == p19 then
		self._lexer:advance()
		
		return true
	end
	return false
end

function t:unexpected(p20) --[[ line: 1550 ]]
	-- upvalues: syntaxError (ref), getTokenDesc (write)
	local var71 = if p20 ~= nil then p20 else self._lexer.token
	
	return syntaxError(self._lexer.source, var71.start, "Unexpected " .. getTokenDesc(var71) .. ".")
end

function t:any(p21, p22, p23) --[[ line: 1561 ]]
	self:expectToken(p21)
	local t = {}
	while not self:expectOptionalToken(p23) do
		table.insert(t, p22(self))
	end
	return t
end

function t:optionalMany(p24, p25, p26) --[[ line: 1582 ]]
	if not self:expectOptionalToken(p24) then
		return {}
	end
	local t = {}
	repeat
		table.insert(t, p25(self))
	until self:expectOptionalToken(p26)
	return t
end

function t:many(p27, p28, p29) --[[ line: 1604 ]]
	self:expectToken(p27)
	local t = {}
	repeat
		table.insert(t, p28(self))
	until self:expectOptionalToken(p29)
	return t
end

function t:delimitedMany(p30, p31) --[[ line: 1623 ]]
	self:expectOptionalToken(p30)
	local t = {}
	repeat
		table.insert(t, p31(self))
	until not self:expectOptionalToken(p30)
	return t
end

getTokenDesc = function(p32) --[[ line: 1640 | named "getTokenDesc" ]]
	-- upvalues: getTokenKindDesc (write)
	local value = p32.value
	
	return getTokenKindDesc(p32.kind) .. (if value ~= nil then " \"" .. value .. "\"" else "")
end

getTokenKindDesc = function(p33) --[[ line: 1648 | named "getTokenKindDesc" ]]
	-- upvalues: isPunctuatorTokenKind (ref)
	return if isPunctuatorTokenKind(p33) then "\"" .. p33 .. "\"" else p33
end

return {
	Parser = t,
	parse = parse,
	parseValue = parseValue,
	parseType = parseType
}
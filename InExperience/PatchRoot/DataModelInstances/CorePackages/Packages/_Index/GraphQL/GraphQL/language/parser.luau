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

local function parse(p1, p2)
	-- upvalues: t (ref)
	return t.new(p1, p2):parseDocument()
end

local function parseValue(p1, p2)
	-- upvalues: t (ref), tokenKind (ref)
	local var1 = t.new(p1, p2)
	var1:expectToken(tokenKind.SOF)
	local var2 = var1:parseValueLiteral(false)
	var1:expectToken(tokenKind.EOF)
	
	return var2
end

local function parseType(value, p1)
	-- upvalues: t (ref), tokenKind (ref)
	local var1 = t.new(value, p1)
	var1:expectToken(tokenKind.SOF)
	local var2 = var1:parseTypeReference()
	var1:expectToken(tokenKind.EOF)
	
	return var2
end

function t.new(p1, p2)
	-- upvalues: source (ref), lexer (ref), t (ref)
	return setmetatable({
		_lexer = lexer.new(if typeof(p1) == "string" then source.new(p1) else p1),
		_options = p2
	}, t)
end

function t:parseName()
	-- upvalues: tokenKind (ref), kind (ref)
	local name = self:expectToken(tokenKind.NAME)
	
	return {
		kind = kind.NAME,
		value = name.value,
		loc = self:loc(name)
	}
end

function t:parseDocument()
	-- upvalues: kind (ref), tokenKind (ref)
	return {
		kind = kind.DOCUMENT,
		definitions = self:many(tokenKind.SOF, self.parseDefinition, tokenKind.EOF),
		loc = self:loc(self._lexer.token)
	}
end

function t:parseDefinition()
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

function t:parseOperationDefinition()
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

function t:parseOperationType()
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

function t:parseVariableDefinitions()
	-- upvalues: tokenKind (ref)
	return self:optionalMany(tokenKind.PAREN_L, self.parseVariableDefinition, tokenKind.PAREN_R)
end

function t:parseVariableDefinition()
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var1 = self:parseVariable()
	self:expectToken(tokenKind.COLON)
	
	return {
		kind = kind.VARIABLE_DEFINITION,
		variable = var1,
		type = self:parseTypeReference(),
		defaultValue = if self:expectOptionalToken(tokenKind.EQUALS) then self:parseValueLiteral(true) else nil,
		directives = self:parseDirectives(true),
		loc = self:loc(token)
	}
end

function t:parseVariable()
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	self:expectToken(tokenKind.DOLLAR)
	
	return {
		kind = kind.VARIABLE,
		name = self:parseName(),
		loc = self:loc(token)
	}
end

function t:parseSelectionSet()
	-- upvalues: kind (ref), tokenKind (ref)
	return {
		kind = kind.SELECTION_SET,
		selections = self:many(tokenKind.BRACE_L, self.parseSelection, tokenKind.BRACE_R),
		loc = self:loc(self._lexer.token)
	}
end

function t:parseSelection()
	-- upvalues: tokenKind (ref)
	return if self:peek(tokenKind.SPREAD) then self:parseFragment() else self:parseField()
end

function t:parseField()
	-- upvalues: tokenKind (ref), kind (ref)
	local var1
	local token = self._lexer.token
	local var2 = self:parseName()
	local var3 = nil
	local _ = nil
	
	if self:expectOptionalToken(tokenKind.COLON) then
		var3 = var2
		var1 = self:parseName()
	else
		var1 = var2
	end
	return {
		kind = kind.FIELD,
		alias = var3,
		name = var1,
		arguments = self:parseArguments(false),
		directives = self:parseDirectives(false),
		selectionSet = self:peek(tokenKind.BRACE_L) and self:parseSelectionSet() or nil,
		loc = self:loc(token)
	}
end

function t:parseArguments(p1)
	-- upvalues: tokenKind (ref)
	return self:optionalMany(tokenKind.PAREN_L, if p1 then self.parseConstArgument else self.parseArgument, tokenKind.PAREN_R)
end

function t:parseArgument()
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var1 = self:parseName()
	self:expectToken(tokenKind.COLON)
	
	return {
		kind = kind.ARGUMENT,
		name = var1,
		value = self:parseValueLiteral(false),
		loc = self:loc(token)
	}
end

function t:parseConstArgument()
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var1 = self:parseName()
	self:expectToken(tokenKind.COLON)
	
	return {
		kind = kind.ARGUMENT,
		name = var1,
		value = self:parseValueLiteral(true),
		loc = self:loc(token)
	}
end

function t:parseFragment()
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

function t:parseFragmentDefinition()
	-- upvalues: kind (ref)
	local token = self._lexer.token
	self:expectKeyword("fragment")
	
	if (self._options and self._options.experimentalFragmentVariables) == true then
		local var1 = self:parseFragmentName()
		local var2 = self:parseVariableDefinitions()
		self:expectKeyword("on")
		
		return {
			kind = kind.FRAGMENT_DEFINITION,
			name = var1,
			variableDefinitions = var2,
			typeCondition = self:parseNamedType(),
			directives = self:parseDirectives(false),
			selectionSet = self:parseSelectionSet(),
			loc = self:loc(token)
		}
	end
	local var3 = self:parseFragmentName()
	self:expectKeyword("on")
	
	return {
		kind = kind.FRAGMENT_DEFINITION,
		name = var3,
		typeCondition = self:parseNamedType(),
		directives = self:parseDirectives(false),
		selectionSet = self:parseSelectionSet(),
		loc = self:loc(token)
	}
end

function t:parseFragmentName()
	if self._lexer.token.value == "on" then
		error(self:unexpected())
	end
	return self:parseName()
end

function t:parseValueLiteral(p1)
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local kind_1 = token.kind
	
	if kind_1 == tokenKind.BRACKET_L then
		return self:parseList(p1)
	elseif kind_1 == tokenKind.BRACE_L then
		return self:parseObject(p1)
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
	elseif kind_1 == tokenKind.DOLLAR and not p1 then
		return self:parseVariable()
	end
	error(self:unexpected())
end

function t:parseStringLiteral()
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

function t:parseList(p1)
	-- upvalues: kind (ref), tokenKind (ref)
	return {
		kind = kind.LIST,
		values = self:any(tokenKind.BRACKET_L, function()
			-- upvalues: self (ref), p1 (ref)
			return self:parseValueLiteral(p1)
		end, tokenKind.BRACKET_R),
		loc = self:loc(self._lexer.token)
	}
end

function t:parseObject(p1)
	-- upvalues: kind (ref), tokenKind (ref)
	return {
		kind = kind.OBJECT,
		fields = self:any(tokenKind.BRACE_L, function()
			-- upvalues: self (ref), p1 (ref)
			return self:parseObjectField(p1)
		end, tokenKind.BRACE_R),
		loc = self:loc(self._lexer.token)
	}
end

function t:parseObjectField(p1)
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var1 = self:parseName()
	self:expectToken(tokenKind.COLON)
	
	return {
		kind = kind.OBJECT_FIELD,
		name = var1,
		value = self:parseValueLiteral(p1),
		loc = self:loc(token)
	}
end

function t:parseDirectives(p1)
	-- upvalues: tokenKind (ref)
	local t = {}
	while self:peek(tokenKind.AT) do
		table.insert(t, self:parseDirective(p1))
	end
	return t
end

function t:parseDirective(p2)
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	self:expectToken(tokenKind.AT)
	
	return {
		kind = kind.DIRECTIVE,
		name = self:parseName(),
		arguments = self:parseArguments(p2),
		loc = self:loc(token)
	}
end

function t:parseTypeReference()
	-- upvalues: tokenKind (ref), kind (ref)
	local t
	local token = self._lexer.token
	local _ = nil
	
	if self:expectOptionalToken(tokenKind.BRACKET_L) then
		local var1 = self:parseTypeReference()
		self:expectToken(tokenKind.BRACKET_R)
		t = {
			kind = kind.LIST_TYPE,
			type = var1,
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

function t:parseNamedType()
	-- upvalues: kind (ref)
	return {
		kind = kind.NAMED_TYPE,
		name = self:parseName(),
		loc = self:loc(self._lexer.token)
	}
end

function t:parseTypeSystemDefinition()
	-- upvalues: tokenKind (ref)
	local var1 = if self:peekDescription() then self._lexer:lookahead() else self._lexer.token
	
	if var1.kind == tokenKind.NAME then
		local value = var1.value
		
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
	error(self:unexpected(var1))
end

function t:peekDescription()
	-- upvalues: tokenKind (ref)
	return self:peek(tokenKind.STRING) or self:peek(tokenKind.BLOCK_STRING)
end

function t:parseDescription()
	if self:peekDescription() then
		return self:parseStringLiteral()
	end
end

function t:parseSchemaDefinition()
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var1 = self:parseDescription()
	self:expectKeyword("schema")
	
	return {
		kind = kind.SCHEMA_DEFINITION,
		description = var1,
		directives = self:parseDirectives(true),
		operationTypes = self:many(tokenKind.BRACE_L, self.parseOperationTypeDefinition, tokenKind.BRACE_R),
		loc = self:loc(token)
	}
end

function t:parseOperationTypeDefinition()
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var1 = self:parseOperationType()
	self:expectToken(tokenKind.COLON)
	
	return {
		kind = kind.OPERATION_TYPE_DEFINITION,
		operation = var1,
		type = self:parseNamedType(),
		loc = self:loc(token)
	}
end

function t:parseScalarTypeDefinition()
	-- upvalues: kind (ref)
	local token = self._lexer.token
	local var1 = self:parseDescription()
	self:expectKeyword("scalar")
	
	return {
		kind = kind.SCALAR_TYPE_DEFINITION,
		description = var1,
		name = self:parseName(),
		directives = self:parseDirectives(true),
		loc = self:loc(token)
	}
end

function t:parseObjectTypeDefinition()
	-- upvalues: kind (ref)
	local token = self._lexer.token
	local var1 = self:parseDescription()
	self:expectKeyword("type")
	
	return {
		kind = kind.OBJECT_TYPE_DEFINITION,
		description = var1,
		name = self:parseName(),
		interfaces = self:parseImplementsInterfaces(),
		directives = self:parseDirectives(true),
		fields = self:parseFieldsDefinition(),
		loc = self:loc(token)
	}
end

function t:parseImplementsInterfaces()
	-- upvalues: tokenKind (ref)
	return if self:expectOptionalKeyword("implements") then self:delimitedMany(tokenKind.AMP, self.parseNamedType) else {}
end

function t:parseFieldsDefinition()
	-- upvalues: tokenKind (ref)
	return self:optionalMany(tokenKind.BRACE_L, self.parseFieldDefinition, tokenKind.BRACE_R)
end

function t:parseFieldDefinition()
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var1 = self:parseDescription()
	local var2 = self:parseName()
	local var3 = self:parseArgumentDefs()
	self:expectToken(tokenKind.COLON)
	
	return {
		kind = kind.FIELD_DEFINITION,
		description = var1,
		name = var2,
		arguments = var3,
		type = self:parseTypeReference(),
		directives = self:parseDirectives(true),
		loc = self:loc(token)
	}
end

function t:parseArgumentDefs()
	-- upvalues: tokenKind (ref)
	return self:optionalMany(tokenKind.PAREN_L, self.parseInputValueDef, tokenKind.PAREN_R)
end

function t:parseInputValueDef()
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var1 = self:parseDescription()
	local var2 = self:parseName()
	self:expectToken(tokenKind.COLON)
	
	return {
		kind = kind.INPUT_VALUE_DEFINITION,
		description = var1,
		name = var2,
		type = self:parseTypeReference(),
		defaultValue = if self:expectOptionalToken(tokenKind.EQUALS) then self:parseValueLiteral(true) else nil,
		directives = self:parseDirectives(true),
		loc = self:loc(token)
	}
end

function t:parseInterfaceTypeDefinition()
	-- upvalues: kind (ref)
	local token = self._lexer.token
	local var1 = self:parseDescription()
	self:expectKeyword("interface")
	
	return {
		kind = kind.INTERFACE_TYPE_DEFINITION,
		description = var1,
		name = self:parseName(),
		interfaces = self:parseImplementsInterfaces(),
		directives = self:parseDirectives(true),
		fields = self:parseFieldsDefinition(),
		loc = self:loc(token)
	}
end

function t:parseUnionTypeDefinition()
	-- upvalues: kind (ref)
	local token = self._lexer.token
	local var1 = self:parseDescription()
	self:expectKeyword("union")
	
	return {
		kind = kind.UNION_TYPE_DEFINITION,
		description = var1,
		name = self:parseName(),
		directives = self:parseDirectives(true),
		types = self:parseUnionMemberTypes(),
		loc = self:loc(token)
	}
end

function t:parseUnionMemberTypes()
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

function t:parseEnumTypeDefinition()
	-- upvalues: kind (ref)
	local token = self._lexer.token
	local var1 = self:parseDescription()
	self:expectKeyword("enum")
	
	return {
		kind = kind.ENUM_TYPE_DEFINITION,
		description = var1,
		name = self:parseName(),
		directives = self:parseDirectives(true),
		values = self:parseEnumValuesDefinition(),
		loc = self:loc(token)
	}
end

function t:parseEnumValuesDefinition()
	-- upvalues: tokenKind (ref)
	return self:optionalMany(tokenKind.BRACE_L, self.parseEnumValueDefinition, tokenKind.BRACE_R)
end

function t:parseEnumValueDefinition()
	-- upvalues: kind (ref)
	return {
		kind = kind.ENUM_VALUE_DEFINITION,
		description = self:parseDescription(),
		name = self:parseName(),
		directives = self:parseDirectives(true),
		loc = self:loc(self._lexer.token)
	}
end

function t:parseInputObjectTypeDefinition()
	-- upvalues: kind (ref)
	local token = self._lexer.token
	local var1 = self:parseDescription()
	self:expectKeyword("input")
	
	return {
		kind = kind.INPUT_OBJECT_TYPE_DEFINITION,
		description = var1,
		name = self:parseName(),
		directives = self:parseDirectives(true),
		fields = self:parseInputFieldsDefinition(),
		loc = self:loc(token)
	}
end

function t:parseInputFieldsDefinition()
	-- upvalues: tokenKind (ref)
	return self:optionalMany(tokenKind.BRACE_L, self.parseInputValueDef, tokenKind.BRACE_R)
end

function t:parseTypeSystemExtension()
	-- upvalues: tokenKind (ref)
	local var1 = self._lexer:lookahead()
	
	if var1.kind == tokenKind.NAME then
		local value = var1.value
		
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
	error(self:unexpected(var1))
end

function t:parseSchemaExtension()
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("schema")
	local var1 = self:parseDirectives(true)
	local brace_l = self:optionalMany(tokenKind.BRACE_L, self.parseOperationTypeDefinition, tokenKind.BRACE_R)
	
	if #var1 == 0 and #brace_l == 0 then
		error(self:unexpected())
	end
	return {
		kind = kind.SCHEMA_EXTENSION,
		directives = var1,
		operationTypes = brace_l,
		loc = self:loc(token)
	}
end

function t:parseScalarTypeExtension()
	-- upvalues: kind (ref)
	local token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("scalar")
	local var1 = self:parseName()
	local var2 = self:parseDirectives(true)
	
	if #var2 == 0 then
		error(self:unexpected())
	end
	return {
		kind = kind.SCALAR_TYPE_EXTENSION,
		name = var1,
		directives = var2,
		loc = self:loc(token)
	}
end

function t:parseObjectTypeExtension()
	-- upvalues: kind (ref)
	local token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("type")
	local var1 = self:parseName()
	local var2 = self:parseImplementsInterfaces()
	local var3 = self:parseDirectives(true)
	local var4 = self:parseFieldsDefinition()
	
	if #var2 == 0 and #var3 == 0 and #var4 == 0 then
		error(self:unexpected())
	end
	return {
		kind = kind.OBJECT_TYPE_EXTENSION,
		name = var1,
		interfaces = var2,
		directives = var3,
		fields = var4,
		loc = self:loc(token)
	}
end

function t:parseInterfaceTypeExtension()
	-- upvalues: kind (ref)
	local token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("interface")
	local var1 = self:parseName()
	local var2 = self:parseImplementsInterfaces()
	local var3 = self:parseDirectives(true)
	local var4 = self:parseFieldsDefinition()
	
	if #var2 == 0 and #var3 == 0 and #var4 == 0 then
		error(self:unexpected())
	end
	return {
		kind = kind.INTERFACE_TYPE_EXTENSION,
		name = var1,
		interfaces = var2,
		directives = var3,
		fields = var4,
		loc = self:loc(token)
	}
end

function t:parseUnionTypeExtension()
	-- upvalues: kind (ref)
	local token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("union")
	local var1 = self:parseName()
	local var2 = self:parseDirectives(true)
	local var3 = self:parseUnionMemberTypes()
	
	if #var2 == 0 and #var3 == 0 then
		error(self:unexpected())
	end
	return {
		kind = kind.UNION_TYPE_EXTENSION,
		name = var1,
		directives = var2,
		types = var3,
		loc = self:loc(token)
	}
end

function t:parseEnumTypeExtension()
	-- upvalues: kind (ref)
	local token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("enum")
	local var1 = self:parseName()
	local var2 = self:parseDirectives(true)
	local var3 = self:parseEnumValuesDefinition()
	
	if #var2 == 0 and #var3 == 0 then
		error(self:unexpected())
	end
	return {
		kind = kind.ENUM_TYPE_EXTENSION,
		name = var1,
		directives = var2,
		values = var3,
		loc = self:loc(token)
	}
end

function t:parseInputObjectTypeExtension()
	-- upvalues: kind (ref)
	local token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("input")
	local var1 = self:parseName()
	local var2 = self:parseDirectives(true)
	local var3 = self:parseInputFieldsDefinition()
	
	if #var2 == 0 and #var3 == 0 then
		error(self:unexpected())
	end
	return {
		kind = kind.INPUT_OBJECT_TYPE_EXTENSION,
		name = var1,
		directives = var2,
		fields = var3,
		loc = self:loc(token)
	}
end

function t:parseDirectiveDefinition()
	-- upvalues: tokenKind (ref), kind (ref)
	local token = self._lexer.token
	local var1 = self:parseDescription()
	self:expectKeyword("directive")
	self:expectToken(tokenKind.AT)
	local var2 = self:parseName()
	local var3 = self:parseArgumentDefs()
	local repeatable = self:expectOptionalKeyword("repeatable")
	self:expectKeyword("on")
	
	return {
		kind = kind.DIRECTIVE_DEFINITION,
		description = var1,
		name = var2,
		arguments = var3,
		repeatable = repeatable,
		locations = self:parseDirectiveLocations(),
		loc = self:loc(token)
	}
end

function t:parseDirectiveLocations()
	-- upvalues: tokenKind (ref)
	self:expectOptionalToken(tokenKind.PIPE)
	local t = {}
	repeat
		table.insert(t, self:parseDirectiveLocation())
	until not self:expectOptionalToken(tokenKind.PIPE)
	return t
end

function t:parseDirectiveLocation()
	-- upvalues: directiveLocation (ref)
	local token = self._lexer.token
	local var1 = self:parseName()
	
	if directiveLocation[var1.value] == nil then
		error(self:unexpected(token))
		
		return
	end
	return var1
end

function t:loc(p2)
	-- upvalues: location (ref)
	return if (self._options and self._options.noLocation) == true then nil else location.new(p2, self._lexer.lastToken, self._lexer.source)
end

function t:peek(p2)
	return self._lexer.token.kind == p2
end

function t:expectToken(p2)
	-- upvalues: syntaxError (ref), getTokenKindDesc (write), getTokenDesc (write)
	local token = self._lexer.token
	
	if token.kind == p2 then
		self._lexer:advance()
		
		return token
	end
	error(syntaxError(self._lexer.source, token.start, "Expected " .. getTokenKindDesc(p2) .. ", found " .. getTokenDesc(token) .. "."))
end

function t:expectOptionalToken(p2)
	local token = self._lexer.token
	
	if token.kind == p2 then
		self._lexer:advance()
		
		return token
	end
	return nil
end

function t:expectKeyword(p2)
	-- upvalues: tokenKind (ref), syntaxError (ref), getTokenDesc (write)
	local token = self._lexer.token
	
	if token.kind == tokenKind.NAME and token.value == p2 then
		self._lexer:advance()
		
		return
	end
	error(syntaxError(self._lexer.source, token.start, "Expected \"" .. p18 .. "\", found " .. getTokenDesc(token) .. "."))
end

function t:expectOptionalKeyword(p2)
	-- upvalues: tokenKind (ref)
	local token = self._lexer.token
	
	if token.kind == tokenKind.NAME and token.value == p2 then
		self._lexer:advance()
		
		return true
	end
	return false
end

function t:unexpected(p2)
	-- upvalues: syntaxError (ref), getTokenDesc (write)
	local var1 = if p2 ~= nil then p2 else self._lexer.token
	
	return syntaxError(self._lexer.source, var1.start, "Unexpected " .. getTokenDesc(var1) .. ".")
end

function t:any(p2, p3, p4)
	self:expectToken(p2)
	local t = {}
	while not self:expectOptionalToken(p4) do
		table.insert(t, p3(self))
	end
	return t
end

function t:optionalMany(p5, p6, p7)
	if not self:expectOptionalToken(p5) then
		return {}
	end
	local t = {}
	repeat
		table.insert(t, p6(self))
	until self:expectOptionalToken(p7)
	return t
end

function t:many(p5, p6, p7)
	self:expectToken(p5)
	local t = {}
	repeat
		table.insert(t, p6(self))
	until self:expectOptionalToken(p7)
	return t
end

function t:delimitedMany(p5, p6)
	self:expectOptionalToken(p5)
	local t = {}
	repeat
		table.insert(t, p6(self))
	until not self:expectOptionalToken(p5)
	return t
end

getTokenDesc = function(p5)
	-- upvalues: getTokenKindDesc (write)
	local value = p5.value
	
	return getTokenKindDesc(p5.kind) .. (if value ~= nil then " \"" .. value .. "\"" else "")
end

getTokenKindDesc = function(p5)
	-- upvalues: isPunctuatorTokenKind (ref)
	return if isPunctuatorTokenKind(p5) then "\"" .. p33 .. "\"" else p5
end

return {
	Parser = t,
	parse = parse,
	parseValue = parseValue,
	parseType = parseType
}
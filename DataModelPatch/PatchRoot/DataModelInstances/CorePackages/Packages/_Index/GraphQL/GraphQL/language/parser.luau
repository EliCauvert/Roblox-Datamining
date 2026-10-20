local Parent = script.Parent
local Parent1 = Parent.Parent
local _ = require(Parent1.Parent.LuauPolyfill)
local _ = require(Parent1.error)
local Location = require(Parent.ast).Location
local Source = require(Parent.source).Source
local LexerModule = require(Parent.lexer)
local Lexer = LexerModule.Lexer
local IsPunctuatorTokenKindFunction = LexerModule.isPunctuatorTokenKind
local TokenKind = require(Parent.tokenKind).TokenKind
local DirectiveLocation = require(Parent.directiveLocation).DirectiveLocation
local Kind = require(Parent.kinds).Kind
local SyntaxErrorFunction = require(script.Parent.Parent.error.syntaxError).syntaxError
local Callback1 = nil
local Callback = nil
local Module = {}
Module.__index = Module

local function parse(p1, Options)
	-- upvalues: Module (copy)
	return Module.new(p1, Options):parseDocument()
end

local function parseValue(p1, Options)
	-- upvalues: Module (copy), TokenKind (copy)
	local NewModule = Module.new(p1, Options)
	NewModule:expectToken(TokenKind.SOF)
	local ParseValueLiteralResult = NewModule:parseValueLiteral(false)
	NewModule:expectToken(TokenKind.EOF)
	
	return ParseValueLiteralResult
end

local function parseType(p1, Options)
	-- upvalues: Module (copy), TokenKind (copy)
	local NewModule = Module.new(p1, Options)
	NewModule:expectToken(TokenKind.SOF)
	local ParseTypeReferenceResult = NewModule:parseTypeReference()
	NewModule:expectToken(TokenKind.EOF)
	
	return ParseTypeReferenceResult
end

function Module.new(NewResult, Options)
	-- upvalues: Source (copy), Lexer (copy), Module (copy)
	return (setmetatable({
		_lexer = Lexer.new(if typeof(NewResult) == "string" then Source.new(NewResult) else NewResult),
		_options = Options
	}, Module))
end

function Module:parseName()
	-- upvalues: TokenKind (copy), Kind (copy)
	local ExpectTokenResult = self:expectToken(TokenKind.NAME)
	
	return {
		kind = Kind.NAME,
		value = ExpectTokenResult.value,
		loc = self:loc(ExpectTokenResult)
	}
end

function Module:parseDocument()
	-- upvalues: Kind (copy), TokenKind (copy)
	return {
		kind = Kind.DOCUMENT,
		definitions = self:many(TokenKind.SOF, self.parseDefinition, TokenKind.EOF),
		loc = self:loc(self._lexer.token)
	}
end

function Module:parseDefinition()
	-- upvalues: TokenKind (copy)
	if self:peek(TokenKind.NAME) then
		local Value = self._lexer.token.value
		
		if Value == "query" or Value == "mutation" or Value == "subscription" then
			return self:parseOperationDefinition()
		elseif Value == "fragment" then
			return self:parseFragmentDefinition()
		elseif Value == "schema" or Value == "scalar" or Value == "type" or Value == "interface" or Value == "union" or Value == "enum" or Value == "input" or Value == "directive" then
			return self:parseTypeSystemDefinition()
		elseif Value == "extend" then
			return self:parseTypeSystemExtension()
		end
	elseif self:peek(TokenKind.BRACE_L) then
		return self:parseOperationDefinition()
	elseif self:peekDescription() then
		return self:parseTypeSystemDefinition()
	end
	error(self:unexpected())
end

function Module:parseOperationDefinition()
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	
	return if self:peek(TokenKind.BRACE_L) then {
		operation = "query",
		name = nil,
		kind = Kind.OPERATION_DEFINITION,
		variableDefinitions = {},
		directives = {},
		selectionSet = self:parseSelectionSet(),
		loc = self:loc(Token)
	} else {
		kind = Kind.OPERATION_DEFINITION,
		operation = self:parseOperationType(),
		name = if self:peek(TokenKind.NAME) then self:parseName() else nil,
		variableDefinitions = self:parseVariableDefinitions(),
		directives = self:parseDirectives(false),
		selectionSet = self:parseSelectionSet(),
		loc = self:loc(Token)
	}
end

function Module:parseOperationType(): string?
	-- upvalues: TokenKind (copy)
	local ExpectTokenResult = self:expectToken(TokenKind.NAME)
	
	if ExpectTokenResult.value == "query" then
		return "query"
	elseif ExpectTokenResult.value == "mutation" then
		return "mutation"
	elseif ExpectTokenResult.value == "subscription" then
		return "subscription"
	else
		error(self:unexpected(ExpectTokenResult))
	end
end

function Module:parseVariableDefinitions()
	-- upvalues: TokenKind (copy)
	return self:optionalMany(TokenKind.PAREN_L, self.parseVariableDefinition, TokenKind.PAREN_R)
end

function Module:parseVariableDefinition()
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	local ParseVariableResult = self:parseVariable()
	self:expectToken(TokenKind.COLON)
	
	return {
		kind = Kind.VARIABLE_DEFINITION,
		variable = ParseVariableResult,
		type = self:parseTypeReference(),
		defaultValue = if self:expectOptionalToken(TokenKind.EQUALS) then self:parseValueLiteral(true) else nil,
		directives = self:parseDirectives(true),
		loc = self:loc(Token)
	}
end

function Module:parseVariable()
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	self:expectToken(TokenKind.DOLLAR)
	
	return {
		kind = Kind.VARIABLE,
		name = self:parseName(),
		loc = self:loc(Token)
	}
end

function Module:parseSelectionSet()
	-- upvalues: Kind (copy), TokenKind (copy)
	return {
		kind = Kind.SELECTION_SET,
		selections = self:many(TokenKind.BRACE_L, self.parseSelection, TokenKind.BRACE_R),
		loc = self:loc(self._lexer.token)
	}
end

function Module.parseSelection(p1)
	-- upvalues: TokenKind (copy)
	return if p1:peek(TokenKind.SPREAD) then p1:parseFragment() else p1:parseField()
end

function Module:parseField()
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	local ParseNameResult = self:parseName()
	local Alias = nil
	local ParseNameResult1 = nil
	
	if self:expectOptionalToken(TokenKind.COLON) then
		Alias = ParseNameResult
		ParseNameResult1 = self:parseName()
	else
		ParseNameResult1 = ParseNameResult
	end
	return {
		kind = Kind.FIELD,
		alias = Alias,
		name = ParseNameResult1,
		arguments = self:parseArguments(false),
		directives = self:parseDirectives(false),
		selectionSet = self:peek(TokenKind.BRACE_L) and self:parseSelectionSet() or nil,
		loc = self:loc(Token)
	}
end

function Module:parseArguments(p1)
	-- upvalues: TokenKind (copy)
	return self:optionalMany(TokenKind.PAREN_L, if p1 then self.parseConstArgument else self.parseArgument, TokenKind.PAREN_R)
end

function Module:parseArgument()
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	local ParseNameResult = self:parseName()
	self:expectToken(TokenKind.COLON)
	
	return {
		kind = Kind.ARGUMENT,
		name = ParseNameResult,
		value = self:parseValueLiteral(false),
		loc = self:loc(Token)
	}
end

function Module:parseConstArgument()
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	local ParseNameResult = self:parseName()
	self:expectToken(TokenKind.COLON)
	
	return {
		kind = Kind.ARGUMENT,
		name = ParseNameResult,
		value = self:parseValueLiteral(true),
		loc = self:loc(Token)
	}
end

function Module:parseFragment()
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	self:expectToken(TokenKind.SPREAD)
	local On = self:expectOptionalKeyword("on")
	
	return if On or not self:peek(TokenKind.NAME) then {
		kind = Kind.INLINE_FRAGMENT,
		typeCondition = if On then self:parseNamedType() else nil,
		directives = self:parseDirectives(false),
		selectionSet = self:parseSelectionSet(),
		loc = self:loc(Token)
	} else {
		kind = Kind.FRAGMENT_SPREAD,
		name = self:parseFragmentName(),
		directives = self:parseDirectives(false),
		loc = self:loc(Token)
	}
end

function Module:parseFragmentDefinition()
	-- upvalues: Kind (copy)
	local Token = self._lexer.token
	self:expectKeyword("fragment")
	
	if (self._options and self._options.experimentalFragmentVariables) == true then
		local ParseFragmentNameResult = self:parseFragmentName()
		local ParseVariableDefinitionsResult = self:parseVariableDefinitions()
		self:expectKeyword("on")
		
		return {
			kind = Kind.FRAGMENT_DEFINITION,
			name = ParseFragmentNameResult,
			variableDefinitions = ParseVariableDefinitionsResult,
			typeCondition = self:parseNamedType(),
			directives = self:parseDirectives(false),
			selectionSet = self:parseSelectionSet(),
			loc = self:loc(Token)
		}
	else
		local ParseFragmentNameResult = self:parseFragmentName()
		self:expectKeyword("on")
		
		return {
			kind = Kind.FRAGMENT_DEFINITION,
			name = ParseFragmentNameResult,
			typeCondition = self:parseNamedType(),
			directives = self:parseDirectives(false),
			selectionSet = self:parseSelectionSet(),
			loc = self:loc(Token)
		}
	end
end

function Module:parseFragmentName()
	if self._lexer.token.value == "on" then
		error(self:unexpected())
	end
	return self:parseName()
end

function Module:parseValueLiteral(p1)
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	local Kind1 = Token.kind
	
	if Kind1 == TokenKind.BRACKET_L then
		return self:parseList(p1)
	elseif Kind1 == TokenKind.BRACE_L then
		return self:parseObject(p1)
	elseif Kind1 == TokenKind.INT then
		self._lexer:advance()
		
		return {
			kind = Kind.INT,
			value = Token.value,
			loc = self:loc(Token)
		}
	elseif Kind1 == TokenKind.FLOAT then
		self._lexer:advance()
		
		return {
			kind = Kind.FLOAT,
			value = Token.value,
			loc = self:loc(Token)
		}
	elseif Kind1 == TokenKind.STRING or Kind1 == TokenKind.BLOCK_STRING then
		return self:parseStringLiteral()
	elseif Kind1 == TokenKind.NAME then
		self._lexer:advance()
		local Value = Token.value
		
		return if Value == "true" then { value = true, kind = Kind.BOOLEAN, loc = self:loc(Token) } elseif Value == "false" then {
			value = false,
			kind = Kind.BOOLEAN,
			loc = self:loc(Token)
		} elseif Value == "null" then { kind = Kind.NULL, loc = self:loc(Token) } else { kind = Kind.ENUM, value = Value, loc = self:loc(Token) }
	elseif Kind1 == TokenKind.DOLLAR and not p1 then
		return self:parseVariable()
	else
		error(self:unexpected())
	end
end

function Module:parseStringLiteral()
	-- upvalues: Kind (copy), TokenKind (copy)
	local Token = self._lexer.token
	self._lexer:advance()
	
	return {
		kind = Kind.STRING,
		value = Token.value,
		block = Token.kind == TokenKind.BLOCK_STRING,
		loc = self:loc(Token)
	}
end

function Module:parseList(p1)
	-- upvalues: Kind (copy), TokenKind (copy)
	return {
		kind = Kind.LIST,
		values = self:any(TokenKind.BRACKET_L, function()
			-- upvalues: self (copy), p1 (copy)
			return self:parseValueLiteral(p1)
		end, TokenKind.BRACKET_R),
		loc = self:loc(self._lexer.token)
	}
end

function Module:parseObject(p1)
	-- upvalues: Kind (copy), TokenKind (copy)
	return {
		kind = Kind.OBJECT,
		fields = self:any(TokenKind.BRACE_L, function()
			-- upvalues: self (copy), p1 (copy)
			return self:parseObjectField(p1)
		end, TokenKind.BRACE_R),
		loc = self:loc(self._lexer.token)
	}
end

function Module:parseObjectField(p1)
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	local ParseNameResult = self:parseName()
	self:expectToken(TokenKind.COLON)
	
	return {
		kind = Kind.OBJECT_FIELD,
		name = ParseNameResult,
		value = self:parseValueLiteral(p1),
		loc = self:loc(Token)
	}
end

function Module:parseDirectives(p1)
	-- upvalues: TokenKind (copy)
	local List = {}
	while self:peek(TokenKind.AT) do
		table.insert(List, self:parseDirective(p1))
	end
	return List
end

function Module:parseDirective(p2)
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	self:expectToken(TokenKind.AT)
	
	return {
		kind = Kind.DIRECTIVE,
		name = self:parseName(),
		arguments = self:parseArguments(p2),
		loc = self:loc(Token)
	}
end

function Module:parseTypeReference()
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	local ParseNamedTypeResult = nil
	
	if self:expectOptionalToken(TokenKind.BRACKET_L) then
		local ParseTypeReferenceResult = self:parseTypeReference()
		self:expectToken(TokenKind.BRACKET_R)
		ParseNamedTypeResult = {
			kind = Kind.LIST_TYPE,
			type = ParseTypeReferenceResult,
			loc = self:loc(Token)
		}
	else
		ParseNamedTypeResult = self:parseNamedType()
	end
	return if self:expectOptionalToken(TokenKind.BANG) then {
		kind = Kind.NON_NULL_TYPE,
		type = ParseNamedTypeResult,
		loc = self:loc(Token)
	} else ParseNamedTypeResult
end

function Module:parseNamedType()
	-- upvalues: Kind (copy)
	return {
		kind = Kind.NAMED_TYPE,
		name = self:parseName(),
		loc = self:loc(self._lexer.token)
	}
end

function Module:parseTypeSystemDefinition()
	-- upvalues: TokenKind (copy)
	local LookaheadResult = if self:peekDescription() then self._lexer:lookahead() else self._lexer.token
	
	if LookaheadResult.kind == TokenKind.NAME then
		local Value = LookaheadResult.value
		
		if Value == "schema" then
			return self:parseSchemaDefinition()
		elseif Value == "scalar" then
			return self:parseScalarTypeDefinition()
		elseif Value == "type" then
			return self:parseObjectTypeDefinition()
		elseif Value == "interface" then
			return self:parseInterfaceTypeDefinition()
		elseif Value == "union" then
			return self:parseUnionTypeDefinition()
		elseif Value == "enum" then
			return self:parseEnumTypeDefinition()
		elseif Value == "input" then
			return self:parseInputObjectTypeDefinition()
		elseif Value == "directive" then
			return self:parseDirectiveDefinition()
		end
	end
	error(self:unexpected(LookaheadResult))
end

function Module:peekDescription()
	-- upvalues: TokenKind (copy)
	return self:peek(TokenKind.STRING) or self:peek(TokenKind.BLOCK_STRING)
end

function Module:parseDescription()
	if not self:peekDescription() then return end
	return self:parseStringLiteral()
end

function Module:parseSchemaDefinition()
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	local ParseDescriptionResult = self:parseDescription()
	self:expectKeyword("schema")
	
	return {
		kind = Kind.SCHEMA_DEFINITION,
		description = ParseDescriptionResult,
		directives = self:parseDirectives(true),
		operationTypes = self:many(TokenKind.BRACE_L, self.parseOperationTypeDefinition, TokenKind.BRACE_R),
		loc = self:loc(Token)
	}
end

function Module:parseOperationTypeDefinition()
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	local ParseOperationTypeResult = self:parseOperationType()
	self:expectToken(TokenKind.COLON)
	
	return {
		kind = Kind.OPERATION_TYPE_DEFINITION,
		operation = ParseOperationTypeResult,
		type = self:parseNamedType(),
		loc = self:loc(Token)
	}
end

function Module:parseScalarTypeDefinition()
	-- upvalues: Kind (copy)
	local Token = self._lexer.token
	local ParseDescriptionResult = self:parseDescription()
	self:expectKeyword("scalar")
	
	return {
		kind = Kind.SCALAR_TYPE_DEFINITION,
		description = ParseDescriptionResult,
		name = self:parseName(),
		directives = self:parseDirectives(true),
		loc = self:loc(Token)
	}
end

function Module:parseObjectTypeDefinition()
	-- upvalues: Kind (copy)
	local Token = self._lexer.token
	local ParseDescriptionResult = self:parseDescription()
	self:expectKeyword("type")
	
	return {
		kind = Kind.OBJECT_TYPE_DEFINITION,
		description = ParseDescriptionResult,
		name = self:parseName(),
		interfaces = self:parseImplementsInterfaces(),
		directives = self:parseDirectives(true),
		fields = self:parseFieldsDefinition(),
		loc = self:loc(Token)
	}
end

function Module.parseImplementsInterfaces(p2)
	-- upvalues: TokenKind (copy)
	return if p2:expectOptionalKeyword("implements") then p2:delimitedMany(TokenKind.AMP, p2.parseNamedType) else {}
end

function Module:parseFieldsDefinition()
	-- upvalues: TokenKind (copy)
	return self:optionalMany(TokenKind.BRACE_L, self.parseFieldDefinition, TokenKind.BRACE_R)
end

function Module:parseFieldDefinition()
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	local ParseDescriptionResult = self:parseDescription()
	local ParseNameResult = self:parseName()
	local ParseArgumentDefsResult = self:parseArgumentDefs()
	self:expectToken(TokenKind.COLON)
	
	return {
		kind = Kind.FIELD_DEFINITION,
		description = ParseDescriptionResult,
		name = ParseNameResult,
		arguments = ParseArgumentDefsResult,
		type = self:parseTypeReference(),
		directives = self:parseDirectives(true),
		loc = self:loc(Token)
	}
end

function Module:parseArgumentDefs()
	-- upvalues: TokenKind (copy)
	return self:optionalMany(TokenKind.PAREN_L, self.parseInputValueDef, TokenKind.PAREN_R)
end

function Module:parseInputValueDef()
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	local ParseDescriptionResult = self:parseDescription()
	local ParseNameResult = self:parseName()
	self:expectToken(TokenKind.COLON)
	
	return {
		kind = Kind.INPUT_VALUE_DEFINITION,
		description = ParseDescriptionResult,
		name = ParseNameResult,
		type = self:parseTypeReference(),
		defaultValue = if self:expectOptionalToken(TokenKind.EQUALS) then self:parseValueLiteral(true) else nil,
		directives = self:parseDirectives(true),
		loc = self:loc(Token)
	}
end

function Module:parseInterfaceTypeDefinition()
	-- upvalues: Kind (copy)
	local Token = self._lexer.token
	local ParseDescriptionResult = self:parseDescription()
	self:expectKeyword("interface")
	
	return {
		kind = Kind.INTERFACE_TYPE_DEFINITION,
		description = ParseDescriptionResult,
		name = self:parseName(),
		interfaces = self:parseImplementsInterfaces(),
		directives = self:parseDirectives(true),
		fields = self:parseFieldsDefinition(),
		loc = self:loc(Token)
	}
end

function Module:parseUnionTypeDefinition()
	-- upvalues: Kind (copy)
	local Token = self._lexer.token
	local ParseDescriptionResult = self:parseDescription()
	self:expectKeyword("union")
	
	return {
		kind = Kind.UNION_TYPE_DEFINITION,
		description = ParseDescriptionResult,
		name = self:parseName(),
		directives = self:parseDirectives(true),
		types = self:parseUnionMemberTypes(),
		loc = self:loc(Token)
	}
end

function Module:parseUnionMemberTypes()
	-- upvalues: TokenKind (copy)
	local List = {}
	
	if self:expectOptionalToken(TokenKind.EQUALS) then
		self:expectOptionalToken(TokenKind.PIPE)
		repeat
			table.insert(List, self:parseNamedType())
		until not self:expectOptionalToken(TokenKind.PIPE)
	end
	return List
end

function Module:parseEnumTypeDefinition()
	-- upvalues: Kind (copy)
	local Token = self._lexer.token
	local ParseDescriptionResult = self:parseDescription()
	self:expectKeyword("enum")
	
	return {
		kind = Kind.ENUM_TYPE_DEFINITION,
		description = ParseDescriptionResult,
		name = self:parseName(),
		directives = self:parseDirectives(true),
		values = self:parseEnumValuesDefinition(),
		loc = self:loc(Token)
	}
end

function Module:parseEnumValuesDefinition()
	-- upvalues: TokenKind (copy)
	return self:optionalMany(TokenKind.BRACE_L, self.parseEnumValueDefinition, TokenKind.BRACE_R)
end

function Module:parseEnumValueDefinition()
	-- upvalues: Kind (copy)
	return {
		kind = Kind.ENUM_VALUE_DEFINITION,
		description = self:parseDescription(),
		name = self:parseName(),
		directives = self:parseDirectives(true),
		loc = self:loc(self._lexer.token)
	}
end

function Module:parseInputObjectTypeDefinition()
	-- upvalues: Kind (copy)
	local Token = self._lexer.token
	local ParseDescriptionResult = self:parseDescription()
	self:expectKeyword("input")
	
	return {
		kind = Kind.INPUT_OBJECT_TYPE_DEFINITION,
		description = ParseDescriptionResult,
		name = self:parseName(),
		directives = self:parseDirectives(true),
		fields = self:parseInputFieldsDefinition(),
		loc = self:loc(Token)
	}
end

function Module:parseInputFieldsDefinition()
	-- upvalues: TokenKind (copy)
	return self:optionalMany(TokenKind.BRACE_L, self.parseInputValueDef, TokenKind.BRACE_R)
end

function Module:parseTypeSystemExtension()
	-- upvalues: TokenKind (copy)
	local LookaheadResult = self._lexer:lookahead()
	
	if LookaheadResult.kind == TokenKind.NAME then
		local Value = LookaheadResult.value
		
		if Value == "schema" then
			return self:parseSchemaExtension()
		elseif Value == "scalar" then
			return self:parseScalarTypeExtension()
		elseif Value == "type" then
			return self:parseObjectTypeExtension()
		elseif Value == "interface" then
			return self:parseInterfaceTypeExtension()
		elseif Value == "union" then
			return self:parseUnionTypeExtension()
		elseif Value == "enum" then
			return self:parseEnumTypeExtension()
		elseif Value == "input" then
			return self:parseInputObjectTypeExtension()
		end
	end
	error(self:unexpected(LookaheadResult))
end

function Module:parseSchemaExtension()
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("schema")
	local ParseDirectivesResult = self:parseDirectives(true)
	local OptionalManyResult = self:optionalMany(TokenKind.BRACE_L, self.parseOperationTypeDefinition, TokenKind.BRACE_R)
	
	if #ParseDirectivesResult == 0 and #OptionalManyResult == 0 then
		error(self:unexpected())
	end
	return {
		kind = Kind.SCHEMA_EXTENSION,
		directives = ParseDirectivesResult,
		operationTypes = OptionalManyResult,
		loc = self:loc(Token)
	}
end

function Module:parseScalarTypeExtension()
	-- upvalues: Kind (copy)
	local Token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("scalar")
	local ParseNameResult = self:parseName()
	local ParseDirectivesResult = self:parseDirectives(true)
	
	if #ParseDirectivesResult == 0 then
		error(self:unexpected())
	end
	return {
		kind = Kind.SCALAR_TYPE_EXTENSION,
		name = ParseNameResult,
		directives = ParseDirectivesResult,
		loc = self:loc(Token)
	}
end

function Module:parseObjectTypeExtension()
	-- upvalues: Kind (copy)
	local Token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("type")
	local ParseNameResult = self:parseName()
	local ParseImplementsInterfacesResult = self:parseImplementsInterfaces()
	local ParseDirectivesResult = self:parseDirectives(true)
	local ParseFieldsDefinitionResult = self:parseFieldsDefinition()
	
	if #ParseImplementsInterfacesResult == 0 and #ParseDirectivesResult == 0 and #ParseFieldsDefinitionResult == 0 then
		error(self:unexpected())
	end
	return {
		kind = Kind.OBJECT_TYPE_EXTENSION,
		name = ParseNameResult,
		interfaces = ParseImplementsInterfacesResult,
		directives = ParseDirectivesResult,
		fields = ParseFieldsDefinitionResult,
		loc = self:loc(Token)
	}
end

function Module:parseInterfaceTypeExtension()
	-- upvalues: Kind (copy)
	local Token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("interface")
	local ParseNameResult = self:parseName()
	local ParseImplementsInterfacesResult = self:parseImplementsInterfaces()
	local ParseDirectivesResult = self:parseDirectives(true)
	local ParseFieldsDefinitionResult = self:parseFieldsDefinition()
	
	if #ParseImplementsInterfacesResult == 0 and #ParseDirectivesResult == 0 and #ParseFieldsDefinitionResult == 0 then
		error(self:unexpected())
	end
	return {
		kind = Kind.INTERFACE_TYPE_EXTENSION,
		name = ParseNameResult,
		interfaces = ParseImplementsInterfacesResult,
		directives = ParseDirectivesResult,
		fields = ParseFieldsDefinitionResult,
		loc = self:loc(Token)
	}
end

function Module:parseUnionTypeExtension()
	-- upvalues: Kind (copy)
	local Token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("union")
	local ParseNameResult = self:parseName()
	local ParseDirectivesResult = self:parseDirectives(true)
	local ParseUnionMemberTypesResult = self:parseUnionMemberTypes()
	
	if #ParseDirectivesResult == 0 and #ParseUnionMemberTypesResult == 0 then
		error(self:unexpected())
	end
	return {
		kind = Kind.UNION_TYPE_EXTENSION,
		name = ParseNameResult,
		directives = ParseDirectivesResult,
		types = ParseUnionMemberTypesResult,
		loc = self:loc(Token)
	}
end

function Module:parseEnumTypeExtension()
	-- upvalues: Kind (copy)
	local Token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("enum")
	local ParseNameResult = self:parseName()
	local ParseDirectivesResult = self:parseDirectives(true)
	local ParseEnumValuesDefinitionResult = self:parseEnumValuesDefinition()
	
	if #ParseDirectivesResult == 0 and #ParseEnumValuesDefinitionResult == 0 then
		error(self:unexpected())
	end
	return {
		kind = Kind.ENUM_TYPE_EXTENSION,
		name = ParseNameResult,
		directives = ParseDirectivesResult,
		values = ParseEnumValuesDefinitionResult,
		loc = self:loc(Token)
	}
end

function Module:parseInputObjectTypeExtension()
	-- upvalues: Kind (copy)
	local Token = self._lexer.token
	self:expectKeyword("extend")
	self:expectKeyword("input")
	local ParseNameResult = self:parseName()
	local ParseDirectivesResult = self:parseDirectives(true)
	local ParseInputFieldsDefinitionResult = self:parseInputFieldsDefinition()
	
	if #ParseDirectivesResult == 0 and #ParseInputFieldsDefinitionResult == 0 then
		error(self:unexpected())
	end
	return {
		kind = Kind.INPUT_OBJECT_TYPE_EXTENSION,
		name = ParseNameResult,
		directives = ParseDirectivesResult,
		fields = ParseInputFieldsDefinitionResult,
		loc = self:loc(Token)
	}
end

function Module:parseDirectiveDefinition()
	-- upvalues: TokenKind (copy), Kind (copy)
	local Token = self._lexer.token
	local ParseDescriptionResult = self:parseDescription()
	self:expectKeyword("directive")
	self:expectToken(TokenKind.AT)
	local ParseNameResult = self:parseName()
	local ParseArgumentDefsResult = self:parseArgumentDefs()
	local Repeatable = self:expectOptionalKeyword("repeatable")
	self:expectKeyword("on")
	
	return {
		kind = Kind.DIRECTIVE_DEFINITION,
		description = ParseDescriptionResult,
		name = ParseNameResult,
		arguments = ParseArgumentDefsResult,
		repeatable = Repeatable,
		locations = self:parseDirectiveLocations(),
		loc = self:loc(Token)
	}
end

function Module:parseDirectiveLocations()
	-- upvalues: TokenKind (copy)
	self:expectOptionalToken(TokenKind.PIPE)
	local List = {}
	repeat
		table.insert(List, self:parseDirectiveLocation())
	until not self:expectOptionalToken(TokenKind.PIPE)
	return List
end

function Module:parseDirectiveLocation()
	-- upvalues: DirectiveLocation (copy)
	local Token = self._lexer.token
	local ParseNameResult = self:parseName()
	
	if DirectiveLocation[ParseNameResult.value] == nil then
		error(self:unexpected(Token))
		
		return
	else
		return ParseNameResult
	end
end

function Module:loc(Token)
	-- upvalues: Location (copy)
	local NoLocation = self._options and self._options.noLocation
	
	return if NoLocation == true then nil else Location.new(Token, self._lexer.lastToken, self._lexer.source)
end

function Module:peek(BRACEL): boolean
	return self._lexer.token.kind == BRACEL
end

function Module:expectToken(COLON)
	-- upvalues: SyntaxErrorFunction (copy), Callback (ref), Callback1 (ref)
	local Token = self._lexer.token
	
	if Token.kind ~= COLON then
		error(SyntaxErrorFunction(self._lexer.source, Token.start, "Expected " .. Callback(COLON) .. ", found " .. Callback1(Token) .. "."))
		
		return
	end
	self._lexer:advance()
	
	return Token
end

function Module:expectOptionalToken(PIPE)
	local Token = self._lexer.token
	
	if Token.kind == PIPE then
		self._lexer:advance()
		
		return Token
	else
		return nil
	end
end

function Module:expectKeyword(Text)
	-- upvalues: TokenKind (copy), SyntaxErrorFunction (copy), Callback1 (ref)
	local Token = self._lexer.token
	
	if Token.kind == TokenKind.NAME and Token.value == Text then
		self._lexer:advance()
		
		return
	else
		error(SyntaxErrorFunction(self._lexer.source, Token.start, "Expected \"" .. Text .. "\", found " .. Callback1(Token) .. "."))
	end
end

function Module:expectOptionalKeyword(p2): boolean
	-- upvalues: TokenKind (copy)
	local Token = self._lexer.token
	
	if Token.kind == TokenKind.NAME and Token.value == p2 then
		self._lexer:advance()
		
		return true
	else
		return false
	end
end

function Module:unexpected(LookaheadResult)
	-- upvalues: SyntaxErrorFunction (copy), Callback1 (ref)
	local Token = if LookaheadResult == nil then self._lexer.token else LookaheadResult or self._lexer.token
	
	return SyntaxErrorFunction(self._lexer.source, Token.start, "Unexpected " .. Callback1(Token) .. ".")
end

function Module:any(BRACEL, Callback, BRACER)
	self:expectToken(BRACEL)
	local List = {}
	while not self:expectOptionalToken(BRACER) do
		table.insert(List, Callback(self))
	end
	return List
end

function Module:optionalMany(BRACEL, Callback, BRACER)
	if not self:expectOptionalToken(BRACEL) then
		return {}
	end
	local List = {}
	repeat
		table.insert(List, Callback(self))
	until self:expectOptionalToken(BRACER)
	return List
end

function Module:many(BRACEL, Callback, BRACER)
	self:expectToken(BRACEL)
	local List = {}
	repeat
		table.insert(List, Callback(self))
	until self:expectOptionalToken(BRACER)
	return List
end

function Module:delimitedMany(AMP, Callback)
	self:expectOptionalToken(AMP)
	local List = {}
	repeat
		table.insert(List, Callback(self))
	until not self:expectOptionalToken(AMP)
	return List
end

Callback1 = function(Token): string
	-- upvalues: Callback (ref)
	local Value = Token.value
	
	return Callback(Token.kind) .. (if Value == nil then "" else " \"" .. Value .. "\"" or "")
end

Callback = function(Kind)
	-- upvalues: IsPunctuatorTokenKindFunction (copy)
	return IsPunctuatorTokenKindFunction(Kind) and "\"" .. Kind .. "\"" or Kind
end

return {
	Parser = Module,
	parse = parse,
	parseValue = parseValue,
	parseType = parseType
}
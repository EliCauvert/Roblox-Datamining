local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Map = LuauPolyfillModule.Map
local _ = require(Parent.jsutils.ObjMap)
local Language = Parent.language
local Kind = require(Language.kinds).Kind
local VisitFunction = require(Language.visitor).visit
local _ = require(Language.ast)
local _ = require(Parent.error.GraphQLError)
local TypeInfoModule = require(Parent.utilities.TypeInfo)
local TypeInfo = TypeInfoModule.TypeInfo
local VisitWithTypeInfoFunction = TypeInfoModule.visitWithTypeInfo
local _ = require(Parent.type.schema)
local _ = require(Parent.type.directives)
local _ = require(Parent.type.definition)
local ASTValidationContext = {}
local config = { __index = ASTValidationContext }

function ASTValidationContext.new(Ast, OnError) --[[ Line: 100 ]]
	-- upvalues: config (copy)
	return (setmetatable({
		_fragments = nil,
		_ast = Ast,
		_fragmentSpreads = {},
		_recursivelyReferencedFragments = {},
		_onError = OnError
	}, config))
end

function ASTValidationContext.reportError(p1, p2) --[[ Line: 115 ]]
	p1._onError(p2)
end

function ASTValidationContext.getDocument(p1) --[[ Line: 119 ]]
	return p1._ast
end

function ASTValidationContext.getFragment(p1, p2) --[[ Line: 123 ]]
	-- upvalues: Kind (copy)
	local Fragments = nil
	if p1._fragments then
		Fragments = p1._fragments
	else
		Fragments = {}
		
		for _, definition in ipairs(p1:getDocument().definitions) do
			if definition.kind == Kind.FRAGMENT_DEFINITION then
				Fragments[definition.name.value] = definition
			end
		end
		p1._fragments = Fragments
	end
	return Fragments[p2]
end

function ASTValidationContext.getFragmentSpreads(p3, Removed) --[[ Line: 139 ]]
	-- upvalues: Kind (copy)
	local FragmentSpread = p3._fragmentSpreads[Removed] or {}
	
	if not p3._fragmentSpreads[Removed] then
		local List = { Removed }
		while #List ~= 0 do
			for _, selection in ipairs(table.remove(List).selections) do
				if selection.kind == Kind.FRAGMENT_SPREAD then
					table.insert(FragmentSpread, selection)
				elseif selection.selectionSet then
					table.insert(List, selection.selectionSet)
				end
			end
		end
		p3._fragmentSpreads[Removed] = FragmentSpread
	end
	return FragmentSpread
end

function ASTValidationContext.getRecursivelyReferencedFragments(p4, p5) --[[ Line: 165 ]]
	local RecursivelyReferencedFragment = p4._recursivelyReferencedFragments[p5] or {}
	
	if not p4._recursivelyReferencedFragments[p5] then
		local t = {}
		local List = { p5.selectionSet }
		while #List ~= 0 do
			for _, fragmentSpread in ipairs(p4:getFragmentSpreads((table.remove(List)))) do
				local Value = fragmentSpread.name.value
				
				if t[Value] ~= true then
					t[Value] = true
					local Fragment = p4:getFragment(Value)
					
					if Fragment then
						table.insert(RecursivelyReferencedFragment, Fragment)
						table.insert(List, Fragment.selectionSet)
					end
				end
			end
		end
		p4._recursivelyReferencedFragments[p5] = RecursivelyReferencedFragment
	end
	return RecursivelyReferencedFragment
end

local self = setmetatable({}, { __index = ASTValidationContext })
local config1 = { __index = self }

function self.new(Ast, _schema, OnError) --[[ Line: 208 ]]
	-- upvalues: ASTValidationContext (copy), config1 (copy)
	local NewASTValidationContext = ASTValidationContext.new(Ast, OnError)
	NewASTValidationContext._schema = _schema
	
	return (setmetatable(NewASTValidationContext, config1))
end

function self.getSchema(p6) --[[ Line: 218 ]]
	return p6._schema
end

local self1 = setmetatable({}, { __index = ASTValidationContext })
local config2 = { __index = self1 }

function self1.new(_schema, Ast, _typeInfo, OnError) --[[ Line: 257 ]]
	-- upvalues: ASTValidationContext (copy), Map (copy), config2 (copy)
	local NewASTValidationContext = ASTValidationContext.new(Ast, OnError)
	NewASTValidationContext._schema = _schema
	NewASTValidationContext._typeInfo = _typeInfo
	NewASTValidationContext._variableUsages = Map.new()
	NewASTValidationContext._recursiveVariableUsages = Map.new()
	
	return (setmetatable(NewASTValidationContext, config2))
end

function self1.getSchema(p6) --[[ Line: 274 ]]
	return p6._schema
end

function self1.getVariableUsages(p6, p7) --[[ Line: 278 ]]
	-- upvalues: TypeInfo (copy), VisitFunction (copy), VisitWithTypeInfoFunction (copy)
	local VariableUsage = p6._variableUsages[p7]
	
	if not VariableUsage then
		local List = {}
		local NewTypeInfo = TypeInfo.new(p6._schema)
		VisitFunction(p7, VisitWithTypeInfoFunction(NewTypeInfo, {
			VariableDefinition = function(): boolean --[[ Line: 286 ]]
				return false
			end,
			Variable = function(_, Node) --[[ Line: 289 ]]
				-- upvalues: List (copy), NewTypeInfo (copy)
				table.insert(List, {
					node = Node,
					type = NewTypeInfo:getInputType(),
					defaultValue = NewTypeInfo:getDefaultValue()
				})
			end
		}))
		VariableUsage = List
		p6._variableUsages[p7] = VariableUsage
	end
	return VariableUsage
end

function self1.getRecursiveVariableUsages(p6, p7) --[[ Line: 305 ]]
	-- upvalues: Array (copy)
	local RecursiveVariableUsage = p6._recursiveVariableUsages[p7]
	
	if not RecursiveVariableUsage then
		RecursiveVariableUsage = p6:getVariableUsages(p7)
		
		for _, recursivelyReferencedFragment in ipairs(p6:getRecursivelyReferencedFragments(p7)) do
			RecursiveVariableUsage = Array.concat(RecursiveVariableUsage, p6:getVariableUsages(recursivelyReferencedFragment))
		end
		p6._recursiveVariableUsages[p7] = RecursiveVariableUsage
	end
	return RecursiveVariableUsage
end

function self1.getType(p8) --[[ Line: 319 ]]
	return p8._typeInfo:getType()
end

function self1.getParentType(p8) --[[ Line: 323 ]]
	return p8._typeInfo:getParentType()
end

function self1.getInputType(p8) --[[ Line: 327 ]]
	return p8._typeInfo:getInputType()
end

function self1.getParentInputType(p8) --[[ Line: 331 ]]
	return p8._typeInfo:getParentInputType()
end

function self1.getFieldDef(p8) --[[ Line: 335 ]]
	return p8._typeInfo:getFieldDef()
end

function self1.getDirective(p8) --[[ Line: 339 ]]
	return p8._typeInfo:getDirective()
end

function self1.getArgument(p8) --[[ Line: 343 ]]
	return p8._typeInfo:getArgument()
end

function self1.getEnumValue(p8) --[[ Line: 347 ]]
	return p8._typeInfo:getEnumValue()
end

return {
	ASTValidationContext = ASTValidationContext,
	SDLValidationContext = self,
	ValidationContext = self1
}
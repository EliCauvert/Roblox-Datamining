local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local map = luauPolyfillModule.Map
local _ = require(parent.jsutils.ObjMap)
local language = parent.language
local kind = require(language.kinds).Kind
local visit = require(language.visitor).visit
local _ = require(language.ast)
local _ = require(parent.error.GraphQLError)
local typeInfoModule = require(parent.utilities.TypeInfo)
local typeInfo = typeInfoModule.TypeInfo
local visitWithTypeInfo = typeInfoModule.visitWithTypeInfo
local _ = require(parent.type.schema)
local _ = require(parent.type.directives)
local _ = require(parent.type.definition)
local t = {}
local t_1 = { __index = t }

function t.new(p1, p2)
	-- upvalues: t_1 (ref)
	return setmetatable({
		_fragments = nil,
		_ast = p1,
		_fragmentSpreads = {},
		_recursivelyReferencedFragments = {},
		_onError = p2
	}, t_1)
end

function t.reportError(p1, p2)
	p1._onError(p2)
end

function t.getDocument(p1)
	return p1._ast
end

function t.getFragment(p1, p2)
	-- upvalues: kind (ref)
	local fragments
	local _ = nil
	
	if p1._fragments then
		fragments = p1._fragments
	else
		fragments = {}
		
		for i, v in ipairs(p1:getDocument().definitions) do
			if v.kind == kind.FRAGMENT_DEFINITION then
				fragments[v.name.value] = v
			end
		end
		p1._fragments = fragments
	end
	return fragments[p2]
end

function t.getFragmentSpreads(p3, p4)
	-- upvalues: kind (ref)
	local var1 = p3._fragmentSpreads[p4] or {}
	
	if not p3._fragmentSpreads[p4] then
		local list = { p4 }
		while #list ~= 0 do
			for i, v in ipairs(table.remove(list).selections) do
				if v.kind == kind.FRAGMENT_SPREAD then
					table.insert(var1, v)
				elseif v.selectionSet then
					table.insert(list, v.selectionSet)
				end
			end
		end
		p3._fragmentSpreads[p4] = var1
	end
	return var1
end

function t.getRecursivelyReferencedFragments(p5, p6)
	local var2 = p5._recursivelyReferencedFragments[p6] or {}
	
	if not p5._recursivelyReferencedFragments[p6] then
		local t = {}
		local list = { p6.selectionSet }
		while #list ~= 0 do
			for i, v in ipairs(p5:getFragmentSpreads(table.remove(list))) do
				local value = v.name.value
				
				if t[value] ~= true then
					t[value] = true
					local var3 = p5:getFragment(value)
					
					if var3 then
						table.insert(var2, var3)
						table.insert(list, var3.selectionSet)
					end
				end
			end
		end
		p5._recursivelyReferencedFragments[p6] = var2
	end
	return var2
end

local tbl = setmetatable({}, { __index = t })
local t_2 = { __index = tbl }

function tbl.new(p7, p8, p9)
	-- upvalues: t (ref), t_2 (ref)
	local var4 = t.new(p7, p9)
	var4._schema = p8
	
	return setmetatable(var4, t_2)
end

function tbl.getSchema(p7)
	return p7._schema
end

local tbl_1 = setmetatable({}, { __index = t })
local t_3 = { __index = tbl_1 }

function tbl_1.new(p7, p8, p9, p10)
	-- upvalues: t (ref), map (ref), t_3 (ref)
	local var4 = t.new(p8, p10)
	var4._schema = p7
	var4._typeInfo = p9
	var4._variableUsages = map.new()
	var4._recursiveVariableUsages = map.new()
	
	return setmetatable(var4, t_3)
end

function tbl_1.getSchema(p7)
	return p7._schema
end

function tbl_1.getVariableUsages(p7, p8)
	-- upvalues: typeInfo (ref), visit (ref), visitWithTypeInfo (ref)
	local var4 = p7._variableUsages[p8]
	
	if not var4 then
		local t = {}
		local var5 = typeInfo.new(p7._schema)
		visit(p8, visitWithTypeInfo(var5, {
			VariableDefinition = function()
				return false
			end,
			Variable = function(_, p9)
				-- upvalues: t (ref), var5 (ref)
				table.insert(t, {
					node = p9,
					type = var5:getInputType(),
					defaultValue = var5:getDefaultValue()
				})
			end
		}))
		var4 = t
		p7._variableUsages[p8] = var4
	end
	return var4
end

function tbl_1.getRecursiveVariableUsages(p7, p8)
	-- upvalues: array (ref)
	local var4 = p7._recursiveVariableUsages[p8]
	
	if not var4 then
		var4 = p7:getVariableUsages(p8)
		
		for i, v in ipairs(p7:getRecursivelyReferencedFragments(p8)) do
			var4 = array.concat(var4, p7:getVariableUsages(v))
		end
		p7._recursiveVariableUsages[p8] = var4
	end
	return var4
end

function tbl_1.getType(p9)
	return p9._typeInfo:getType()
end

function tbl_1.getParentType(p9)
	return p9._typeInfo:getParentType()
end

function tbl_1.getInputType(p9)
	return p9._typeInfo:getInputType()
end

function tbl_1.getParentInputType(p9)
	return p9._typeInfo:getParentInputType()
end

function tbl_1.getFieldDef(p9)
	return p9._typeInfo:getFieldDef()
end

function tbl_1.getDirective(p9)
	return p9._typeInfo:getDirective()
end

function tbl_1.getArgument(p9)
	return p9._typeInfo:getArgument()
end

function tbl_1.getEnumValue(p9)
	return p9._typeInfo:getEnumValue()
end

return {
	ASTValidationContext = t,
	SDLValidationContext = tbl,
	ValidationContext = tbl_1
}
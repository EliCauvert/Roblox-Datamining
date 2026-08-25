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

function t.new(p0, p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		_fragments = nil,
		_ast = p0,
		_fragmentSpreads = {},
		_recursivelyReferencedFragments = {},
		_onError = p1
	}, t_1)
end

function t.reportError(p2, p3)
	p2._onError(p3)
end

function t.getDocument(p4)
	return p4._ast
end

function t.getFragment(p5, p6)
	-- upvalues: kind (ref)
	local fragments
	local _ = nil
	
	if p5._fragments then
		fragments = p5._fragments
	else
		fragments = {}
		
		for i, v in ipairs(p5:getDocument().definitions) do
			if v.kind == kind.FRAGMENT_DEFINITION then
				fragments[v.name.value] = v
			end
		end
		p5._fragments = fragments
	end
	return fragments[p6]
end

function t.getFragmentSpreads(p7, p8)
	-- upvalues: kind (ref)
	local var8 = p7._fragmentSpreads[p8] or {}
	
	if not p7._fragmentSpreads[p8] then
		local list = { p8 }
		while #list ~= 0 do
			for i, v in ipairs(table.remove(list).selections) do
				if v.kind == kind.FRAGMENT_SPREAD then
					table.insert(var8, v)
				elseif v.selectionSet then
					table.insert(list, v.selectionSet)
				end
			end
		end
		p7._fragmentSpreads[p8] = var8
	end
	return var8
end

function t.getRecursivelyReferencedFragments(p9, p10)
	local var10 = p9._recursivelyReferencedFragments[p10] or {}
	
	if not p9._recursivelyReferencedFragments[p10] then
		local t = {}
		local list = { p10.selectionSet }
		while #list ~= 0 do
			for i, v in ipairs(p9:getFragmentSpreads(table.remove(list))) do
				local value = v.name.value
				
				if t[value] ~= true then
					t[value] = true
					local var13 = p9:getFragment(value)
					
					if var13 then
						table.insert(var10, var13)
						table.insert(list, var13.selectionSet)
					end
				end
			end
		end
		p9._recursivelyReferencedFragments[p10] = var10
	end
	return var10
end

local tbl = setmetatable({}, { __index = t })
local t_2 = { __index = tbl }

function tbl.new(p11, p12, p13)
	-- upvalues: t (ref), t_2 (ref)
	local var14 = t.new(p11, p13)
	var14._schema = p12
	
	return setmetatable(var14, t_2)
end

function tbl.getSchema(p14)
	return p14._schema
end

local tbl_1 = setmetatable({}, { __index = t })
local t_3 = { __index = tbl_1 }

function tbl_1.new(p15, p16, p17, p18)
	-- upvalues: t (ref), map (ref), t_3 (ref)
	local var15 = t.new(p16, p18)
	var15._schema = p15
	var15._typeInfo = p17
	var15._variableUsages = map.new()
	var15._recursiveVariableUsages = map.new()
	
	return setmetatable(var15, t_3)
end

function tbl_1.getSchema(p19)
	return p19._schema
end

function tbl_1.getVariableUsages(p20, p21)
	-- upvalues: typeInfo (ref), visit (ref), visitWithTypeInfo (ref)
	local var16 = p20._variableUsages[p21]
	
	if not var16 then
		local t = {}
		local var18 = typeInfo.new(p20._schema)
		visit(p21, visitWithTypeInfo(var18, {
			VariableDefinition = function()
				return false
			end,
			Variable = function(_, p22)
				-- upvalues: t (ref), var18 (ref)
				table.insert(t, {
					node = p22,
					type = var18:getInputType(),
					defaultValue = var18:getDefaultValue()
				})
			end
		}))
		var16 = t
		p20._variableUsages[p21] = var16
	end
	return var16
end

function tbl_1.getRecursiveVariableUsages(p23, p24)
	-- upvalues: array (ref)
	local var19 = p23._recursiveVariableUsages[p24]
	
	if not var19 then
		var19 = p23:getVariableUsages(p24)
		
		for i, v in ipairs(p23:getRecursivelyReferencedFragments(p24)) do
			var19 = array.concat(var19, p23:getVariableUsages(v))
		end
		p23._recursiveVariableUsages[p24] = var19
	end
	return var19
end

function tbl_1.getType(p25)
	return p25._typeInfo:getType()
end

function tbl_1.getParentType(p26)
	return p26._typeInfo:getParentType()
end

function tbl_1.getInputType(p27)
	return p27._typeInfo:getInputType()
end

function tbl_1.getParentInputType(p28)
	return p28._typeInfo:getParentInputType()
end

function tbl_1.getFieldDef(p29)
	return p29._typeInfo:getFieldDef()
end

function tbl_1.getDirective(p30)
	return p30._typeInfo:getDirective()
end

function tbl_1.getArgument(p31)
	return p31._typeInfo:getArgument()
end

function tbl_1.getEnumValue(p32)
	return p32._typeInfo:getEnumValue()
end

return {
	ASTValidationContext = t,
	SDLValidationContext = tbl,
	ValidationContext = tbl_1
}
local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local _ = require(parent.GraphQL)
local getArgumentValues = require(script.Parent.getArgumentValues).getArgumentValues

local function getDirectivesInExtensions(p1, p2)
	-- upvalues: array (ref), object (ref)
	return array.reduce(if p2 ~= nil then { "directives" } else p2, function(p3, p4)
		-- upvalues: object (copy)
		return if p3 == object.None or p3 == nil then nil else p3[p4]
	end, if typeof(p1) == "table" and p1.extensions then p1.extensions else object.None)
end

t.getDirectivesInExtensions = getDirectivesInExtensions

local function _getDirectiveInExtensions(p1, p2)
	-- upvalues: array (ref)
	local var1 = array.filter(p1, function(p3)
		-- upvalues: p2 (ref)
		return p3.name == p2
	end)
	
	return if #var1 == 0 then nil else array.map(var1, function(p3)
		return if p3.args == nil then {} else p3.args
	end)
end

local function getDirectiveInExtensions(p1, p2, p3)
	-- upvalues: array (ref), object (ref), boolean (ref), _getDirectiveInExtensions (ref)
	local reduce = array.reduce
	reduce = reduce(if p3 ~= nil then { "directives" } else p3, function(p4, p5)
		-- upvalues: object (copy)
		return if p4 == object.None or p4 == nil then nil else p4[p5]
	end, if typeof(p1) == "table" and p1.extensions then p1.extensions else object.None)
	
	if reduce == nil then
		return nil
	elseif boolean.toJSBoolean(array.isArray(reduce)) then
		return _getDirectiveInExtensions(reduce, p2)
	end
	local unpacked, unpacked_1
	local t = {}
	
	for i, v in object.entries(reduce) do
		unpacked, unpacked_1 = table.unpack(v, 1, 2)
		
		if not boolean.toJSBoolean(array.isArray(unpacked_1)) then
			table.insert(t, { name = unpacked, args = unpacked_1 })
			continue
		end
		for i_1, v_1 in unpacked_1 do
			table.insert(t, { name = unpacked, args = v_1 })
		end
	end
	return _getDirectiveInExtensions(t, p2)
end

t.getDirectiveInExtensions = getDirectiveInExtensions

function t.getDirectives(p4, p5, p6)
	-- upvalues: getDirectivesInExtensions (ref), boolean (ref), array (ref), object (ref), getArgumentValues (ref)
	local var1 = getDirectivesInExtensions(p5, if p6 ~= nil then { "directives" } else p6)
	
	if var1 ~= nil and #var1 > 0 then
		return var1
	end
	local var2 = array.reduce(if boolean.toJSBoolean(if boolean.toJSBoolean(p4) then p4.getDirectives else p4) then p4:getDirectives() else {}, function(p7, p8)
		p7[tostring(p8.name)] = p8
		
		return p7
	end, {})
	local t = {}
	
	if boolean.toJSBoolean(p5.astNode) then
		table.insert(t, p5.astNode)
	end
	if array.indexOf(object.keys(p5), "extensionASTNodes") ~= -1 and boolean.toJSBoolean(p5.extensionASTNodes) then
		t = array.concat({}, t, p5.extensionASTNodes)
	end
	local t_1 = {}
	
	for i, v in t do
		if boolean.toJSBoolean(v.directives) then
			for i_1, v_1 in v.directives do
				local value = var2[tostring(v_1.name.value)]
				
				if boolean.toJSBoolean(value) then
					table.insert(t_1, {
						name = v_1.name.value,
						args = getArgumentValues(value, v_1)
					})
				end
			end
		end
	end
	return t_1
end

function t.getDirective(p7, p8, p9, p10)
	-- upvalues: getDirectiveInExtensions (ref), boolean (ref), array (ref), object (ref), getArgumentValues (ref)
	local var3 = getDirectiveInExtensions(p8, p9, if p10 ~= nil then { "directives" } else p10)
	
	if var3 ~= nil then
		return var3
	end
	local var4 = if boolean.toJSBoolean(if boolean.toJSBoolean(p7) then p7.getDirective else p7) then p7:getDirective(p9) else nil
	
	if var4 == nil then
		return nil
	end
	local t = {}
	
	if boolean.toJSBoolean(p8.astNode) then
		table.insert(t, p8.astNode)
	end
	if array.indexOf(object.keys(p8), "extensionASTNodes") ~= -1 and boolean.toJSBoolean(p8.extensionASTNodes) then
		t = array.concat({}, t, p8.extensionASTNodes)
	end
	local t_1 = {}
	
	for i, v in t do
		if boolean.toJSBoolean(v.directives) then
			for i_1, v_1 in v.directives do
				if v_1.name.value == p9 then
					table.insert(t_1, getArgumentValues(var4, v_1))
				end
			end
		end
	end
	return if boolean.toJSBoolean(#t_1) then t_1 else nil
end

return t
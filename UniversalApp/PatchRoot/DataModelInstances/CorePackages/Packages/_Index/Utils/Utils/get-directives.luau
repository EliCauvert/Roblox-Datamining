local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local _ = require(parent.GraphQL)
local getArgumentValues = require(script.Parent.getArgumentValues).getArgumentValues

local function getDirectivesInExtensions(p0, p1)
	-- upvalues: array (ref), object (ref)
	return array.reduce(if p1 ~= nil then { "directives" } else p1, function(p2, p3)
		-- upvalues: object (copy)
		return if p2 == object.None or p2 == nil then nil else p2[p3]
	end, if typeof(p0) == "table" and p0.extensions then p0.extensions else object.None)
end

t.getDirectivesInExtensions = getDirectivesInExtensions

local function _getDirectiveInExtensions(p4, p5)
	-- upvalues: array (ref)
	local var5 = array.filter(p4, function(p6)
		-- upvalues: p5 (ref)
		return p6.name == p5
	end)
	
	return if #var5 == 0 then nil else array.map(var5, function(p7)
		return if p7.args == nil then {} else p7.args
	end)
end

local function getDirectiveInExtensions(p8, p9, p10)
	-- upvalues: array (ref), object (ref), boolean (ref), _getDirectiveInExtensions (ref)
	local reduce = array.reduce
	reduce = reduce(if p10 ~= nil then { "directives" } else p10, function(p11, p12)
		-- upvalues: object (copy)
		return if p11 == object.None or p11 == nil then nil else p11[p12]
	end, if typeof(p8) == "table" and p8.extensions then p8.extensions else object.None)
	
	if reduce == nil then
		return nil
	elseif boolean.toJSBoolean(array.isArray(reduce)) then
		return _getDirectiveInExtensions(reduce, p9)
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
	return _getDirectiveInExtensions(t, p9)
end

t.getDirectiveInExtensions = getDirectiveInExtensions

function t.getDirectives(p13, p14, p15)
	-- upvalues: getDirectivesInExtensions (ref), boolean (ref), array (ref), object (ref), getArgumentValues (ref)
	local var9 = getDirectivesInExtensions(p14, if p15 ~= nil then { "directives" } else p15)
	
	if var9 ~= nil and #var9 > 0 then
		return var9
	end
	local var10 = array.reduce(if boolean.toJSBoolean(if boolean.toJSBoolean(p13) then p13.getDirectives else p13) then p13:getDirectives() else {}, function(p16, p17)
		p16[tostring(p17.name)] = p17
		
		return p16
	end, {})
	local t = {}
	
	if boolean.toJSBoolean(p14.astNode) then
		table.insert(t, p14.astNode)
	end
	if array.indexOf(object.keys(p14), "extensionASTNodes") ~= -1 and boolean.toJSBoolean(p14.extensionASTNodes) then
		t = array.concat({}, t, p14.extensionASTNodes)
	end
	local t_1 = {}
	
	for i, v in t do
		if boolean.toJSBoolean(v.directives) then
			for i_1, v_1 in v.directives do
				local value = var10[tostring(v_1.name.value)]
				
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

function t.getDirective(p18, p19, p20, p21)
	-- upvalues: getDirectiveInExtensions (ref), boolean (ref), array (ref), object (ref), getArgumentValues (ref)
	local var13 = getDirectiveInExtensions(p19, p20, if p21 ~= nil then { "directives" } else p21)
	
	if var13 ~= nil then
		return var13
	end
	local var14 = if boolean.toJSBoolean(if boolean.toJSBoolean(p18) then p18.getDirective else p18) then p18:getDirective(p20) else nil
	
	if var14 == nil then
		return nil
	end
	local t = {}
	
	if boolean.toJSBoolean(p19.astNode) then
		table.insert(t, p19.astNode)
	end
	if array.indexOf(object.keys(p19), "extensionASTNodes") ~= -1 and boolean.toJSBoolean(p19.extensionASTNodes) then
		t = array.concat({}, t, p19.extensionASTNodes)
	end
	local t_1 = {}
	
	for i, v in t do
		if boolean.toJSBoolean(v.directives) then
			for i_1, v_1 in v.directives do
				if v_1.name.value == p20 then
					table.insert(t_1, getArgumentValues(var14, v_1))
				end
			end
		end
	end
	return if boolean.toJSBoolean(#t_1) then t_1 else nil
end

return t
local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local object = luauPolyfillModule.Object
local t = {}
local print = require(parent.GraphQL).print
local _ = require(script.Parent["merge-typedefs_types"])
local isSome = require(parent.Utils).isSome
local deduplicateLists = nil

local function directiveAlreadyExists(p0, p1) --[[ line: 43 ]]
	-- upvalues: boolean (ref), array (ref)
	return boolean.toJSBoolean(array.find(p0, function(p2) --[[ line: 49 ]]
		-- upvalues: p1 (ref)
		return p2.name.value == p1.name.value
	end))
end

local function _(p3, p4) --[[ line: 54 | named "nameAlreadyExists" ]]
	-- upvalues: array (ref)
	return array.some(p4, function(p5) --[[ line: 55 ]]
		-- upvalues: p3 (ref)
		return p5.value == p3.value
	end)
end

local function mergeArguments(p6, p7) --[[ line: 60 ]]
	-- upvalues: array (ref), deduplicateLists (write), boolean (ref)
	local var6 = array.concat({}, p7)
	
	for i, v in p6 do
		local var7 = array.findIndex(var6, function(p8) --[[ line: 73 ]]
			-- upvalues: v (ref)
			return p8.name.value == v.name.value
		end)
		
		if var7 > -1 then
			local var8 = var6[var7]
			
			if var8.value.kind == "ListValue" then
				var8.value.values = deduplicateLists(var8.value.values, v.value.values, function(p9, p10) --[[ line: 87 ]]
					-- upvalues: boolean (copy), array (copy)
					local value = p9.value
					
					return not boolean.toJSBoolean(value) or not array.some(p10, function(p11) --[[ line: 94 ]]
						-- upvalues: value (ref)
						return p11.value == value
					end)
				end)
			else
				var8.value = v.value
			end
		else
			table.insert(var6, v)
		end
	end
	return var6
end

local _ = function(p12) --[[ line: 108 | named "deduplicateDirectives" ]]
	-- upvalues: array (ref), mergeArguments (ref), isSome (ref)
	return array.filter(array.map(p12, function(p13, p14, p15) --[[ line: 112 ]]
		-- upvalues: array (copy), mergeArguments (copy)
		local var9 = array.findIndex(p15, function(p16) --[[ line: 114 ]]
			-- upvalues: p13 (ref)
			return p16.name.value == p13.name.value
		end)
		
		if var9 == p14 then
			return p13
		end
		p13.arguments = mergeArguments(p13.arguments, p15[var9].arguments)
		
		return nil
	end), isSome)
end

function t.mergeDirectives(p17, p18, p19) --[[ line: 133 ]]
	-- upvalues: boolean (ref), array (ref), mergeArguments (ref), isSome (ref), directiveAlreadyExists (ref)
	local var10 = if p17 ~= nil then {} else p17
	local var11 = if p18 ~= nil then {} else p18
	local var12 = p19 and p19.reverseDirectives
	local var13 = array.filter(array.map(array.concat({}, if boolean.toJSBoolean(var12) then var10 else var11), function(p20, p21, p22) --[[ line: 112 ]]
		-- upvalues: array (copy), mergeArguments (copy)
		local var9 = array.findIndex(p22, function(p23) --[[ line: 114 ]]
			-- upvalues: p20 (ref)
			return p23.name.value == p20.name.value
		end)
		
		if var9 == p21 then
			return p20
		end
		p20.arguments = mergeArguments(p20.arguments, p22[var9].arguments)
		
		return nil
	end), isSome)
	
	for i, v in if boolean.toJSBoolean(var12) then var11 else var10 do
		if boolean.toJSBoolean(directiveAlreadyExists(var13, v)) then
			local var14 = array.findIndex(var13, function(p24) --[[ line: 155 ]]
				-- upvalues: v (ref)
				return p24.name.value == v.name.value
			end)
			local var15 = var13[var14]
			var13[var14].arguments = mergeArguments(if boolean.toJSBoolean(v.arguments) then v.arguments else {}, if boolean.toJSBoolean(var15.arguments) then var15.arguments else {})
		else
			table.insert(var13, v)
		end
	end
	return var13
end

local function validateInputs(p25, p26) --[[ line: 176 ]]
	-- upvalues: print (ref), object (ref), boolean (ref), error (ref)
	local var16 = print(object.assign({}, p25, { description = object.None }))
	local var17 = print(object.assign({}, p26, { description = object.None }))
	
	if not boolean.toJSBoolean(var16:gsub("directive @w*d*", ""):gsub(" on .*$", "") == var17:gsub("directive @w*d*", ""):gsub(" on .*$", "")) then
		error(error.new(("Unable to merge GraphQL directive \"%s\". \nExisting directive:  \n\t%s \nReceived directive: \n\t%s"):format(tostring(p25.name.value), tostring(var17), tostring(var16))))
	end
end

function t.mergeDirective(p27, p28) --[[ line: 201 ]]
	-- upvalues: validateInputs (ref), object (ref), array (ref)
	if p28 then
		validateInputs(p27, p28)
		
		return object.assign({}, p27, {
			locations = array.concat({}, p28.locations, array.filter(p27.locations, function(p29) --[[ line: 219 ]]
				-- upvalues: p28 (ref), array (copy)
				return not array.some(p28.locations, function(p30) --[[ line: 55 ]]
					-- upvalues: p29 (ref)
					return p30.value == p29.value
				end)
			end))
		})
	end
	return p27
end

deduplicateLists = function(p31, p32, p33) --[[ line: 229 | named "deduplicateLists" ]]
	-- upvalues: array (ref)
	return array.concat(p31, array.filter(p32, function(p34) --[[ line: 247 ]]
		-- upvalues: p33 (ref), p31 (ref)
		return p33(p34, p31)
	end))
end

return t
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

local function directiveAlreadyExists(p1, p2)
	-- upvalues: boolean (ref), array (ref)
	return boolean.toJSBoolean(array.find(p1, function(p3)
		-- upvalues: p2 (ref)
		return p3.name.value == p2.name.value
	end))
end

local function _(p1, p2)
	-- upvalues: array (ref)
	return array.some(p2, function(p3)
		-- upvalues: p1 (ref)
		return p3.value == p1.value
	end)
end

local function mergeArguments(p1, p2)
	-- upvalues: array (ref), deduplicateLists (write), boolean (ref)
	local var1 = array.concat({}, p2)
	
	for i, v in p1 do
		local var2 = array.findIndex(var1, function(p3)
			-- upvalues: v (ref)
			return p3.name.value == v.name.value
		end)
		
		if var2 > -1 then
			local var3 = var1[var2]
			
			if var3.value.kind == "ListValue" then
				var3.value.values = deduplicateLists(var3.value.values, v.value.values, function(p3, p4)
					-- upvalues: boolean (copy), array (copy)
					local value = p3.value
					
					return not boolean.toJSBoolean(value) or not array.some(p4, function(p5)
						-- upvalues: value (ref)
						return p5.value == value
					end)
				end)
			else
				var3.value = v.value
			end
		else
			table.insert(var1, v)
		end
	end
	return var1
end

local _ = function(p3)
	-- upvalues: array (ref), mergeArguments (ref), isSome (ref)
	return array.filter(array.map(p3, function(p4, p5, p6)
		-- upvalues: array (copy), mergeArguments (copy)
		local var4 = array.findIndex(p6, function(p7)
			-- upvalues: p4 (ref)
			return p7.name.value == p4.name.value
		end)
		
		if var4 == p5 then
			return p4
		end
		p4.arguments = mergeArguments(p4.arguments, p6[var4].arguments)
		
		return nil
	end), isSome)
end

function t.mergeDirectives(p3, p4, p5)
	-- upvalues: boolean (ref), array (ref), mergeArguments (ref), isSome (ref), directiveAlreadyExists (ref)
	local var4 = if p3 ~= nil then {} else p3
	local var5 = if p4 ~= nil then {} else p4
	local var6 = p5 and p5.reverseDirectives
	local var7 = array.filter(array.map(array.concat({}, if boolean.toJSBoolean(var6) then var4 else var5), function(p6, p7, p8)
		-- upvalues: array (copy), mergeArguments (copy)
		local var8 = array.findIndex(p8, function(p9)
			-- upvalues: p6 (ref)
			return p9.name.value == p6.name.value
		end)
		
		if var8 == p7 then
			return p6
		end
		p6.arguments = mergeArguments(p6.arguments, p8[var8].arguments)
		
		return nil
	end), isSome)
	
	for i, v in if boolean.toJSBoolean(var6) then var5 else var4 do
		if boolean.toJSBoolean(directiveAlreadyExists(var7, v)) then
			local var8 = array.findIndex(var7, function(p6)
				-- upvalues: v (ref)
				return p6.name.value == v.name.value
			end)
			local var9 = var7[var8]
			var7[var8].arguments = mergeArguments(if boolean.toJSBoolean(v.arguments) then v.arguments else {}, if boolean.toJSBoolean(var9.arguments) then var9.arguments else {})
		else
			table.insert(var7, v)
		end
	end
	return var7
end

local function validateInputs(p6, p7)
	-- upvalues: print (ref), object (ref), boolean (ref), error (ref)
	local var10 = print(object.assign({}, p6, { description = object.None }))
	local var11 = print(object.assign({}, p7, { description = object.None }))
	
	if not boolean.toJSBoolean(var10:gsub("directive @w*d*", ""):gsub(" on .*$", "") == var11:gsub("directive @w*d*", ""):gsub(" on .*$", "")) then
		error(error.new(("Unable to merge GraphQL directive \"%s\". \nExisting directive:  \n\t%s \nReceived directive: \n\t%s"):format(tostring(p6.name.value), tostring(var11), tostring(var10))))
	end
end

function t.mergeDirective(p6, p7)
	-- upvalues: validateInputs (ref), object (ref), array (ref)
	if p7 then
		validateInputs(p6, p7)
		
		return object.assign({}, p6, {
			locations = array.concat({}, p7.locations, array.filter(p6.locations, function(p8)
				-- upvalues: p7 (ref), array (copy)
				return not array.some(p7.locations, function(p9)
					-- upvalues: p8 (ref)
					return p9.value == p8.value
				end)
			end))
		})
	end
	return p6
end

deduplicateLists = function(p6, p7, p8)
	-- upvalues: array (ref)
	return array.concat(p6, array.filter(p7, function(p9)
		-- upvalues: p8 (ref), p6 (ref)
		return p8(p9, p6)
	end))
end

return t
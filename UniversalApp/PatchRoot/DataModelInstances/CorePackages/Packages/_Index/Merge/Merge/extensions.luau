local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {
	extractExtensionsFromSchema = require(parent.Utils).extractExtensionsFromSchema
}
local _ = require(parent.GraphQL)
local mergeDeep = require(parent.Utils).mergeDeep

function t.mergeExtensions(p1)
	-- upvalues: mergeDeep (ref)
	return mergeDeep(p1)
end

local function applyExtensionObject(p1, p2)
	-- upvalues: mergeDeep (ref), boolean (ref)
	if p1 then
		p1.extensions = mergeDeep({
			if boolean.toJSBoolean(p1.extensions) then p1.extensions else {},
			if boolean.toJSBoolean(p2) then p2 else {}
		})
		
		return
	end
end

function t.applyExtensions(p3, p4)
	-- upvalues: applyExtensionObject (ref), object (ref), boolean (ref), array (ref)
	applyExtensionObject(p3, p4.schemaExtensions)
	
	for i, v in object.entries(if boolean.toJSBoolean(p4.types) then p4.types else {}) do
		local var1 = v[2]
		local var2 = p3:getType(v[1])
		
		if boolean.toJSBoolean(var2) then
			applyExtensionObject(var2, var1.extensions)
			
			if var1.type == "object" or var1.type == "interface" then
				for i_1, v_1 in object.entries(var1.fields) do
					local var3 = v_1[2]
					local var4 = var2:getFields():get(v_1[1])
					
					if boolean.toJSBoolean(var4) then
						applyExtensionObject(var4, var3.extensions)
						
						for i_3, v_4 in object.entries(var3.arguments) do
							local unpacked, unpacked_1 = table.unpack(v_4, 1, 2)
							applyExtensionObject(array.find(var4.args, function(p5)
								-- upvalues: unpacked (ref)
								return p5.name == unpacked
							end), unpacked_1)
						end
					end
				end
			elseif var1.type == "input" then
				for i_1, v_1 in object.entries(var1.fields) do
					local unpacked, unpacked_1 = table.unpack(v_1, 1, 2)
					applyExtensionObject(var2:getFields():get(unpacked), unpacked_1.extensions)
				end
			elseif var1.type == "enum" then
				for i_1, v_1 in object.entries(var1.values) do
					local unpacked, unpacked_1 = table.unpack(v_1, 1, 2)
					applyExtensionObject(var2:getValue(unpacked), unpacked_1)
				end
			end
		end
	end
	return p3
end

return t
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

function t.mergeExtensions(p0)
	-- upvalues: mergeDeep (ref)
	return mergeDeep(p0)
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
		local var3 = v[2]
		local var4 = p3:getType(v[1])
		
		if boolean.toJSBoolean(var4) then
			applyExtensionObject(var4, var3.extensions)
			
			if var3.type == "object" or var3.type == "interface" then
				for i_1, v_1 in object.entries(var3.fields) do
					local var9 = v_1[2]
					local var10 = var4:getFields():get(v_1[1])
					
					if boolean.toJSBoolean(var10) then
						applyExtensionObject(var10, var9.extensions)
						
						for i_3, v_4 in object.entries(var9.arguments) do
							local unpacked, unpacked_1 = table.unpack(v_4, 1, 2)
							applyExtensionObject(array.find(var10.args, function(p5)
								-- upvalues: unpacked (ref)
								return p5.name == unpacked
							end), unpacked_1)
						end
					end
				end
			elseif var3.type == "input" then
				for i_1, v_1 in object.entries(var3.fields) do
					local unpacked, unpacked_1 = table.unpack(v_1, 1, 2)
					applyExtensionObject(var4:getFields():get(unpacked), unpacked_1.extensions)
				end
			elseif var3.type == "enum" then
				for i_1, v_1 in object.entries(var3.values) do
					local unpacked, unpacked_1 = table.unpack(v_1, 1, 2)
					applyExtensionObject(var4:getValue(unpacked), unpacked_1)
				end
			end
		end
	end
	return p3
end

return t